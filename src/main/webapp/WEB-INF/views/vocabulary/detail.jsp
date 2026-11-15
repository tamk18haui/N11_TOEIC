<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/header.jspf" %>

<main class="vocabulary-page">
  <section class="page-section">
    <div class="container container-n11 vocab-detail-wrap">
      <a class="vocab-back-link" href="${pageContext.request.contextPath}/vocabulary">← Tất cả chủ đề</a>
      <header class="vocab-detail-heading">
        <span class="vocab-level">${topic.level eq 'BASIC' ? 'Cơ bản' : topic.level eq 'INTERMEDIATE' ? 'Trung cấp' : 'Nâng cao'}</span>
        <h1><c:out value="${topic.title}"/></h1>
        <p><c:out value="${topic.description}"/></p>
        <div class="vocab-detail-actions">
          <a class="btn vocab-primary-btn" href="#vocabulary-flashcards">Luyện Flashcard</a>
          <a class="btn vocab-outline-btn" href="#vocabulary-quiz">Làm bài Quiz</a>
          <span class="vocab-word-count">${words.size()} từ vựng</span>
        </div>
      </header>

      <section id="vocabulary-flashcards" class="vocab-study-panel" hidden>
        <div class="vocab-study-heading">
          <div><span class="vocab-eyebrow">ÔN TẬP NHANH</span><h2>Flashcard chủ đề</h2></div>
          <button id="vocab-close-study" class="btn btn-sm btn-outline-secondary" type="button">Đóng</button>
        </div>
        <div id="vocab-study-card" class="vocab-study-card" role="button" tabindex="0" aria-label="Lật flashcard">
          <span class="vocab-study-counter"></span>
          <strong class="vocab-study-word"></strong>
          <span class="vocab-study-phonetic"></span>
          <span class="vocab-study-meaning"></span>
          <span class="vocab-study-example"></span>
          <span class="vocab-study-example-meaning"></span>
          <span class="vocab-study-hint">Chạm hoặc nhấn Space để lật</span>
        </div>
        <div class="vocab-study-controls">
          <button id="vocab-study-prev" class="btn vocab-outline-btn" type="button">← Trước</button>
          <button id="vocab-study-speak" class="btn vocab-outline-btn" type="button">🔊 Phát âm</button>
          <button id="vocab-study-next" class="btn vocab-primary-btn" type="button">Tiếp →</button>
        </div>
      </section>

      <section id="vocabulary-quiz" class="vocab-quiz-panel" hidden>
        <div class="vocab-study-heading">
          <div><span class="vocab-eyebrow">KIỂM TRA NHANH</span><h2>Chọn nghĩa đúng</h2></div>
          <button id="vocab-close-quiz" class="btn btn-sm btn-outline-secondary" type="button">Đóng</button>
        </div>
        <p class="vocab-quiz-intro">Bài luyện nhanh tạo từ các từ trong chủ đề này. Kết quả chỉ hiển thị trong phiên hiện tại.</p>
        <div id="vocab-quiz-questions"></div>
        <button id="vocab-quiz-check" class="btn vocab-primary-btn" type="button">Chấm điểm</button>
        <p id="vocab-quiz-result" class="vocab-flashcard-status" role="status" aria-live="polite"></p>
      </section>

      <section id="vocab-word-list" class="vocab-word-list">
        <div class="vocab-list-heading">
          <div><span class="vocab-eyebrow">TỪ VỰNG TOEIC</span><h2>Danh sách từ</h2></div>
          <span class="vocab-word-count">${words.size()} từ</span>
        </div>
        <c:forEach items="${words}" var="word" varStatus="status">
          <article class="vocab-word-card"
                   data-word="<c:out value='${word.word}'/>"
                   data-phonetic="<c:out value='${word.phonetic}'/>"
                   data-part-of-speech="<c:out value='${word.partOfSpeech}'/>"
                   data-meaning="<c:out value='${word.meaningVi}'/>"
                   data-example="<c:out value='${word.exampleSentence}'/>"
                   data-example-meaning="<c:out value='${word.exampleMeaning}'/>"
                   data-audio-url="<c:out value='${word.audioUrl}'/>">
            <div class="vocab-word-number">${status.index + 1}</div>
            <div class="vocab-word-content">
              <div class="vocab-word-title">
                <h3><c:out value="${word.word}"/></h3>
                <span class="vocab-word-phonetic"><c:out value="${word.phonetic}"/></span>
                <span class="vocab-pos"><c:out value="${word.partOfSpeech}"/></span>
                <button class="vocab-pronounce" type="button" aria-label="Phát âm từ vựng">🔊</button>
              </div>
              <p class="vocab-word-meaning"><c:out value="${word.meaningVi}"/></p>
              <c:if test="${not empty word.definitionEn}">
                <p class="vocab-definition"><c:out value="${word.definitionEn}"/></p>
              </c:if>
              <c:if test="${not empty word.exampleSentence}">
                <blockquote class="vocab-example"><c:out value="${word.exampleSentence}"/></blockquote>
              </c:if>
              <c:if test="${not empty word.exampleMeaning}">
                <p class="vocab-example-meaning"><c:out value="${word.exampleMeaning}"/></p>
              </c:if>
            </div>
          </article>
        </c:forEach>
        <c:if test="${empty words}">
          <div class="vocab-empty"><h2>Chủ đề chưa có từ vựng</h2><p>Vui lòng quay lại sau.</p></div>
        </c:if>
      </section>
    </div>
  </section>
</main>

<script src="${pageContext.request.contextPath}/assets/js/vocabulary.js"></script>
<%@ include file="../fragments/footer.jspf" %>
<%@ include file="../fragments/scripts.jspf" %>
