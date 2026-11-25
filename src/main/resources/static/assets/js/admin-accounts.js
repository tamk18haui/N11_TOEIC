/* N11 SOURCE NOTES V24: submit/click nhận thao tác; fetch gửi HTTP và CSRF; response.json đọc phản hồi; textContent/classList cập nhật giao diện sau khi máy chủ xác nhận. */
/* Admin accounts: AJAX lock/unlock, unchanged form POST fallback if JavaScript is unavailable. */
(() => {
  'use strict';
  const announce = (message, bad = false) => {
    let node = document.getElementById('adminAccountAjaxMessage');
    if (!node) {
      node = document.createElement('div');
      node.id = 'adminAccountAjaxMessage';
      node.setAttribute('role','status');
      node.setAttribute('aria-live','polite');
      node.className = 'alert';
      (document.querySelector('.admin-shell .col-lg-9') || document.querySelector('.admin-shell'))?.prepend(node);
    }
    node.className = bad ? 'alert alert-danger' : 'alert alert-success';
    node.textContent = message;
  };
  document.querySelectorAll('form[data-confirm]').forEach(form => {
    form.addEventListener('submit', async event => {
      event.preventDefault();
      if (!window.confirm(form.dataset.confirm || 'Xác nhận thay đổi trạng thái?')) return;
      const statusField = form.querySelector('[name=status]');
      const button = form.querySelector('button[type=submit]');
      if (!statusField || !button) return;
      const newStatus = statusField.value;
      const row = form.closest('tr');
      const oldLabel = button.textContent;
      button.disabled = true;
      button.textContent = 'Đang lưu…';
      try {
        const endpoint = form.action.replace(/\/status\/?$/, '/status-ajax');
        const response = await fetch(endpoint, {
          method:'POST', credentials:'same-origin',
          headers:{'Accept':'application/json','X-Requested-With':'XMLHttpRequest'},
          body:new URLSearchParams(new FormData(form))
        });
        const payload = await response.json().catch(() => ({}));
        if (!response.ok) throw new Error(payload.message || `Không thể cập nhật (HTTP ${response.status}).`);
        const locked = payload.status === 'LOCKED';
        const badge = row?.querySelector('.badge-status');
        if (badge) {
          badge.textContent = locked ? 'Đã khóa' : 'Hoạt động';
          badge.classList.toggle('good',!locked);
          badge.classList.toggle('warn',locked);
        }
        statusField.value = locked ? 'ACTIVE' : 'LOCKED';
        button.textContent = locked ? 'Mở khóa' : 'Khóa';
        form.dataset.confirm = locked ? 'Mở khóa tài khoản này?' : 'Khóa tài khoản này?';
        // The 4th stat card on the account screen is the locked-account count.
        const lockedCounter = document.querySelectorAll('.admin-shell .admin-stat .num')[3];
        if (lockedCounter) {
          const previous = Number(lockedCounter.textContent.trim());
          if (Number.isFinite(previous)) lockedCounter.textContent = String(Math.max(0,previous + (locked ? 1 : -1)));
        }
        announce(payload.message || 'Đã cập nhật trạng thái tài khoản.');
      } catch (err) {
        button.textContent = oldLabel;
        announce(err.message || 'Không thể kết nối máy chủ.',true);
      } finally { button.disabled = false; }
    });
  });
})();
