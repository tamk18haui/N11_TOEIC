<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<div id="reading-app" class="part6-app" data-base="${pageContext.request.contextPath}" data-attempt="${attemptId}" data-csrf="${_csrf.token}" data-csrf-header="${_csrf.headerName}">
  <header class="reading-toolbar">
    <div class="reading-toolbar-brand"><a class="reading-back" href="${pageContext.request.contextPath}/reading/part6" aria-label="Trở lại danh sách">←</a><img src="${pageContext.request.contextPath}/assets/img/logo.svg" width="40" height="40" alt="N11 TOEIC"/></div>
    <div class="reading-tools" aria-label="Công cụ học"><button type="button" data-action="bilingual" aria-pressed="false">Aあ Song ngữ</button></div>
    <div class="reading-toolbar-actions"><a href="${pageContext.request.contextPath}/reading/part6">Thoát</a><button type="button" data-action="finish">✓ Kết thúc</button></div>
  </header>
  <main class="reading-workspace">
    <div class="reading-session-heading"><span><c:out value="${attemptTitle}"/></span><span id="session-progress"></span></div>
    <div id="reading-error" class="reading-error" role="alert" hidden></div>
    <section id="reading-result" class="reading-result" hidden></section>
    <div id="reading-loading" role="status">Đang tải bài luyện…</div>
    <div class="part6-columns"><article id="part6-passage" class="part6-passage" aria-label="Bài đọc"></article><section id="reading-question" aria-label="Câu hỏi" hidden></section></div>
    <noscript><p>Vui lòng bật JavaScript để làm bài luyện Part 6.</p></noscript>
  </main>
  <nav class="reading-question-nav" aria-label="Điều hướng câu hỏi"><button type="button" data-action="previous" aria-label="Bài đọc trước">‹</button><button type="button" class="reading-position" data-action="grid" aria-label="Mở danh sách bài đọc">▦ <span id="question-position">…</span></button><button type="button" data-action="next" aria-label="Bài đọc tiếp theo">›</button></nav>
  <dialog id="reading-dialog"><div class="reading-dialog-header"><h2 id="dialog-title"></h2><button type="button" data-action="close" aria-label="Đóng">×</button></div><div id="dialog-content"></div></dialog>
  <div id="reading-status" class="reading-status" role="status" aria-live="polite"></div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/reading-part6.js" defer></script>
<%@ include file="../fragments/scripts.jspf" %>
