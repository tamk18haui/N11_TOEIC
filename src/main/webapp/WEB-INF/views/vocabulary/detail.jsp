<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vocabulary-v44.css?v=44" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vocabulary-v46.css?v=46" />
<%@ include file="../fragments/header.jspf" %>

<main class="vocabulary-page">
  <div class="container container-n11 vocab-wrap vocab-detail-wrap">
    <%@ include file="../fragments/vocabulary-settings.jspf" %>
    <a class="vocab-back-link" href="${pageContext.request.contextPath}/vocabulary" data-i18n="backRoadmap">← Quay lại lộ trình</a>

    <header class="vocab-detail-heading">
      <span class="vocab-eyebrow">TOEIC VOCABULARY TOPIC ${topic.sortOrder}</span>
      <div class="vocab-detail-title-row">
        <div>
          <h1><c:out value="${topic.title}"/></h1>
          <p><c:out value="${topic.description}"/></p>
        </div>
        <span class="vocab-level ${topic.level eq 'INTERMEDIATE' ? 'intermediate' : topic.level eq 'ADVANCED' ? 'advanced' : ''}">
          <span data-i18n="${topic.level eq 'BASIC' ? 'levelBasic' : topic.level eq 'INTERMEDIATE' ? 'levelIntermediate' : 'levelAdvanced'}">${topic.level eq 'BASIC' ? 'Foundation' : topic.level eq 'INTERMEDIATE' ? 'Intermediate' : 'Advanced'}</span>
        </span>
      </div>
      <div class="vocab-topic-summary">
        <div>
          <strong>${completedLessons} / ${lessonCount}</strong>
          <span data-i18n="lessonsCompleted">bài học hoàn thành</span>
        </div>
        <div>
          <strong>★ ${totalStars}</strong>
          <span data-i18n="starsEarned">số sao đạt được</span>
        </div>
        <div>
          <strong><c:out value="${words.size()}"/></strong>
          <span data-i18n="wordsAvailable">từ hiện có</span>
        </div>
      </div>
      <div class="vocab-progress-track" role="progressbar"
           aria-label="Tiến độ chủ đề"
           aria-valuenow="${lessonCount eq 0 ? 0 : completedLessons * 100 / lessonCount}"
           aria-valuemin="0" aria-valuemax="100">
        <span style="width:${lessonCount eq 0 ? 0 : completedLessons * 100 / lessonCount}%"></span>
      </div>
      <div class="vocab-detail-actions">
        <c:choose>
          <c:when test="${not empty pageContext.request.userPrincipal}">
            <c:choose>
              <c:when test="${placementPassed}">
                <span class="vocab-status-pill completed" data-i18n="placementPassed">✓ Đã đạt bài kiểm tra tổng hợp</span>
              </c:when>
              <c:otherwise>
                <a class="btn grammar-btn" href="${pageContext.request.contextPath}/vocabulary/${topic.id}/placement" data-i18n="takePlacement">
                  Làm bài kiểm tra tổng hợp (30 câu)
                </a>
              </c:otherwise>
            </c:choose>
          </c:when>
          <c:otherwise>
            <a class="btn grammar-btn" href="${pageContext.request.contextPath}/vocabulary/${topic.id}/placement" data-i18n="signInPlacement">
              Đăng nhập để làm bài kiểm tra tổng hợp
            </a>
          </c:otherwise>
        </c:choose>
        <span class="vocab-topic-caption" data-i18n="placementHint">Bài kiểm tra tự đánh giá (đạt từ 25/30). Mọi bài học đều học tự do.</span>
      </div>
    </header>

    <%-- N11_V46_FREE_STUDY --%>
    <section class="vocab-roadmap" aria-labelledby="lesson-roadmap-title">
      <div class="v46-free-note">Bạn có thể học bất kỳ bài nào sau khi đăng nhập, không cần hoàn thành bài trước.</div>
      <div class="vocab-list-heading">
        <div>
          <span class="vocab-eyebrow" data-i18n="learningPath">YOUR LEARNING PATH</span>
          <h2 id="lesson-roadmap-title" data-i18n="lessonsInTopic">Bài học trong chủ đề</h2>
        </div>
        <span class="vocab-word-count">${lessonCount} <span data-i18n="lessons">lessons</span></span>
      </div>

      <c:forEach items="${lessons}" var="entry" varStatus="status">
        <article class="vocab-lesson-row">
          <div class="vocab-lesson-number">${status.index + 1}</div>
          <div class="vocab-lesson-copy">
            <div class="vocab-lesson-title">
              <h3><c:out value="${entry.lesson.title}"/></h3>
              <span class="vocab-status-pill ${entry.state eq 'COMPLETED' ? 'completed' : entry.state eq 'IN_PROGRESS' ? 'learning' : 'open'}">
                <c:choose>
                  <c:when test="${entry.state eq 'IN_PROGRESS'}"><span data-i18n="inProgress">Đang học</span></c:when>
                  <c:when test="${entry.state eq 'COMPLETED'}"><span data-i18n="completed">Hoàn thành</span></c:when>
                  <c:otherwise><span data-i18n="open">Mở</span></c:otherwise>
                </c:choose>
              </span>
            </div>
            <p><c:out value="${entry.lesson.description}"/></p>
            <div class="vocab-lesson-meta">
              <span><c:out value="${entry.wordCount}"/> <span data-i18n="words">từ</span></span>
              <span><span data-i18n="target">Mục tiêu</span>: ${entry.lesson.targetWordCount}</span>
              <span><c:out value="${entry.bestScore}"/>%</span>
              <span class="vocab-stars" aria-label="Số sao đạt được">
                <c:forEach begin="1" end="3" var="star">
                  <span class="${star le entry.stars ? 'earned' : ''}">★</span>
                </c:forEach>
              </span>
            </div>
          </div>
          <a class="vocab-primary-btn" href="${pageContext.request.contextPath}/vocabulary/${topic.id}/lessons/${entry.lesson.id}" data-i18n="openLesson">
                Vào học →
              </a>
        </article>
      </c:forEach>

      <c:if test="${empty lessons}">
        <div class="vocab-empty">
          <h2 data-i18n="lessonsPreparing">Bài học đang được chuẩn bị</h2>
          <p data-i18n="lessonsPreparingText">Các bài học của chủ đề này sẽ xuất hiện khi nội dung được xuất bản.</p>
        </div>
      </c:if>
    </section>
  </div>
</main>

<script src="${pageContext.request.contextPath}/assets/js/vocabulary.js?v=46"></script>
<%@ include file="../fragments/footer.jspf" %>
<%@ include file="../fragments/scripts.jspf" %>
