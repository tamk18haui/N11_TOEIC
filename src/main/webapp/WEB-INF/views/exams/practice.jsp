<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/exam-student.css?v=3.2" />
<main class="n11-exam n11-exam-room" id="examStudentApp" data-attempt-id="${attemptId}" data-base="${pageContext.request.contextPath}" data-csrf="${_csrf.token}">
  <div class="exam-room-topbar">
    <a class="exam-room-brand" href="${pageContext.request.contextPath}/exams" aria-label="Danh sách đề thi"><span class="exam-brand-mark">N</span> N11 <b>TOEIC</b></a>
    <div class="exam-top-title"><strong id="examPaperTitle">Đang tải đề thi...</strong><small id="examTopPart">Phòng thi thử TOEIC</small></div>
    <div class="exam-clock-group">
      <div class="exam-top-clock"><span id="examPhaseLabel">ĐANG TẢI THỜI GIAN</span><strong id="examTimer" aria-live="off">--:--</strong></div>
      <div class="exam-top-clock exam-total-clock" id="examTotalClockWrap" hidden><span>TỔNG CÒN LẠI</span><strong id="examTotalTimer">--:--</strong></div>
    </div>
    <button class="exam-top-submit" id="examSubmitTop" type="button">Nộp bài</button>
  </div>
  <div class="exam-room-main">
    <section class="exam-question-area" aria-label="Nội dung đề thi">
      <div id="examAlert" class="exam-alert" role="status" aria-live="polite">Đang tải dữ liệu đề thi…</div>
      <div class="exam-question-toolbar"><div><span class="exam-overline" id="examCurrentPart">PART 1 · LISTENING</span><h1 id="examCurrentNumber">Câu 1</h1></div><div class="exam-save-actions"><span class="exam-quiet-pill" id="examSaveStatus" role="status">Tự động lưu</span><button class="exam-secondary-button" id="examRetrySave" type="button" hidden>Thử lưu lại</button></div></div>
      <div class="exam-question-card" id="examQuestionCard">
        <div class="exam-reading-panes">
          <div id="examMaterialPane" class="exam-material-pane">
            <h2 id="examReadingLabel" class="exam-reading-label" hidden></h2>
            <div id="examPassage" class="exam-passage" hidden></div>
            <div id="examAudioWrap" class="exam-media-block" hidden>
              <strong id="examAudioTitle">Nghe đoạn âm thanh</strong>
              <audio id="examAudio" controls preload="none"></audio>
              <button class="exam-primary-button" id="examAudioStart" type="button" hidden>Phát Listening</button>
              <small id="examAudioStatus" role="status"></small>
            </div>
            <div id="examImageWrap" class="exam-image-frame" hidden>
              <img id="examImage" alt="Hình ảnh câu hỏi TOEIC" />
              <a id="examImageZoom" class="exam-image-zoom" target="_blank" rel="noopener noreferrer" hidden>Mở ảnh lớn</a>
              <p id="examImageStatus" class="exam-image-status" role="status" hidden>Không tải được ảnh. Bạn có thể thử mở ảnh lớn.</p>
            </div>
          </div>
          <div id="examAnswerPane" class="exam-answer-pane">
            <h2 id="examQuestionText">Đang tải câu hỏi…</h2>
            <div class="exam-choices" id="examChoices" role="group" aria-label="Chọn đáp án"></div>
          </div>
        </div>
        <div class="exam-question-actions"><button type="button" class="exam-secondary-button" id="examPrev">← Câu trước</button><button type="button" class="exam-secondary-button" id="examClear" disabled>Bỏ chọn</button><button type="button" class="exam-secondary-button" id="examNext">Câu tiếp →</button></div>
      </div>
    </section>
    <aside class="exam-room-sidebar" aria-label="Danh sách câu hỏi">
      <div class="exam-side-heading"><div><h2>Danh sách câu</h2><small id="examAnsweredText">0 câu đã chọn</small></div><span id="examProgressBadge">0/0</span></div>
      <div class="exam-progress-track"><span id="examProgressBar"></span></div>
      <p class="exam-phase-notice" id="examPhaseNotice">Đang tải quy tắc làm bài...</p>
      <div class="exam-nav-scroll" id="examPartNav"></div>
      <div class="exam-nav-legend"><span><i class="exam-dot answered"></i>Đã làm</span><span><i class="exam-dot current"></i>Đang xem</span><span><i class="exam-dot empty"></i>Chưa làm</span></div>
      <button class="exam-primary-button" id="examSubmitSide" type="button">Nộp bài thi</button>
      <p class="exam-sidebar-tip">Đáp án được lưu khi bạn chọn. Bạn có thể quay lại sửa trước khi nộp bài.</p>
      <a class="exam-back-link" href="${pageContext.request.contextPath}/exams/history">Lịch sử thi</a>
    </aside>
  </div>
  <div class="exam-modal-backdrop" id="examConfirmOverlay" hidden>
    <div class="exam-confirm-card" role="dialog" aria-modal="true" aria-labelledby="examConfirmTitle">
      <div class="exam-confirm-icon">✓</div><h2 id="examConfirmTitle">Nộp bài thi?</h2><p id="examConfirmMessage">Bạn có chắc muốn kết thúc và chấm bài ngay bây giờ?</p>
      <div class="exam-confirm-actions"><button type="button" id="examCancelSubmit" class="exam-secondary-button">Tiếp tục làm</button><button type="button" id="examConfirmSubmit" class="exam-primary-button">Xác nhận nộp</button></div>
    </div>
  </div>
</main>
<script src="${pageContext.request.contextPath}/assets/js/exam-student.js?v=3.2"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ets1-page-viewer.css?v=1" />
<script src="${pageContext.request.contextPath}/assets/js/ets1-page-viewer.js?v=2"></script>
<%@ include file="../fragments/scripts.jspf" %>
