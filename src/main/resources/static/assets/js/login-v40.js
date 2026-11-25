// Chỉ hiện/ẩn mật khẩu, không can thiệp gửi form hoặc xác thực.
(() => {
  'use strict';
  const button = document.getElementById('n11LoginEye');
  const field = document.getElementById('password');
  if (!button || !field || !document.getElementById('n11LoginForm')) return;
  button.addEventListener('click', () => {
    const visible = field.type === 'password';
    field.type = visible ? 'text' : 'password';
    button.setAttribute('aria-pressed', String(visible));
    button.setAttribute('aria-label', visible ? 'Ẩn mật khẩu' : 'Hiện mật khẩu');
  });
})();
