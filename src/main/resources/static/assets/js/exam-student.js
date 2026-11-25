/* N11 TOEIC student examination room. Correct answers never arrive before submission. */
(() => {
  'use strict';
  const root = document.getElementById('examStudentApp');
  if (!root) return;
  const base = root.dataset.base || '';
  const attemptId = root.dataset.attemptId;
  const csrf = root.dataset.csrf;
  const el = id => document.getElementById(id);
  let exam = null;
  let currentIndex = 0;
  let renderedReadingStart = null;
  let answers = {};
  let targetDeadline = 0;
  let totalDeadline = 0;
  let timer = null;
  let syncTimer = null;
  let syncing = false;
  let finished = false;
  let submitting = false;
  const pending = new Map();
  const dirty = new Map();
  const endpoint = `/exams/api/attempts/${attemptId}`;
  const storageKey = `n11-exam:${base}:${attemptId}`;
  const player = el('examAudio');
  let tracks = [];
  let trackByQuestion = new Map();
  let trackIndex = 0;
  let releasedTrack = -1;
  let resumePosition = 0;
  let currentAudio = null;
  let playingSequence = false;
  let audioPlayPending = false;
  const byId = id => exam?.questions.find(q => String(q.id) === String(id));
  const isFullListening = () => exam?.examType === 'LR_FULL' && exam.phase === 'LISTENING';

  async function request(path, method = 'GET', data) {
    const options = {method, credentials: 'same-origin', headers: {'Accept':'application/json'}};
    if (globalThis.AbortSignal?.timeout) options.signal = AbortSignal.timeout(8000);
    if (method !== 'GET') {
      options.headers['X-CSRF-TOKEN'] = csrf;
      if (data !== undefined) {
        options.headers['Content-Type'] = 'application/json';
        options.body = JSON.stringify(data);
      }
    }
    const response = await fetch(base + path, options);
    const type = response.headers.get('content-type') || '';
    if (!type.includes('application/json')) {
      if (response.redirected || response.status === 401 || response.status === 403) {
        throw new Error('Phiên đăng nhập hết hạn. Hãy đăng nhập lại rồi tiếp tục bài thi.');
      }
      throw new Error(`Máy chủ không trả về dữ liệu JSON (HTTP ${response.status}).`);
    }
    const body = await response.json();
    if (!response.ok) {
      const error = new Error(body.message || `HTTP ${response.status}`);
      error.status = response.status;
      throw error;
    }
    return body;
  }

  function alertMessage(message, error = false) {
    const node = el('examAlert');
    node.textContent = message;
    node.hidden = !message;
    node.classList.toggle('is-error', error);
  }

  function showSaveStatus(text, failed = false) {
    const node = el('examSaveStatus');
    node.textContent = text;
    node.classList.toggle('is-error', failed);
    el('examRetrySave').hidden = !failed || !dirty.size || finished || submitting;
  }

  function safeMedia(url) {
    if (typeof url !== 'string') return null;
    const value = url.trim();
    if (/^https?:\/\//i.test(value)) return value;
    if (value.startsWith('/') && !value.startsWith('//') && !value.includes('\\')) return base + value;
    return null;
  }

  function stored(suffix) {
    try { return JSON.parse(sessionStorage.getItem(storageKey+suffix)); }
    catch { return null; }
  }

  function store(suffix,value) {
    try {
      if (value==null) sessionStorage.removeItem(storageKey+suffix);
      else sessionStorage.setItem(storageKey+suffix,JSON.stringify(value));
    } catch { /* The exam still keeps current changes in memory. */ }
  }

  function canNavigate(index) {
    const q=exam?.questions[index];
    return !!q && (!isFullListening() || trackByQuestion.get(String(q.id))<=releasedTrack);
  }

  function canAnswer(index) {
    return !finished && !submitting && Date.now()<targetDeadline && canNavigate(index);
  }

  function setAudio(src) {
    player.pause();
    currentAudio=src;
    if (src) player.src=src;
    else player.removeAttribute('src');
    player.load();
  }

  function renderQuestionAudio(q) {
    const src=safeMedia(q.audio);
    el('examAudioWrap').hidden=!src;
    el('examAudioStart').hidden=true;
    el('examAudioTitle').textContent='Nghe đoạn âm thanh';
    el('examAudioStatus').textContent='';
    player.hidden=!src;
    player.controls=true;
    if (src!==currentAudio) setAudio(src);
  }

  function rememberAudio() {
    if (!isFullListening() || finished) return;
    const track=tracks[trackIndex];
    const position=resumePosition>0 ? resumePosition : Math.max(0,Math.floor(player.currentTime || 0));
    store(':audio',{group:track?.key,done:!track,releasedTrack,
      position:track && releasedTrack===trackIndex ? position : 0});
  }

  function showTrack(message='') {
    const track=tracks[trackIndex];
    el('examAudioWrap').hidden=false;
    el('examAudioStart').hidden=!track?.src || playingSequence || audioPlayPending;
    el('examAudioStart').textContent=releasedTrack<0 ? 'Phát Listening' : 'Tiếp tục phát';
    el('examAudioTitle').textContent=track
      ? 'Listening · Câu '+track.firstOrder+(track.firstOrder===track.lastOrder?'':'–'+track.lastOrder)
      : 'Đã phát hết phần Listening';
    el('examAudioStatus').textContent=message || (track
      ? (track.src ? 'Các đoạn phát lần lượt theo đề.' : 'Thiếu âm thanh cho đoạn này.')
      : 'Bạn có thể rà lại đáp án đến khi hết giờ Listening.');
  }

  function prepareTracks() {
    tracks=[];
    trackByQuestion=new Map();
    exam.questions.forEach((q,index)=>{
      const key=q.audioGroup || String(q.id);
      const previous=tracks.at(-1);
      if (previous?.key===key) previous.lastOrder=q.order;
      else tracks.push({key,src:safeMedia(q.audio),firstIndex:index,firstOrder:q.order,lastOrder:q.order});
      trackByQuestion.set(String(q.id),tracks.length-1);
    });
    const saved=stored(':audio');
    const savedIndex=tracks.findIndex(track=>track.key===saved?.group);
    const lastAnswered=exam.questions.reduce((last,q)=>{
      const id=String(q.id);
      return answers[id]==null ? last : Math.max(last,trackByQuestion.get(id));
    },-1);
    trackIndex=saved?.done ? tracks.length : Math.max(0,savedIndex>=0 ? savedIndex : lastAnswered);
    releasedTrack=saved?.done ? tracks.length-1 : (savedIndex>=0
      ? Math.max(-1,Math.min(savedIndex,Number(saved.releasedTrack) || 0)) : lastAnswered);
    resumePosition=savedIndex>=0 && releasedTrack===trackIndex ? Math.max(0,Number(saved.position) || 0) : 0;
    player.controls=false;
    player.hidden=true;
    setAudio(tracks[trackIndex]?.src ?? null);
    showTrack();
  }

  async function playTrack() {
    const track=tracks[trackIndex];
    if (finished || !isFullListening() || !track?.src || Date.now()>=targetDeadline || audioPlayPending) return;
    audioPlayPending=true;
    showTrack();
    try {
      if (player.error) player.load();
      await player.play();
    } catch {
      if (isFullListening() && !finished) {
        playingSequence=false;
        showTrack('Chưa phát được âm thanh. Bấm phát để thử lại.');
      }
    } finally {
      audioPlayPending=false;
      if (isFullListening() && !finished) {
        const button=el('examAudioStart');
        button.hidden=!tracks[trackIndex]?.src || playingSequence;
      }
    }
  }

  player.addEventListener('loadedmetadata',()=>{
    if (!isFullListening() || !resumePosition) return;
    player.currentTime=Math.min(resumePosition,Math.max(0,player.duration-.05));
    resumePosition=0;
  });
  player.addEventListener('playing',()=>{
    if (!isFullListening() || finished) return;
    playingSequence=true;
    showTrack();
    const track=tracks[trackIndex];
    if (track && releasedTrack<trackIndex) {
      releasedTrack=trackIndex;
      goTo(track.firstIndex);
    }
    rememberAudio();
  });
  player.addEventListener('timeupdate',rememberAudio);
  player.addEventListener('pause',()=>{
    if (!isFullListening() || finished || !player.paused || player.ended || !playingSequence) return;
    playingSequence=false;
    showTrack('Âm thanh bị gián đoạn. Bấm để tiếp tục phát.');
    rememberAudio();
  });
  player.addEventListener('ended',()=>{
    if (!isFullListening() || finished) return;
    trackIndex++;
    resumePosition=0;
    playingSequence=false;
    setAudio(tracks[trackIndex]?.src ?? null);
    rememberAudio();
    showTrack();
    playTrack();
  });
  player.addEventListener('error',()=>{
    if (isFullListening() && tracks[trackIndex]?.src) {
      playingSequence=false;
      showTrack('Không tải được âm thanh. Bấm phát để thử lại.');
    } else if (!isFullListening() && currentAudio) {
      el('examAudioStatus').textContent='Không tải được âm thanh.';
    }
  });

  function renderNavigation() {
    const wrapper = el('examPartNav');
    wrapper.replaceChildren();
    let part = null;
    let grid = null;
    exam.questions.forEach((question, index) => {
      if (question.part !== part) {
        part = question.part;
        const group = document.createElement('section');
        group.className = 'exam-nav-group';
        const title = document.createElement('h3');
        title.textContent = `PART ${part} · ${part <= 4 ? 'LISTENING' : 'READING'}`;
        group.append(title);
        grid = document.createElement('div');
        grid.className = 'exam-nav-grid';
        group.append(grid);
        wrapper.append(group);
      }
      const button = document.createElement('button');
      button.type = 'button';
      button.className = 'exam-nav-button';
      button.textContent = question.order;
      button.dataset.questionIndex = index;
      button.setAttribute('aria-label', `Chuyển đến câu ${question.order}`);
      button.addEventListener('click', () => goTo(index,true));
      grid.append(button);
    });
    paintNavigation();
  }

  function paintNavigation() {
    if (!exam) return;
    const total = exam.questions.length;
    const completed = Object.keys(answers).filter(id => answers[id] !== null && answers[id] !== undefined).length;
    el('examAnsweredText').textContent = `${completed} câu đã chọn`;
    el('examProgressBadge').textContent = `${completed}/${total}`;
    el('examProgressBar').style.width = `${total ? completed * 100 / total : 0}%`;
    root.querySelectorAll('[data-question-index]').forEach(button => {
      const index = Number(button.dataset.questionIndex);
      button.disabled = !canNavigate(index);
      button.classList.toggle('is-current', index === currentIndex);
      button.classList.toggle('is-answered', answers[String(exam.questions[index].id)] != null);
      if (index === currentIndex) button.setAttribute('aria-current','step');
      else button.removeAttribute('aria-current');
    });
  }

  function goTo(index,scrollToQuestion=false) {
    if (!canNavigate(index)) return;
    currentIndex = index;
    renderQuestion();
    if (scrollToQuestion && readingRange(index)) {
      el('examReadingQuestion-'+exam.questions[index].id)?.scrollIntoView({block:'nearest'});
    }
  }

  function readingRange(index) {
    const q=exam?.questions[index];
    if (!q || q.part<6) return null;
    let start=index,end=index;
    if (q.readingGroup) {
      const same=other=>other?.part===q.part && other.readingGroup===q.readingGroup;
      while (same(exam.questions[start-1])) start--;
      while (same(exam.questions[end+1])) end++;
    }
    return {start,end};
  }

  function adjacentIndex(direction,range=readingRange(currentIndex)) {
    if (!range) return currentIndex+direction;
    const index=direction<0 ? range.start-1 : range.end+1;
    return readingRange(index)?.start ?? index;
  }

  function addQuestionImage(container,src,order) {
    if (!src) return;
    const frame=document.createElement('div');
    frame.className='exam-image-frame exam-reading-image';
    const image=document.createElement('img');
    image.alt='Hình riêng của câu '+order;
    const link=document.createElement('a');
    link.href=src;
    link.target='_blank';
    link.rel='noopener noreferrer';
    link.className='exam-image-zoom';
    link.textContent='Mở ảnh câu hỏi';
    const status=document.createElement('p');
    status.className='exam-image-status';
    status.textContent='Không tải được ảnh riêng của câu hỏi.';
    status.hidden=true;
    image.addEventListener('error',()=>{status.hidden=false;});
    image.addEventListener('load',()=>{status.hidden=true;});
    image.src=src;
    frame.append(image,link,status);
    container.append(frame);
  }

  function renderOptions(question,index,container) {
    for (const option of question.options || []) {
      const button=document.createElement('button');
      button.type='button';
      button.className='exam-answer-choice';
      button.dataset.answerIndex=String(index);
      button.dataset.optionId=String(option.id);
      const label=document.createElement('b');
      label.textContent=option.label;
      const copy=document.createElement('span');
      copy.textContent=option.text || 'Chọn đáp án';
      button.append(label,copy);
      button.addEventListener('click',()=>changeAnswer(index,option.id));
      container.append(button);
    }
  }

  function renderImage(value,reading) {
    const src=safeMedia(value);
    const wrap=el('examImageWrap');
    const image=el('examImage');
    const zoom=el('examImageZoom');
    wrap.hidden=!src;
    wrap.classList.toggle('exam-reading-image',reading);
    zoom.hidden=!src || !reading;
    if (src) zoom.href=src;
    else zoom.removeAttribute('href');
    if (image.dataset.source===(src || '')) return;
    image.dataset.source=src || '';
    el('examImageStatus').hidden=true;
    if (src) image.src=src;
    else image.removeAttribute('src');
  }

  function renderQuestion() {
    if (!exam) return;
    const q = exam.questions[currentIndex];
    if (!q) return;
    const range=readingRange(currentIndex);
    const group=range ? exam.questions.slice(range.start,range.end+1) : [q];
    const first=group[0],last=group.at(-1);
    const number=first===last ? String(first.order) : first.order+'–'+last.order;
    const reading=!!range;
    root.classList.toggle('exam-reading-mode',reading);
    el('examQuestionCard').classList.toggle('exam-grouped-reading',reading);
    el('examReadingLabel').hidden=!reading;
    el('examReadingLabel').textContent='Bài đọc · Câu '+number;
    el('examPaperTitle').textContent = exam.title;
    el('examTopPart').textContent = `Câu ${number}/${exam.examTotalQuestions || exam.questions.length} · Part ${q.part}`;
    el('examCurrentPart').textContent = `PART ${q.part} · ${q.skill}`;
    el('examCurrentNumber').textContent = `Câu ${number}`;
    const questionText=el('examQuestionText');
    questionText.hidden=reading;
    questionText.textContent=q.text || 'Chọn phương án đúng.';
    const passage = el('examPassage');
    const sharedText=group.find(item=>item.passage)?.passage;
    const sharedImage=group.find(item=>item.passageImage)?.passageImage
      || (group.every(item=>item.image===first.image) || !sharedText ? group.find(item=>item.image)?.image : '');
    passage.hidden=!sharedText;
    if (sharedText && passage.textContent!==sharedText) {
      passage.textContent=sharedText;
      passage.scrollTop=0;
    }
    if (!isFullListening()) renderQuestionAudio(q);
    el('examImage').alt=reading ? 'Ảnh bài đọc Part '+q.part : 'Hình ảnh câu hỏi TOEIC';
    renderImage(reading ? sharedImage : q.image,reading);
    const choices=el('examChoices');
    if (!range || renderedReadingStart!==range.start) {
      choices.replaceChildren();
      if (!range) {
        renderOptions(q,currentIndex,choices);
      } else {
        el('examAnswerPane').scrollTop=0;
        el('examMaterialPane').scrollTop=0;
        group.forEach((entry,offset)=>{
          const section=document.createElement('section');
          section.className='exam-reading-question';
          section.id='examReadingQuestion-'+entry.id;
          const heading=document.createElement('h3');
          heading.textContent='Câu '+entry.order;
          section.append(heading);
          if (entry.text) {
            const prompt=document.createElement('p');
            prompt.className='exam-reading-prompt';
            prompt.textContent=entry.text;
            section.append(prompt);
          }
          const ownImage=entry.questionImage || (entry.image!==sharedImage ? entry.image : '');
          addQuestionImage(section,safeMedia(ownImage),entry.order);
          const options=document.createElement('div');
          options.className='exam-choices';
          options.setAttribute('role','group');
          options.setAttribute('aria-label','Đáp án câu '+entry.order);
          renderOptions(entry,range.start+offset,options);
          section.append(options);
          choices.append(section);
        });
      }
      renderedReadingStart=range?.start ?? null;
    }
    el('examPrev').disabled=!canNavigate(adjacentIndex(-1,range));
    el('examNext').disabled=!canNavigate(adjacentIndex(1,range));
    el('examPrev').textContent=reading ? '← Bài đọc trước' : '← Câu trước';
    el('examNext').textContent=reading ? 'Bài đọc tiếp →' : 'Câu tiếp →';
    paintChoices();
    paintNavigation();
  }

  function paintChoices() {
    const q=exam?.questions[currentIndex];
    if (!q) return;
    root.querySelectorAll('.exam-answer-choice').forEach(button => {
      const index=Number(button.dataset.answerIndex);
      const questionId=exam.questions[index].id;
      const chosen = String(answers[String(questionId)]) === button.dataset.optionId;
      button.classList.toggle('is-chosen',chosen);
      button.setAttribute('aria-pressed',String(chosen));
      button.disabled = !canAnswer(index);
    });
    el('examClear').disabled=!canAnswer(currentIndex) || answers[String(q.id)]==null;
    el('examClear').textContent=readingRange(currentIndex) ? 'Bỏ chọn câu '+q.order : 'Bỏ chọn';
  }

  function setSubmitting(enabled) {
    submitting = enabled;
    el('examSubmitSide').disabled = enabled;
    el('examSubmitTop').disabled = enabled;
    el('examConfirmSubmit').disabled = enabled;
    paintChoices();
    renderSaveState();
  }

  function changeAnswer(index, optionId) {
    const range=readingRange(currentIndex);
    const visible=range ? index>=range.start && index<=range.end : index===currentIndex;
    if (!visible || !canAnswer(index)) return;
    const key=String(exam.questions[index].id);
    currentIndex=index;
    if ((answers[key] ?? null)===optionId) {
      paintChoices();
      paintNavigation();
      return;
    }
    answers[key] = optionId;
    dirty.set(key,optionId);
    persistDraft();
    paintChoices();
    paintNavigation();
    queueAnswer(key,optionId);
  }

  function persistDraft() {
    store(':draft',dirty.size ? [...dirty] : null);
  }

  function renderSaveState() {
    const unsent=[...dirty.keys()].filter(key=>!pending.has(key)).length;
    if (unsent) showSaveStatus('Chưa xác nhận '+unsent+' đáp án',true);
    else if (dirty.size) showSaveStatus('Đang lưu…');
    else {
      showSaveStatus('Đã lưu trên máy chủ');
      if (el('examAlert').textContent.startsWith('Chưa lưu được lựa chọn.')) alertMessage('');
    }
  }

  function reconcileDraft() {
    let discarded=0;
    for (const [key,choice] of dirty) {
      const question=byId(key);
      if (!question || (choice!==null && !question.options.some(option=>String(option.id)===String(choice)))) {
        if (!question) discarded++;
        dirty.delete(key);
      } else if ((answers[key] ?? null)===choice && !pending.has(key)) {
        dirty.delete(key);
      } else {
        answers[key]=choice;
      }
    }
    persistDraft();
    return discarded;
  }

  function queueAnswer(key,optionId) {
    if (pending.has(key)) return;
    const task = request(endpoint+'/answers', 'POST', {
      examQuestionId: Number(key), selectedOptionId: optionId
    });
    pending.set(key, task);
    renderSaveState();
    task.then(result => {
      if (result.expired) {
        refreshState();
      } else if (result.saved && pending.get(key)===task && dirty.get(key)===optionId) {
        dirty.delete(key);
        persistDraft();
      }
    },error=>{
      if (pending.get(key)!==task || !byId(key) || finished) return;
      if (!submitting) alertMessage('Chưa lưu được lựa chọn. '+error.message,true);
      if (error.status===409) refreshState();
    }).finally(()=>{
      if (pending.get(key)===task) pending.delete(key);
      if (!submitting && !finished && Date.now()<targetDeadline && byId(key)
          && dirty.has(key) && dirty.get(key)!==optionId) {
        queueAnswer(key,dirty.get(key));
      }
      renderSaveState();
    });
  }

  function retryDraft() {
    if (submitting || finished || !exam || Date.now()>=targetDeadline) return;
    for (const [key,choice] of dirty) {
      if (!pending.has(key) && byId(key)) queueAnswer(key,choice);
    }
  }

  const formatTime = seconds => `${String(Math.floor(seconds/60)).padStart(2,'0')}:${String(seconds%60).padStart(2,'0')}`;

  function clocksFromState(state) {
    targetDeadline = Date.now() + Math.max(0, state.phaseRemainingSeconds) * 1000;
    totalDeadline = Date.now() + Math.max(0, state.remainingSeconds) * 1000;
    const full = state.examType === 'LR_FULL';
    const phaseText = state.phase === 'LISTENING' ? 'LISTENING · 45 PHÚT'
      : state.phase === 'READING' ? 'READING · 75 PHÚT' : 'BÀI THI · TỔNG THỜI GIAN';
    el('examPhaseLabel').textContent = phaseText;
    el('examPhaseNotice').textContent = full
      ? (state.phase === 'LISTENING'
        ? 'Đang thi Listening: chỉ chọn đáp án Part 1–4. Hết 45 phút hệ thống sẽ chuyển sang Reading và khóa đáp án Listening.'
        : 'Đang thi Reading: Part 5–7. Bạn không thể sửa lại câu Listening sau khi đã chuyển phần.')
      : 'Đề thi ngắn: bạn có thể chuyển giữa các Part trong đề và sửa đáp án trước khi nộp.';
    el('examTotalClockWrap').hidden = !full;
  }

  function updateTimer() {
    if (finished || !exam) return;
    const seconds = Math.max(0,Math.ceil((targetDeadline-Date.now())/1000));
    const total = Math.max(0,Math.ceil((totalDeadline-Date.now())/1000));
    el('examTimer').textContent = formatTime(seconds);
    el('examTimer').classList.toggle('is-urgent',seconds <= 300);
    el('examTotalTimer').textContent = formatTime(total);
    if (seconds === 0 && !submitting) {
      if (isFullListening() && playingSequence) {
        playingSequence=false;
        player.pause();
      }
      paintChoices();
      refreshState();
    }
  }

  async function refreshState() {
    if (syncing || finished || submitting || !exam) return;
    syncing = true;
    try {
      const state = await request(endpoint);
      if (state.status !== 'IN_PROGRESS') {
        goToResult(state.resultUrl,true);
        return;
      }
      const switched = state.phase !== exam.phase;
      if (switched) {
        playingSequence=false;
        exam = state;
        renderedReadingStart=null;
        answers = state.answers || {};
        const discarded=reconcileDraft();
        store(':audio',null);
        currentIndex = firstUnanswered();
        clocksFromState(state);
        renderNavigation();
        renderQuestion();
        const note=discarded ? ' Có '+discarded+' lựa chọn Listening chưa được máy chủ xác nhận trước khi hết giờ.' : '';
        alertMessage('Đã chuyển sang Reading. Phần Listening đã khóa.'+note,!!discarded);
      } else {
        clocksFromState(state);
        paintChoices();
      }
      renderSaveState();
    } catch (error) {
      showSaveStatus('Không đồng bộ được',true);
      alertMessage(error.message,true);
    } finally { syncing = false; }
  }

  function goToResult(url,replace=false) {
    finished=true;
    player.pause();
    if (timer) clearInterval(timer);
    if (syncTimer) clearInterval(syncTimer);
    store(':draft',null);
    store(':audio',null);
    if (replace) window.location.replace(base+url);
    else window.location.assign(base+url);
  }

  function firstUnanswered() {
    const next=exam.questions.findIndex((q,index)=>canNavigate(index) && answers[String(q.id)]==null);
    return next<0 ? (isFullListening() && releasedTrack>=0 ? tracks[releasedTrack].firstIndex : 0) : next;
  }

  function askSubmit() {
    if (finished || submitting || !exam) return;
    const completed = Object.keys(answers).filter(key => answers[key] != null).length;
    const missing = exam.questions.length - completed;
    el('examConfirmMessage').textContent = exam.phase === 'LISTENING'
      ? 'Bạn đang ở phần Listening. Nộp lúc này sẽ kết thúc TOÀN BỘ đề thi, kể cả 100 câu Reading chưa được làm. Bạn chắc chắn muốn nộp?'
      : missing > 0
        ? `Trong phần hiện tại còn ${missing} câu chưa chọn. Nộp bài sẽ chấm cả đề, câu bỏ trống tính sai. Bạn chắc chắn muốn nộp?`
        : 'Xác nhận nộp TOÀN BỘ đề thi và xem kết quả?';
    el('examConfirmOverlay').hidden = false;
    el('examConfirmSubmit').focus();
  }

  async function finishAndRedirect() {
    if (submitting || finished) return;
    setSubmitting(true);
    el('examConfirmOverlay').hidden = true;
    alertMessage('Đang lưu các câu trả lời và nộp bài…');
    try {
      // Wait for all previously queued answer writes to settle.
      await Promise.allSettled([...pending.values()]);
      const result = await request(endpoint+'/submit','POST',{answers:Object.fromEntries(dirty)});
      goToResult(result.resultUrl);
    } catch (err) {
      setSubmitting(false);
      alertMessage('Chưa nộp được bài. '+err.message,true);
      if (err.status===409) refreshState();
    }
  }

  async function loadExam() {
    try {
      const state = await request(endpoint);
      if (state.status !== 'IN_PROGRESS') {
        goToResult(state.resultUrl,true);
        return;
      }
      exam = state;
      answers = state.answers || {};
      const savedDraft=stored(':draft');
      if (Array.isArray(savedDraft)) for (const [key,choice] of savedDraft) dirty.set(key,choice);
      const discarded=reconcileDraft();
      if (isFullListening()) prepareTracks();
      currentIndex=firstUnanswered();
      clocksFromState(state);
      renderNavigation();
      renderQuestion();
      alertMessage(discarded ? 'Có '+discarded+' lựa chọn từ phần trước chưa được xác nhận khi hết giờ.' : '',!!discarded);
      renderSaveState();
      updateTimer();
      retryDraft();
      timer = setInterval(updateTimer, 1000);
      syncTimer = setInterval(refreshState, 20000);
    } catch (err) {
      alertMessage(err.message,true);
      el('examQuestionText').textContent = 'Không tải được đề thi.';
    }
  }

  el('examPrev').addEventListener('click', () => goTo(adjacentIndex(-1)));
  el('examNext').addEventListener('click', () => goTo(adjacentIndex(1)));
  el('examClear').addEventListener('click',()=>{
    changeAnswer(currentIndex,null);
  });
  el('examAudioStart').addEventListener('click',playTrack);
  el('examRetrySave').addEventListener('click',retryDraft);
  el('examImage').addEventListener('error',()=>{el('examImageStatus').hidden=el('examImageWrap').hidden;});
  el('examImage').addEventListener('load',()=>{el('examImageStatus').hidden=true;});
  el('examSubmitTop').addEventListener('click', askSubmit);
  el('examSubmitSide').addEventListener('click', askSubmit);
  el('examConfirmSubmit').addEventListener('click', finishAndRedirect);
  el('examCancelSubmit').addEventListener('click', () => {el('examConfirmOverlay').hidden = true;});
  el('examConfirmOverlay').addEventListener('click', event => {
    if (event.target === el('examConfirmOverlay')) el('examConfirmOverlay').hidden = true;
  });
  document.addEventListener('keydown', event => {
    if (event.key === 'Escape') el('examConfirmOverlay').hidden = true;
    if (document.activeElement?.tagName === 'INPUT') return;
    if (!el('examConfirmOverlay').hidden) return;
    if (event.key === 'ArrowLeft') goTo(adjacentIndex(-1));
    if (event.key === 'ArrowRight') goTo(adjacentIndex(1));
  });
  window.addEventListener('online',retryDraft);
  window.addEventListener('pagehide',rememberAudio);
  loadExam();
})();
