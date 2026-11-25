/* Part 6: feedback is unlocked by the server only after a whole passage is answered. */
(() => {
 'use strict';
 const app=document.getElementById('reading-app'); if(!app)return;
 const $=s=>app.querySelector(s), base=app.dataset.base, endpoint=`/reading/api/part6/attempts/${app.dataset.attempt}`;
 const esc=v=>String(v??'').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
 let state,index=0,busy=false,bilingual=false;
 const passage=()=>state.passages[index], questions=()=>state.questions.filter(q=>q.passage_id===passage().id);
 const dialog=$('#reading-dialog');
 function error(message){$('#reading-error').textContent=message;$('#reading-error').hidden=!message;}
 async function api(path,body){
  const options={credentials:'same-origin',headers:{Accept:'application/json'}};
  if(body!==undefined){options.method='POST';options.headers['Content-Type']='application/json';options.headers[app.dataset.csrfHeader]=app.dataset.csrf;options.body=JSON.stringify(body);}
  const r=await fetch(base+path,options);
  if(r.redirected||r.status===401||r.status===403)throw Error('Phiên đăng nhập đã hết hạn. Hãy tải lại trang và đăng nhập để tiếp tục.');
  const result=await r.json().catch(()=>null);if(!r.ok||!result)throw Error(result?.message||'Không thể kết nối máy chủ. Vui lòng thử lại.');return result;
 }
 function english(text){
  return String(text).split(/(\[\d+\])/).map(token=>{
   if(/^\[\d+\]$/.test(token))return `<span class="part6-blank">(${esc(token.slice(1,-1))}) _____</span>`;
   return esc(token);
  }).join('');
 }
 function render(){
  if(!state.passages.length){error('Bộ luyện chưa có bài đọc.');return;}
  const qs=questions(),done=qs.every(q=>q.reviewed),count=qs.filter(q=>q.selected!==null).length;
  const expanded=new Set([...app.querySelectorAll("details[data-explanation][open]")].map(el=>el.dataset.explanation));
  const left=$('#part6-passage').scrollTop,right=$('#reading-question').scrollTop;
  $('#reading-loading').hidden=true;$('#reading-question').hidden=false;
  $('[data-action=bilingual]').setAttribute('aria-pressed',String(bilingual));
  $('#session-progress').textContent=`${state.answered}/${state.total} câu đã chọn · ${state.finished?'Đã kết thúc':'Tự động lưu'}`;
  $('#question-position').textContent=`Bài ${index+1}/${state.passages.length}`;
  $('[data-action=previous]').disabled=busy||index===0;$('[data-action=next]').disabled=busy||index===state.passages.length-1;
  $('[data-action=finish]').hidden=state.finished;$('[data-action=finish]').disabled=busy;
  $('#part6-passage').innerHTML=`<h1>${esc(passage().title)}</h1>${passage().lines.map(line=>`<p>${english(line.en)}${bilingual?`<span class="reading-translation">${esc(line.vi)}</span>`:''}</p>`).join('')}`;
  $('#reading-question').innerHTML=`<p class="part6-hint" role="status">${done?'Đã chọn đủ câu. Kết quả được hiển thị bên dưới; nhấn Giải thích chi tiết để xem lời giải.':`Đã chọn ${count}/${qs.length} câu. Chọn đủ tất cả câu trong bài đọc để xem đúng/sai. Bạn có thể đổi lựa chọn trước khi hoàn tất.`}</p>`+qs.map((q,i)=>`<section class="part6-question" aria-label="Câu ${q.text.match(/\[(\d+)\]/)?.[1]||state.questions.indexOf(q)+131}"><h2>Câu ${q.text.match(/\[(\d+)\]/)?.[1]||state.questions.indexOf(q)+131}.</h2>${q.options.map(o=>{
   const correct=q.reviewed&&q.correct_option===o.id,wrong=q.reviewed&&q.selected===o.id&&!correct,selected=!q.reviewed&&q.selected===o.id;
   return `<button class="reading-answer${correct?' correct':wrong?' wrong':selected?' selected':''}" type="button" data-question="${q.id}" data-option="${o.id}" aria-pressed="${q.selected===o.id}" ${busy||q.reviewed||state.finished?'disabled':''}><span class="reading-answer-letter">${esc(o.label)}</span><span>${english(o.text)}${bilingual?`<span class="reading-translation">${esc(o.translation)}</span>`:''}</span></button>`;
  }).join('')}${q.reviewed?`<details class="reading-explanation" data-explanation="${q.id}" ${expanded.has(String(q.id))?'open':''}><summary>Giải thích chi tiết</summary><p>${esc(q.explanation)}</p></details>`:''}</section>`).join('');
  $('#part6-passage').scrollTop=left;$('#reading-question').scrollTop=right;
  $('#reading-result').hidden=!state.finished;
  if(state.finished)$('#reading-result').innerHTML=`<h1>Đã hoàn thành lượt luyện Part 6</h1><div class="reading-result-metrics"><div><strong>${state.correct}/${state.total}</strong><span>Câu đúng</span></div><div><strong>${state.score}%</strong><span>Độ chính xác</span></div></div><a class="reading-primary" href="${base}/reading/part6">Chọn cấp độ / Luyện lại →</a>`;
 }
 function show(title,html){$('#dialog-title').textContent=title;$('#dialog-content').innerHTML=html;if(!dialog.open)dialog.showModal();}
 function go(i){if(busy||i<0||i>=state.passages.length)return;index=i;dialog.close();render();$('#part6-passage').scrollTop=0;$('#reading-question').scrollTop=0;window.scrollTo(0,0);}
 async function mutate(work){if(busy)return;busy=true;error('');render();try{state=await work();}catch(e){try{state=await api(endpoint);}catch{}error(e.message);}finally{busy=false;render();}}
 const actions={
  bilingual:()=>{bilingual=!bilingual;render();},close:()=>dialog.close(),previous:()=>go(index-1),next:()=>go(index+1),
  grid:()=>show('Danh sách bài đọc','<div class="reading-passage-list">'+state.passages.map((p,i)=>{const qs=state.questions.filter(q=>q.passage_id===p.id);return `<p><button type="button" class="reading-primary" data-go="${i}">Bài ${i+1}: ${esc(p.title)} · ${qs.filter(q=>q.selected!==null).length}/${qs.length}</button></p>`;}).join('')+'</div>'),
  finish:()=>{if(state.answered!==state.total){show('Bài luyện chưa hoàn tất','<p>Hãy chọn đủ các câu trước khi kết thúc để xem kết quả. Bạn có thể bấm Thoát; các lựa chọn đã được lưu để tiếp tục sau.</p><div class="reading-dialog-actions"><button type="button" data-action="close">Tiếp tục luyện</button></div>');return;}show('Kết thúc lượt luyện?','<p>Kết quả sẽ được lưu vào lịch sử. Bạn vẫn có thể xem lại các bài đọc và lời giải.</p><div class="reading-dialog-actions"><button type="button" data-action="close">Xem lại bài</button><button type="button" class="reading-primary" data-action="confirm-finish">Kết thúc và lưu kết quả</button></div>');},
  'confirm-finish':()=>{dialog.close();return mutate(()=>api(endpoint+'/finish',{}));}
 };
 app.addEventListener('click',async event=>{const b=event.target.closest('button');if(!b||b.disabled||!state||busy)return;if(b.dataset.action){await actions[b.dataset.action]?.();return;}if(b.dataset.option)await mutate(()=>api(endpoint+'/answers',{questionId:Number(b.dataset.question),optionId:Number(b.dataset.option)}));if(b.dataset.go!==undefined)go(Number(b.dataset.go));});
 api(endpoint).then(data=>{state=data;const first=state.passages.findIndex(p=>state.questions.some(q=>q.passage_id===p.id&&!q.reviewed));index=first<0?0:first;render();}).catch(e=>{error(e.message);$('#reading-loading').textContent='Không tải được bài luyện. Hãy tải lại trang để thử lại.';});
})();
