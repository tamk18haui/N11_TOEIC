<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/header.jspf" %>
<main class="reading-home container container-n11">
  <nav class="reading-breadcrumb" aria-label="Đường dẫn"><a href="${pageContext.request.contextPath}/">Trang chủ</a><span>›</span><a href="${pageContext.request.contextPath}/reading">Luyện đọc TOEIC</a><span>›</span><strong>Part 7: Đọc hiểu</strong></nav>
  <div class="reading-layout">
    <aside class="reading-sidebar">
      <div class="reading-sidebar-title"><span class="reading-book"><svg class="icon icon-lg"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#book-open"/></svg></span><div><strong>Kỹ năng Đọc</strong><small>Reading · Parts 5 → 7</small></div></div>
      <a class="reading-part" href="${pageContext.request.contextPath}/reading"><span>5</span>Part 5: Hoàn thành câu</a>
      <a class="reading-part" href="${pageContext.request.contextPath}/reading/part6"><span>6</span>Part 6: Hoàn thành đoạn văn</a>
      <a class="reading-part active part7-active" href="${pageContext.request.contextPath}/reading/part7"><span>7</span>Part 7: Đọc hiểu</a>
      <p class="reading-sidebar-tip">Mỗi câu là một bước tiến.<br>Luyện đều đặn, hiểu thật kỹ.</p>
    </aside>
    <div class="reading-content">
      <section class="reading-hero"><div><span class="reading-eyebrow">LUYỆN TẬP THEO NĂNG LỰC</span><h1>Luyện Part 7 theo 5 cấp độ</h1><p>Luyện đọc đơn, đôi và ba văn bản; tìm thông tin, suy luận và đối chiếu nội dung. Chọn đủ các câu trong mỗi bài đọc để xem đúng/sai. Bật Song ngữ khi cần hỗ trợ.</p><small>Học liệu N11 biên soạn · Tiến độ được lưu theo tài khoản</small></div><span class="reading-hero-icon" aria-hidden="true"><svg><use href="${pageContext.request.contextPath}/assets/img/icons.svg#book-open"/></svg></span></section>
      <div class="reading-section-title"><h2>Chọn cấp độ của bạn</h2><span>Học từ dễ đến khó</span></div>
      <div class="reading-levels">
        <c:forEach var="item" items="${levels}">
          <section class="reading-level level-${item.level}">
            <div class="reading-level-heading"><span class="reading-level-number">${item.level}</span><h3>Cấp ${item.level} — <c:out value="${item.label}"/></h3></div>
            <span class="reading-difficulty">▥ <c:out value="${item.label}"/></span>
            <p>Part 7: Đọc hiểu · luyện theo độ khó ${item.level}/5</p>
            <div class="reading-question-count">${item.passages} bài đọc · ${item.total} câu</div>
            <div class="reading-progress-label"><span>Đã luyện ${item.practiced}/${item.total} câu</span><strong>${item.percent}%</strong></div>
            <progress max="100" value="${item.percent}" aria-label="Tiến độ cấp ${item.level}"></progress>
            <c:choose><c:when test="${item.total gt 0}"><a class="reading-start" href="${pageContext.request.contextPath}/reading/part7/${item.level}">Bắt đầu luyện <span aria-hidden="true">→</span></a></c:when><c:otherwise><button class="reading-start" disabled>Chưa có học liệu</button></c:otherwise></c:choose>
          </section>
        </c:forEach>
      </div>
      <c:if test="${empty pageContext.request.userPrincipal}"><p class="reading-signin-note"><a href="${pageContext.request.contextPath}/login">Đăng nhập</a> để làm bài, lưu tiến độ và xem lại kết quả của bạn.</p></c:if>
      <c:if test="${not empty history}"><section class="reading-history"><h2>Lượt luyện gần đây</h2><div class="table-responsive"><table class="table"><thead><tr><th>Bộ luyện</th><th>Đúng / Tổng</th><th>Kết quả</th><th></th></tr></thead><tbody><c:forEach var="attempt" items="${history}"><tr><td><c:out value="${attempt.title}"/><small><c:out value="${attempt.submitted_at}"/></small></td><td>${attempt.correct_count}/${attempt.total_questions}</td><td>${attempt.score_percent}%</td><td><a href="${pageContext.request.contextPath}/reading/part7/attempts/${attempt.id}">Xem lại →</a></td></tr></c:forEach></tbody></table></div></section></c:if>
    </div>
  </div>
</main>
<%@ include file="../fragments/footer.jspf" %>
<%@ include file="../fragments/scripts.jspf" %>
