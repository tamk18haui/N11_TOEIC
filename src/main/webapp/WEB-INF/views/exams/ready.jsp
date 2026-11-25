<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/exam-student.css?v=3.0" />
<%@ include file="../fragments/header.jspf" %>
<main class="n11-exam"><div class="container container-n11 py-5">
  <section class="exam-empty">
    <span class="exam-overline">PHÒNG THI THỬ</span>
    <h1><c:out value="${paper.title}" /></h1>
    <c:choose>
      <c:when test="${not empty paper.resumeAttemptId}">
        <p>Bạn có một lượt thi đang làm. Đồng hồ tiếp tục chạy khi rời phòng thi.</p>
        <a class="exam-primary-button exam-button-link" href="${pageContext.request.contextPath}/exams/attempts/${paper.resumeAttemptId}">Tiếp tục lượt thi</a>
      </c:when>
      <c:otherwise>
        <p>${paper.questionCount} câu · ${paper.durationMinutes} phút. Đồng hồ bắt đầu khi bạn bấm <b>Bắt đầu thi</b>.</p>
        <c:if test="${paper.examType eq 'LR_FULL'}">
          <p>Chuẩn bị tai nghe trước khi bắt đầu. Trong phòng thi, bấm <b>Phát Listening</b> để bắt đầu chuỗi âm thanh. Bạn có 45 phút Listening và 75 phút Reading.</p>
        </c:if>
        <form method="post" action="${pageContext.request.contextPath}/exams/${paper.id}/start">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
          <button type="submit" class="exam-primary-button">Bắt đầu thi</button>
        </form>
      </c:otherwise>
    </c:choose>
    <a class="exam-back-link" href="${pageContext.request.contextPath}/exams">Về danh sách đề</a>
  </section>
</div></main>
<%@ include file="../fragments/footer.jspf" %>
<%@ include file="../fragments/scripts.jspf" %>
