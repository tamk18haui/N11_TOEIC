/* Progressive enhancement: preserves original forms, CSRF, server-side Part filter and AJAX. */
(() => {
  'use strict';
  const root = document.querySelector('main.n11-lr-v47');
  if (!root || root.classList.contains('lr-enhanced')) return;
  const table = root.querySelector('.listening-sets-table, .reading-admin-table');
  const hero = root.querySelector('.ff-hero, .reading-admin-hero');
  const wrapper = table?.closest('.listening-table-scroll, .admin-table-wrap');
  const body = table?.tBodies[0];
  if (!body || !hero || !wrapper) return;
  const rows = Array.from(body.rows).filter(row => row.cells.length === 7 && row.querySelector('.badge-status'));
  const make = (tag, cls, text) => { const el = document.createElement(tag); if(cls) el.className=cls; if(text!==undefined)el.textContent=text; return el; };
  const fmt = n => n.toLocaleString('vi-VN');
  const isPublished = row => row.querySelector('.badge-status')?.classList.contains('good');
  const normalize = value => String(value ?? '').normalize('NFD').replace(/[\u0300-\u036f]/g,'').replace(/đ/g,'d').replace(/Đ/g,'D').toLowerCase().trim();
  const stats = make('section','lr-stats'); stats.setAttribute('aria-label','Thống kê danh sách hiện tại');
  const figures = ['Bộ trong danh sách','Đã công bố','Bản nháp','Tổng số câu'].map(label => {
    const card=make('div','lr-stat'); const number=make('strong','','0'); card.append(make('span','',label),number);stats.append(card);return number;
  });
  const refreshStats = () => { const published=rows.filter(isPublished).length;const questions=rows.reduce((sum,row)=>sum+(Number(row.cells[3].textContent.trim())||0),0);[rows.length,published,rows.length-published,questions].forEach((n,i)=>figures[i].textContent=fmt(n)); };
  hero.insertAdjacentElement('afterend',stats);
  const toolbar=make('div','lr-toolbar');
  const field=(label,control,id)=>{const box=make('div','lr-field');const title=make('label','',label);title.htmlFor=id;control.id=id;box.append(title,control);toolbar.append(box);return control;};
  const search=make('input','form-control');search.type='search';search.placeholder='Tên bộ luyện hoặc mã #ID';search.autocomplete='off';field('Tìm bộ luyện',search,'lr-v47-search');
  const status=make('select','form-select');[['all','Tất cả trạng thái'],['published','Đã công bố'],['draft','Bản nháp']].forEach(([v,t])=>{const o=make('option','',t);o.value=v;status.append(o);});field('Trạng thái',status,'lr-v47-status');
  const size=make('select','form-select');[15,30,50].forEach(n=>{const o=make('option','',n+' bộ / trang');o.value=String(n);size.append(o);});field('Hiển thị',size,'lr-v47-size');
  wrapper.before(toolbar);
  const footer=make('div','lr-pagination');const info=make('span');info.setAttribute('role','status');info.setAttribute('aria-live','polite');const controls=make('div','lr-page-controls');const prev=make('button','lr-page-button','← Trước');const next=make('button','lr-page-button','Sau →');prev.type=next.type='button';const current=make('span');controls.append(prev,current,next);footer.append(info,controls);wrapper.after(footer);
  const empty=make('tr');empty.hidden=true;const emptyCell=make('td','lr-no-results','Không tìm thấy bộ luyện phù hợp.');emptyCell.colSpan=7;empty.append(emptyCell);body.append(empty);
  // Only apply a styled wrapper to Reading's plain Part cell; preserve every form and its inputs.
  rows.forEach(row=>{const cell=row.cells[1];if(!cell.querySelector('span') && /^Part\s+[1-7]$/.test(cell.textContent.trim())){const pill=make('span','lr-part',cell.textContent.trim());cell.replaceChildren(pill);}});
  let page=1;
  function render(reset=false){
    if(reset)page=1;
    const query=normalize(search.value);
    const matches=rows.filter(row=>normalize(row.cells[0].textContent).includes(query)&&(status.value==='all'||(status.value==='published')===isPublished(row)));
    const per=Number(size.value)||15;const pages=Math.max(1,Math.ceil(matches.length/per));page=Math.min(pages,Math.max(1,page));
    const from=(page-1)*per;const visible=new Set(matches.slice(from,from+per));
    rows.forEach(row=>{row.hidden=!visible.has(row);});empty.hidden=!(rows.length&&matches.length===0);
    info.textContent=matches.length ? `${fmt(from+1)}–${fmt(Math.min(from+per,matches.length))} / ${fmt(matches.length)} bộ` : '0 bộ phù hợp';
    current.textContent=`${page} / ${pages}`;prev.disabled=page<=1;next.disabled=page>=pages;
    refreshStats();
  }
  search.addEventListener('input',()=>render(true));status.addEventListener('change',()=>render(true));size.addEventListener('change',()=>render(true));prev.addEventListener('click',()=>{page--;render();});next.addEventListener('click',()=>{page++;render();});
  // Publication AJAX changes class/text on the badge; recompute counts and filtered rows without intercepting requests.
  const observer=new MutationObserver(()=>render());rows.forEach(row=>{const badge=row.querySelector('.badge-status');observer.observe(badge,{attributes:true,attributeFilter:['class'],childList:true,characterData:true,subtree:true});});
  root.classList.add('lr-enhanced');render();
})();
