<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/header.jspf" %>

<main class="vocabulary-page">
  <section class="vocab-hero">
    <div class="container container-n11">
      <span class="vocab-eyebrow">HỌC TỪ VỰNG THEO CHỦ ĐỀ</span>
      <h1>Mở rộng vốn từ <span>TOEIC</span></h1>
      <p>Tra cứu từ vựng thiết thực, nghe phát âm và ôn tập theo từng chủ đề.</p>
    </div>
  </section>

  <section class="page-section">
    <div class="container container-n11">
      <div class="row g-4 align-items-start">
        <div class="col-lg-8">
          <div class="vocab-section-heading">
            <div>
              <span class="vocab-eyebrow">THƯ VIỆN TỪ VỰNG</span>
              <h2>Các chủ đề</h2>
            </div>
            <span class="vocab-count"><strong>${topics.size()}</strong> chủ đề</span>
          </div>

          <form class="vocab-search-form" method="get" action="${pageContext.request.contextPath}/vocabulary">
            <label for="vocab-search" class="visually-hidden">Tìm chủ đề hoặc từ tiếng Anh</label>
            <input id="vocab-search" class="form-control input-search" type="search" name="q"
                   maxlength="200" value="<c:out value='${q}'/>"
                   placeholder="Tìm tên chủ đề hoặc từ tiếng Anh...">
            <button class="btn vocab-primary-btn" type="submit">Tìm kiếm</button>
          </form>

          <c:if test="${not empty q}">
            <p class="vocab-search-caption">Kết quả tìm kiếm cho “<c:out value="${q}"/>”</p>
          </c:if>

          <div class="row g-3">
            <c:forEach items="${topics}" var="topic">
              <div class="col-md-6">
                <article class="vocab-topic-card">
                  <div class="d-flex justify-content-between align-items-start gap-2">
                    <span class="vocab-level">${topic.level eq 'BASIC' ? 'Cơ bản' : topic.level eq 'INTERMEDIATE' ? 'Trung cấp' : 'Nâng cao'}</span>
                    <span class="vocab-word-count">${topic.totalWords} từ</span>
                  </div>
                  <h3><c:out value="${topic.title}"/></h3>
                  <p><c:out value="${topic.description}"/></p>
                  <div class="vocab-progress-label">
                    <span>Đã thuộc</span>
                    <strong>${topic.masteredWords} / ${topic.totalWords} từ (${topic.progressPercent}%)</strong>
                  </div>
                  <div class="progress vocab-progress" role="progressbar" aria-label="Tiến độ học chủ đề"
                       aria-valuenow="${topic.progressPercent}" aria-valuemin="0" aria-valuemax="100">
                    <div class="progress-bar" style="width:${topic.progressPercent}%"></div>
                  </div>
                  <a class="btn vocab-soft-btn" href="${pageContext.request.contextPath}/vocabulary/${topic.id}">
                    Xem từ vựng <span aria-hidden="true">→</span>
                  </a>
                </article>
              </div>
            </c:forEach>
          </div>

          <c:if test="${empty topics}">
            <div class="vocab-empty">
              <h2>Chưa tìm thấy chủ đề phù hợp</h2>
              <p>Thử tìm bằng tên chủ đề hoặc một từ tiếng Anh khác.</p>
              <a class="btn vocab-soft-btn" href="${pageContext.request.contextPath}/vocabulary">Xem tất cả chủ đề</a>
            </div>
          </c:if>
        </div>

        <aside class="col-lg-4" aria-label="Flashcard ngẫu nhiên">
          <section class="vocab-side-card">
            <div class="d-flex align-items-center justify-content-between gap-2">
              <h2>Flashcard hôm nay</h2>
              <span class="vocab-side-tag">Ôn nhanh</span>
            </div>
            <p class="vocab-side-intro">Chạm vào thẻ để xem nghĩa và ví dụ.</p>
            <div id="vocabFlashcard" class="vocab-flashcard" role="button" tabindex="0"
                 aria-label="Lật flashcard"
                 data-id="${flashcard.id}"
                 data-word="<c:out value='${flashcard.word}'/>"
                 data-phonetic="<c:out value='${flashcard.phonetic}'/>"
                 data-part-of-speech="<c:out value='${flashcard.partOfSpeech}'/>"
                 data-meaning="<c:out value='${flashcard.meaningVi}'/>"
                 data-example="<c:out value='${flashcard.exampleSentence}'/>"
                 data-example-meaning="<c:out value='${flashcard.exampleMeaning}'/>">
              <div class="vocab-flashcard-inner">
                <div class="vocab-flashcard-face vocab-flashcard-front">
                  <span class="vocab-card-label">TỪ VỰNG</span>
                  <strong class="vocab-card-word"><c:out value="${flashcard.word}"/></strong>
                  <span class="vocab-card-phonetic"><c:out value="${flashcard.phonetic}"/></span>
                </div>
                <div class="vocab-flashcard-face vocab-flashcard-back">
                  <span class="vocab-card-pos"><c:out value="${flashcard.partOfSpeech}"/></span>
                  <strong class="vocab-card-meaning"><c:out value="${flashcard.meaningVi}"/></strong>
                  <span class="vocab-card-example"><c:out value="${flashcard.exampleSentence}"/></span>
                  <span class="vocab-card-example-meaning"><c:out value="${flashcard.exampleMeaning}"/></span>
                </div>
              </div>
            </div>
            <div class="vocab-flashcard-actions">
              <button id="vocab-speak" class="btn btn-outline-primary" type="button" aria-label="Phát âm từ hiện tại">🔊</button>
              <c:choose>
                <c:when test="${not empty pageContext.request.userPrincipal}">
                  <button id="vocab-bookmark" class="btn vocab-soft-btn" type="button"
                          data-url="${pageContext.request.contextPath}/vocabulary/flashcard/${flashcard.id}/bookmark"
                          data-csrf-token="<c:out value='${_csrf.token}'/>"
                          data-csrf-header="<c:out value='${_csrf.headerName}'/>">
                    Lưu từ này
                  </button>
                </c:when>
                <c:otherwise>
                  <a class="btn vocab-soft-btn" href="${pageContext.request.contextPath}/login">Đăng nhập để lưu</a>
                </c:otherwise>
              </c:choose>
              <button id="vocab-next" class="btn vocab-primary-btn" type="button"
                      data-url="${pageContext.request.contextPath}/vocabulary/flashcard/next">Từ kế tiếp</button>
            </div>
            <p id="vocab-flashcard-status" class="vocab-flashcard-status" role="status" aria-live="polite"></p>
          </section>
        </aside>
      </div>
    </div>
  </section>
</main>

<script src="${pageContext.request.contextPath}/assets/js/vocabulary.js"></script>
<%@ include file="../fragments/footer.jspf" %>
<%@ include file="../fragments/scripts.jspf" %>
