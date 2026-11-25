<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/exam-student.css?v=3.1" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/exam-review-v42.css?v=42" />
<%@ include file="../fragments/header.jspf" %>
<main class="n11-exam"><div class="container container-n11 py-4 py-lg-5">
  <div class="exam-section-heading"><div><span class="exam-overline">KẾT QUẢ THI THỬ</span><h1><c:out value="${result.title}" /></h1></div><a class="exam-secondary-button exam-button-link" href="${pageContext.request.contextPath}/exams/history">Lịch sử thi →</a></div>
  <div class="exam-result-grid"><div class="exam-result-card"><span>Listening đúng</span><strong><c:out value="${result.listeningCorrect}" /></strong><small>câu</small></div><div class="exam-result-card"><span>Reading đúng</span><strong><c:out value="${result.readingCorrect}" /></strong><small>câu</small></div><div class="exam-result-card"><span>Đáp án máy chủ đã nhận</span><strong>${result.answeredCount} / ${result.totalQuestions}</strong><small>câu</small></div><div class="exam-result-card exam-result-main"><span>Điểm quy đổi</span><c:choose><c:when test="${result.hasScaledScore}"><strong><c:out value="${result.totalScaled}" /></strong><small>L: ${result.listeningScaled} · R: ${result.readingScaled}</small></c:when><c:otherwise><strong>—</strong><small>Chưa có bảng quy đổi phù hợp</small></c:otherwise></c:choose></div></div>
  <div class="exam-note mt-3"><c:out value="${result.status eq 'EXPIRED' ? 'Hết giờ. Hệ thống đã chấm các đáp án nhận được trước hạn.' : 'Bài thi đã được nộp.'}" /></div>
  <div class="exam-part-result-grid" aria-label="Kết quả theo Part">
    <c:forEach var="part" items="${result.parts}">
      <c:url var="practiceLink" value="${part.practiceUrl}" />
      <div class="exam-part-result"><strong>Part ${part.number}</strong><span>${part.correct}/${part.total} câu đúng</span><a href="<c:out value='${practiceLink}' />">Luyện Part ${part.number} →</a></div>
    </c:forEach>
  </div>
  <div class="exam-section-heading mt-5"><div><span class="exam-overline">ĐÁP ÁN VÀ GIẢI THÍCH</span><h2>Kiểm tra lại bài làm</h2></div><a href="${pageContext.request.contextPath}/exams" class="exam-button-link exam-primary-button">Chọn đề khác</a></div>
  <form class="exam-review-filter" method="get">
    <label for="reviewPart">Phần thi<select id="reviewPart" name="part">
      <option value="0">Tất cả các Part</option>
      <c:forEach var="part" items="${result.parts}"><option value="${part.number}" ${partFilter eq part.number ? 'selected' : ''}>Part ${part.number}</option></c:forEach>
    </select></label>
    <label for="needsReview">Hiển thị<select id="needsReview" name="needsReview">
      <option value="true" ${needsReview ? 'selected' : ''}>Câu sai và bỏ trống</option>
      <option value="false" ${needsReview ? '' : 'selected'}>Tất cả câu</option>
    </select></label>
    <button class="exam-secondary-button" type="submit">Lọc câu hỏi</button>
  </form>
  <c:if test="${empty result.questions}"><div class="exam-note">Không có câu hỏi phù hợp với bộ lọc.</div></c:if>
  <div class="exam-review-list">
    <c:forEach var="q" items="${result.questions}">
      <article class="exam-review-row">
        <div class="exam-review-top"><span class="exam-review-number">Câu ${q.order} · Part ${q.part}</span>
          <c:choose><c:when test="${empty q.selectedLabel}"><span class="exam-review-wrong">Chưa chọn</span></c:when><c:when test="${q.correct}"><span class="exam-review-good">✓ Đúng</span></c:when><c:otherwise><span class="exam-review-wrong">✕ Sai</span></c:otherwise></c:choose>
        </div>
        <p class="exam-review-question"><c:out value="${q.text}" /></p>
        <div class="exam-review-options"><span>Bạn chọn: <b><c:out value="${q.selectedLabel}" default="—" /></b></span><span>Đáp án đúng: <b><c:out value="${q.correctLabel}" default="—" /></b></span></div>
        <c:if test="${not empty q.options}"><div class="exam-review-answer-list">
          <c:forEach var="o" items="${q.options}">
            <div class="exam-review-answer-line"><b><c:out value="${o.label}" />.</b><span><c:out value="${o.text}" /></span>
              <c:if test="${o.label eq q.correctLabel}"><span class="exam-review-answer-correct">Đúng</span></c:if>
              <c:if test="${o.label eq q.selectedLabel}"><span class="exam-review-answer-chosen">Bạn chọn</span></c:if>
            </div>
          </c:forEach>
        </div></c:if>
        <c:if test="${not empty q.audio or not empty q.image or not empty q.questionImage or not empty q.passage or not empty q.explanation or not empty q.reviewRaw}">
          <details class="exam-review-material">
            <summary>Học liệu và giải thích</summary>
            <c:if test="${not empty q.audio}"><c:url var="audioUrl" value="${q.audio}" /><audio controls preload="none" src="<c:out value='${audioUrl}' />" aria-label="Bài nghe câu ${q.order}"></audio></c:if>
            <c:if test="${not empty q.image}">
              <c:url var="imageUrl" value="${q.image}" />
              <img loading="lazy" src="<c:out value='${imageUrl}' />" alt="Hình học liệu của câu ${q.order}" />
              <c:if test="${q.part ge 6}"><a class="exam-image-zoom" href="<c:out value='${imageUrl}' />" target="_blank" rel="noopener noreferrer">Mở ảnh lớn</a></c:if>
            </c:if>
            <c:if test="${not empty q.passage}"><c:choose>
              <c:when test="${q.part le 4}"><div class="n11-review-render" data-part="${q.part}" data-passage="true"><template><c:out value="${q.passage}" /></template></div></c:when>
              <c:otherwise><p class="exam-passage"><c:out value="${q.passage}" /></p></c:otherwise>
            </c:choose></c:if>
            <c:if test="${not empty q.questionImage}">
              <c:url var="questionImageUrl" value="${q.questionImage}" />
              <img loading="lazy" src="<c:out value='${questionImageUrl}' />" alt="Hình riêng của câu ${q.order}" />
              <a class="exam-image-zoom" href="<c:out value='${questionImageUrl}' />" target="_blank" rel="noopener noreferrer">Mở ảnh câu hỏi</a>
            </c:if>
            <c:if test="${not empty q.reviewRaw or not empty q.explanation}">
              <div class="n11-review-render" data-part="${q.part}"><template><c:out value="${empty q.reviewRaw ? q.explanation : q.reviewRaw}" /></template></div>
              <noscript>Hãy bật JavaScript để xem lời giải theo từng đáp án.</noscript>
            </c:if>
          </details>
        </c:if>
      </article>
    </c:forEach>
  </div>
</div></main>
<%@ include file="../fragments/footer.jspf" %>
<script defer src="${pageContext.request.contextPath}/assets/js/exam-review-v42.js?v=42"></script>
<%@ include file="../fragments/scripts.jspf" %>
