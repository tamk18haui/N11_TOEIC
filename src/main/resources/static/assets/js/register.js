/* N11 TOEIC - client validation. Server Java ALWAYS validates again. */
(function () {
  'use strict';
  const form = document.getElementById('n11RegisterForm');
  if (!form) return;
  const full = document.getElementById('n11FullName');
  const email = document.getElementById('n11Email');
  const pass = document.getElementById('n11Password');
  const confirm = document.getElementById('n11ConfirmPassword');
  const submit = document.getElementById('n11RegisterSubmit');
  const strength = document.querySelector('.n11-reg-strength');
  const strengthText = document.getElementById('n11StrengthText');
  const ruleContainer = document.getElementById('n11PasswordRules');
  const errorMap = new Map([[full,'n11FullNameError'],[email,'n11EmailError'],[pass,'n11PasswordError'],[confirm,'n11ConfirmError']]);
  const mailPattern = /^[A-Za-z0-9._%+-]+@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z]{2,63}$/;
  const fullPattern = /^[\p{L}][\p{L} .'-]*$/u;
  const RULES = {
    length: p => p.length >= 8 && p.length <= 64,
    upper: p => /[A-Z]/.test(p),
    lower: p => /[a-z]/.test(p),
    special: p => /[\p{P}\p{S}]/u.test(p)
  };
  const encoder = typeof TextEncoder === 'undefined' ? null : new TextEncoder();
  const byteLength = p => encoder ? encoder.encode(p).length : unescape(encodeURIComponent(p)).length;
  const whitespace = p => /\s/.test(p);
  const isPasswordValid = p => Object.values(RULES).every(test => test(p)) && !whitespace(p) && byteLength(p) <= 72;

  function setError(el, text) {
    const error = document.getElementById(errorMap.get(el));
    if (error) error.textContent = text || '';
    el.classList.toggle('is-invalid', Boolean(text));
    el.setAttribute('aria-invalid', String(Boolean(text)));
  }
  function updateStrength() {
    const p = pass.value;
    let score = Object.values(RULES).filter(check => check(p)).length;
    if (whitespace(p) || byteLength(p) > 72) score = Math.min(score, 2);
    strength.setAttribute('data-level', p ? String(score) : '0');
    strengthText.textContent = !p ? 'Chưa nhập mật khẩu' : (['','Yếu','Trung bình','Khá','Mạnh'][score] || 'Yếu');
    ruleContainer.querySelectorAll('[data-rule]').forEach(node => {
      node.classList.toggle('is-ok', RULES[node.dataset.rule](p));
    });
  }
  function validate(el) {
    let message = '';
    const value = el.value;
    if (el === full) {
      const s = value.trim().replace(/\s+/g, ' ');
      if (s.length < 2 || s.length > 120) message = 'Họ tên phải có từ 2 đến 120 ký tự.';
      else if (!fullPattern.test(s)) message = 'Vui lòng nhập họ tên hợp lệ (chỉ gồm chữ cái).';
    } else if (el === email) {
      const s = value.trim();
      if (!s || s.length > 191 || !mailPattern.test(s)) message = 'Email phải có dạng ten@tenmien.com.';
    } else if (el === pass) {
      if (!isPasswordValid(value)) message = 'Cần 8–64 ký tự, chữ hoa, chữ thường, ký tự đặc biệt; không có khoảng trắng.';
    } else if (el === confirm) {
      if (!value) message = 'Vui lòng xác nhận mật khẩu.';
      else if (value !== pass.value) message = 'Mật khẩu xác nhận không khớp.';
    }
    setError(el, message);
    return !message;
  }
  [full,email,pass,confirm].forEach(input => {
    input.addEventListener('blur', () => validate(input));
    input.addEventListener('input', () => {
      if (input.classList.contains('is-invalid')) validate(input);
      if (input === pass) {updateStrength(); if (confirm.value) validate(confirm);}
      if (input === confirm && confirm.value) validate(confirm);
    });
  });
  document.querySelectorAll('[data-toggle-password]').forEach(button => {
    button.addEventListener('click', () => {
      const input = document.getElementById(button.dataset.togglePassword);
      const reveal = input.type === 'password';
      input.type = reveal ? 'text' : 'password';
      button.setAttribute('aria-pressed', String(reveal));
      button.setAttribute('aria-label', reveal ? 'Ẩn mật khẩu' : 'Hiện mật khẩu');
      button.style.color = reveal ? '#4c5edf' : '';
    });
  });
  form.addEventListener('submit', event => {
    full.value = full.value.trim().replace(/\s+/g, ' ');
    email.value = email.value.trim().toLowerCase();
    const all = [full,email,pass,confirm].map(validate);
    if (all.some(ok => !ok)) {
      event.preventDefault();
      const first = [full,email,pass,confirm].find(el => el.classList.contains('is-invalid'));
      if (first) {first.focus();first.scrollIntoView({behavior:'smooth',block:'center'});}
      return;
    }
    submit.disabled = true;
    submit.classList.add('is-busy');
    submit.innerHTML = '<span>Đang tạo tài khoản...</span><span class="n11-reg-spinner" aria-hidden="true"></span>';
  });
  updateStrength();
})();


/* Trang tri chuyen dong (progressive enhancement). Khong can thu vien ngoai. */
(function () {
  'use strict';
  const page = document.getElementById('n11RegisterExperience');
  if (!page) return;

  const reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  const stage = document.getElementById('n11MotionStage');
  const card = document.getElementById('n11TiltCard');

  // Parallax nhe tren man hinh co chuot, khong can con tro tren dien thoai.
  if (!reduceMotion && stage && card && window.matchMedia('(hover: hover) and (pointer: fine)').matches) {
    let pending = false;
    let pointerX = 0;
    let pointerY = 0;
    stage.addEventListener('pointermove', function (event) {
      const b = stage.getBoundingClientRect();
      pointerX = Math.max(-1, Math.min(1, (event.clientX - b.left) / b.width * 2 - 1));
      pointerY = Math.max(-1, Math.min(1, (event.clientY - b.top) / b.height * 2 - 1));
      if (pending) return;
      pending = true;
      requestAnimationFrame(function () {
        pending = false;
        card.style.setProperty('--n11-tilt-x', (pointerX * 9).toFixed(1) + 'px');
        card.style.setProperty('--n11-tilt-y', (pointerY * 8).toFixed(1) + 'px');
      });
    });
    stage.addEventListener('pointerleave', function () {
      card.style.setProperty('--n11-tilt-x', '0px');
      card.style.setProperty('--n11-tilt-y', '0px');
    });
  }

  // Thong bao truc quan cho cac truong hop le sau khi nguoi dung roi o nhap.
  const form = document.getElementById('n11RegisterForm');
  if (form) {
    form.querySelectorAll('input.form-control').forEach(function (input) {
      input.addEventListener('blur', function () {
        const valid = input.value.trim().length > 0 && !input.classList.contains('is-invalid');
        input.classList.toggle('is-valid', valid);
      });
      input.addEventListener('input', function () {
        input.classList.remove('is-valid');
      });
    });
  }

  // Confetti chi xuat hien sau POST thanh cong, khong xuat hien khi bam nut.
  if (!reduceMotion && page.querySelector('.n11-reg-alert-success')) {
    const colors = ['#565dea','#50dbc5','#b79bff','#ffc87d','#8abaff'];
    for (let i = 0; i < 26; i++) {
      const part = document.createElement('span');
      part.className = 'n11-reg-confetti';
      part.style.background = colors[i % colors.length];
      const angle = (i / 26) * Math.PI * 2;
      const radius = 95 + (i % 4) * 36;
      part.style.setProperty('--cx', Math.round(Math.cos(angle) * radius) + 'px');
      part.style.setProperty('--cy', Math.round(Math.sin(angle) * radius + 65) + 'px');
      part.style.setProperty('--cr', (i % 2 ? '-' : '') + (280 + i * 17) + 'deg');
      part.style.animationDelay = (i % 7) * 45 + 'ms';
      document.body.appendChild(part);
      part.addEventListener('animationend', function () {part.remove();}, {once:true});
    }
  }
})();
