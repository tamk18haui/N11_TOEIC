/* N11 V42: chỉ trình bày dữ liệu lời giải sau khi nộp bài. Không thay đổi chấm điểm. */
(function(root){
  'use strict';
  const txt=v=>typeof v==='string'?v.trim():'';
  const norm=v=>txt(v).replace(/^\s*[A-D][.):]\s*/i,'').replace(/\s+/g,' ').trim();
  function chunks(raw){
    const out=[];let start=0,i=0;
    while(i<raw.length){
      if(raw[i]!=='{'){i++;continue;}
      let depth=0,quoted=false,escape=false,end=-1;
      for(let j=i;j<raw.length;j++){
        const c=raw[j];
        if(quoted){if(escape)escape=false;else if(c==='\\')escape=true;else if(c==='"')quoted=false;continue;}
        if(c==='"')quoted=true;else if(c==='{')depth++;else if(c==='}'&&--depth===0){end=j+1;break;}
      }
      if(end<0){if(/^\{\s*"(?:explanation|evidence|correct|wrong|summary)"/.test(raw.slice(i))){if(i>start)out.push(raw.slice(start,i));out.push({invalid:true});start=raw.length;break;}i++;continue;}
      try{const obj=JSON.parse(raw.slice(i,end));if(obj&&typeof obj==='object'&&!Array.isArray(obj)){
        if(i>start)out.push(raw.slice(start,i));out.push(obj);start=end;i=end;continue;
      }}catch(e){if(/^\{\s*"/.test(raw.slice(i,end))){if(i>start)out.push(raw.slice(start,i));out.push({invalid:true});start=end;i=end;continue;}}
      i++;
    }
    if(start<raw.length)out.push(raw.slice(start));return out;
  }
  function sections(raw,part,options,correct){
    const result=[],seen=new Set();
    const add=(kind,title,text)=>{text=txt(text);if(!text)return;const k=kind+'\0'+text;if(!seen.has(k)){seen.add(k);result.push({kind,title,text});}};
    function plain(s){
      for(let p of s.split(/\n\s*\n/)){p=txt(p);if(!p)continue;
        const candidate=p.replace(/^Transcript\s*:\s*/i,'');const lines=candidate.split(/\s*\|\s*/).map(txt).filter(Boolean);
        const matching=part<=2&&options.length>=3&&options.length<=4&&lines.length===options.length&&lines.every((v,i)=>norm(v)===norm(options[i].text));
        if(matching){add('transcript','Transcript',options.map((o,i)=>o.label+'. '+norm(lines[i])).join('\n'));}
        else if(/^Transcript\s*:/i.test(p)){add('transcript','Transcript',lines.join('\n'));}
        else add('plain','',p);
      }
    }
    for(const block of chunks(txt(raw))){
      if(typeof block==='string'){plain(block);continue;}
      if(block.invalid){add('notice','Lưu ý','Một phần lời giải nguồn chưa đúng định dạng. Vui lòng báo quản trị viên.');continue;}
      const before=result.length;
      add('evidence','Dẫn chứng',block.evidence);
      add('explanation','Giải thích',block.explanation);
      const c=block.correct;
      if(c&&typeof c==='object'){
        const label=txt(c.letter).toUpperCase();
        if(/^[A-D]$/.test(label)&&label===correct)add('correct','Đáp án '+label+' – đúng',c.why);
        else if(/^[A-D]$/.test(label))add('notice','Đối chiếu dữ liệu','Lời giải nguồn ghi đáp án '+label+' nhưng không khớp đáp án hệ thống.');
      }
      if(Array.isArray(block.wrong))for(const w of block.wrong){if(!w||typeof w!=='object')continue;const label=txt(w.letter).toUpperCase();if(/^[A-D]$/.test(label)&&label!==correct)add('wrong','Đáp án '+label+' – sai',w.why);}
      add('summary','Ghi nhớ',block.summary);
      if(typeof block.transcript==='string')plain('Transcript: '+block.transcript);
      if(result.length===before)add('notice','Lưu ý','Lời giải có cấu trúc chưa được hỗ trợ. Nội dung gốc vẫn được lưu trong hệ thống.');
    }
    return result;
  }
  function readTemplate(t){return t.content.textContent||'';}
  function render(host,rows){
    for(const item of rows){const box=document.createElement('section');box.className='n11-review-block n11-review-'+item.kind;
      if(item.title){const h=document.createElement('h4');h.textContent=item.title;box.append(h);}
      const p=document.createElement('p');p.textContent=item.text;box.append(p);host.append(box);
    }
  }
  function run(){document.querySelectorAll('.exam-review-row').forEach(row=>{
    const part=Number(row.querySelector('.n11-review-render')?.dataset.part||0);
    const options=Array.from(row.querySelectorAll('.exam-review-answer-line')).map(x=>({label:txt(x.querySelector('b')?.textContent).replace(/\.$/,''),text:txt(x.querySelector('span')?.textContent)}));
    const correct=row.querySelector('.exam-review-answer-correct')?.closest('.exam-review-answer-line')?.querySelector('b')?.textContent.trim().replace(/\.$/,'')||'';
    row.querySelectorAll('.n11-review-render').forEach(host=>{const t=host.querySelector('template');if(!t)return;let raw=readTemplate(t);if(host.dataset.passage==='true'&&part<=4)raw='Transcript: '+raw;
      const data=sections(raw,part,options,correct);t.remove();render(host,data);});
  });}
  if(typeof module==='object'&&module.exports)module.exports={sections,chunks};
  if(typeof document!=='undefined'){if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',run);else run();}
})(typeof globalThis!=='undefined'?globalThis:this);
