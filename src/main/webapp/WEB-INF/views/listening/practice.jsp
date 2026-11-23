<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/listening.css?v=20261120-instant4" />
<main class="n11-listening l-exam" id="listeningPractice" data-base="${pageContext.request.contextPath}" data-set="${setId}" data-part="${part}">
  <header class="l-exam-topbar">
    <a href="${pageContext.request.contextPath}/listening?part=${part}" class="l-icon-back" aria-label="Quay lại chọn cấp độ">
      <svg viewBox="0 0 24 24" aria-hidden="true"><path d="M15 18l-6-6 6-6"/></svg>
    </a>
    <a href="${pageContext.request.contextPath}/listening" class="l-brand"><span class="l-brand-headphone"><img src="${pageContext.request.contextPath}/assets/img/logo.svg" width="31" height="31" alt="" /></span><span>N11 <b>TOEIC</b></span></a>
    <span class="l-topbar-divider" aria-hidden="true"></span>
    <div class="l-current-title"><strong id="lExamTitle">Listening · Part ${part}</strong><small>Chọn đáp án · Xem giải thích ngay</small></div>
    <span class="l-exam-chip">Part ${part}</span>
    <a class="l-leave" href="${pageContext.request.contextPath}/listening?part=${part}">Thoát</a>
  </header>
  <div class="l-exam-container">
    <div class="l-exam-state" id="lExamMessage" role="status" aria-live="polite">Đang tải câu hỏi...</div>
    <div class="l-three-columns">
      <section class="l-exam-media" aria-label="Âm thanh và hình ảnh">
        <header class="l-panel-title"><div class="l-title-symbol l-symbol-audio" aria-hidden="true"><svg viewBox="0 0 24 24"><path d="M9 18V5l12-2v13M9 9l12-2"/><circle cx="6" cy="18" r="3"/><circle cx="18" cy="16" r="3"/></svg></div><div><h2>Nghe và quan sát</h2><small>Nội dung cho câu hỏi hiện tại</small></div></header>
        <div class="l-player-card">
          <div class="l-player-heading"><span class="l-live-dot"></span><strong>Âm thanh bài nghe</strong><span class="l-audio-caption">LISTENING</span></div>
          <audio controls preload="metadata" id="lAudio" aria-label="Trình phát âm thanh TOEIC"></audio>
          <div class="l-audio-tools">
            <button type="button" id="lReplay"><span aria-hidden="true">↻</span> Phát lại</button>
            <label for="lSpeed">Tốc độ</label>
            <select id="lSpeed"><option value="0.75">0.75×</option><option value="1" selected>1×</option><option value="1.25">1.25×</option><option value="1.5">1.5×</option></select>
          </div>
          <p class="l-audio-note" id="lAudioStatus">Đang kiểm tra âm thanh...</p>
        </div>
        <div class="l-photo-card" id="lPhotoCard" hidden><img id="lPhoto" alt="Hình minh họa của câu nghe" /><p>Quan sát hình ảnh và nghe kỹ các phương án.</p></div>
        <div class="l-media-placeholder" id="lNoPicture" hidden><span aria-hidden="true">▧</span><p>Chưa có hình minh họa cho câu hỏi này.</p></div>
        <div class="l-media-tip"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 3a9 9 0 1 0 0 18 9 9 0 0 0 0-18zm0 4v6m0 4h.01"/></svg><span>Nghe kỹ trước khi chọn đáp án. Có thể phát lại và thay đổi tốc độ.</span></div>
      </section>
      <section class="l-exam-question" aria-label="Chọn đáp án">
        <div class="l-q-topline"><span id="lQTitle">Câu 1</span><span id="lQGroup">Part ${part}</span></div>
        <h1 id="lQuestion">Đang tải nội dung câu hỏi...</h1>
        <p class="l-q-instruction">Chọn một đáp án. Hệ thống chấm ngay sau khi bạn nhấn chọn.</p>
        <div id="lChoices" class="l-choices" role="group" aria-label="Đáp án cho câu hiện tại"></div>
        <div class="l-feedback" id="lFeedback" hidden></div>
        <div class="l-question-actions"><button type="button" id="lPrevious"><span aria-hidden="true">←</span> Câu trước</button><span id="lCounter">1 / 1</span><button type="button" id="lNext">Câu tiếp <span aria-hidden="true">→</span></button></div>
      </section>
      <aside class="l-exam-nav" aria-label="Danh sách câu hỏi">
        <div class="l-nav-head"><div><h2>Danh sách câu</h2><small>Chuyển nhanh đến câu hỏi</small></div><span id="lAnswered">0/0</span></div>
        <div class="l-nav-progress" aria-label="Tiến độ đã trả lời"><div id="lProgress" style="width:0"></div></div>
        <div class="l-questions-grid" id="lQuestionNav"></div>
        <div class="l-legend"><span><i class="done"></i>Đúng</span><span><i class="incorrect"></i>Sai</span><span><i class="current"></i>Đang xem</span></div>
        <div class="l-nav-bottom"><p class="l-nav-tip"><strong>Chấm ngay từng câu.</strong> Chọn một đáp án để thấy đúng/sai và giải thích bên dưới. Kết quả được tự động lưu.</p></div>
      </aside>
    </div>
    <section class="l-score-summary" id="lScoreSummary" hidden aria-live="polite"></section>
  </div>
  <input type="hidden" id="lCsrf" value="${_csrf.token}" data-header="${_csrf.headerName}" />
</main>
<script defer src="${pageContext.request.contextPath}/assets/js/listening.js?v=20261120-instant4"></script>
<%@ include file="../fragments/scripts.jspf" %>
