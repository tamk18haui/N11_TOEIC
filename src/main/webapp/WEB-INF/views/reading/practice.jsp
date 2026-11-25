<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<div id="reading-app" data-base="${pageContext.request.contextPath}" data-attempt="${attemptId}" data-csrf="${_csrf.token}" data-csrf-header="${_csrf.headerName}">
  <header class="reading-toolbar">
    <div class="reading-toolbar-brand"><a class="reading-back" href="${pageContext.request.contextPath}/reading" aria-label="Trở lại danh sách">←</a><img src="${pageContext.request.contextPath}/assets/img/logo.svg" width="40" height="40" alt="N11 TOEIC"/></div>
    <div class="reading-tools" aria-label="Công cụ học"><button type="button" data-action="bilingual" aria-pressed="true">Aあ Song ngữ</button><button type="button" data-action="highlight" aria-pressed="false">✎ Bút nhớ</button><button type="button" data-action="notes">▧ Ghi chú</button><button type="button" data-action="settings" aria-label="Cài đặt">⚙</button></div>
    <div class="reading-toolbar-actions"><a href="${pageContext.request.contextPath}/reading">Thoát</a><button type="button" data-action="finish">✓ Kết thúc</button></div>
  </header>
  <main class="reading-workspace">
    <div class="reading-session-heading"><span><c:out value="${attemptTitle}"/></span><span id="session-progress"></span></div>
    <div id="reading-error" class="reading-error" role="alert" hidden></div>
    <section id="reading-result" class="reading-result" hidden></section>
    <div id="reading-loading" role="status">Đang tải bài luyện…</div>
    <section id="reading-question" aria-label="Câu hỏi" hidden></section>
    <section id="reading-vocabulary" class="reading-vocabulary" aria-label="Từ vựng nên học" hidden></section>
    <noscript><p>Vui lòng bật JavaScript để làm bài luyện Part 5.</p></noscript>
  </main>
  <nav class="reading-question-nav" aria-label="Điều hướng câu hỏi"><button type="button" data-action="previous" aria-label="Câu trước">‹</button><button type="button" class="reading-position" data-action="grid" aria-label="Mở danh sách câu hỏi">▦ <span id="question-position">…</span></button><button type="button" data-action="next" aria-label="Câu tiếp theo">›</button></nav>
  <dialog id="reading-dialog"><div class="reading-dialog-header"><h2 id="dialog-title"></h2><button type="button" data-action="close" aria-label="Đóng">×</button></div><div id="dialog-content"></div></dialog>
  <div id="reading-status" class="reading-status" role="status" aria-live="polite"></div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/reading-practice.js" defer></script>
<%@ include file="../fragments/scripts.jspf" %>
