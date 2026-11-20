<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/header.jspf" %>

<main class="vocabulary-page">
  <div class="container container-n11 vocab-wrap">
    <%@ include file="../fragments/vocabulary-settings.jspf" %>
    <nav class="vocab-subnav" aria-label="Điều hướng từ vựng">
      <a class="selected" href="${pageContext.request.contextPath}/vocabulary">Lộ trình học</a>
      <a href="${pageContext.request.contextPath}/vocabulary/history">Kết quả của tôi</a>
    </nav>

    <section class="vocab-hero">
      <div class="vocab-hero-shell">
        <div class="vocab-hero-copy">
          <span class="vocab-eyebrow" data-i18n="heroEyebrow">✧ IELTS VOCABULARY ROADMAP</span>
          <h1><span class="vocab-hero-title-first" data-i18n="heroTitleFirst">Build your vocabulary,</span><br><span data-i18n="heroTitleSecond">one topic at a time.</span></h1>
          <p data-i18n="heroDescription">Explore 25 IELTS topics, learn in short lessons, and track your progress from the first word to mastery.</p>
          <div class="vocab-hero-note" data-i18n="heroNote">Small steps. Strong vocabulary. Confident answers.</div>
        </div>

        <div class="vocab-hero-stats" aria-label="Thông tin lộ trình học">
          <div class="vocab-hero-stat">
            <strong>${topics.size()}</strong>
            <span data-i18n="topicStat">Chủ đề học</span>
          </div>
          <div class="vocab-hero-stat">
            <strong>03</strong>
            <span data-i18n="levelStat">Topics from foundation to advanced</span>
          </div>
          <div class="vocab-hero-stat">
            <strong>03</strong>
            <span data-i18n="stepsStat">Learn · practise · master</span>
          </div>
        </div>
      </div>
    </section>

    <c:choose>
      <c:when test="${not empty pageContext.request.userPrincipal}">
        <section class="vocab-progress-card" aria-label="Tiến độ luyện tập">
          <div class="vocab-progress-icon" aria-hidden="true">↗</div>
          <div class="vocab-progress-copy">
            <span class="vocab-eyebrow" data-i18n="progressEyebrow">YOUR LEARNING PROGRESS</span>
            <h2 data-i18n="progressHeading">Keep moving through your roadmap</h2>
            <p><strong>${completedLessons} / ${totalLessons}</strong> <span data-i18n="progressSummary">lessons completed ·</span> <strong>${totalStars}</strong> <span data-i18n="starsEarned">stars earned</span>.</p>
            <div class="vocab-progress-track" role="progressbar"
                 aria-label="Overall lesson completion"
                 aria-valuenow="${overallProgress}" aria-valuemin="0" aria-valuemax="100">
              <span style="width: ${overallProgress}%"></span>
            </div>
          </div>
          <a class="vocab-progress-link" href="${pageContext.request.contextPath}/vocabulary/history" data-i18n="viewHistory">View history →</a>
        </section>
      </c:when>
      <c:otherwise>
        <section class="vocab-guest-note" aria-label="Chế độ học thử">
          <div>
            <span class="vocab-guest-label" data-i18n="guestEyebrow">GUEST PREVIEW</span>
            <h2 data-i18n="guestHeading">Explore the topics before you begin</h2>
            <p data-i18n="guestDescription">Browse lessons and flashcards as a guest. Sign in to take tests and sync your learning progress.</p>
          </div>
          <a class="btn grammar-btn" href="${pageContext.request.contextPath}/login" data-i18n="signIn">Sign in to sync progress →</a>
        </section>
      </c:otherwise>
    </c:choose>

    <section class="vocab-learning-layout" aria-labelledby="vocab-topics-title">
      <div class="vocab-topic-section">
        <div class="vocab-section-heading">
          <div>
            <span class="vocab-eyebrow" data-i18n="curriculumEyebrow">YOUR IELTS CURRICULUM</span>
            <h2 id="vocab-topics-title" data-i18n="topicHeading">Choose a topic to start</h2>
            <p data-i18n="topicDescription">Each topic includes three lessons, a placement test, and focused practice modes.</p>
          </div>
          <span class="vocab-count"><strong>${topics.size()}</strong> <span data-i18n="topics">topics</span></span>
        </div>

        <div class="row g-3">
          <c:forEach items="${topics}" var="topic" varStatus="status">
            <div class="col-md-6">
              <article class="vocab-topic-card">
                <div class="vocab-topic-card-top">
                  <span class="vocab-topic-index">${status.index + 1}</span>
                  <span class="vocab-level ${topic.level eq 'INTERMEDIATE' ? 'intermediate' : topic.level eq 'ADVANCED' ? 'advanced' : ''}">
                    <span data-i18n="${topic.level eq 'BASIC' ? 'levelBasic' : topic.level eq 'INTERMEDIATE' ? 'levelIntermediate' : 'levelAdvanced'}">${topic.level eq 'BASIC' ? 'Foundation' : topic.level eq 'INTERMEDIATE' ? 'Intermediate' : 'Advanced'}</span>
                  </span>
                </div>
                <h3><c:out value="${topic.title}"/></h3>
                <p><c:out value="${topic.description}"/></p>

                <div class="vocab-topic-progress">
                  <div class="vocab-topic-progress-label">
                    <span class="learning-state ${topic.completedLessons gt 0 ? 'practiced' : ''}">
                      <i></i><c:out value="${topic.completedLessons}"/> / <c:out value="${topic.totalLessons}"/> <span data-i18n="lessons">lessons</span>
                    </span>
                    <strong>★ <c:out value="${topic.totalStars}"/></strong>
                  </div>
                  <div class="vocab-progress-track" role="progressbar"
                       aria-label="Topic lesson completion"
                       aria-valuenow="${topic.progressPercent}" aria-valuemin="0" aria-valuemax="100">
                    <span style="width: ${topic.progressPercent}%"></span>
                  </div>
                  <span class="vocab-topic-caption"><c:out value="${topic.progressPercent}"/>% <span data-i18n="complete">complete</span> · <span data-i18n="${topic.placementPassed ? 'placementPassedShort' : 'placementAvailable'}">${topic.placementPassed ? 'Placement test passed' : 'Placement test available'}</span></span>
                </div>
                <span class="vocab-word-count mb-3"><c:out value="${topic.totalWords}"/> từ vựng · tối thiểu 30 từ</span>

                <a class="btn grammar-btn w-100" href="${pageContext.request.contextPath}/vocabulary/${topic.id}">
                  <span data-i18n="openRoadmap">Open roadmap →</span>
                </a>
              </article>
            </div>
          </c:forEach>
        </div>

        <c:if test="${empty topics}">
          <div class="vocab-empty">
            <h2 data-i18n="emptyTopics">No vocabulary topics yet</h2>
            <p data-i18n="emptyTopicsText">Learning paths will appear here when the content is published.</p>
          </div>
        </c:if>
      </div>

      <aside class="vocab-side-card" aria-labelledby="vocab-word-of-day">
        <span class="vocab-eyebrow" data-i18n="wordEyebrow">MỖI NGÀY MỘT TỪ</span>
        <h2 id="vocab-word-of-day" data-i18n="wordHeading">Word of the day</h2>
        <p class="vocab-side-intro" data-i18n="wordDescription">A quick review from the vocabulary bank.</p>
        <c:choose>
          <c:when test="${not empty flashcard}">
            <article class="vocab-random-word" data-word="<c:out value='${flashcard.word}'/>"
                     data-audio-url="<c:out value='${flashcard.audioUrl}'/>">
              <span class="vocab-card-label" data-i18n="randomWord">RANDOM WORD</span>
              <div class="vocab-random-word-title">
                <h3><c:out value="${flashcard.word}"/></h3>
                <button class="vocab-pronounce" type="button" aria-label="<c:out value='Hear ${flashcard.word}'/>" data-i18n="listen">Listen</button>
              </div>
              <span class="vocab-card-phonetic"><c:out value="${flashcard.ipa}"/></span>
              <p><c:out value="${flashcard.meaningVi}"/></p>
              <c:if test="${not empty flashcard.exampleEn}">
                <blockquote>
                  <c:out value="${flashcard.exampleEn}"/>
                  <c:if test="${not empty flashcard.exampleVi}">
                    <span><c:out value="${flashcard.exampleVi}"/></span>
                  </c:if>
                </blockquote>
              </c:if>
            </article>
            <a class="vocab-soft-btn w-100" href="${pageContext.request.contextPath}/vocabulary/${flashcard.topicId}" data-i18n="exploreTopic">Explore this topic →</a>
          </c:when>
          <c:otherwise>
            <div class="vocab-side-empty" data-i18n="wordEmpty">A word will appear when topics are published.</div>
          </c:otherwise>
        </c:choose>

        <div class="vocab-learning-steps">
          <h3 data-i18n="topicIncludes">Every topic includes</h3>
          <ol>
            <li><span>01</span> <span data-i18n="stepFlashcards">Flashcards with examples</span></li>
            <li><span>02</span> <span data-i18n="stepPractice">Exercises and dictation</span></li>
            <li><span>03</span> <span data-i18n="stepPlacement">Placement test and progress</span></li>
          </ol>
        </div>
      </aside>
    </section>
  </div>
</main>

<script src="${pageContext.request.contextPath}/assets/js/vocabulary.js"></script>
<%@ include file="../fragments/footer.jspf" %>
<%@ include file="../fragments/scripts.jspf" %>
