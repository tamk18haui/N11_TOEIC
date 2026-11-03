/* N11 TOEIC - chi xu ly tuong tac minh hoa tren trinh duyet. Khong luu du lieu. */
(function () {
  'use strict';
  const toast = document.getElementById('n11Toast');
  let timeoutId;
  function showToast(message) {
    if (!toast) return;
    toast.textContent = message;
    toast.classList.add('show');
    clearTimeout(timeoutId);
    timeoutId = setTimeout(() => toast.classList.remove('show'), 3900);
  }
  document.querySelectorAll('[data-demo-action]').forEach(button => {
    button.addEventListener('click', function (event) {
      event.preventDefault();
      showToast(this.getAttribute('data-demo-action') || 'Đây là chức năng giao diện mẫu.');
    });
  });
  document.querySelectorAll('.js-demo-form').forEach(form => {
    form.addEventListener('submit', function (event) {
      event.preventDefault();
      if (!form.checkValidity()) { form.classList.add('was-validated'); return; }
      showToast(form.getAttribute('data-demo-message') || 'Form demo: chưa kết nối xử lý backend.');
    });
  });
  document.querySelectorAll('[data-quiz]').forEach(quiz => {
    const button = quiz.querySelector('[data-check-quiz]');
    const result = quiz.querySelector('.answer-result');
    if (!button || !result) return;
    button.addEventListener('click', function () {
      const answer = quiz.querySelector('input[type="radio"]:checked');
      if (!answer) {showToast('Hãy chọn một đáp án trước nhé.');return;}
      const correct = answer.value === quiz.getAttribute('data-answer');
      result.className = 'answer-result visible ' + (correct ? 'is-success' : 'is-error');
      const explanation = quiz.getAttribute('data-explanation') || '';
      result.textContent = (correct ? 'Chính xác! ' : 'Chưa đúng. ') + explanation;
    });
  });
  const flashcard = document.getElementById('vocabFlashcard');
  if (flashcard) {
    let flipped = false;
    flashcard.addEventListener('click', function () {
      flipped = !flipped;
      const word = flashcard.querySelector('.word');
      const hint = flashcard.querySelector('.hint');
      if (word) word.textContent = flipped ? flashcard.dataset.meaning : flashcard.dataset.word;
      if (hint) hint.textContent = flipped ? 'Nhấp để xem từ tiếng Anh' : 'Nhấp để lật thẻ xem nghĩa';
    });
  }
  const filter = document.getElementById('vocabFilter');
  if (filter) filter.addEventListener('input', function () {
    const q = this.value.toLocaleLowerCase('vi');
    document.querySelectorAll('[data-vocab-item]').forEach(item => {
      item.style.display = item.textContent.toLocaleLowerCase('vi').includes(q) ? '' : 'none';
    });
  });
  const timer = document.getElementById('sampleTimer');
  if (timer) {
    let remaining = 600;
    const update = () => {timer.textContent = String(Math.floor(remaining / 60)).padStart(2, '0') + ':' + String(remaining % 60).padStart(2, '0');};
    update();
    const interval = setInterval(() => { if (remaining <= 0) {clearInterval(interval);showToast('Hết giờ! Đây chỉ là đề thi mẫu.');return;} remaining--;update(); }, 1000);
    const submit = document.getElementById('sampleSubmit');
    if (submit) submit.addEventListener('click', function () {
      clearInterval(interval);
      const key = ['B','C','A'];
      let score = 0;
      for (let i=0; i<key.length; i++) {const checked = document.querySelector('input[name="q'+(i+1)+'"]:checked');if (checked && checked.value === key[i])score++;}
      const result = document.getElementById('sampleResult');
      if (result) {result.className='answer-result visible '+(score===3?'is-success':'is-error');result.textContent='Bạn đúng '+score+'/3 câu. Đáp án mẫu: 1B, 2C, 3A. Kết quả chưa được lưu vào CSDL.';}
      this.disabled = true;
      result?.scrollIntoView({behavior:'smooth',block:'center'});
    });
  }
})();
