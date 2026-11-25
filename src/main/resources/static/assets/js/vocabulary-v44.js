/* N11_V44 local filtering; existing links/forms continue to work. */
(() => {
  'use strict';
  function normalize(s) {return String(s || '').toLowerCase().normalize('NFD').replace(/[\u0300-\u036f]/g,'').replace(/đ/g,'d').trim();}
  function init(root, selector, getLevel) {
    if (!root || root.dataset.v44Init) return;
    const items = Array.from(root.querySelectorAll(selector));
    if (!items.length) return;
    root.dataset.v44Init='1';
    const filter=document.createElement('div');filter.className='v44-filter';
    const input=document.createElement('input');input.className='form-control';input.type='search';input.placeholder='Tìm chủ đề từ vựng…';input.setAttribute('aria-label','Tìm chủ đề từ vựng');
    const select=document.createElement('select');select.className='form-select';select.setAttribute('aria-label','Lọc theo mức độ');
    for(const [v,t] of [['','Tất cả mức độ'],['BASIC','Cơ bản'],['INTERMEDIATE','Trung cấp'],['ADVANCED','Nâng cao']]){const o=document.createElement('option');o.value=v;o.textContent=t;select.append(o);}
    const count=document.createElement('span');count.className='v44-filter-count';count.setAttribute('aria-live','polite');
    filter.append(input,select,count);root.before(filter);
    const no=document.createElement('div');no.className='v44-no-results';no.textContent='Không tìm thấy chủ đề phù hợp.';no.hidden=true;root.after(no);
    function apply(){let n=0;for(const item of items){const visible=normalize(item.textContent).includes(normalize(input.value))&&(!select.value||getLevel(item)===select.value);item.classList.toggle('v44-hidden',!visible);if(visible)n++;}count.textContent=`${n}/${items.length} chủ đề`;no.hidden=n!==0;}
    input.addEventListener('input',apply);select.addEventListener('change',apply);apply();
  }
  function start(){
    const section=document.querySelector('.vocabulary-page .vocab-topic-section');
    const grid=section?.querySelector('.row');
    init(grid,':scope > div',item=>{const level=item.querySelector('.vocab-level');return level?.classList.contains('advanced')?'ADVANCED':level?.classList.contains('intermediate')?'INTERMEDIATE':'BASIC';});
    const admin=document.querySelector('.v44-admin .n11-content-main .admin-table-wrap');
    init(admin,'tbody tr:has(td:nth-child(4))',item=>item.children[1]?.textContent.trim());
  }
  if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',start);else start();
})();
