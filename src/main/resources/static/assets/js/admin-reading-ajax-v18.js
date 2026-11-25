/* N11 SOURCE NOTES V24: submit/click nhận thao tác; fetch gửi HTTP và CSRF; response.json đọc phản hồi; textContent/classList cập nhật giao diện sau khi máy chủ xác nhận. */
/* Reading admin: publish/unpublish over AJAX while keeping HTML POST as fallback. */
(() => {
 'use strict';
 const root=document.querySelector('[data-reading-admin]');
 if (!root || typeof fetch !== 'function') return;
 const base=root.dataset.base || '';
 const notice=document.getElementById('readingAjaxMessage');
 const message=(txt,error=false)=>{
   if(!notice) return;
   notice.hidden=false;
   notice.className=error?'alert alert-danger':'alert alert-success';
   notice.textContent=txt;
 };
 root.querySelectorAll('form[data-ajax-publication]').forEach(form=>{
   form.addEventListener('submit',async event=>{
     event.preventDefault();
     const isPublish=form.querySelector('[name=published]')?.value==='true';
     if(!confirm(isPublish?'Công bố bộ Reading này cho học viên?':'Ẩn bộ Reading này?'))return;
     const button=form.querySelector('button[type=submit]');
     if(!button)return;
     const old=button.textContent;
     button.disabled=true;button.textContent='Đang xử lý…';
     try{
       const response=await fetch(`${base}/admin/reading/api/sets/${encodeURIComponent(form.dataset.setId)}/publish`,{
         method:'POST',credentials:'same-origin',
         headers:{'Accept':'application/json','X-Requested-With':'XMLHttpRequest'},
         body:new URLSearchParams(new FormData(form))
       });
       const data=await response.json().catch(()=>({}));
       if(!response.ok)throw new Error(data.message || `HTTP ${response.status}`);
       const published=!!data.published;
       const scope=form.closest('tr') || form.closest('.panel-card') || root;
       const badge=scope.querySelector('[data-publication-label]');
       if(badge){badge.textContent=published?'Đã công bố':'Bản nháp';badge.classList.toggle('good',published);badge.classList.toggle('warn',!published);}
       form.querySelector('[name=published]').value=published?'false':'true';
       button.textContent=published?(form.closest('tr')?'Ẩn':'Ẩn bộ Reading'):(form.closest('tr')?'Công bố':'Công bố cho học viên');
       message(data.message||'Đã cập nhật trạng thái.');
     }catch(err){button.textContent=old;message(err.message||'Có lỗi kết nối.',true);}
     finally{button.disabled=false;}
   });
 });
})();
