// Điều hướng quiz và hiển thị phản hồi. Server giữ đáp án và thực hiện chấm.
(() => {
    const form = document.querySelector('#grammar-quiz');
    if (!form) return;

    const practice = form.dataset.mode === 'practice';
    const questions = Array.from(form.querySelectorAll('[data-quiz-question]'));
    const jumps = Array.from(form.querySelectorAll('[data-quiz-jump]'));
    const previous = form.querySelector('[data-quiz-prev]');
    const next = form.querySelector('[data-quiz-next]');
    const progress = document.querySelector('#quiz-progress');
    const csrf = form.querySelector('[data-quiz-csrf]');
    const answered = new Set();
    let index = 0;

    function showQuestion(target) {
        index = target;
        questions.forEach((question, number) => { question.hidden = number !== index; });
        jumps.forEach((jump, number) => {
            jump.classList.toggle('is-answered', answered.has(number));
            jump.setAttribute('aria-current', number === index ? 'step' : 'false');
        });
        previous.disabled = index === 0;
        next.disabled = index === questions.length - 1;
        progress.textContent = `Đã trả lời ${answered.size}/${questions.length}`;
    }

    // Dùng textContent vì lời giải là văn bản trong database.
    function renderReview(question, review) {
        const feedback = question.querySelector('.quiz-feedback');
        feedback.textContent = review.correct ? '✓ Chính xác!' : '✕ Chưa đúng';
        feedback.classList.toggle('is-correct', review.correct);
        feedback.classList.toggle('is-wrong', !review.correct);
        feedback.hidden = false;
        const analysis = question.querySelector('.quiz-analysis');
        const heading = document.createElement('h4');
        heading.className = 'h6';
        heading.textContent = 'Phân tích từng đáp án';
        analysis.replaceChildren(heading);
        review.options.forEach(option => {
            const row = question.querySelector(`[data-label="${option.label}"]`);
            row.classList.toggle('is-correct', option.correct);
            row.classList.toggle('is-wrong', option.selected && !option.correct);
            if (!option.explanation) return;
            const note = document.createElement('p');
            note.className = option.correct ? 'quiz-note is-correct' : 'quiz-note';
            note.textContent = `${option.label}. ${option.correct ? 'Đúng' : 'Sai'}. ${option.explanation}`;
            analysis.append(note);
        });
        analysis.hidden = false;
    }

    async function checkPractice(question, input, number) {
        const options = question.querySelectorAll('input[type=radio]');
        const feedback = question.querySelector('.quiz-feedback');
        options.forEach(option => { option.disabled = true; });
        feedback.textContent = 'Đang kiểm tra đáp án…';
        feedback.hidden = false;
        try {
            const data = new URLSearchParams({questionId: question.dataset.quizQuestion, optionId: input.value});
            data.set(csrf.name, csrf.value);
            const response = await fetch(form.dataset.checkUrl, { method: 'POST', body: data });
            if (!response.ok) throw new Error('Check failed');
            renderReview(question, await response.json());
            answered.add(number);
            showQuestion(index);
        } catch {
            input.checked = false;
            options.forEach(option => { option.disabled = false; });
            feedback.textContent = 'Chưa kiểm tra được. Hãy chọn lại hoặc tải lại trang nếu phiên đã hết hạn.';
        }
    }

    jumps.forEach((jump, number) => jump.addEventListener('click', () => showQuestion(number)));
    previous.addEventListener('click', () => showQuestion(index - 1));
    next.addEventListener('click', () => showQuestion(index + 1));
    form.querySelector('[data-quiz-reset]').addEventListener('click', () => window.location.reload());
    questions.forEach((question, number) => {
        question.addEventListener('change', event => {
            if (!event.target.matches('input[type=radio]')) return;
            if (practice) {
                checkPractice(question, event.target, number);
            } else {
                answered.add(number);
                showQuestion(index);
            }
        });
    });
    form.addEventListener('submit', event => {
        if (practice || (answered.size < questions.length
            && !window.confirm(`Còn ${questions.length - answered.size} câu trống. Nộp bài?`))) {
            event.preventDefault();
        }
    });
    form.reset();
    showQuestion(0);
})();
