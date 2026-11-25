/* N11 TOEIC Listening; no library/CDN dependencies, Cloudinary URLs come from MySQL. */
(() => {
  'use strict';
  const app = document.getElementById('listeningHome') || document.getElementById('listeningPractice');
  if (!app) return;
  const base = app.dataset.base || '';
  const $ = (selector, scope=document) => scope.querySelector(selector);
  const $$ = (selector, scope=document) => [...scope.querySelectorAll(selector)];
  const mk = (tag, klass, value) => {
    const element = document.createElement(tag);
    if (klass) element.className = klass;
    if (value !== undefined && value !== null) element.textContent = String(value);
    return element;
  };
  const getUrl = path => base + path;
  const partNames = ['', 'Hình ảnh', 'Hỏi – Đáp', 'Hội thoại ngắn', 'Độc thoại'];
  
  const safeMedia = value => {
    if (typeof value !== 'string' || !value) return null;
    // N11_MEDIA_LOCAL_V27: tai audio/anh tu endpoint noi bo, ho tro context path.
    if (new RegExp('^/listening-media/[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}[.](mp3|wav|ogg|png|jpg|jpeg|webp)$').test(value)) {
      return new URL(base + value, location.origin).href;
    }
    try {
      const url = new URL(value);
      // Only use HTTPS from public media distribution (Cloudinary or custom CDN domain).
      return url.protocol === 'https:' && !url.username && !url.password ? url.href : null;
    } catch { return null; }
  };
  const request = async (path, options) => {
    const res = await fetch(getUrl(path), {credentials:'same-origin', ...options});
    if (res.redirected && /\/login(?:\?|$)/.test(new URL(res.url).pathname)) {
      throw new Error('Bạn cần đăng nhập để sử dụng phần luyện nghe.');
    }
    const type = res.headers.get('content-type') || '';
    if (!type.includes('json')) throw new Error(`Máy chủ chưa trả JSON (${res.status}). Hãy kiểm tra đăng nhập và máy chủ.`);
    const body = await res.json();
    if (!res.ok) throw new Error(body.message || `Yêu cầu thất bại (HTTP ${res.status})`);
    return body;
  };
  function message(selector, text, error=false) {
    const el = $(selector); if(!el) return;
    el.textContent = text; el.classList.toggle('error', error);
  }

  if (app.id === 'listeningHome') {
    const buttons = $$('.l-part-menu button');
    const cards = $$('.l-level');
    let active = Number(new URLSearchParams(location.search).get('part')) || 1;
    if (active < 1 || active > 4) active = 1;
    const activate = async part => {
      active = part;
      buttons.forEach(b => {
        const selected = Number(b.dataset.part) === part;
        b.classList.toggle('active', selected);
        b.setAttribute('aria-pressed', String(selected));
      });
      $('#lPartCrumb').textContent = `Part ${part}: ${partNames[part]}`;
      $('#lHeading').textContent = `Luyện Part ${part} theo 5 cấp độ`;
      $('#lSubhead').textContent = `Part ${part}: ${partNames[part]} · Chọn cấp độ và bộ đề phù hợp để bắt đầu luyện tập.`;
      const newUrl = new URL(location.href);
      newUrl.searchParams.set('part', String(part));
      history.replaceState({}, '', newUrl);
      cards.forEach(c => { $('.l-start',c).disabled = true; $('.l-select-sets',c).hidden = true; });
      message('#lMessage', 'Đang tải dữ liệu từ MySQL...');
      try {
        const data = await request(`/listening/api/overview?part=${part}`);
        if (active !== part) return;
        for (const level of data.levels) {
          const card = cards[level.level - 1]; if (!card) continue;
          $('.l-level-name',card).textContent = `Cấp ${level.level} — ${level.label}`;
          $('.l-tag',card).textContent = level.label;
          $('.l-level-description',card).textContent = `Part ${part}: ${partNames[part]} · Độ khó ${level.level}/5`;
          $('.l-sets',card).textContent = `${level.sets} bộ đề`;
          $('.l-count',card).textContent = `${level.total} câu`;
          $('.l-progress-title span',card).textContent = `Đã luyện ${level.practiced}/${level.total} câu`;
          $('.l-progress-title b',card).textContent = `${level.percent}%`;
          $('.l-track span',card).style.width = `${level.percent}%`;
          const go = $('.l-start',card);
          const list = $('.l-select-sets',card);
          list.replaceChildren(); list.hidden = true;
          const sets = (level.setList || []).filter(s => Number(s.question_count) > 0);
          go.disabled = sets.length === 0;
          go.textContent = sets.length === 0 ? 'Chưa có câu hỏi' : (sets.length === 1 ? 'Bắt đầu luyện →' : 'Chọn bộ đề →');
          go.onclick = () => {
            if (sets.length === 1) location.href = getUrl(`/listening/practice/${sets[0].id}`);
            else { list.hidden = !list.hidden; go.setAttribute('aria-expanded', String(!list.hidden)); }
          };
          for (const set of sets) {
            const a = mk('a','',`${set.title} · ${set.question_count} câu →`);
            a.href = getUrl(`/listening/practice/${set.id}`);
            list.appendChild(a);
          }
        }
        message('#lMessage', data.loggedIn ? 'Tiến độ được đồng bộ theo tài khoản của bạn.' : 'Đăng nhập để lưu kết quả và xem tiến độ.');
      } catch (error) {
        message('#lMessage', `${error.message} Mở trang Đăng nhập nếu cần.`, true);
      }
    };
    buttons.forEach(b => b.addEventListener('click', () => activate(Number(b.dataset.part))));
    async function historyRows() {
      const target = $('#lHistory');
      try {
        const rows = await request('/listening/api/history');
        target.replaceChildren();
        if (!rows.length) {target.textContent = 'Bạn chưa hoàn thành bộ luyện nào.'; return;}
        rows.forEach(row => {
          const line = mk('div','l-history-item');
          line.append(mk('span','',`Part ${row.part_no} · ${row.title}`),mk('b','',`${row.correct_count}/${row.total_questions} · ${row.score_percent}%`));
          target.appendChild(line);
        });
      } catch { target.textContent = 'Đăng nhập để xem lịch sử luyện nghe của bạn.'; }
    }
    activate(active); historyRows();
    return;
  }

  // INSTANT PRACTICE: server grades each choice and saves it immediately.
  const setId = Number(app.dataset.set);
  const defaultPart = Number(app.dataset.part);
  const audio = $('#lAudio');
  const photo = $('#lPhoto');
  const answersZone = $('#lChoices');
  const nav = $('#lQuestionNav');
  const csrf = $('#lCsrf');
  let state = null;
  let current = 0;
  let attemptId = null;
  let busy = false;
  let lastAudio = null;
  const reviews = new Map();
  const checkedCount = () => reviews.size;
  const postHeaders = () => {
    const headers = {'Content-Type':'application/json'};
    if (csrf && csrf.dataset.header && csrf.value) headers[csrf.dataset.header] = csrf.value;
    return headers;
  };
  function updateNav() {
    if (!state) return;
    const total = state.questions.length;
    const checked = checkedCount();
    $('#lAnswered').textContent = `${checked}/${total}`;
    $('#lProgress').style.width = `${(checked*100/total).toFixed(1)}%`;
    $('#lCounter').textContent = `${current+1} / ${total}`;
    $$('#lQuestionNav button').forEach((btn,i) => {
      const grade = reviews.get(Number(state.questions[i].id));
      btn.classList.toggle('current', i === current);
      btn.classList.toggle('answered', !!grade);
      btn.classList.toggle('is-right', !!grade && !!grade.correct);
      btn.classList.toggle('is-wrong', !!grade && !grade.correct);
      btn.setAttribute('aria-current', i===current ? 'true' : 'false');
      if (grade) btn.title=`Câu ${i+1}: ${grade.correct?'Đúng':'Sai'}`;
    });
    $('#lPrevious').disabled = current === 0;
    $('#lNext').disabled = current === total-1;
  }
  function showReview(question) {
    const box = $('#lFeedback');
    const review = reviews.get(Number(question.id));
    box.hidden = !review;
    box.replaceChildren();
    box.classList.toggle('is-right', !!review?.correct);
    box.classList.toggle('is-wrong', !!review && !review.correct);
    if(!review) return;

    const headline=mk('div','l-feedback-heading');
    headline.append(mk('strong','',review.correct ? '✓ Chính xác!' : '✗ Chưa chính xác'));
    headline.append(mk('span','',`Đáp án đúng: ${review.correctLabel || '?'}`));
    box.append(headline);

    if (review.correctText && (state.part===1 || state.part===2)) {
      const quote=mk('p','l-feedback-answer',review.correctText);
      box.append(quote);
    }
    const explain=mk('div','l-feedback-detail');
    explain.append(mk('strong','','Giải thích'));
    explain.append(mk('p','',review.explanation || 'Chưa có giải thích chi tiết cho câu này.'));
    box.append(explain);
    if (review.transcript) {
      const transcript=mk('details','l-feedback-transcript');
      transcript.open = true;
      transcript.append(mk('summary','','Bản chép lời (Transcript)'));
      transcript.append(mk('p','',review.transcript));
      box.append(transcript);
    }
  }
  function renderQuestion(index) {
    if (!state || index < 0 || index >= state.questions.length) return;
    current=index;
    const q=state.questions[index];
    const review=reviews.get(Number(q.id));
    $('#lQTitle').textContent=`Câu ${index+1}`;
    $('#lQGroup').textContent=`Part ${state.part}${q.passageId ? ' · Nhóm '+q.passageId : ''}`;
    $('#lQuestion').textContent=q.text || 'Listen and select the best answer.';

    const src=safeMedia(q.audio);
    if(src !== lastAudio) {
      audio.pause();audio.removeAttribute('src');
      if(src){audio.src=src;audio.load();}
      lastAudio=src;
    }
    const status=$('#lAudioStatus');
    status.textContent=src ? 'Sẵn sàng phát bài nghe.' : 'Bài nghe chưa được liên kết âm thanh trực tuyến.';
    $('#lReplay').disabled=!src;
    audio.controls=!!src;
    audio.hidden=!src;
    const image=safeMedia(q.image);
    $('#lPhotoCard').hidden=!image;
    $('#lNoPicture').hidden=!!image || state.part!==1;
    if(image){photo.src=image;photo.alt=`Hình minh họa câu ${index+1}`;}
    else photo.removeAttribute('src');

    answersZone.replaceChildren();
    for(const option of q.options) {
      const id=Number(option.id);
      const button=mk('button','l-choice');
      button.type='button';
      button.append(mk('strong','',option.label));
      const onlyLetters=(state.part===1||state.part===2);
      if(!onlyLetters) button.append(mk('span','',option.text || ''));
      button.classList.toggle('l-choice--letter-only',onlyLetters);
      button.setAttribute('aria-label',`Đáp án ${option.label}`);
      button.setAttribute('aria-pressed',String(!!review && Number(review.selectedId)===id));
      if(review) {
        button.disabled=true;
        button.classList.toggle('correct',Number(review.correctId)===id);
        button.classList.toggle('wrong',Number(review.selectedId)===id && !review.correct);
      } else {
        button.disabled=busy;
        button.addEventListener('click',()=>check(q,id));
      }
      answersZone.append(button);
    }
    showReview(q);
    updateNav();
  }
  function complete() {
    if (!state || checkedCount()!==state.questions.length) return;
    const correct=[...reviews.values()].filter(v=>v.correct).length;
    const total=state.questions.length;
    const pct=Math.round(correct*10000/total)/100;
    const box=$('#lScoreSummary');box.hidden=false;box.replaceChildren();
    box.append(mk('strong','',`Hoàn thành · ${correct}/${total} câu đúng (${pct}%)`));
    box.append(mk('p','','Kết quả đã tự động lưu. Bạn có thể chọn từng câu để xem lại giải thích.'));
    const back=mk('a','','← Quay về chọn cấp độ');
    back.href=getUrl(`/listening?part=${defaultPart}`);box.append(back);
    message('#lExamMessage','Bạn đã hoàn thành bộ luyện. Không cần nộp bài.');
  }
  async function check(question, optionId) {
    if(busy || !attemptId || reviews.has(Number(question.id))) return;
    busy=true;
    message('#lExamMessage','Đang kiểm tra câu trả lời...');
    renderQuestion(current);
    try {
      const answer=await request(`/listening/api/sets/${setId}/attempts/${attemptId}/check`,{
        method:'POST',headers:postHeaders(),
        body:JSON.stringify({questionId:Number(question.id),optionId:Number(optionId)})
      });
      reviews.set(Number(question.id),answer);
      message('#lExamMessage',answer.correct ? 'Đúng rồi! Xem giải thích ngay bên dưới.' : 'Câu này chưa đúng. Đáp án và giải thích đã hiện bên dưới.');
      if(state && Number(state.questions[current].id)===Number(question.id)) renderQuestion(current);
      else updateNav();
      complete();
    }catch(err){
      message('#lExamMessage',err.message,true);
    }finally{
      busy=false;
      if(state)renderQuestion(current);
    }
  }
  audio.addEventListener('error',()=>{
    $('#lAudioStatus').textContent='Không phát được audio. Kiểm tra lại đường dẫn học liệu.';
  });
  $('#lReplay').addEventListener('click',()=>{
    if(!audio.src)return;
    audio.currentTime=0;
    audio.play().catch(()=>{$('#lAudioStatus').textContent='Bấm Play để phát âm thanh.';});
  });
  $('#lSpeed').addEventListener('change',event=>{audio.playbackRate=Number(event.target.value)||1;});
  $('#lPrevious').addEventListener('click',()=>renderQuestion(current-1));
  $('#lNext').addEventListener('click',()=>renderQuestion(current+1));
  document.addEventListener('keydown',event=>{
    if(event.target.matches('input,textarea,select,button') || event.altKey || event.ctrlKey || event.metaKey)return;
    if(event.key==='ArrowLeft')renderQuestion(current-1);
    if(event.key==='ArrowRight')renderQuestion(current+1);
    if(/^[1-4]$/.test(event.key)&&state&&!busy){
      const q=state.questions[current];
      const option=q.options[Number(event.key)-1];
      if(option)check(q,Number(option.id));
    }
  });
  async function load() {
    try {
      state=await request(`/listening/api/sets/${setId}`);
      $('#lExamTitle').textContent=`Listening TOEIC · Part ${state.part} · Cấp độ ${state.level}`;
      const started=await request(`/listening/api/sets/${setId}/start`,{
        method:'POST',headers:postHeaders(),body:'{}'
      });
      attemptId=Number(started.attemptId);
      (started.review||[]).forEach(v=>reviews.set(Number(v.questionId),v));
      nav.replaceChildren();
      state.questions.forEach((q,i)=>{
        const b=mk('button','',i+1);b.type='button';b.title=`Chuyển đến câu ${i+1}`;
        b.addEventListener('click',()=>renderQuestion(i));nav.append(b);
      });
      renderQuestion(0);
      if(checkedCount()===state.questions.length)complete();
      else message('#lExamMessage',`Có ${state.questions.length} câu. Chọn đáp án để biết đúng/sai và xem giải thích ngay, không cần nộp bài.`);
    }catch(e){
      message('#lExamMessage',`${e.message} Hãy kiểm tra tài khoản và dữ liệu bài luyện.`,true);
    }
  }
  load();
})();
