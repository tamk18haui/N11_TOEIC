/* Scanned ETS 2023 pages: supplemental page navigation for N11 Student V2. */
(() => {
  'use strict';
  const root = document.getElementById('examStudentApp');
  const image = document.getElementById('examImage');
  const wrap = document.getElementById('examImageWrap');
  if (!root || !image || !wrap) return;
  const bar = document.createElement('div');
  bar.className = 'ets1-page-bar';
  const prev = document.createElement('button'); prev.type = 'button'; prev.textContent = '← Trang trước';
  const title = document.createElement('span'); title.className = 'ets1-page-label';
  const next = document.createElement('button'); next.type = 'button'; next.textContent = 'Trang sau →';
  const zoom = document.createElement('a'); zoom.textContent = 'Mở ảnh lớn'; zoom.target='_blank'; zoom.rel='noopener noreferrer';
  const tip = document.createElement('p'); tip.className = 'ets1-page-tip';
  tip.textContent = 'Đề gốc dạng ảnh quét. Nếu đoạn văn nằm ở trang trước, hãy dùng nút chuyển trang.';
  bar.append(prev,title,next,zoom);
  wrap.prepend(bar);
  wrap.append(tip);
  let current = null;
  function readPage(){
    if (!image.getAttribute('src')) return null;
    const url=new URL(image.src,document.baseURI);
    const match=url.pathname.match(/\/assets\/ets2023t01\/pages\/(lc|rc)-(\d{2})\.webp$/i);
    if (!match) return null;
    return {url,doc:match[1].toLowerCase(),page:Number(match[2]),last:match[1].toLowerCase()==='lc'?13:31};
  }
  function update(){
    current=readPage();
    const active=!!current;
    wrap.classList.toggle('ets1-scanned-mode',active);
    bar.hidden=!active;tip.hidden=!active;
    if (!active) return;
    title.textContent=`${current.doc==='lc'?'Listening':'Reading'} — trang ${current.page}/${current.last}`;
    prev.disabled=current.page<=2;
    next.disabled=current.page>=current.last;
    zoom.href=image.src;
  }
  function goto(delta){
    if (!current) return;
    const page=Math.min(current.last,Math.max(2,current.page+delta));
    const url=new URL(current.url.href);
    url.pathname=url.pathname.replace(/\d{2}(?=\.webp$)/i,String(page).padStart(2,'0'));
    image.src=url.href;
  }
  prev.addEventListener('click',()=>goto(-1));
  next.addEventListener('click',()=>goto(1));
  new MutationObserver(update).observe(image,{attributes:true,attributeFilter:['src']});
  update();
})();
