<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vocabulary-v44.css?v=44" />
<%@ include file="../fragments/header.jspf" %>

<main class="vocabulary-page">
  <section class="page-section">
    <div class="container container-n11 vocab-wrap">
      <%@ include file="../fragments/vocabulary-settings.jspf" %>
      <a class="vocab-back-link" href="${pageContext.request.contextPath}/vocabulary" data-i18n="backAllTopics">← All topics</a>

      <header class="vocab-detail-heading">
        <h1 data-i18n="historyHeading">Practice history</h1>
        <p data-i18n="historyDescription">Review your completed vocabulary quizzes</p>
      </header>

      <c:if test="${not empty attempts}">
        <div class="result-history">
          <c:forEach items="${attempts}" var="attempt">
            <article class="result-history-item">
              <div class="d-flex justify-content-between align-items-start gap-2">
                <div>
                  <h3><c:out value="${attempt.topicTitle}"/></h3>
                  <p class="text-muted"><fmt:formatDate value="${attempt.submittedAt}" pattern="dd/MM/yyyy HH:mm"/></p>
                </div>
                <div class="text-end">
                  <strong class="result-score-large">${attempt.scorePercent}%</strong>
                  <div class="result-score-subtext">${attempt.correctCount}/${attempt.questionCount} <span data-i18n="questions">questions</span></div>
                </div>
              </div>
              <a class="btn btn-sm grammar-btn" href="${pageContext.request.contextPath}/vocabulary/attempts/${attempt.id}" data-i18n="viewDetails">View details</a>
            </article>
          </c:forEach>
        </div>
      </c:if>

      <c:if test="${empty attempts}">
        <div class="grammar-empty">
          <h2 data-i18n="noAttempts">No quizzes yet</h2>
          <p data-i18n="startTopicHint">Choose a vocabulary topic to start practising.</p>
          <a class="btn grammar-btn" href="${pageContext.request.contextPath}/vocabulary" data-i18n="chooseTopic">Choose a topic</a>
        </div>
      </c:if>
    </div>
  </section>
</main>

<script src="${pageContext.request.contextPath}/assets/js/vocabulary.js?v=46"></script>
<%@ include file="../fragments/footer.jspf" %>
<%@ include file="../fragments/scripts.jspf" %>
