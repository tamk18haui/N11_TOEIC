<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/listening.css?v=20261125-v1" />
<%@ include file="../fragments/header.jspf" %>
<main class="n11-listening l-home" id="listeningHome" data-base="${pageContext.request.contextPath}">
  <div class="l-container">
    <nav class="l-breadcrumb" aria-label="Đường dẫn">
      <a href="${pageContext.request.contextPath}/">Trang chủ</a><span aria-hidden="true">›</span>
      <span>Luyện nghe TOEIC</span><span aria-hidden="true">›</span><b id="lPartCrumb">Part 1: Hình ảnh</b>
    </nav>
    <div class="l-home-grid">
      <aside class="l-sidebar" aria-label="Chọn Part Listening">
        <div class="l-side-heading">
          <span class="l-side-logo" aria-hidden="true"><svg class="icon icon-lg"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#headphones"></use></svg></span>
          <div><strong>Kỹ năng Nghe</strong><small>Listening · Parts 1–4</small></div>
        </div>
        <nav class="l-part-menu" aria-label="Các Part TOEIC Listening">
          <button type="button" data-part="1" class="active"><span class="l-menu-icon">01</span><span>Part 1: Hình ảnh</span></button>
          <button type="button" data-part="2"><span class="l-menu-icon">02</span><span>Part 2: Hỏi – Đáp</span></button>
          <button type="button" data-part="3"><span class="l-menu-icon">03</span><span>Part 3: Hội thoại ngắn</span></button>
          <button type="button" data-part="4"><span class="l-menu-icon">04</span><span>Part 4: Độc thoại</span></button>
        </nav>
        <div class="l-side-tip"><span aria-hidden="true">✦</span><p>Chọn Part, luyện theo 5 cấp độ và theo dõi tiến bộ của bạn.</p></div>
      </aside>
      <section class="l-home-main" aria-label="Các cấp độ Listening">
        <section class="l-banner">
          <div class="l-banner-copy">
            <span class="l-eyebrow">✦ &nbsp; LUYỆN TẬP THEO NĂNG LỰC</span>
            <h1 id="lHeading">Luyện Part 1 theo 5 cấp độ</h1>
            <p id="lSubhead">Rèn luyện kỹ năng nghe với các bộ câu hỏi được chia theo độ khó từ cơ bản đến nâng cao.</p>
            <small>TOEIC Listening · 4 Part · Theo dõi tiến độ cá nhân</small>
          </div>
          <span class="l-banner-icon" aria-hidden="true"><svg class="icon"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#headphones"></use></svg></span>
        </section>
        <div class="l-section-heading"><h2>Chọn cấp độ của bạn</h2><span>Chọn cấp độ để luyện và xem giải thích ngay</span></div>
        <div class="l-info" id="lMessage" role="status" aria-live="polite">Đang tải danh sách bộ đề...</div>
        <div class="l-levels" aria-label="5 cấp độ Listening">
          <c:forEach begin="1" end="5" var="level">
            <article class="l-level l-level-${level}">
              <div class="l-card-header"><span class="l-num">${level}</span><strong class="l-level-name">Cấp ${level}</strong></div>
              <span class="l-tag">Đang tải</span>
              <p class="l-level-description">Đang tải học liệu...</p>
              <div class="l-level-metrics"><span class="l-sets">0 bộ đề</span><span class="l-separator">│</span><span class="l-count">0 câu</span></div>
              <div class="l-card-progress"><div class="l-progress-title"><span>Chưa bắt đầu</span><b>0%</b></div><div class="l-track"><span></span></div></div>
              <button class="l-start" type="button" disabled>Chưa có câu hỏi</button>
              <div class="l-select-sets" hidden></div>
            </article>
          </c:forEach>
        </div>
        <section class="l-history" aria-label="Lịch sử làm bài"><h2>Lịch sử luyện tập</h2><div id="lHistory">Đang tải lịch sử...</div></section>
      </section>
    </div>
  </div>
</main>
<script defer src="${pageContext.request.contextPath}/assets/js/listening.js?v=20261125-v4"></script>
<%@ include file="../fragments/footer.jspf" %>
<%@ include file="../fragments/scripts.jspf" %>
