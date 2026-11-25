<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vocabulary-v44.css?v=44" />
<%@ include file="../fragments/header.jspf" %>

<main class="vocabulary-page">
  <div class="container container-n11 vocab-wrap vocab-detail-wrap">
    <%@ include file="../fragments/vocabulary-settings.jspf" %>
    <a class="vocab-back-link" href="${pageContext.request.contextPath}/vocabulary/${topic.id}" data-i18n="backTopic">← Quay lại chủ đề</a>

    <header class="vocab-detail-heading">
      <span class="vocab-eyebrow">
        <c:choose>
          <c:when test="${quiz.type eq 'PLACEMENT'}"><span data-i18n="placementTestTitle">OPTIONAL ASSESSMENT</span></c:when>
          <c:otherwise><span data-i18n="lessonQuizTitle">LESSON QUIZ</span></c:otherwise>
        </c:choose>
      </span>
      <h1><c:choose><c:when test="${quiz.type eq 'PLACEMENT'}"><span data-i18n="placementTestTitle">Placement Test</span></c:when><c:otherwise><span data-i18n="lessonQuizTitle">Lesson Quiz</span></c:otherwise></c:choose></h1>
      <c:choose>
        <c:when test="${quiz.type eq 'PLACEMENT'}">
          <p data-i18n="placementInstructions">Bài kiểm tra gồm 25 câu trắc nghiệm và 5 câu nghe viết. Đạt ít nhất 25/30 để ghi nhận kết quả đạt.</p>
          <div class="vocab-quiz-rule"><strong>25</strong> <span data-i18n="multipleChoice">multiple choice</span> <span>+</span> <strong>5</strong> <span data-i18n="dictationLabel">dictation</span> · <span data-i18n="passAt">pass at</span> <strong>25/30</strong></div>
        </c:when>
        <c:otherwise>
          <p data-i18n="lessonQuizInstructions">Hoàn thành bài tập để lưu điểm và nhận sao. Không bắt buộc học theo thứ tự.</p>
        </c:otherwise>
      </c:choose>
    </header>

    <form method="post" action="${pageContext.request.contextPath}${quizAction}" class="vocab-quiz-form">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      <input type="hidden" name="quizToken" value="${quiz.token}">
      <c:forEach items="${quiz.questions}" var="question">
        <fieldset class="vocab-quiz-question">
          <legend>
            <span class="vocab-question-number">${question.number}</span>
            <c:choose>
              <c:when test="${question.kind eq 'DICTATION'}"><span data-i18n="dictationQuestion">Nghe và viết từ bạn nghe được</span></c:when>
              <c:otherwise><span data-i18n="meaningPrompt">Chọn từ tiếng Anh tương ứng với nghĩa:</span> <strong><c:out value="${question.term.meaningVi}"/></strong></c:otherwise>
            </c:choose>
          </legend>
          <c:choose>
            <c:when test="${question.kind eq 'DICTATION'}">
              <div class="vocab-dictation-row">
                <c:choose>
                  <c:when test="${not empty question.term.audioUrl}">
                    <button class="vocab-soft-btn vocab-speak-prompt" type="button"
                            data-audio-url="<c:out value='${question.term.audioUrl}'/>" data-i18n="playAudio">🔊 Play audio</button>
                  </c:when>
                  <c:otherwise>
                    <button class="vocab-soft-btn vocab-speak-prompt" type="button" data-v44-tts="true" data-word="<c:out value='${question.term.word}'/>" data-i18n="playAudio">🔊 Nghe từ</button>
                  </c:otherwise>
                </c:choose>
                <input class="form-control" type="text" name="dictation_${question.number}"
                       maxlength="500" autocomplete="off" spellcheck="false"
                       aria-label="Câu trả lời nghe viết ${question.number}">
              </div>
            </c:when>
            <c:otherwise>
              <div class="vocab-quiz-options">
                <c:forEach items="${question.options}" var="option">
                  <label class="vocab-quiz-option">
                    <input type="radio" name="answer_${question.number}" value="${option.id}">
                    <span><c:out value="${option.word}"/></span>
                  </label>
                </c:forEach>
              </div>
            </c:otherwise>
          </c:choose>
        </fieldset>
      </c:forEach>
      <p class="vocab-flashcard-status" id="vocab-dictation-status" role="status" aria-live="polite"></p>
      <div class="vocab-quiz-submit">
        <button class="vocab-primary-btn" type="submit" data-i18n="submitQuiz">Nộp bài và xem kết quả</button>
        <span data-i18n="quizAnswerNotice">Kết quả được chấm và lưu trên máy chủ.</span>
      </div>
    </form>
  </div>
</main>

<script src="${pageContext.request.contextPath}/assets/js/vocabulary.js?v=46"></script>
<%@ include file="../fragments/footer.jspf" %>
<%@ include file="../fragments/scripts.jspf" %>
