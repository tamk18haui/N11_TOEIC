<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/exam-student.css?v=3.0" />
<%@ include file="../fragments/header.jspf" %>
<main class="n11-exam n11-exam-list">
  <div class="container container-n11 py-4 py-lg-5">
    <div class="exam-hero">
      <div><div class="exam-eyebrow">TOEIC · LISTENING &amp; READING</div>
        <h1>Phòng thi thử TOEIC</h1>
        <p>Làm bài có giới hạn thời gian, lưu đáp án tự động và xem kết quả sau khi nộp. Mỗi lượt thi được lưu trong lịch sử của bạn.</p>
        <a class="exam-link-light" href="${pageContext.request.contextPath}/exams/history">Xem lịch sử thi của tôi →</a>
      </div>
      <div class="exam-hero-figure" aria-hidden="true"><span>200</span><small>QUESTIONS</small><b>7 PARTS</b></div>
    </div>
    <div class="exam-phase-summary">Full Test: 45 phút Listening (100 câu), tiếp theo 75 phút Reading (100 câu). Hết thời gian Listening sẽ không quay lại sửa đáp án được. Đề ngắn dùng tổng thời gian do Admin đặt.</div>
    <div class="exam-section-heading"><div><span class="exam-overline">ĐỀ THI ĐƯỢC CÔNG BỐ</span><h2>Chọn bài thi</h2></div><span class="exam-subnote">Đề do quản trị viên cung cấp</span></div>
    <c:choose>
      <c:when test="${empty papers}">
        <div class="exam-empty"><div class="exam-empty-symbol">▤</div><h3>Chưa có đề thi được công bố</h3>
          <p>Trong lúc chờ đề mới, bạn có thể luyện từng dạng câu hỏi.</p>
          <div class="exam-confirm-actions"><a class="exam-secondary-button exam-button-link" href="${pageContext.request.contextPath}/listening">Luyện Listening</a><a class="exam-secondary-button exam-button-link" href="${pageContext.request.contextPath}/reading">Luyện Reading</a></div>
        </div>
      </c:when>
      <c:otherwise>
        <div class="exam-paper-grid">
          <c:forEach var="paper" items="${papers}">
            <article class="exam-paper-card">
              <div class="exam-card-head"><span class="exam-tag ${paper.examType eq 'LR_FULL' ? 'exam-tag-full' : 'exam-tag-mini'}">${paper.examType eq 'LR_FULL' ? 'FULL TEST' : 'CUSTOM TEST'}</span><span class="exam-tag-muted">Đã công bố</span></div>
              <h3><c:out value="${paper.title}" /></h3>
              <p class="exam-description"><c:out value="${paper.description}" default="Bài thi TOEIC Listening &amp; Reading" /></p>
              <div class="exam-stats"><div><strong><c:out value="${paper.questionCount}" /></strong><span>Câu hỏi</span></div><div><strong><c:out value="${paper.durationMinutes}" />'</strong><span>Thời gian</span></div><div><strong><c:out value="${paper.listeningCount}" /> / <c:out value="${paper.readingCount}" /></strong><span>Nghe / Đọc</span></div></div>
              <c:choose><c:when test="${paper.questionCount gt 0}">
                <a class="exam-primary-button exam-button-link" href="${pageContext.request.contextPath}/exams/${paper.id}/ready">Mở đề thi <span aria-hidden="true">→</span></a>
              </c:when><c:otherwise><span class="exam-muted">Đề chưa có câu hỏi</span></c:otherwise></c:choose>
            </article>
          </c:forEach>
        </div>
      </c:otherwise>
    </c:choose>
    <div class="exam-rules"><h3>Quy tắc phòng thi</h3><div class="exam-rule-grid"><p><b>01.</b> Đáp án được tự động lưu khi có kết nối.</p><p><b>02.</b> Full Test phát Listening lần lượt theo đề, sau đó chuyển sang Reading.</p><p><b>03.</b> Khi hết giờ, hệ thống chấm các đáp án đã nhận.</p><p><b>04.</b> Đáp án, lời giải và điểm quy đổi (nếu có) hiển thị sau khi nộp.</p></div></div>
  </div>
</main>
<%@ include file="../fragments/footer.jspf" %>
<%@ include file="../fragments/scripts.jspf" %>
