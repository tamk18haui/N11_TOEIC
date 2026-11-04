/* Quản lý tài khoản – chỉ xác nhận thao tác khóa/mở khóa trước khi POST. */
(() => {
  'use strict';
  document.querySelectorAll('form[data-confirm]').forEach(form => {
    form.addEventListener('submit', event => {
      if (!window.confirm(form.dataset.confirm)) event.preventDefault();
    });
  });
})();
