/* N11 V31: trình sửa giao diện Admin tại localhost. Không có endpoint ghi file.
   Xem trước trong DOM; xuất JSON để script Python kiểm tra và ghi JSP/CSS. */
(() => {
'use strict';
const path=location.pathname.replace(/^\/[^/]+(?=\/admin(?:\/|$))/,'');
if(!['localhost','127.0.0.1','[::1]'].includes(location.hostname)||!/^\/admin(?:\/|$)/.test(path)||window.__n11VisualStart)return;
const MARK='data-n11-src', q=m=>`[${MARK}="${CSS.escape(m)}"]`, valid=m=>/^(?:admin\/[^|]+\.jsp|(?:grammar|vocabulary)\/admin\/[^|]+\.jsp|fragments\/admin-sidebar\.jspf)\|[1-9]\d*$/.test(m||'');
const marker=e=>e?.getAttribute(MARK), unique=e=>valid(marker(e))&&document.querySelectorAll(q(marker(e))).length===1;
const find=m=>document.querySelector(q(m)), clone=o=>JSON.parse(JSON.stringify(o));
let saving=false,saved=false;
let panel,overlay,preview,target,wrapper,group,baseText=new Map(),baseOrder=new Map(),history=[],cursor=0,state,controls,resize,drag;
const fresh=()=>({version:31,styles:{},desktop:{},texts:{},orders:{}});
const fontList=['inherit','Arial, sans-serif','Segoe UI, sans-serif','Tahoma, sans-serif','Verdana, sans-serif','Georgia, serif','Times New Roman, serif','Roboto, sans-serif'];
function groupFor(el){
  // Chỉ kéo các khung con trực tiếp trong row/grid; không kéo trộn bảng, form hoặc khu vực khác.
  for(let e=el,depth=0;e&&e!==document.body&&depth<2;e=e.parentElement,depth++){
    const p=e.parentElement;if(!p||!unique(e)||!unique(p)||!p.matches('.row,.admin-module-grid,[data-n11-layout]'))continue;
    if(p.querySelector('.admin-sidebar,.admin-nav,form,table'))continue;
    const cs=[...p.children];if(cs.length<2||cs.length>40||!cs.every(x=>unique(x)&&marker(x).split('|')[0]===marker(p).split('|')[0]))continue;
    if(!cs.every(x=>x.matches('div,section,article,a,aside')))continue;
    return {wrapper:e,parent:p};
  }return null;
}
function cssText(s){let out='';for(const [m,p] of Object.entries(s.styles))out+=q(m)+'{'+Object.entries(p).map(([k,v])=>`${k}:${v} !important;`).join('')+'}\n';
  for(const [m,p] of Object.entries(s.desktop))out+='@media (min-width:1200px){'+q(m)+'{'+Object.entries(p).map(([k,v])=>`${k}:${v} !important;`).join('')+'}}\n';return out;}
function render(){
  preview.textContent=cssText(state);
  for(const [m,t] of baseText){const e=find(m);if(e)e.textContent=state.texts[m]??t;}
  for(const [m,ids] of baseOrder){const p=find(m);if(p&&JSON.stringify([...p.children].map(marker))!==JSON.stringify(state.orders[m]||ids))for(const id of state.orders[m]||ids){const e=find(id);if(e?.parentElement===p)p.append(e);}}
  position();if(controls){controls.undo.disabled=cursor===0;controls.redo.disabled=cursor===history.length-1;controls.count.textContent=`${Object.keys(state.styles).length+Object.keys(state.desktop).length+Object.keys(state.texts).length+Object.keys(state.orders).length} mục thay đổi`;}
}
function commit(next){if(saving)return;if(JSON.stringify(next)===JSON.stringify(state))return;state=next;history=history.slice(0,cursor+1);history.push(clone(next));cursor++;render();}
function setProp(el,k,v,desktop=false){if(!unique(el))return;const next=clone(state),bag=desktop?next.desktop:next.styles,m=marker(el);(bag[m]??={})[k]=v;commit(next);}
function setWidth(w,percent){if(!unique(w))return;const next=clone(state),bag=next.desktop,m=marker(w),v=`${Math.max(10,Math.min(100,Math.round(percent*100)/100))}%`;bag[m]={...(bag[m]||{}),width:v,'max-width':v,'flex-basis':v};commit(next);}
function reorder(w,to){if(!w||!to||w===to||w.parentElement!==to.parentElement)return;const p=w.parentElement,m=marker(p),ids=[...p.children].map(marker);if(!baseOrder.has(m))baseOrder.set(m,ids.slice());const a=ids.indexOf(marker(w)),b=ids.indexOf(marker(to));if(a<0||b<0)return;ids.splice(a,1);ids.splice(b,0,marker(w));const next=clone(state);next.orders[m]=ids;commit(next);}
function el(tag,text,css){const x=document.createElement(tag);if(text!=null)x.textContent=text;if(css)x.style.cssText=css;return x;}
function btn(parent,text,fn){const b=el('button',text,'font:600 12px Segoe UI,Arial;padding:7px 9px;border:1px solid #c9d8d3;border-radius:6px;background:#fff;color:#164a40;cursor:pointer');b.type='button';b.onclick=fn;parent.append(b);return b;}
function row(parent,label){const r=el('label',null,'display:flex;align-items:center;justify-content:space-between;gap:8px;margin:7px 0;font:12px Segoe UI,Arial;color:#244b42');r.append(el('span',label));parent.append(r);return r;}
function field(parent,label,type,value,change,opts={}){const r=row(parent,label),i=el(type==='select'?'select':'input');if(type!=='select')i.type=type;Object.assign(i,opts);i.style.cssText='width:145px;max-width:58%;min-width:0;font:12px Segoe UI,Arial;border:1px solid #c5d9d1;border-radius:5px;padding:5px;background:white;color:#173c38';if(type==='select')for(const f of fontList){const o=el('option',f);o.value=f;i.append(o);}i.value=value;i.onchange=()=>change(i.value);r.append(i);return i;}
function hex(s){const m=s.match(/^rgba?\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)/);return m?'#'+m.slice(1,4).map(x=>(+x).toString(16).padStart(2,'0')).join(''):'#ffffff';}
function staticText(t){return unique(t)&&!t.children.length&&t.matches('h1,h2,h3,h4,h5,h6,p,span,strong,b,small,label,div,a,button')&&t.textContent.trim()&&t.textContent.trim().length<=180&&!t.matches('.num,[contenteditable]');}
function select(hit){if(saving)return;if(!hit||!window.__n11VisualIdentify)return;target=window.__n11VisualIdentify(hit);if(!unique(target.el)){target=null;wrapper=null;group=null;build();position();return;}group=groupFor(target.el);wrapper=group?.wrapper||target.el;build();position();}
function build(){
  panel.replaceChildren();const top=el('div',null,'display:flex;align-items:center;justify-content:space-between;gap:5px');top.append(el('strong','N11 · CHỈNH GIAO DIỆN'));btn(top,'Đổi bên',()=>{const left=panel.style.left==='12px';panel.style.left=left?'auto':'12px';panel.style.right=left?'12px':'auto';});btn(top,'Tắt',stop);panel.append(top);
  const info=el('div',target?`${target.label} · ${target.name||target.el.tagName}`:'Chọn một thành phần có mã JSP duy nhất.','margin:7px 0;color:#087d62;font-weight:700');panel.append(info);
  const toolbar=el('div',null,'display:flex;gap:5px;flex-wrap:wrap');panel.append(toolbar);
  const undo=btn(toolbar,'↶ Hoàn tác',()=>step(-1)),redo=btn(toolbar,'↷ Làm lại',()=>step(1));btn(toolbar,'Đặt lại',()=>{if(confirm('Bỏ tất cả thay đổi của phiên này?'))commit(fresh());});const count=el('small','');panel.append(count);controls={undo,redo,count};
  if(target){const e=target.el,t=target.text&&unique(target.text)?target.text:null,cs=getComputedStyle(e);const section=title=>{const b=el('div',null,'border-top:1px solid #d7e5df;margin-top:9px;padding-top:6px');b.append(el('strong',title));panel.append(b);return b;};
    const box=section('Khung / nút');const num=(p,l,k,node,v,min=0,max=500)=>field(p,l,'number',Math.round(parseFloat(v)||0),s=>{const n=Number(s);if(s!==''&&Number.isFinite(n)&&n>=min&&n<=max)setProp(node,k,`${n}px`);},{min,max,step:1});
    field(box,'Màu nền','color',hex(cs.backgroundColor),v=>setProp(e,'background-color',v));
    field(box,'Màu viền','color',hex(cs.borderTopColor),v=>setProp(e,'border-color',v));
    num(box,'Độ dày viền','border-width',e,cs.borderTopWidth,0,20);btn(box,'Hiện viền',()=>setProp(e,'border-style','solid'));
    num(box,'Bo góc','border-radius',e,cs.borderTopLeftRadius,0,200);num(box,'Đệm trong','padding',e,cs.paddingTop,0,100);num(box,'Lề ngoài','margin',e,cs.marginTop,0,100);num(box,'Cao tối thiểu','min-height',e,Math.max(0,parseFloat(cs.minHeight)||0),0,1500);
    if(group){const layout=section('Bố cục · desktop ≥1200px');const width=Math.round(wrapper.getBoundingClientRect().width/group.parent.getBoundingClientRect().width*100);field(layout,'Rộng (%)','number',width,v=>{if(+v>=10&&+v<=100)setWidth(wrapper,+v);},{min:10,max:100});field(layout,'Số cột','number',Math.max(1,Math.min(6,Math.round(100/Math.max(width,1)))),v=>{const n=Number(v);if(!Number.isInteger(n)||n<1||n>6)return;const next=clone(state),s=`${Math.floor(100000/n)/1000}%`;for(const x of group.parent.children){const m=marker(x);next.desktop[m]={...(next.desktop[m]||{}),width:s,'max-width':s,'flex-basis':s};}commit(next);},{min:1,max:6});num(layout,'Khoảng cách hàng','row-gap',group.parent,getComputedStyle(group.parent).rowGap,0,100);
      const moves=el('div',null,'display:flex;gap:4px;margin-top:5px');btn(moves,'← Trước',()=>reorder(wrapper,wrapper.previousElementSibling));btn(moves,'Sau →',()=>reorder(wrapper,wrapper.nextElementSibling));layout.append(moves);layout.append(el('small','Kéo tay nắm xanh để đổi vị trí trong cùng hàng.'));
    }else box.append(el('small','Không có nhóm khung kéo thả an toàn tại vị trí này.'));
    if(t){const ty=section('Chữ bên trong'),tc=getComputedStyle(t);field(ty,'Màu chữ','color',hex(tc.color),v=>setProp(t,'color',v));num(ty,'Cỡ chữ','font-size',t,tc.fontSize,8,100);field(ty,'Font chữ','select',fontList.includes(tc.fontFamily)?tc.fontFamily:'inherit',v=>setProp(t,'font-family',v));field(ty,'Độ đậm','number',parseInt(tc.fontWeight)||400,v=>{if(+v>=100&&+v<=900&&+v%100===0)setProp(t,'font-weight',v);},{min:100,max:900,step:100});
      const align=row(ty,'Căn chữ');for(const [label,v] of [['Trái','left'],['Giữa','center'],['Phải','right']])btn(align,label,()=>setProp(t,'text-align',v));
      if(staticText(t)){field(ty,'Nội dung','text',t.textContent.trim(),v=>{if(v.length>180||/[\r\n]/.test(v))return;const m=marker(t);if(!baseText.has(m))baseText.set(m,t.textContent);const next=clone(state);next.texts[m]=v;commit(next);});}
    }
  }
  const save=btn(panel,'Lưu giao diện',saveSource);save.disabled=saving;save.style.cssText+=';display:block;width:100%;margin-top:10px;background:#087d62;color:white;border:0;padding:10px';
  const discard=btn(panel,'Không lưu · Hủy thay đổi',stop);discard.disabled=saving;discard.style.cssText+=';display:block;width:100%;margin-top:6px;padding:9px';
  const status=el('small','Chỉ xem trước cho đến khi nhấn Lưu. Tải lại trang sẽ hủy phần chưa lưu.','display:block;margin-top:5px;color:#526760');panel.append(status);controls.status=status;
  btn(panel,'Xuất JSON dự phòng',download);

  controls.undo.disabled=cursor===0;controls.redo.disabled=cursor===history.length-1;count.textContent=`${Object.keys(state.styles).length+Object.keys(state.desktop).length+Object.keys(state.texts).length+Object.keys(state.orders).length} mục thay đổi`;
}
function step(n){if(saving)return;if(cursor+n<0||cursor+n>=history.length)return;cursor+=n;state=clone(history[cursor]);render();build();}
function position(){if(!overlay)return;if(!wrapper?.isConnected){overlay.style.display='none';return;}const r=wrapper.getBoundingClientRect();Object.assign(overlay.style,{display:'block',left:r.left+'px',top:r.top+'px',width:r.width+'px',height:r.height+'px'});overlay.firstChild.style.display=group?'block':'none';}
function start(t){if(panel)return;if(saved){alert('Đã lưu vào mã nguồn. Khởi động lại Spring Boot và Ctrl+F5 trước khi chỉnh tiếp.');return;}window.__n11VisualActive=true;state=fresh();history=[clone(state)];cursor=0;baseText.clear();baseOrder.clear();preview=el('style');preview.id='n11-visual-preview-v31';document.head.append(preview);
  panel=el('aside',null,'position:fixed;right:12px;top:12px;z-index:2147483646;width:min(310px,calc(100vw - 24px));max-height:calc(100vh - 24px);overflow:auto;box-sizing:border-box;padding:12px;border:1px solid #9cc8ba;border-radius:10px;background:#fff;color:#173c38;box-shadow:0 10px 30px #0003;font:12px/1.4 Segoe UI,Arial;text-align:left');panel.id='n11-visual-panel-v31';document.body.append(panel);
  overlay=el('div',null,'position:fixed;z-index:2147483645;box-sizing:border-box;border:2px solid #147ce5;pointer-events:none;display:none');overlay.id='n11-visual-outline-v31';const grip=btn(overlay,'⠿ Kéo khung',()=>{}),edge=btn(overlay,'↘',()=>{});grip.style.cssText+=';position:absolute;left:0;top:-27px;pointer-events:auto;touch-action:none;background:#147ce5;color:white;cursor:grab';edge.style.cssText+=';position:absolute;right:-9px;bottom:-9px;pointer-events:auto;touch-action:none;background:#147ce5;color:white;cursor:nwse-resize';document.body.append(overlay);
  grip.onpointerdown=e=>{if(saving||!group||e.button!==0)return;e.preventDefault();grip.setPointerCapture(e.pointerId);drag={id:e.pointerId,w:wrapper};};grip.onpointerup=e=>{if(!drag)return;const w=drag.w;drag=null;overlay.style.visibility='hidden';const hit=document.elementFromPoint(e.clientX,e.clientY);overlay.style.visibility='';let to=hit;while(to&&to.parentElement!==w.parentElement)to=to.parentElement;if(to&&to!==w)reorder(w,to);build();};grip.onpointercancel=()=>{drag=null;};
  edge.onpointerdown=e=>{if(saving||!target||e.button!==0)return;e.preventDefault();edge.setPointerCapture(e.pointerId);resize={x:e.clientX,y:e.clientY,w:wrapper.getBoundingClientRect().width,h:target.el.getBoundingClientRect().height,el:target.el,wrap:wrapper,g:group};};edge.onpointermove=e=>{if(!resize)return;const r=resize,dx=e.clientX-r.x,dy=e.clientY-r.y;overlay.style.width=Math.max(30,r.w+dx)+'px';overlay.style.height=Math.max(25,r.h+dy)+'px';};edge.onpointerup=e=>{if(!resize)return;const r=resize;resize=null;const next=clone(state),h=Math.round(Math.max(25,Math.min(1500,r.h+e.clientY-r.y)));(next.styles[marker(r.el)]??={})['min-height']=h+'px';if(r.g&&innerWidth>=1200){const v=Math.max(10,Math.min(100,Math.round((r.w+e.clientX-r.x)/r.g.parent.getBoundingClientRect().width*10000)/100))+'%';next.desktop[marker(r.wrap)]={...(next.desktop[marker(r.wrap)]||{}),width:v,'max-width':v,'flex-basis':v};}else if(!r.g){(next.styles[marker(r.el)]??={})['width']=Math.round(Math.max(30,Math.min(1500,r.w+e.clientX-r.x)))+'px';}commit(next);build();};edge.onpointercancel=()=>{resize=null;position();};
  select(t.el);if(t.text&&unique(t.text)){target=t;build();}window.addEventListener('scroll',position,true);window.addEventListener('resize',position);
}
function closeEditor(keepPreview){if(!keepPreview){state=fresh();render();preview.remove();}panel.remove();overlay.remove();panel=overlay=preview=target=wrapper=group=controls=null;window.__n11VisualActive=false;window.removeEventListener('scroll',position,true);window.removeEventListener('resize',position);}
function dirty(){return Object.keys(state.styles).length+Object.keys(state.desktop).length+Object.keys(state.texts).length+Object.keys(state.orders).length>0;}
function stop(){if(!panel||saving)return;if(dirty()&&!confirm('Không lưu? Mọi chỉnh sửa chưa lưu sẽ bị hủy.'))return;closeEditor(false);}
async function saveSource(){if(saving||!panel)return;if(!dirty()){alert('Chưa có thay đổi.');return;}if(!confirm('Lưu các chỉnh sửa hiện tại vào JSP/CSS? Tool sẽ sao lưu mã nguồn trước khi ghi.'))return;saving=true;const snapshot=JSON.stringify(state);panel.querySelectorAll('button,input,select').forEach(x=>x.disabled=true);controls.status.textContent='Đang ghi vào mã nguồn...';try{const session=await fetch('http://127.0.0.1:8766/session',{credentials:'omit',cache:'no-store'});if(!session.ok)throw Error('Save Bridge không sẵn sàng');const {token}=await session.json();if(!token)throw Error('Save Bridge không hợp lệ');const response=await fetch('http://127.0.0.1:8766/save',{method:'POST',headers:{'Content-Type':'application/json','X-N11-Save-Token':token},body:snapshot,credentials:'omit',cache:'no-store'});const result=await response.json();if(!response.ok||!result.ok)throw Error(result.message||'Không lưu được');saved=true;closeEditor(true);alert('Đã lưu vào mã nguồn!\n'+result.message+'\nKhởi động lại Spring Boot và Ctrl+F5 để kiểm tra.');}catch(error){saving=false;build();controls.status.textContent='Chưa xác nhận lưu thành công. '+error.message+' · Kiểm tra cửa sổ Save Bridge hoặc xuất JSON dự phòng.';return;}saving=false;}
function download(){if(!cursor){alert('Chưa có thay đổi.');return;}const file=URL.createObjectURL(new Blob([JSON.stringify(state,null,2)],{type:'application/json'})),a=el('a');a.href=file;a.download='N11_VISUAL_'+new Date().toISOString().replace(/[:.]/g,'-')+'.json';panel.append(a);a.click();a.remove();setTimeout(()=>URL.revokeObjectURL(file),1000);}
window.__n11VisualStart=start;
document.addEventListener('click',e=>{if(!panel||!(e.target instanceof Element)||e.target.closest('#n11-visual-panel-v31,#n11-visual-outline-v31'))return;e.preventDefault();e.stopImmediatePropagation();if(!saving)select(e.target);},true);
document.addEventListener('dblclick',e=>{if(!panel||!(e.target instanceof Element)||e.target.closest('#n11-visual-panel-v31,#n11-visual-outline-v31'))return;e.preventDefault();e.stopImmediatePropagation();if(saving)return;const t=window.__n11VisualIdentify(e.target).text;if(!staticText(t))return;const v=prompt('Nội dung chữ:',t.textContent.trim());if(v===null||v.length>180||/[\r\n]/.test(v))return;const m=marker(t);if(!baseText.has(m))baseText.set(m,t.textContent);const next=clone(state);next.texts[m]=v;commit(next);build();},true);
document.addEventListener('submit',e=>{if(panel){e.preventDefault();e.stopImmediatePropagation();}},true);
document.addEventListener('keydown',e=>{if(!panel)return;if(e.key==='Escape'){e.preventDefault();stop();return;}if(e.target instanceof Element&&e.target.matches('input,textarea,select'))return;if(e.ctrlKey&&e.key.toLowerCase()==='z'){e.preventDefault();step(e.shiftKey?1:-1);}if(e.ctrlKey&&e.key.toLowerCase()==='y'){e.preventDefault();step(1);}},true);
})();
