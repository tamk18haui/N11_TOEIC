/* Mở mã giao diện: bấm chuột phải 7 lần liên tiếp trên cùng phần tử.
   Chỉ chạy trên localhost và trang quản trị. JSP quyết định cấu trúc;
   CSS quyết định màu, kích thước và bố cục. Không đọc hay sửa CSDL. */
(() => {
  'use strict';
  const path = location.pathname.replace(/^\/[^/]+(?=\/admin(?:\/|$))/, '');
  if (!['localhost','127.0.0.1','[::1]'].includes(location.hostname) || !/^\/admin(?:\/|$)/.test(path) || window.__n11SourceV31) return;
  window.__n11SourceV31=true;
  try {
    const v=new URLSearchParams(location.search).get('n11code');
    if(v==='0')localStorage.setItem('n11-dev-source-disabled','1');
    if(v==='1')localStorage.removeItem('n11-dev-source-disabled');
    if(localStorage.getItem('n11-dev-source-disabled')==='1')return;
  } catch(_){}
  const ROOT='src/main/webapp/WEB-INF/views/',ASSETS='src/main/resources/static/assets/';
  function jsp(el) {
    if(el.closest('.admin-sidebar,.admin-nav'))return ROOT+'fragments/admin-sidebar.jspf';
    let f=null;
    if(/^\/admin\/?$/.test(path))f='admin/index.jsp';
    else if(/^\/admin\/accounts\/(new|\d+\/edit)\/?$/.test(path))f='admin/account-form.jsp';
    else if(/^\/admin\/accounts\/?$/.test(path))f='admin/accounts.jsp';
    else if(/^\/admin\/listening\/import/.test(path))f='admin/listening/import.jsp';
    else if(/^\/admin\/listening\/media/.test(path))f='admin/listening/media.jsp';
    else if(/^\/admin\/listening\/.*questions?/.test(path))f='admin/listening/question-form.jsp';
    else if(/^\/admin\/listening\/sets\/(new|\d+\/edit)/.test(path))f='admin/listening/set-form.jsp';
    else if(/^\/admin\/listening\/sets\/\d+\/?$/.test(path))f='admin/listening/detail.jsp';
    else if(/^\/admin\/listening\/?$/.test(path))f='admin/listening/index.jsp';
    else if(/^\/admin\/reading\/sets\/\d+\/questions\/(new|\d+\/edit)\/?$/.test(path))f='admin/reading/question-form.jsp';
    else if(/^\/admin\/reading\/sets\/(new|\d+\/edit)\/?$/.test(path))f='admin/reading/set-form.jsp';
    else if(/^\/admin\/reading\/sets\/\d+\/?$/.test(path))f='admin/reading/detail.jsp';
    else if(/^\/admin\/reading\/?$/.test(path))f='admin/reading/index.jsp';
    else if(/^\/admin\/grammar\/lessons\/[^/]+\/questions\//.test(path))f='grammar/admin/question.jsp';
    else if(/^\/admin\/grammar\/lessons\/(new|\d+)\/?$/.test(path))f='grammar/admin/lesson.jsp';
    else if(/^\/admin\/grammar\/?$/.test(path))f='grammar/admin/index.jsp';
    else if(/^\/admin\/vocabulary\/topics\/\d+\/lessons\/(new|\d+)\/?$/.test(path))f='vocabulary/admin/lesson.jsp';
    else if(/^\/admin\/vocabulary\/topics\/\d+\/terms\/(new|\d+)\/?$/.test(path))f='vocabulary/admin/term.jsp';
    else if(/^\/admin\/vocabulary\/topics\/(new|\d+)\/?$/.test(path))f='vocabulary/admin/topic.jsp';
    else if(/^\/admin\/vocabulary\/?$/.test(path))f='vocabulary/admin/index.jsp';
    else if(/^\/admin\/exams\/?$/.test(path))f='admin/exams.jsp';
    return f?ROOT+f:null;
  }
  // Mỗi phần tử JSP có mã định vị duy nhất. Handler đọc file gốc để tìm đúng dòng/cột.
  function jspPosition(el) {
    const mark=el.closest('[data-n11-src]')?.getAttribute('data-n11-src');
    const m=mark?.match(/^([\w/.-]+\.jspf?)\|([1-9]\d*)$/);
    return m?{file:ROOT+m[1],marker:m[2]}:jsp(el)?{file:jsp(el)}:null;
  }
  const normalize=s=>s.replace(/\/\*[\s\S]*?\*\//g,'').replace(/\s+/g,' ').replace(/\s*([,>+~])\s*/g,'$1').trim();
  // Tách dấu phẩy ngoài ngoặc: dùng cho selector có :is(), :not(), :has().
  function splitSelectors(s) {
    let q='',level=0,start=0,arr=[];
    for(let i=0;i<s.length;i++){
      const c=s[i];if(c==='\\'){i++;continue;}
      if(q){if(c===q)q='';continue;}
      if(c==='"'||c==="'"){q=c;continue;}
      if(c==='('||c==='[')level++;else if(c===')'||c===']')level--;
      else if(c===','&&!level){arr.push(s.slice(start,i).trim());start=i+1;}
    } arr.push(s.slice(start).trim());return arr.filter(Boolean);
  }
  const cmp=(a,b)=>a[0]-b[0]||a[1]-b[1]||a[2]-b[2];
  const add=(a,b)=>{for(let i=0;i<3;i++)a[i]+=b[i];};
  function specificity(s) {
    const out=[0,0,0];let i=0,expectType=true;
    while(i<s.length){const c=s[i];
      if(/[\s>+~|]/.test(c)){expectType=true;i++;continue;}
      if(c==='['){let q='',j=i+1;for(;j<s.length;j++){if(s[j]==='\\'){j++;continue;}if(q){if(s[j]===q)q='';}else if(s[j]==='"'||s[j]==="'")q=s[j];else if(s[j]===']')break;}out[1]++;i=j+1;expectType=false;continue;}
      if(c==='#'||c==='.'){out[c==='#'?0:1]++;i++;while(i<s.length&&/[\w-]/.test(s[i]))i++;expectType=false;continue;}
      if(c===':'){
        const pseudo=s.slice(i).match(/^(:{1,2})([\w-]+)/);if(!pseudo){i++;continue;}
        const name=pseudo[2].toLowerCase();i+=pseudo[0].length;
        if(pseudo[1]==='::'||['before','after','first-line','first-letter'].includes(name))out[2]++;
        else if(!['where','is','not','has'].includes(name))out[1]++;
        if(s[i]==='('){let d=1,j=i+1,q='';for(;j<s.length&&d;j++){let x=s[j];if(x==='\\'){j++;continue;}if(q){if(x===q)q='';continue;}if(x==='"'||x==="'")q=x;else if(x==='(')d++;else if(x===')')d--;}
          const arg=s.slice(i+1,j-1);if(['is','not','has'].includes(name)){const best=splitSelectors(arg).map(specificity).sort((a,b)=>cmp(b,a))[0];if(best)add(out,best);}
          else if(/^nth-(child|last-child)$/.test(name)&&/\bof\s+/.test(arg)){const best=splitSelectors(arg.split(/\bof\s+/).slice(1).join('of ')).map(specificity).sort((a,b)=>cmp(b,a))[0];if(best)add(out,best);}
          i=j;
        }expectType=false;continue;
      }
      const w=s.slice(i).match(/^[a-zA-Z_][\w-]*/);if(w){if(expectType)out[2]++;i+=w[0].length;expectType=false;continue;}
      i++;expectType=false;
    }return out;
  }
  // Đọc quy tắc CSS đang nạp thực tế (bao gồm @media đang hoạt động).
  // Cascade layer, animation, pseudo-element và CSS do JavaScript tạo có thể cần F12 để xác minh.
  const cssFile=href=>{try{const u=new URL(href,location.href);if(u.origin!==location.origin)return null;const m=u.pathname.match(/\/assets\/css\/((?:[\w-]+\/)*[\w.-]+\.css)$/);return m?ASSETS+'css/'+m[1]:null;}catch(_){return null;}};
  function matched(el) {
    const rows=[];let order=0;
    function visit(list,sheet) {
      for(const rule of list){
        const kind=rule.constructor.name;
        if(kind==='CSSMediaRule'&&!matchMedia(rule.conditionText).matches)continue;
        if(kind==='CSSSupportsRule'&&!CSS.supports(rule.conditionText))continue;
        if(kind==='CSSKeyframesRule'||kind==='CSSContainerRule'||kind==='CSSScopeRule')continue;
        if(rule.selectorText&&rule.style){
          const ranks=[];for(const sel of splitSelectors(rule.selectorText))try{if(el.matches(sel))ranks.push(specificity(sel));}catch(_){}
          if(ranks.length)rows.push({rule,style:rule.style,rank:ranks.sort((a,b)=>cmp(b,a))[0],order:++order,file:cssFile(sheet.href),href:sheet.href});
        }
        if(rule.styleSheet){try{visit(rule.styleSheet.cssRules,rule.styleSheet);}catch(_){} }
        else if(rule.cssRules)visit(rule.cssRules,sheet);
      }
    }
    for(const sheet of document.styleSheets)try{if(!sheet.disabled&&(!sheet.media.mediaText||matchMedia(sheet.media.mediaText).matches))visit(sheet.cssRules,sheet);}catch(_){}
    if(el.hasAttribute('style'))rows.push({style:el.style,rank:[100000,0,0],order:++order,inline:jspPosition(el)});
    return rows;
  }
  const SH={color:[], 'background-color':['background'],'background-image':['background'], 'font-size':['font'],'font-weight':['font'],'line-height':['font'], 'font-family':['font']};
  for(const side of ['top','right','bottom','left']){
    for(const suffix of ['color','width','style'])SH[`border-${side}-${suffix}`]=[`border-${side}`,`border-${suffix}`,'border'];
    for(const kind of ['padding','margin'])SH[`${kind}-${side}`]=[kind];
  }
  for(const corner of ['top-left','top-right','bottom-left','bottom-right'])SH[`border-${corner}-radius`]=['border-radius'];
  SH['row-gap']=['gap'];SH['column-gap']=['gap'];
  function declInfo(style,prop) {
    if(style.getPropertyValue(prop))return {priority:style.getPropertyPriority(prop)};
    for(const shorthand of SH[prop]||[])if(style.getPropertyValue(shorthand))return {priority:style.getPropertyPriority(shorthand)};
    return null;
  }
  const inherited=new Set(['color','font-size','font-weight','font-family','line-height','text-align']);
  function winner(el,prop,cache){
    let n=el;
    while(n){if(!cache.has(n))cache.set(n,matched(n));const list=cache.get(n).map(r=>({...r,decl:declInfo(r.style,prop)})).filter(r=>r.decl);
      list.sort((a,b)=>Number(b.decl.priority==='important')-Number(a.decl.priority==='important')||cmp(b.rank,a.rank)||b.order-a.order);
      if(list.length)return {row:list[0],prop,inherited:n!==el};
      if(!inherited.has(prop))break;n=n.parentElement;
    }return null;
  }
  // Tách mã CSS gốc để xác định chính xác dòng/cột của khai báo, không dùng số dòng CSSOM giả.
  function boundary(s,start,end,chars){let q='',paren=0,bracket=0;
    for(let i=start;i<end;i++){const c=s[i];if(c==='\\'){i++;continue;}
      if(q){if(c===q)q='';continue;}if(c==='"'||c==="'"){q=c;continue;}
      if(c==='/'&&s[i+1]==='*'){const j=s.indexOf('*/',i+2);if(j<0)return end;i=j+1;continue;}
      if(c==='(')paren++;else if(c===')')paren--;else if(c==='[')bracket++;else if(c===']')bracket--;
      else if(!paren&&!bracket&&chars.includes(c))return i;
    }return end;
  }
  function blockEnd(s,start,end){let depth=1,i=start;while(i<end){i=boundary(s,i,end,'{}');if(i>=end)return end;if(s[i]==='{')depth++;else if(!--depth)return i;i++;}return end;}
  function skip(s,i,end){while(i<end){if(/\s/.test(s[i])){i++;continue;}if(s.startsWith('/*',i)){const j=s.indexOf('*/',i+2);if(j<0)return end;i=j+2;continue;}break;}return i;}
  function scanCss(s){const rules=[];
    function visit(a,b){let i=a;while((i=skip(s,i,b))<b){let j=boundary(s,i,b,'{;}');if(j===b)break;if(s[j]!== '{'){i=j+1;continue;}let k=blockEnd(s,j+1,b);if(k===b)break;
      const sel=s.slice(i,j).trim();if(sel.startsWith('@')){if(/^@(media|supports|layer|container|scope|starting-style)\b/i.test(sel))visit(j+1,k);}
      else rules.push({sel,body:s.slice(j+1,k),start:j+1});i=k+1;
    }}visit(0,s.length);return rules;
  }
  const sourceCache=new Map();
  async function loadSource(href){if(!sourceCache.has(href))sourceCache.set(href,fetch(href,{credentials:'same-origin',cache:'no-cache'}).then(r=>{if(!r.ok)throw new Error('CSS');return r.text();}).then(s=>({s,rules:scanCss(s)})).catch(()=>null));return sourceCache.get(href);}
  function locationAt(s,index){return {line:s.slice(0,index).split('\n').length,column:index-s.lastIndexOf('\n',index-1)};}
  function declPosition(raw,s,prop){let i=raw.start,end=raw.start+raw.body.length,found=null;
    while((i=skip(s,i,end))<end){let j=boundary(s,i,end,';');let c=boundary(s,i,j,':');
      if(c<j){const name=s.slice(i,c).trim();const value=s.slice(c+1,j);const temp=document.createElement('i').style;temp.cssText=name+':'+value;
        const info=declInfo(temp,prop);if(info&&(!found||found.priority!=='important'||info.priority==='important'))found={...locationAt(s,i),priority:info.priority};
      }i=j+1;
    }return found;
  }
  async function sourcePosition(w){if(!w)return null;const {row,prop}=w;
    if(row.inline)return {...row.inline,inline:true};if(!row.file||!row.href)return null;
    const source=await loadSource(row.href);if(!source)return {file:row.file};
    const matches=source.rules.filter(r=>normalize(r.sel)===normalize(row.rule.selectorText));
    // CSSOM chuẩn hóa shorthand và khoảng trắng; so khớp toàn bộ declaration trước khi dùng vị trí.
    const exact=matches.filter(r=>{const st=document.createElement('i').style;st.cssText=r.body;return st.cssText===row.style.cssText;});
    const candidates=exact.length?exact:matches.length===1?matches:[];
    if(candidates.length!==1)return {file:row.file};
    const pos=declPosition(candidates[0],source.s,prop);return pos?{file:row.file,line:pos.line,column:pos.column}:{file:row.file};
  }
  // Nhận diện thành phần theo vai trò, không ưu tiên span chỉ vì có mã JSP.
  const controls='button, input:not([type=hidden]), select, textarea, a.btn, [role=button], .admin-link';
  const cards='.admin-stat, .stat-card, .ff-stat, .admin-module-card, .panel-card, .account-panel, .account-form-card, .ff-hero, .admin-welcome, .listening-filter-panel';
  const textTags='h1,h2,h3,h4,h5,h6,p,span,strong,b,small,label,summary,figcaption';
  function identify(hit){
    const control=hit.closest(controls), frame=hit.closest(cards);
    const el=control||frame||hit.closest('a,td,th,img,audio,video')||hit.closest(textTags)||hit.closest('table,form,section,article,nav')||hit.closest('[data-n11-src]')||hit;
    let kind='box',label='Khung';
    if(el.matches('button,a.btn,[role=button]')){kind='button';label='Nút';}
    else if(el.matches('input,select,textarea')){kind='field';label='Ô nhập / chọn';}
    else if(el.matches('.admin-stat,.stat-card,.ff-stat')){kind='card';label='Thẻ thống kê';}
    else if(el.matches(cards)){kind='card';label='Khung nội dung';}
    else if(el.matches('a,.admin-link')){kind='link';label='Liên kết';}
    else if(el.matches('img,audio,video')){kind='media';label='Tài nguyên';}
    else if(el.matches('td,th')){kind='cell';label='Ô bảng';}
    else if(el.matches(textTags)){kind='text';label='Chữ';}
    // Chữ trúng trực tiếp hoặc tiêu đề mặc định của khung; không lấy cả số liệu và mô tả chung.
    let t=hit.closest(textTags);
    if(hit!==el&&el.contains(hit)&&hit.hasAttribute('data-n11-src')&&[...hit.childNodes].some(n=>n.nodeType===3&&n.textContent.trim()))t=hit;
    if(t&&(!el.contains(t)||!t.textContent.trim()||t.querySelector('button,input,select,textarea,table')))t=null;
    if(!t&&kind!=='field'&&kind!=='media'){
      if(kind==='button'||kind==='link'||kind==='text')t=el;
      else if(kind==='card')t=el.querySelector('.admin-stat-label,.stat-label,.label,h1,h2,h3,h4')||[...el.querySelectorAll('span:not(.stat-icon):not(.num),strong:not(.num),small,p')].find(x=>x.textContent.trim());
      else if(!el.querySelector('button,input,select,textarea,table')&&el.textContent.trim()&&el.textContent.trim().length<100)t=el;
    }
    // Tìm chữ có nội dung thực; bỏ biểu tượng SVG hoặc thẻ rỗng.
    if(t&&!t.textContent.trim())t=[...el.querySelectorAll(textTags)].find(x=>x.textContent.trim())||null;
    if(!t&&kind==='field')t=el;
    if(t&&!el.contains(t))t=null;
    const name=(t?.textContent||el.getAttribute('aria-label')||el.getAttribute('placeholder')||'').replace(/\s+/g,' ').trim().slice(0,70);
    return {el,text:t,kind,label,name};
  }
  const boxGroups=[['Màu viền',['border-top-color','border-right-color','border-bottom-color','border-left-color']],
    ['Độ dày viền',['border-top-width','border-right-width','border-bottom-width','border-left-width']],
    ['Bo góc',['border-top-left-radius','border-top-right-radius','border-bottom-left-radius','border-bottom-right-radius']],
    ['Kích thước',['width','height','min-width','min-height','max-width','max-height']],
    ['Khoảng cách trong',['padding-top','padding-right','padding-bottom','padding-left']],
    ['Khoảng cách ngoài',['margin-top','margin-right','margin-bottom','margin-left']],
    ['Bóng đổ',['box-shadow']],['Bố cục',['display','grid-template-columns','flex-direction','row-gap','column-gap','align-items','justify-content']]];
  const textGroups=[['Màu chữ',['color']],['Cỡ chữ',['font-size']],['Độ đậm chữ',['font-weight']],['Căn chữ',['text-align']],['Kiểu chữ',['font-family']]];
  let card,tip,previous={target:null,time:0,count:0};
  function open(pos){if(!pos?.file)return;let suffix=pos.marker?'?marker='+pos.marker:pos.line?'?line='+pos.line+(pos.column?'&column='+pos.column:''):'';location.href='n11toeic-source://open/'+pos.file+suffix;}
  function copy(pos){const v=pos.file+(pos.line?':'+pos.line:'');if(navigator.clipboard?.writeText)navigator.clipboard.writeText(v).catch(()=>prompt('Sao chép đường dẫn:',v));else prompt('Sao chép đường dẫn:',v);}
  function close(){card?.remove();card=null;}
  function button(box,label,action){const b=document.createElement('button');b.type='button';b.textContent=label;b.style.cssText='margin:3px;padding:6px 9px;border:1px solid #bde5dc;border-radius:8px;background:#e7fbf1;color:#075c51;cursor:pointer;font:600 12px Segoe UI,Arial';b.onclick=action;box.append(b);return b;}
  function section(box,title){const d=document.createElement('div');d.style.cssText='border-top:1px solid #d8e7e3;margin-top:8px;padding-top:7px';const h=document.createElement('div');h.textContent=title;h.style.cssText='font-weight:700;margin:0 3px 3px;color:#315a54';d.append(h);box.append(d);return d;}
  const labels={'background-image':'Ảnh nền / gradient','background-color':'Màu nền','width':'Rộng','height':'Cao','min-width':'Rộng tối thiểu','min-height':'Cao tối thiểu','max-width':'Rộng tối đa','max-height':'Cao tối đa','display':'Kiểu bố cục','grid-template-columns':'Cột lưới','flex-direction':'Hướng flex','row-gap':'Khoảng cách hàng','column-gap':'Khoảng cách cột','align-items':'Căn phần tử','justify-content':'Phân bố phần tử'};
  function propLabel(p){return labels[p]||p.replace(/top|right|bottom|left/g,x=>({top:'trên',right:'phải',bottom:'dưới',left:'trái'})[x]);}
  function groupChoices(node,groups,cache){
    const style=getComputedStyle(node);
    return groups.map(([label,props])=>({label,ws:props.filter(prop=>prop!=='background-image'||style.backgroundImage!=='none').map(prop=>winner(node,prop,cache)).filter(Boolean)}));
  }
  async function renderChoices(box,choices,current){
    const results=await Promise.all(choices.map(async ({label,ws})=>{const items=[];
      for(const w of ws){const pos=await sourcePosition(w);if(pos&&!items.some(x=>x.pos.file===pos.file&&x.pos.line===pos.line&&x.pos.column===pos.column&&x.pos.marker===pos.marker))items.push({pos,prop:w.prop,inherited:w.inherited});}
      return {label,items};}));
    if(card!==current)return;
    let count=0;
    for(const {label,items} of results){if(!items.length)continue;count++;
      if(items.length===1){const {pos,prop,inherited}=items[0];const b=button(box,label,()=>open(pos));b.title=prop+(inherited?' (kế thừa)':'')+' · '+pos.file+(pos.line?':'+pos.line:' (mở file)');if(!pos.line&&!pos.marker)b.textContent=label+' · file';}
      else{const d=document.createElement('details');d.style.cssText='display:inline-block;vertical-align:top;margin:3px';const summary=document.createElement('summary');summary.textContent=label;summary.style.cssText='padding:6px 9px;border:1px solid #bde5dc;border-radius:8px;background:#e7fbf1;cursor:pointer;font-weight:600';d.append(summary);for(const {pos,prop} of items){const b=button(d,propLabel(prop),()=>open(pos));b.title=pos.file+(pos.line?':'+pos.line:' (mở file)');}box.append(d);}
    }
    if(!count){const n=document.createElement('small');n.textContent='Không có khai báo CSS cục bộ.';box.append(n);}
  }
  async function show(target){
    close();const {el,text,kind,label,name}=target;const current=document.createElement('aside');card=current;current.className='n11-dev-card-v26';
    current.style.cssText='position:fixed;z-index:2147483000;right:16px;bottom:16px;width:min(390px,calc(100vw - 32px));max-height:60vh;overflow:auto;padding:12px;background:white;color:#173c38;border:1px solid #bce8d9;border-radius:12px;box-shadow:0 12px 35px #003c3630;font:12px/1.4 Segoe UI,Arial;text-align:left';
    const h=document.createElement('strong');h.textContent='N11 · MỞ CODE GIAO DIỆN';current.append(h);button(current,'Đóng',close);
    const caption=document.createElement('div');caption.textContent=label+(name?' · '+name:'');caption.style.cssText='font-weight:600;margin:5px 3px';current.append(caption);
    // JSP khung và JSP nội dung trỏ đến hai marker khác nhau nếu chữ nằm trong thẻ con.
    const structure=jspPosition(el),content=text?jspPosition(text):null;
    if(structure){const j=section(current,'JSP');button(j,kind==='text'?'Thẻ chữ':kind==='button'?'Cấu trúc nút':'Cấu trúc '+(kind==='card'?'khung':'thành phần'),()=>open(structure));
      if(content&&kind!=='field')button(j,'Nội dung chữ',()=>open(content));
      button(j,'Copy JSP',()=>copy(structure));}
    button(current,'Bật chế độ kéo thả',()=>{close();window.__n11VisualStart?.(target);});
    const cache=new Map();
    const background=kind==='button'?'Màu nút':kind==='card'||kind==='box'?'Màu nền khung':'Màu nền';
    const shape=kind!=='text'?groupChoices(el,[[background,['background-image','background-color']],...boxGroups],cache):[];
    const typography=text?groupChoices(text,textGroups,cache):[];
    const jobs=[];
    if(shape.length){const d=section(current,kind==='button'?'Kiểu dáng nút':kind==='card'||kind==='box'?'Kiểu dáng khung':'Kiểu dáng');jobs.push(renderChoices(d,shape,current));}
    if(typography.length){const d=section(current,'Chữ bên trong');jobs.push(renderChoices(d,typography,current));}
    document.body.append(current);await Promise.all(jobs);
  }
  window.__n11VisualIdentify=identify;
  document.addEventListener('keydown',e=>{if(e.key==='Escape')close();});
  document.addEventListener('contextmenu',e=>{
    if(window.__n11VisualActive||e.shiftKey||e.ctrlKey||e.altKey||!(e.target instanceof Element)||e.target.closest('.n11-dev-card-v26'))return;
    e.preventDefault();const selected=identify(e.target),el=selected.el;
    const now=Date.now(),count=el===previous.target&&now-previous.time<1700?previous.count+1:1;previous={target:el,time:now,count};tip?.remove();
    if(count===7){previous={target:null,time:0,count:0};show(selected).catch(console.warn);return;}
    if(count>=2){tip=document.createElement('div');tip.textContent='Mở code '+count+'/7';tip.style.cssText='position:fixed;bottom:12px;left:12px;z-index:2147483000;background:#00796b;color:white;border-radius:8px;padding:6px 9px;font:12px Arial';document.body.append(tip);const t=tip;setTimeout(()=>t.remove(),1700);}
  },true);
})();
