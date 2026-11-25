# -*- coding: utf-8 -*-
"""N11 V35: import structurally intact, user-authorized offline exams as PRIVATE DRAFTS.
Default is read-only scan. --apply asks for confirmation and MySQL login.
No remote requests, no Cloudinary upload, no schema changes, no Student edits.
Python 3.10+. Apply requires PyMySQL. Keep the output JSON on your machine.
"""
import sqlite3
import argparse, collections, getpass, hashlib, html, json, mimetypes, os, re, shutil, sys, uuid
from pathlib import Path
from urllib.parse import urlsplit, unquote, parse_qs
from html.parser import HTMLParser

FULL=[p for p,n in enumerate([0,6,25,39,30,30,16,54]) for _ in range(n)]
MIME={'mp3':'audio/mpeg','wav':'audio/wav','ogg':'audio/ogg','png':'image/png','jpg':'image/jpeg','jpeg':'image/jpeg','webp':'image/webp'}
MARK='[N11_OFFLINE_EXAM_V35:'

def norm(d):
    return {re.sub(r'[^a-z0-9]','',str(k).lower()):v for k,v in d.items()} if isinstance(d,dict) else {}
def num(x):
    return int(x) if not isinstance(x,bool) and re.fullmatch(r'\d{1,9}',str(x)) else None
def uid(x):
    try:return str(uuid.UUID(str(x)))
    except (ValueError,TypeError,AttributeError):return None
def read(p):return json.loads(p.read_text(encoding='utf-8-sig'))
def rows(x):return x if isinstance(x,list) else [x] if isinstance(x,dict) else []
def walk(x):
    if isinstance(x,dict):
        yield x
        for v in x.values():yield from walk(v)
    elif isinstance(x,list):
        for v in x:yield from walk(v)
def endpoint(s):
    try:return urlsplit(str(s or '')).path.rstrip('/').rsplit('/',1)[-1].lower()
    except ValueError:return ''
def save_json(path,obj):
    tmp=path.with_suffix(path.suffix+'.tmp');tmp.write_text(json.dumps(obj,ensure_ascii=False,indent=2),encoding='utf-8');tmp.replace(path)
def flag(x):return x is True or x==1 or str(x).lower()=='true'
class Plain(HTMLParser):
    def __init__(self):super().__init__(convert_charrefs=True);self.parts=[];self.hidden=0
    def handle_starttag(self,tag,attrs):
        if tag in ('script','style'):self.hidden+=1
        elif tag in ('p','br','div','tr','li','h1','h2','h3','h4','td','th'):self.parts.append('\n' if tag not in ('td','th') else ' | ')
    def handle_endtag(self,tag):
        if tag in ('script','style'):self.hidden=max(0,self.hidden-1)
        elif tag in ('p','div','tr','li'):self.parts.append('\n')
    def handle_data(self,s):
        if not self.hidden:self.parts.append(s)
def text(x):
    if x is None:return ''
    if isinstance(x,str):
        if re.search(r'<\/?[a-zA-Z][^>]*>',x):
            p=Plain();p.feed(x);return ''.join(p.parts).strip()
        return html.unescape(x).strip()
    if isinstance(x,list):return '\n'.join(t for v in x if (t:=text(v)))
    if isinstance(x,dict):
        d=norm(x)
        for k in ('text','content','html','label','value'):
            if d.get(k) is not None:return text(d[k])
        return json.dumps(x,ensure_ascii=False)
    return str(x)
def field(d,*keys):
    for k in keys:
        v=d.get(k)
        if isinstance(v,str) and v.strip():return v.strip()
    return ''
def refs(d,kind):
    keys=('audiourl','audio') if kind=='AUDIO' else ('imageurl','imageurl2','imageurl3','image')
    return list(dict.fromkeys(d[k].strip() for k in keys if isinstance(d.get(k),str) and d[k].strip()))
def group_text(g):
    a=[]
    for k in ('passage','passage2','passage3'):
        t=text(g.get(k)) or text(g.get(k+'html'))
        if t:a.append(t)
    return '\n\n'.join(a)
def signature(p,ext):
    try:
        if not 12<=p.stat().st_size<=25*1024*1024:return False
        with p.open('rb') as f:b=f.read(12)
        return {'mp3':b[:3]==b'ID3' or (b[0]==255 and b[1]&224==224),'wav':b[:4]==b'RIFF' and b[8:12]==b'WAVE','ogg':b[:4]==b'OggS','png':b[:4]==b'\x89PNG','jpg':b[:3]==b'\xff\xd8\xff','jpeg':b[:3]==b'\xff\xd8\xff','webp':b[:4]==b'RIFF' and b[8:12]==b'WEBP'}.get(ext,False)
    except OSError:return False
class Media:
    def __init__(self,root):
        self.root=root.resolve();self.names=collections.defaultdict(set);self.mapping=collections.defaultdict(set);self.cache={}
        for p in root.rglob('*'):
            if p.is_file() and p.suffix.lower().lstrip('.') in MIME:
                p=p.resolve()
                if p.is_relative_to(self.root):self.names[p.name.lower()].add(p)
        # Saved media manifest: URL -> file, or records with url/file. Never follow external paths.
        for f in root.glob('*.json'):
            try:o=read(f)
            except (OSError,ValueError,UnicodeError):continue
            for node in walk(o):
                for k,v in node.items():
                    if isinstance(k,str) and k.startswith(('https://','http://')):
                        if isinstance(v,dict):v=field(norm(v),'file','path','localpath','localfile','relativepath')
                        self.add(k,v)
                d=norm(node);u=field(d,'url','sourceurl','originalurl','remoteurl');v=field(d,'file','path','localpath','localfile','relativepath')
                if u and v:self.add(u,v)
    def add(self,u,v):
        if not isinstance(v,str):return
        s=v.replace('\\','/');p=Path(s)
        for q in [p if p.is_absolute() else self.root/s.lstrip('/'),self.root/'media'/p.name]:
            try:
                q=q.resolve()
                if q.is_relative_to(self.root) and q.is_file() and q.suffix.lower().lstrip('.') in MIME:self.mapping[u].add(q)
            except OSError:pass
    def find(self,u,kind):
        if not u:return None
        key=(u,kind)
        if key in self.cache:return self.cache[key]
        try:
            path=unquote(urlsplit(u).path);name=Path(path).name.lower();ext=Path(name).suffix.lower();stem=Path(name).stem
        except ValueError:return None
        def valid(ps):
            return {p for p in ps if MIME.get(p.suffix.lower().lstrip('.'),'').startswith('audio/' if kind=='AUDIO' else 'image/') and signature(p,p.suffix.lower().lstrip('.'))}
        candidates=valid(self.mapping.get(u,set()))
        if not candidates:
            candidates=valid(self.names.get(name,set()))
        if not candidates and ext:
            for alg in ('sha1','sha256','md5'):
                for source in (u,unquote(u)):
                    h=hashlib.new(alg,source.encode('utf-8')).hexdigest()
                    for n in (16,20,24,32,40,64):
                        if n<=len(h):candidates|=valid(self.names.get(h[:n]+ext,set()))
        found=None
        if len(candidates)==1:found=next(iter(candidates))
        self.cache[key]=found;return found

def scan(root,out):
    raw=root/'raw';assert raw.is_dir(),f'Khong tim thay {raw}'
    files=[];groups={};explanations={};tests={};conflicts=set();bad_groups=set();errors=[]
    for p in sorted(raw.rglob('*.json')):
        try:o=read(p);d=norm(o);data=d.get('data',o);ep=endpoint(d.get('sourcepath'));files.append((p,d,data,ep))
        except (OSError,ValueError,UnicodeError) as e:errors.append({'file':p.name,'error':type(e).__name__});continue
        if ep not in ('tests','questions','question_groups'):continue
        for r in rows(data):
            a=norm(r);i=uid(a.get('id'))
            if not i:continue
            if ep=='tests':
                old=tests.setdefault(i,{})
                for k in ('title','durationminutes','expectedquestions','adminonly','ispublished'):
                    if k in a and a[k] is not None:
                        if k in old and old[k]!=a[k]:conflicts.add(i)
                        old[k]=a[k]
            elif ep=='question_groups':
                if i in groups and groups[i]!=a:bad_groups.add(i)
                groups[i]=a
            elif 'explanation' in a or 'aiexplanation' in a:
                old=explanations.setdefault(i,{})
                for k in ('explanation','aiexplanation'):
                    if a.get(k):old[k]=a[k]
    print(f'Raw: {len(files)} | Test IDs: {len(tests)} | Groups: {len(groups)}')
    media=Media(root);candidates=[];report=[];seen=set()
    for p,d,data,ep in files:
        if ep!='test_questions':continue
        ordered=[];tids=set();src=d.get('sourcepath','')
        try:
            for k,vs in parse_qs(urlsplit(src).query).items():
                if re.sub(r'[^a-z0-9]','',k.lower()) in ('testid','examid'):
                    tids.update(i for v in vs if (i:=uid(v.removeprefix('eq.'))))
        except (ValueError,TypeError):pass
        for node in walk(data):
            a=norm(node);q=a.get('question');q=q[0] if isinstance(q,list) and len(q)==1 else q;qd=norm(q);o=num(a.get('orderindex'))
            if o is not None and uid(qd.get('id')):
                ordered.append((o,qd));i=uid(a.get('testid'))
                if i:tids.add(i)
        if not ordered:continue
        ordered.sort(key=lambda x:x[0]);orders=[o for o,_ in ordered];parts=[num(q.get('part')) for _,q in ordered];ids=[uid(q.get('id')) for _,q in ordered]
        info={'file':p.relative_to(root).as_posix(),'rows':len(orders),'unique_orders':len(set(orders)),'status':'BLOCKED','issues':[]}
        report.append(info)
        if orders not in (list(range(200)),list(range(1,201))) or parts!=FULL or len(set(ids))!=200:
            info['issues'].append('Incomplete, duplicate order/ID or invalid Part distribution');continue
        # Deduplicate the same ordered question-ID sequence, not just a title.
        digest=hashlib.sha256('|'.join(ids).encode()).hexdigest()[:32];info['key']=digest
        if digest in seen:info['status']='DUPLICATE';continue
        seen.add(digest)
        if len(tids)>1:info['issues'].append('Conflicting explicit test IDs');continue
        tid=next(iter(tids),None);meta=tests.get(tid,{})
        if tid in conflicts or flag(meta.get('adminonly')) or ('ispublished' in meta and not flag(meta['ispublished'])):
            info['issues'].append('Restricted/unpublished source or conflicting metadata');continue
        title=field(meta,'title') or 'TOEIC Offline - '+p.stem[:12]
        items=[];warnings=[];fatal=[];group_positions=collections.defaultdict(list)
        for position,(_,q) in enumerate(ordered,1):
            i=uid(q['id']);part=num(q['part']);gid=uid(q.get('groupid'));g=groups.get(gid,{})
            opts=q.get('choices');ci=num(q.get('correctindex'))
            if not isinstance(opts,list) or len(opts)!=(3 if part==2 else 4) or ci is None or ci>=len(opts):fatal.append(f'Q{position}: invalid options/answer');continue
            opts=[text(v) for v in opts]
            if any(not v for v in opts):fatal.append(f'Q{position}: empty option');continue
            if part in (3,4,6,7):
                if not gid or gid not in groups or gid in bad_groups or num(g.get('part')) not in (None,part):fatal.append(f'Q{position}: missing/conflicting group');continue
                group_positions[gid].append((position,part))
            else:gid=None;g={}
            prompt=text(q.get('prompt'))
            if not prompt and part<=4:
                prompt='Listen and select the best answer.';warnings.append(f'Q{position}: source prompt empty; generic instruction used')
            if not prompt:fatal.append(f'Q{position}: empty prompt');continue
            gp=group_text(g);own_passage=text(q.get('passage'));tr=text(q.get('transcript'))
            expl=explanations.get(i,{});ex='\n\n'.join(dict.fromkeys(t for v in [expl.get('explanation'),expl.get('aiexplanation'),q.get('explanation'),tr] if (t:=text(v))))
            au=refs(q,'AUDIO')+refs(g,'AUDIO');im=refs(q,'IMAGE')+refs(g,'IMAGE')
            audio=next((f for v in au if (f:=media.find(v,'AUDIO'))),None)
            imgs=list(dict.fromkeys(f for v in im if (f:=media.find(v,'IMAGE'))))
            if part<=4 and not audio:warnings.append(f'Q{position}: audio unresolved')
            if part==1 and not imgs:warnings.append(f'Q{position}: photo unresolved')
            missing=[v for v in im if not media.find(v,'IMAGE')]
            if missing:warnings.append(f'Q{position}: {len(missing)} referenced images unresolved')
            if len(imgs)>1:warnings.append(f'Q{position}: multiple images; schema supports only one image per question/passage, others in local archive')
            if part>=6 and not (gp or own_passage or imgs):warnings.append(f'Q{position}: reading passage unavailable')
            items.append({'order':position,'id':i,'part':part,'gid':gid,'prompt':prompt,'options':opts,'correct':ci,'explanation':ex,'passage':gp or own_passage,'audio':str(audio) if audio else None,'images':[str(v) for v in imgs],'raw_question':q,'raw_group':g,'raw_explanations':expl})
        for gid,positions in group_positions.items():
            pos=[x[0] for x in positions];part=positions[0][1];n=len(pos)
            if len({x[1] for x in positions})!=1 or pos!=list(range(pos[0],pos[0]+n)) or (part in (3,4) and n!=3) or (part==6 and n!=4) or (part==7 and not 2<=n<=5):fatal.append(f'Group {gid}: invalid size/order ({n})')
        info.update({'title':title,'test_id':tid,'identity_confirmed':bool(tid in tests),'warnings':warnings,'issues':fatal})
        if fatal or len(items)!=200:continue
        info['status']='DRAFT_READY' if not warnings else 'DRAFT_MEDIA_REVIEW'
        candidates.append({'key':digest,'title':title,'source':info['file'],'test_id':tid,'warnings':warnings,'questions':items})
    inventory={}
    for name,tables in [('content.db',('documents','tips','vocabulary')),('toeic.db',('questions',))]:
        path=root/name
        if path.is_file():
            try:
                with sqlite3.connect(path.as_uri()+'?mode=ro',uri=True) as con:
                    inventory[name]={t:con.execute('SELECT COUNT(*) FROM '+t).fetchone()[0] for t in tables}
            except sqlite3.Error:inventory[name]={'error':'Cannot read expected tables'}
    print('SQLite inventory:',json.dumps(inventory,ensure_ascii=False))
    result={'sqlite_inventory':inventory,'raw_files':len(files),'unique_test_ids':len(tests),'errors':errors,'files_with_questions':len(report),'exact_structure_files':sum(1 for x in report if 'key' in x),'draft_candidates':len(candidates),'media_review':sum(bool(x['warnings']) for x in candidates),'files':report,'note':'Original order preserved within each file. Unknown original title/ID; no claim of source identity. Drafts only, no publication or score scales.'}
    save_json(out/'REPORT.json',result);save_json(out/'EXAMS_LOCAL.json',candidates)
    print(f'File co cau hoi: {len(report)} | Du cau va thu tu: {result["exact_structure_files"]} | Co the nhap nhap ban: {len(candidates)} | Can xem media: {result["media_review"]}')
    return candidates,result

def envfile(path):
    vals={}
    if path.is_file():
        for line in path.read_text(encoding='utf-8-sig').splitlines():
            m=re.match(r'^\s*(?:export\s+)?([A-Za-z_][A-Za-z0-9_.-]*)\s*=\s*(.*?)\s*$',line)
            if m:vals[m[1]]=m[2].strip().strip('"\'')
    return {**vals,**os.environ}
def ask(label,default):return input(f'{label} [{default}]: ').strip() or str(default)
def apply(args,candidates,out,report):
    if not candidates:print('Khong co de hop le de nhap.');raise SystemExit(2)
    if not args.server and input('Chi nhap hoc lieu ban co quyen su dung. De duoc luu ban nhap, KHONG cong bo. Go IMPORT de tiep tuc: ').strip()!='IMPORT':print('Da huy.');return
    try:import pymysql
    except ImportError:raise SystemExit('Can PyMySQL: py -3 -m pip install pymysql; sau do chay lai --apply')
    project=Path(args.project).resolve();env=envfile(project/'.env');config=envfile(project/'application-local.properties');env={**config,**env}
    host=env.get('DB_HOST','localhost');port=env.get('DB_PORT','3306');db=env.get('DB_NAME','n11_toeic')
    url=env.get('DB_URL') or env.get('spring.datasource.url') or ''
    if url.startswith('jdbc:mysql://') and '${' not in url:
        v=urlsplit(url[5:]);host=v.hostname or host;port=v.port or port;db=v.path.strip('/') or db
    if args.server:
        v=urlsplit(os.environ['N11_IMPORT_JDBC_URL'].removeprefix('jdbc:'))
        if v.scheme!='mysql' or v.username or v.password:raise SystemExit('Unsupported JDBC URL')
        host=v.hostname;port=v.port or 3306;db=v.path.strip('/');user=os.environ['N11_IMPORT_DB_USER']
    else:
        host=ask('MySQL host',host);port=int(ask('MySQL port',port));db=ask('Database',db);user=ask('MySQL user',env.get('DB_USERNAME') or env.get('DB_USER') or env.get('spring.datasource.username') or 'root')
    if host not in ('localhost','127.0.0.1','::1'):raise SystemExit('V35 chi ho tro MySQL local de tranh ghi nham may chu.')
    password=os.environ['N11_IMPORT_DB_PASSWORD'] if args.server else getpass.getpass('MySQL password (Enter dung .env neu co): ') or env.get('DB_PASSWORD',env.get('spring.datasource.password',''))
    if not re.fullmatch(r'[A-Za-z0-9_]+',db):raise SystemExit('Database name invalid')
    media_dir=Path(args.media_dir or env.get('N11_LISTENING_UPLOAD_DIR') or project/'listening-uploads');media_dir=(project/media_dir).resolve() if not media_dir.is_absolute() else media_dir.resolve()
    if not args.server:media_dir=Path(ask('Thu muc upload cua ListeningMediaStore',media_dir)).resolve()
    c=pymysql.connect(host=host,port=port,user=user,password=password,database=db,charset='utf8mb4',autocommit=False,connect_timeout=10,cursorclass=pymysql.cursors.DictCursor)
    results=[];lock='n11_exam_v35_'+hashlib.sha256(db.encode()).hexdigest()[:24];locked=False
    try:
        with c.cursor() as cur:
            def query(sql,*a):cur.execute(sql,a);return cur.fetchall()
            def insert(sql,*a):cur.execute(sql,a);return cur.lastrowid
            admins=query("SELECT id,email FROM users WHERE role='ADMIN' AND status='ACTIVE' ORDER BY id")
            if not admins:raise RuntimeError('Khong co ADMIN ACTIVE')
            if args.server:
                admin_id=next((a['id'] for a in admins if a['email']==os.environ['N11_IMPORT_ADMIN_EMAIL']),None)
            else:
                for admin in admins:print(admin['id'],admin['email'])
                admin_id=int(ask('ID Admin tao de',admins[0]['id']))
            if admin_id not in {a['id'] for a in admins}:raise RuntimeError('Admin khong hop le')
            if query('SELECT GET_LOCK(%s,10) AS acquired',lock)[0]['acquired']!=1:raise RuntimeError('Importer dang chay o noi khac')
            locked=True;c.commit()
            media_dir.mkdir(parents=True,exist_ok=True)
            def media_id(path):
                if not path:return None
                p=Path(path);ext=p.suffix.lower().lstrip('.')
                if not signature(p,ext):raise RuntimeError('Media invalid: '+p.name)
                # Same file content -> same local URL. No external upload.
                digest=hashlib.sha256(p.read_bytes()).hexdigest();name=str(uuid.uuid5(uuid.NAMESPACE_URL,'n11-v35:'+digest))+'.'+ext;dest=media_dir/name
                if dest.exists():
                    if hashlib.sha256(dest.read_bytes()).hexdigest()!=digest:raise RuntimeError('Media conflict: '+name)
                else:
                    temp=dest.with_suffix(dest.suffix+'.tmp');shutil.copyfile(p,temp);temp.replace(dest)
                url='/listening-media/'+name;kind='AUDIO' if MIME[ext].startswith('audio/') else 'IMAGE'
                old=query('SELECT id,media_type FROM media_assets WHERE file_url=%s ORDER BY id LIMIT 1',url)
                if old:
                    if old[0]['media_type']!=kind:raise RuntimeError('Media type conflict')
                    return old[0]['id']
                return insert('INSERT INTO media_assets(media_type,file_url,mime_type,created_by) VALUES(%s,%s,%s,%s)',kind,url,MIME[ext],admin_id)
            for e in candidates:
                marker=MARK+e['key']+']';res={'source':e['source'],'title':e['title'],'key':e['key']};results.append(res)
                try:
                    # Marker also lives on source sets, protecting reruns after a title edit.
                    old=query('SELECT id FROM exam_papers WHERE INSTR(COALESCE(description,\'\'),%s)>0',marker)
                    sets=query('SELECT id FROM practice_sets WHERE INSTR(COALESCE(instructions,\'\'),%s)>0',marker)
                    if old or sets:res.update(status='SKIP_EXISTING',exam_ids=[r['id'] for r in old]);c.rollback();print('SKIP',e['title']);continue
                    desc=marker+'\nNguon file: '+e['source']+'\nTen goc chua xac minh; ban nhap, can kiem tra quyen su dung va media.'
                    if e['test_id']:desc+='\nSource test ID: '+e['test_id']
                    if e['warnings']:desc+='\nCan kiem tra '+str(len(e['warnings']))+' canh bao media; xem REPORT.json.'
                    eid=insert("INSERT INTO exam_papers(title,description,exam_type,duration_minutes,is_published,created_by) VALUES(%s,%s,'LR_FULL',120,0,%s)",e['title'][:220],desc,admin_id)
                    sids={};passages={}
                    for q in e['questions']:
                        part=q['part'];skill='LISTENING' if part<=4 else 'READING'
                        if part not in sids:sids[part]=insert("INSERT INTO practice_sets(skill,part_no,title,instructions,difficulty,is_published,created_by) VALUES(%s,%s,%s,%s,'MEDIUM',0,%s)",skill,part,(e['title']+' - Part '+str(part))[:200],marker+'\nEXAM SOURCE DRAFT - do not publish as practice'+('\n[N11_OFFLINE_REVIEW_REQUIRED]' if any('generic instruction used' not in w for w in e['warnings']) else ''),admin_id)
                        sid=sids[part];audio=media_id(q['audio']);images=[media_id(x) for x in q['images'][:2]];image=images[0] if images else None
                        # Shared group: keep common passage and first image in passage; question may have a second image.
                        # Extra images/HTML remain in the local archive, not silently treated as complete.
                        gid=q['gid'];pid=None
                        if gid:
                            key=gid or 'q:'+q['id']
                            if key not in passages:
                                passage_img=images[1] if len(images)>1 else (image if gid else None)
                                passages[key]=insert('INSERT INTO practice_passages(practice_set_id,passage_text,audio_media_id,image_media_id,sort_order) VALUES(%s,%s,%s,%s,%s)',sid,q['passage'] or None,audio if gid else None,passage_img,q['order'])
                            pid=passages[key]
                        qid=insert('INSERT INTO practice_questions(practice_set_id,passage_id,question_text,explanation,audio_media_id,image_media_id,sort_order) VALUES(%s,%s,%s,%s,%s,%s,%s)',sid,pid,q['prompt'],q['explanation'] or None,audio,image,q['order'])
                        for k,opt in enumerate(q['options']):insert('INSERT INTO practice_options(question_id,option_label,option_text,is_correct) VALUES(%s,%s,%s,%s)',qid,'ABCD'[k],opt,k==q['correct'])
                        insert('INSERT INTO exam_paper_questions(exam_paper_id,question_id,question_order) VALUES(%s,%s,%s)',eid,qid,q['order'])
                    check=query('SELECT COUNT(*) n,COUNT(DISTINCT question_order) distinct_n,MIN(question_order) first_order,MAX(question_order) last_order FROM exam_paper_questions WHERE exam_paper_id=%s',eid)[0]
                    if tuple(check[k] for k in ('n','distinct_n','first_order','last_order'))!=(200,200,1,200):raise RuntimeError('Invalid saved exam counts')
                    c.commit();res.update(status='IMPORTED_DRAFT',exam_id=eid,questions=200,media_warnings=len(e['warnings']));print('IMPORTED',eid,e['title'])
                except Exception as ex:
                    c.rollback();res.update(status='FAILED',error_type=type(ex).__name__,error=('See server database log; transaction rolled back' if args.server else str(ex)[:400]));print('FAILED',e['title'],type(ex).__name__)
                save_json(out/'IMPORT_RESULT.json',{'results':results,'note':'All imported exams and source sets are unpublished. Media files may remain after rollback; no existing files removed.'})
    finally:
        if locked:
            try:
                with c.cursor() as cur:cur.execute('SELECT RELEASE_LOCK(%s)',(lock,))
            except Exception:pass
        c.close()
    print('RESULT:',out/'IMPORT_RESULT.json');print('Imported:',sum(x['status']=='IMPORTED_DRAFT' for x in results),'Skipped:',sum(x['status']=='SKIP_EXISTING' for x in results),'Failed:',sum(x['status']=='FAILED' for x in results))
    if any(x['status']=='FAILED' for x in results):raise SystemExit(2)

def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--root',default=r'E:\AnhNgu24H_TOEIC_Offline');ap.add_argument('--project',default=r'E:\N11_TOEIC');ap.add_argument('--out',default=str(Path.home()/'Downloads'/'N11_OFFLINE_IMPORT_V35'));ap.add_argument('--media-dir');ap.add_argument('--apply',action='store_true');ap.add_argument('--server',action='store_true',help=argparse.SUPPRESS);a=ap.parse_args();out=Path(a.out);out.mkdir(parents=True,exist_ok=True)
    c,r=scan(Path(a.root).resolve(),out);print('REPORT:',out/'REPORT.json')
    if a.apply:apply(a,c,out,r)
    else:print('READ ONLY: de nhap MySQL, chay lai voi --apply.')
if __name__=='__main__':main()
