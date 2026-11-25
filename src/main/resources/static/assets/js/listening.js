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
    if (!res.ok) {
      const error = new Error(body.message || `Yêu cầu thất bại (HTTP ${res.status})`);
      error.status = res.status;
      throw error;
    }
    return body;
  };
  function message(selector, text, error=false) {
    const el = $(selector); if(!el) return;
    el.textContent = text; el.classList.toggle('error', error);
  }

  const practicePath = id => `/listening/practice/${id}`;
  const availableSets = levels => levels.flatMap(level => (level.setList || [])
    .filter(set => Number(set.question_count)>0).map(set => ({...set,level:level.level})));
  function action(text,klass,handler) {
    const button=mk('button',klass,text);
    button.type='button';
    button.addEventListener('click',handler);
    return button;
  }
  function link(text,klass,path) {
    const anchor=mk('a',klass,text);
    anchor.href=getUrl(path);
    return anchor;
  }
  function setAction(set) {
    if (!set.attemptId) return 'Bắt đầu luyện';
    if (!set.submitted) return set.answered ? 'Tiếp tục luyện' : 'Bắt đầu luyện';
    return Number(set.answered)===Number(set.question_count) ? 'Xem kết quả' : 'Bắt đầu luyện';
  }
  if (app.id === 'listeningHome') {
    const buttons = $$('.l-part-menu button');
    const cards = $$('.l-level');
    let active = Number(new URLSearchParams(location.search).get('part')) || 1;
    if (!Number.isInteger(active) || active < 1 || active > 4) active = 1;
    let requestNumber=0;
    const activate = async part => {
      const currentRequest=++requestNumber;
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
      message('#lMessage', 'Đang tải danh sách bài luyện...');
      try {
        const data = await request(`/listening/api/overview?part=${part}`);
        if (currentRequest !== requestNumber) return;
        for (const level of data.levels) {
          const card = cards[level.level - 1]; if (!card) continue;
          $('.l-level-name',card).textContent = `Cấp ${level.level} — ${level.label}`;
          $('.l-tag',card).textContent = level.label;
          const lastResult=level.setList?.find(set=>set.submitted && Number(set.answered)===Number(set.question_count));
          $('.l-level-description',card).textContent = level.setList?.length===1 && lastResult
            ? `Lượt gần nhất · Đúng ${lastResult.correct}/${lastResult.question_count} câu`
            : `Part ${part}: ${partNames[part]} · Độ khó ${level.level}/5`;
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
          go.textContent = sets.length === 0 ? 'Chưa có câu hỏi' : (sets.length === 1 ? `${setAction(sets[0])} →` : 'Chọn bộ luyện →');
          go.setAttribute('aria-expanded','false');
          go.onclick = () => {
            if (sets.length === 1) location.href = getUrl(`/listening/practice/${sets[0].id}`);
            else { list.hidden = !list.hidden; go.setAttribute('aria-expanded', String(!list.hidden)); }
          };
          for (const set of sets) {
            const a=link(`${set.title} · ${set.answered && !set.submitted ? set.answered+'/' : ''}${set.question_count} câu · ${setAction(set)} →`,'',practicePath(set.id));
            list.appendChild(a);
          }
        }
        message('#lMessage', data.loggedIn ? 'Tiến độ cho biết số câu bạn đã luyện.' : 'Đăng nhập để lưu kết quả và xem tiến độ.');
      } catch (error) {
        if (currentRequest===requestNumber) message('#lMessage',error.message,true);
      }
    };
    buttons.forEach(b => b.addEventListener('click', () => activate(Number(b.dataset.part))));
    async function historyRows() {
      const target = $('#lHistory');
      try {
        const rows = await request('/listening/api/history');
        target.replaceChildren();
        if (!rows.length) {target.textContent = 'Bạn chưa có lượt luyện đã lưu.'; return;}
        rows.forEach(row => {
          const line = mk('div','l-history-item');
          const answered=Number(row.answered_count ?? row.total_questions);
          const incomplete=answered < Number(row.total_questions);
          const label=incomplete
            ? `Dừng giữa chừng · ${answered}/${row.total_questions} câu · đúng ${row.correct_count}`
            : `Đúng ${row.correct_count}/${row.total_questions} · ${row.score_percent}%`;
          const title=link(row.title,'',`${practicePath(row.set_id)}?review=${row.id}`);
          title.setAttribute('aria-label',`Xem lại ${row.title}, lượt ${row.id}`);
          line.append(title,mk('b','',label));
          target.appendChild(line);
        });
      } catch (error) { target.textContent = error.message; }
    }
    // N11_V45_GUEST_HISTORY: no private API request before login.
    activate(active);
    if (app.dataset.v45Authenticated === 'true') historyRows();
    else {
      const target = $('#lHistory');
      if (target) {
        target.replaceChildren(link('Đăng nhập để xem lịch sử luyện tập →', '', '/login'));
      }
    }
    return;
  }

  const setId = Number(app.dataset.set);
  const defaultPart = Number(app.dataset.part);
  const params = new URLSearchParams(location.search);
  const historyId = params.get('review');
  const grouped = defaultPart>=3;
  const audio = $('#lAudio');
  const photo = $('#lPhoto');
  const answersZone = $('#lChoices');
  const nav = $('#lQuestionNav');
  const csrf = $('#lCsrf');
  let state = null;
  let units = [];
  let nextSet = null;
  let retry = null;
  let current = 0;
  let activeQuestion = null;
  let attemptId = null;
  let busy = false;
  let readOnly = false;
  let lastAudio = null;
  let audioFailed = false;
  const reviews = new Map();
  const drafts = new Map();
  const unitByQuestion = new Map();
  const questionId = q => Number(q.id);
  const graded = review => typeof review?.correct==='boolean';
  const finished = () => reviews.size===state.questions.length;
  const unitGraded = unit => unit.questions.every(q=>graded(reviews.get(questionId(q))));
  const postHeaders = () => {
    const headers = {'Content-Type':'application/json'};
    if (csrf && csrf.dataset.header && csrf.value) headers[csrf.dataset.header] = csrf.value;
    return headers;
  };
  function updateNav() {
    if (!state) return;
    const total = state.questions.length;
    const checked = reviews.size;
    $('#lAnswered').textContent = `${checked}/${total}`;
    $('#lProgress').style.width = `${(checked*100/total).toFixed(1)}%`;
    $('#lCounter').textContent = retry ? `${retry.position+1} / ${retry.units.length}` : `${current+1} / ${units.length}`;
    $$('#lQuestionNav button').forEach((btn,i) => {
      const q=state.questions[i];
      const id=questionId(q);
      const grade = reviews.get(id);
      const active=q===activeQuestion;
      btn.classList.toggle('current',active);
      btn.classList.toggle('answered', !!grade);
      btn.classList.toggle('is-right',grade?.correct===true);
      btn.classList.toggle('is-wrong',grade?.correct===false);
      btn.classList.toggle('selected',!grade && drafts.has(id));
      btn.setAttribute('aria-current',active?'true':'false');
      if (graded(grade)) btn.title=`Câu ${i+1}: ${grade.correct?'Đúng':'Sai'}`;
      else btn.title=`Chuyển đến câu ${i+1}`;
      btn.disabled=!!retry || busy;
    });
    const index=retry ? retry.position : current;
    const count=retry ? retry.units.length : units.length;
    $('#lPrevious').disabled=busy || !!retry || index===0;
    $('#lNext').disabled=busy || index===count-1 || (!!retry && !retry.graded);
  }
  function showReview(box,review,transcriptReview) {
    box.hidden = !graded(review);
    box.replaceChildren();
    box.classList.toggle('is-right', !!review?.correct);
    box.classList.toggle('is-wrong', !!review && !review.correct);
    if(!graded(review)) return;

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
    if (transcriptReview?.transcript) {
      const transcript=mk('details','l-feedback-transcript');
      const hasChoices=Array.isArray(transcriptReview.transcriptItems) && transcriptReview.transcriptItems.length>0;
      transcript.append(mk('summary','',hasChoices ? 'Bản chép lời (Transcript) · Dịch từng câu' : 'Bản chép lời (Transcript)'));
      if (hasChoices) {
        const options=mk('div','l-transcript-options');
        for (const item of transcriptReview.transcriptItems) {
          const line=mk('div','l-transcript-row');
          if (String(item.label)===String(review.correctLabel)) line.classList.add('is-key');
          const letter=mk('span','l-transcript-letter',item.label);
          const content=mk('div','l-transcript-content');
          content.append(mk('p','l-transcript-english',item.text));
          if (item.translation) {
            content.append(mk('p','l-transcript-vi',`Dịch: ${item.translation}`));
          } else {
            content.append(mk('p','l-transcript-unavailable','Chưa có bản dịch tiếng Việt cho phương án này.'));
          }
          line.append(letter,content);options.append(line);
        }
        transcript.append(options);
      } else {
        transcript.append(mk('p','l-transcript-full',transcriptReview.transcript));
      }
      box.append(transcript);
    }
  }
  function draftStorage(write=false) {
    if (!attemptId || !grouped || readOnly) return;
    const key='toeic-listening-draft-'+base+'-'+setId+'-'+attemptId;
    try {
      if (write) {
        if (drafts.size) sessionStorage.setItem(key,JSON.stringify([...drafts]));
        else sessionStorage.removeItem(key);
      } else {
        const saved=new Map(JSON.parse(sessionStorage.getItem(key)) || []);
        for (const q of state.questions) {
          const id=questionId(q);
          const choice=saved.get(id);
          if (!reviews.has(id) && q.options.some(option=>Number(option.id)===choice)) drafts.set(id,choice);
        }
      }
    } catch { /* Draft choices remain available in memory. */ }
  }

  function unitMedia(unit) {
    const passage=unit.questions.find(q=>safeMedia(q.passageAudio));
    const clips=new Set(unit.questions.map(q=>safeMedia(q.audio)).filter(Boolean));
    return {
      src: grouped && passage ? safeMedia(passage.passageAudio) : (clips.size===1 ? [...clips][0] : null),
      image:unit.questions.every(q=>q.image===unit.questions[0].image) ? safeMedia(unit.questions[0].image) : null
    };
  }

  function renderMedia({src,image}) {
    if (src!==lastAudio) {
      audio.pause();
      lastAudio=src;
      audioFailed=false;
      if (src) audio.src=src;
      else audio.removeAttribute('src');
      audio.load();
      audio.playbackRate=Number($('#lSpeed').value)||1;
    }
    updateAudioStatus();
    $('#lReplay').disabled=!src;
    audio.hidden=!src;
    $('#lPhotoCard').hidden=!image;
    $('#lNoPicture').hidden=!!image || defaultPart!==1;
    if (image) {
      if (photo.src!==image) photo.src=image;
      photo.alt='Hình minh họa bài nghe';
    } else photo.removeAttribute('src');
  }

  function updateAudioStatus() {
    $('#lAudioStatus').textContent=audioFailed
      ? 'Không phát được âm thanh. Bấm Phát lại để thử lại.'
      : (lastAudio ? 'Sẵn sàng phát bài nghe.' : 'Bài nghe này chưa có âm thanh sử dụng được.');
  }

  function optionsFor(q,review,selected,locked) {
    const options=mk('div','l-choices');
    options.setAttribute('role','group');
    options.setAttribute('aria-label','Đáp án câu '+q.number);
    for (const option of q.options) {
      const id=Number(option.id);
      const button=action(option.label,'l-choice',()=>choose(q,id));
      button.replaceChildren(mk('strong','',option.label));
      if (grouped) button.append(mk('span','',option.text || ''));
      button.classList.toggle('l-choice--letter-only',!grouped);
      button.classList.toggle('selected',!graded(review) && selected===id);
      button.setAttribute('aria-pressed',String(selected===id));
      if (!grouped) button.setAttribute('aria-label','Đáp án '+option.label);
      if (graded(review)) {
        button.classList.toggle('correct',Number(review.correctId)===id);
        button.classList.toggle('wrong',selected===id && !review.correct);
      }
      button.disabled=locked;
      options.append(button);
    }
    return options;
  }

  function displayedReview(q,show) {
    const original=reviews.get(questionId(q));
    if (!show || !graded(original)) return null;
    if (!retry) return original;
    const selectedId=retry.choices.get(questionId(q));
    return {...original,selectedId,correct:selectedId===Number(original.correctId)};
  }

  function renderUnit() {
    const unit=units[current];
    const questions=retry?.question ? [retry.question] : unit.questions;
    const checkWholeGroup=grouped && !retry?.question;
    const first=unit.questions[0];
    const show=retry ? retry.graded : (unitGraded(unit) || readOnly);
    const transcript=questions.map(q=>displayedReview(q,show)).find(review=>review?.transcript);
    const selectedCount=questions.filter(q=>{
      const id=questionId(q);
      return retry ? retry.choices.has(id) : reviews.has(id) || drafts.has(id);
    }).length;
    $('#lQTitle').textContent='Câu '+questions.map(q=>q.number).join(', ');
    $('#lQGroup').textContent=grouped ? 'Đoạn '+(current+1)+'/'+units.length : 'Part '+defaultPart;
    $('#lQuestion').textContent=grouped
      ? (defaultPart===3 ? 'Nghe đoạn hội thoại' : 'Nghe bài nói')
      : first.text;
    const instruction=retry ? 'Lượt ôn tập. Điểm lượt làm ban đầu được giữ nguyên.'
      : readOnly ? 'Xem lại đáp án của lượt đã lưu.'
      : grouped ? 'Chọn đáp án cho cả đoạn rồi bấm Kiểm tra cả đoạn.'
      : 'Chọn một đáp án để xem kết quả và giải thích.';
    $('#lInstruction').textContent=checkWholeGroup && !show
      ? instruction+' Đã chọn '+selectedCount+'/'+questions.length+' câu.'
      : instruction;
    renderMedia(unit.media);
    $('#lNext').textContent=retry ? (grouped ? 'Ôn đoạn tiếp →' : 'Ôn câu tiếp →')
      : (grouped ? 'Đoạn tiếp →' : 'Câu tiếp →');
    answersZone.replaceChildren();
    const active=$('#lFeedback');
    active.classList.toggle('l-group-transcript',grouped);
    active.hidden=true;
    active.replaceChildren();
    active.classList.remove('is-right','is-wrong');
    for (const q of questions) {
      const id=questionId(q);
      const saved=reviews.get(id);
      const review=displayedReview(q,show);
      const selected=retry ? retry.choices.get(id) : (saved?.selectedId==null ? drafts.get(id) : Number(saved.selectedId));
      const locked=busy || (retry ? retry.graded : (readOnly || !!saved));
      const options=optionsFor(q,review,selected,locked);
      if (grouped) {
        const section=mk('section','l-group-question');
        section.id='lQuestion-'+id;
        section.append(mk('h2','',q.number+'. '+q.text));
        const questionImage=safeMedia(q.image);
        if (questionImage && questionImage!==unit.media.image) {
          const graphic=mk('img','l-question-graphic');
          graphic.src=questionImage;
          graphic.alt='Hình minh họa câu '+q.number;
          section.append(graphic);
        }
        const feedback=mk('div','l-feedback');
        section.append(options,feedback);
        showReview(feedback,review);
        answersZone.append(section);
      } else {
        answersZone.append(options);
        showReview(active,review,review);
      }
    }
    if (grouped && transcript) {
      active.hidden=false;
      const details=mk('details','l-feedback-transcript');
      details.append(mk('summary','','Bản chép lời của đoạn nghe'),mk('p','l-transcript-full',transcript.transcript));
      active.append(details);
    }
    const groupButton=$('#lCheckGroup');
    groupButton.hidden=!checkWholeGroup || show;
    groupButton.disabled=busy || selectedCount!==questions.length;
    const saved=reviews.get(questionId(activeQuestion));
    $('#lRetake').disabled=busy || readOnly;
    const retryButton=$('#lRetryUnit');
    retryButton.disabled=busy || (!retry && !graded(saved) && (readOnly || !!saved));
    retryButton.title='Làm lại câu '+activeQuestion.number;
    const back=$('#lBackToResult');
    back.hidden=!retry;
    back.textContent=finished() || readOnly ? 'Quay lại kết quả' : 'Quay lại bài đang làm';
    const viewScore=$('#lViewScore');
    viewScore.hidden=!!retry || !(finished() || readOnly);
    $('#lUnitActions').hidden=[groupButton,back,viewScore].every(el=>el.hidden);
    updateNav();
  }

  function rewindAudio() {
    audio.pause();
    if (lastAudio) audio.currentTime=0;
  }

  function openUnit(index,question=units[index]?.questions[0]) {
    if (!units[index]) return;
    if (current!==index) rewindAudio();
    current=index;
    activeQuestion=question;
    renderUnit();
  }

  function move(direction) {
    if (busy || !units.length) return;
    if (retry) {
      if (direction<0 || !retry.graded || retry.position+1>=retry.units.length) return;
      retry.position++;
      resetRetry();
    } else if (units[current+direction]) {
      openUnit(current+direction);
      $('.l-exam-media').scrollIntoView({block:'nearest'});
    }
  }

  function resetRetry() {
    retry.choices.clear();
    retry.graded=false;
    rewindAudio();
    openUnit(retry.units[retry.position],retry.question || undefined);
    message('#lExamMessage',grouped && !retry.question
      ? 'Nghe lại đoạn và chọn đáp án cho cả cụm.' : 'Nghe lại và tự chọn đáp án.');
  }

  function startRetry(indices,{fromSummary=false,question=null}={}) {
    if (busy || !indices.length) return;
    retry={units:indices,position:0,choices:new Map(),graded:false,question,
      returnTo:retry?.returnTo ?? current,returnQuestion:retry?.returnQuestion ?? activeQuestion,fromSummary};
    $('#lScoreSummary').hidden=true;
    resetRetry();
    $('.l-exam-question').scrollIntoView({block:'start'});
  }

  function stopRetry() {
    const previous=retry;
    retry=null;
    openUnit(previous.returnTo,previous.returnQuestion);
    showSummary();
    message('#lExamMessage','Đã quay lại lượt làm ban đầu.');
    if (previous.fromSummary) $('#lScoreSummary').scrollIntoView({block:'start'});
  }

  function retryGrade() {
    retry.graded=true;
    const done=retry.position+1===retry.units.length;
    message('#lExamMessage',done ? 'Đã xong lượt ôn này. Bạn có thể xem lại kết quả ban đầu.' : 'Đã chấm. Bấm nút tiếp theo để ôn tiếp.');
    renderUnit();
  }

  function showSummary() {
    const box=$('#lScoreSummary');
    box.hidden=!!retry || !(finished() || readOnly);
    if (box.hidden) return;
    const correct=[...reviews.values()].filter(v=>v.correct).length;
    const total=state.questions.length;
    const pct=Math.round(correct*10000/total)/100;
    const partial=reviews.size+'/'+total+' câu đã làm · '+correct+' câu đúng';
    const title=finished() ? 'Hoàn thành bộ luyện · '+correct+'/'+total+' câu đúng ('+pct+'%)'
      : 'Lượt đã kết thúc · '+partial;
    box.replaceChildren(mk('strong','',title));
    const actions=mk('div','l-flow-actions l-score-actions');
    const wrong=units.map((unit,index)=>({unit,index})).filter(({unit})=>
      unitGraded(unit) && unit.questions.some(q=>reviews.get(questionId(q)).correct===false));
    const wrongCount=[...reviews.values()].filter(v=>v.correct===false).length;

    if (wrong.length) {
      const label=grouped ? 'Ôn '+wrong.length+' đoạn có câu sai' : 'Ôn '+wrong.length+' câu sai';
      actions.append(action(label,'l-primary-action',()=>startRetry(wrong.map(({index})=>index),{fromSummary:true})));
    }
    if (wrongCount) box.append(mk('p','','Có '+wrongCount+' câu sai. Chọn từng câu để xem giải thích.'));
    if (!readOnly && nextSet) actions.append(link('Sang bộ tiếp theo →','l-primary-action',practicePath(nextSet.id)));
    actions.append(link('Về trang Part '+defaultPart,'l-secondary-action','/listening?part='+defaultPart));
    box.append(actions);
  }

  const post=(path,payload={})=>request(path,{method:'POST',headers:postHeaders(),body:JSON.stringify(payload)});
  const endpoint='/listening/api/sets/'+setId;

  async function restart() {
    if (busy || !attemptId || readOnly) return;
    if (!window.confirm('Tạo lượt luyện mới từ đầu? Các đáp án đã lưu vẫn có trong lịch sử.')) return;
    busy=true;
    renderUnit();
    message('#lExamMessage','Đang tạo lượt luyện mới...');
    try {
      const started=await post(endpoint+'/restart');
      drafts.clear();
      draftStorage(true);
      attemptId=Number(started.attemptId);
      reviews.clear();
      retry=null;
      rewindAudio();
      openUnit(0);
      showSummary();
      message('#lExamMessage','Đã bắt đầu lượt luyện mới.');
      $('.l-exam-question').scrollIntoView({block:'start'});
    } catch(error) {
      message('#lExamMessage',error.message,true);
    } finally {
      busy=false;
      renderUnit();
    }
  }

  function restartCurrentQuestion() {
    if (busy || !attemptId || !activeQuestion) return;
    if (retry?.question) {
      resetRetry();
      return;
    }
    const id=questionId(activeQuestion);
    const saved=reviews.get(id);
    if (retry && !retry.graded) {
      retry.choices.delete(id);
    } else if (graded(saved)) {
      startRetry([current],{fromSummary:retry?.fromSummary,question:activeQuestion});
      return;
    } else if (!readOnly && !saved) {
      drafts.delete(id);
      draftStorage(true);
    } else {
      return;
    }
    rewindAudio();
    renderUnit();
    message('#lExamMessage','Câu '+activeQuestion.number+' đã sẵn sàng để làm lại.');
  }

  function choose(q,id) {
    if (busy || !attemptId) return;
    const qid=questionId(q);
    activeQuestion=q;
    if (retry) {
      if (retry.graded) return;
      retry.choices.set(qid,id);
      if (!grouped || retry.question) {
        retryGrade();
        return;
      }
    } else if (!readOnly && !reviews.has(qid)) {
      if (!grouped) {
        grade('/check',{questionId:qid,optionId:id});
        return;
      }
      drafts.set(qid,id);
      draftStorage(true);
    } else return;
    renderUnit();
    $('#lQuestion-'+qid+' .l-choice.selected')?.focus({preventScroll:true});
  }

  async function grade(path,payload) {
    if (busy || readOnly || !attemptId) return;
    busy=true;
    renderUnit();
    message('#lExamMessage','Đang kiểm tra câu trả lời...');
    try {
      const result=await post(endpoint+'/attempts/'+attemptId+path,payload);
      for (const review of result.review || [result]) {
        const id=Number(review.questionId);
        reviews.set(id,review);
        drafts.delete(id);
      }
      draftStorage(true);
      if (finished()) {
        showSummary();
        message('#lExamMessage','Đã hoàn thành bộ luyện. Kết quả đã được lưu.');
      } else message('#lExamMessage',grouped ? 'Đã chấm cả đoạn và lưu kết quả.' : 'Đã chấm và lưu kết quả.');
    } catch(error) {
      const refresh=error.status===409 ? ' Tải lại trang để đồng bộ lượt luyện.' : '';
      message('#lExamMessage',error.message+refresh,true);
    } finally {
      busy=false;
      renderUnit();
    }
  }

  function checkGroup() {
    const button=$('#lCheckGroup');
    if (button.hidden || button.disabled) return;
    if (retry) {
      retryGrade();
      return;
    }
    const unit=units[current];
    const answers=Object.fromEntries(unit.questions.map(q=>questionId(q))
      .filter(id=>!reviews.has(id)).map(id=>[id,drafts.get(id)]));
    grade('/groups/'+unit.questions[0].id+'/check',{answers});
  }

  audio.addEventListener('error',()=>{
    if (!lastAudio || !units.length) return;
    audioFailed=true;
    updateAudioStatus();
  });
  $('#lReplay').addEventListener('click',()=>{
    if (!lastAudio) return;
    if (audioFailed) {
      audioFailed=false;
      audio.load();
      audio.playbackRate=Number($('#lSpeed').value)||1;
      updateAudioStatus();
    }
    audio.currentTime=0;
    audio.play().catch(()=>{$('#lAudioStatus').textContent='Chưa phát được âm thanh. Hãy thử bấm Play.';});
  });
  $('#lSpeed').addEventListener('change',event=>{audio.playbackRate=Number(event.target.value)||1;});
  $('#lRetake').addEventListener('click',restart);
  $('#lCheckGroup').addEventListener('click',checkGroup);
  $('#lRetryUnit').addEventListener('click',restartCurrentQuestion);
  $('#lBackToResult').addEventListener('click',stopRetry);
  $('#lPrevious').addEventListener('click',()=>move(-1));
  $('#lNext').addEventListener('click',()=>move(1));
  document.addEventListener('keydown',event=>{
    if (event.target.matches('input,textarea,select,button,a,audio') || event.altKey || event.ctrlKey || event.metaKey) return;
    if (event.key==='ArrowLeft') move(-1);
    if (event.key==='ArrowRight') move(1);
    if (!grouped && /^[1-4]$/.test(event.key) && units.length) {
      const q=units[current].questions[0];
      const choice=q.options[Number(event.key)-1];
      if (choice) choose(q,Number(choice.id));
    }
  });

  async function loadAttempt() {
    if (historyId) {
      readOnly=true;
      return request(endpoint+'/attempts/'+encodeURIComponent(historyId));
    }
    return post(endpoint+'/start');
  }

  function buildUnits() {
    const groups=new Map();
    state.questions.forEach((q,index)=>{
      q.number=index+1;
      if (!groups.has(q.groupId)) groups.set(q.groupId,{questions:[]});
      groups.get(q.groupId).questions.push(q);
    });
    units=[...groups.values()];
    units.forEach((unit,index)=>{
      unit.media=unitMedia(unit);
      unit.questions.forEach(q=>unitByQuestion.set(questionId(q),index));
    });
  }

  async function load() {
    try {
      state=await request(endpoint);
      const started=await loadAttempt();
      attemptId=Number(started.attemptId);
      (started.review || []).forEach(v=>reviews.set(Number(v.questionId),v));
      buildUnits();
      draftStorage();
      $('#lExamTitle').textContent=state.title;
      $('#lPracticeMode').textContent=readOnly ? 'Lịch sử luyện nghe'
        : (grouped ? 'Luyện theo từng đoạn nghe' : 'Luyện theo từng câu');
      $('#lRetake').hidden=readOnly;
      $('#lNavTip').textContent=grouped ? 'Kết quả được lưu sau khi kiểm tra cả đoạn.' : 'Kết quả được lưu ngay sau khi bạn chọn đáp án.';
      $('#lPrevious').textContent=grouped ? '← Đoạn trước' : '← Câu trước';
      nav.replaceChildren();
      state.questions.forEach(q=>{
        nav.append(action(q.number,'',()=>{
          openUnit(unitByQuestion.get(questionId(q)),q);
          if (grouped) $('#lQuestion-'+q.id)?.scrollIntoView({block:'nearest'});
        }));
      });
      const pending=units.findIndex(unit=>!unitGraded(unit));
      const resume=readOnly || pending<0 ? 0 : pending;
      const unanswered=units[resume].questions.find(q=>!reviews.has(questionId(q)));
      openUnit(resume,readOnly ? undefined : unanswered);
      showSummary();
      message('#lExamMessage',readOnly || finished()
        ? 'Chọn một câu để xem lại đáp án và giải thích.'
        : (reviews.size || drafts.size ? 'Đã mở lại bài luyện của bạn.' : 'Bấm phát để bắt đầu luyện nghe.'));
      if (!readOnly) {
        request('/listening/api/overview?part='+defaultPart).then(data=>{
          const sets=availableSets(data.levels);
          const index=sets.findIndex(set=>Number(set.id)===setId);
          nextSet=index<0 ? null : sets[index+1];
          showSummary();
        }).catch(()=>{});
      }
    } catch(error) {
      message('#lExamMessage',error.message,true);
    }
  }
  load();
})();
