<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vocabulary-v44.css?v=44" />
<%@ include file="../fragments/header.jspf" %>

<main class="vocabulary-page">
  <section class="page-section">
    <div class="container container-n11 vocab-wrap">
      <%@ include file="../fragments/vocabulary-settings.jspf" %>
      <a class="vocab-back-link" href="${pageContext.request.contextPath}/vocabulary" data-i18n="backAllTopics">← All topics</a>

      <div class="grammar-result">
        <h1><c:choose><c:when test="${attempt.quizType eq 'PLACEMENT'}"><span data-i18n="resultPlacementTitle">Assessment results</span></c:when><c:otherwise><span data-i18n="resultPracticeTitle">Practice results</span></c:otherwise></c:choose></h1>
        <div class="result-score">
          <div class="result-circle">
            <strong>${attempt.scorePercent}%</strong>
          </div>
          <div class="result-info">
            <h2><c:out value="${attempt.topicTitle}"/></h2>
            <p><span data-i18n="answeredCorrectly">Correct answers:</span> <strong>${attempt.correctCount}/${attempt.questionCount}</strong> <span data-i18n="questions">questions</span></p>
            <c:if test="${attempt.quizType eq 'PLACEMENT'}">
              <p class="vocab-placement-result ${attempt.passed ? 'passed' : 'not-passed'}">
                <c:choose>
                  <c:when test="${attempt.passed}"><span data-i18n="placementPassedResult">Passed the optional assessment. All published lessons are available.</span></c:when>
                  <c:otherwise><span data-i18n="placementFailedResult">You need 25 correct answers. Review and try again.</span></c:otherwise>
                </c:choose>
              </p>
            </c:if>
            <c:if test="${attempt.quizType eq 'LESSON'}">
              <p class="vocab-placement-result">
                <c:choose>
                  <c:when test="${attempt.passed}"><span data-i18n="lessonCompletedResult">Lesson completed ·</span> ${attempt.correctCount * 100 / attempt.questionCount}%</c:when>
                  <c:otherwise><span data-i18n="lessonPassHint">Score 70% to mark this lesson completed.</span></c:otherwise>
                </c:choose>
              </p>
            </c:if>
            <p class="result-time"><fmt:formatDate value="${attempt.submittedAt}" pattern="dd/MM/yyyy HH:mm"/></p>
          </div>
        </div>

        <div class="result-actions">
          <a class="btn grammar-btn" href="${pageContext.request.contextPath}/vocabulary" data-i18n="returnToTopics">Back to topics</a>
          <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/vocabulary/history" data-i18n="viewHistoryLabel">View history</a>
        </div>

        <c:if test="${not empty answers}">
          <section class="result-details">
            <h3 data-i18n="answerDetails">Answer details</h3>
            <c:forEach items="${answers}" var="answer" varStatus="status">
              <div class="result-item ${answer.correct ? 'correct' : 'incorrect'}">
                <div class="result-item-header">
                  <span class="result-number"><span data-i18n="question">Question</span> ${status.index + 1}</span>
                  <span class="result-status"><span data-i18n="${answer.correct ? 'correct' : 'incorrect'}">${answer.correct ? '✓ Correct' : '✗ Incorrect'}</span></span>
                </div>
                <c:if test="${not empty answer.typedAnswer}">
                  <p class="mb-0"><span data-i18n="yourAnswer">Your answer:</span> <c:out value="${answer.typedAnswer}"/></p>
                </c:if>
              </div>
            </c:forEach>
          </section>
        </c:if>
      </div>
    </div>
  </section>
</main>

<script src="${pageContext.request.contextPath}/assets/js/vocabulary.js?v=46"></script>
<%@ include file="../fragments/footer.jspf" %>
<%@ include file="../fragments/scripts.jspf" %>
