<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ include file="../../fragments/head.jspf" %>
<main class="admin-shell listening-admin-page"><div class="container container-n11 listening-container"><div class="row g-4 listening-layout">
 <div class="col-lg-3 listening-sidebar-col"><%@ include file="../../fragments/admin-sidebar.jspf" %></div>
 <div class="col-lg-9 listening-content-col">
  <!-- N11 FORUM V9: HERO -->
  <a class="ff-back" href="${pageContext.request.contextPath}/admin/listening">← Danh sách Listening</a>
  <%-- Ten hien thi gon hon; KHONG thay doi ten goc trong MySQL. --%>
  <header class="ff-hero ff-hero-detail">
   <div class="ff-hero-main">
    <span class="ff-kicker">LISTENING · PART ${set.part_no}</span>
    <h1>
     <c:choose>
      <c:when test="${fn:contains(set.title, 'UNKNOWN - batch')}">Listening Part ${set.part_no} · Bộ #${set.id}</c:when>
      <c:otherwise><c:out value="${set.title}"/></c:otherwise>
     </c:choose>
    </h1>
    <p>Quản lý câu hỏi, đáp án, âm thanh và hình ảnh của bộ luyện nghe.</p>
    <div class="ff-hero-status">
     <span class="badge-status ${set.is_published ? 'good' : 'warn'}">${set.is_published ? 'Đã công bố' : 'Bản nháp'}</span>
     <span class="small-meta">${set.question_count} câu hỏi · ${set.attempt_count} lượt làm</span>
    </div>
    <c:if test="${fn:contains(set.title, 'UNKNOWN - batch')}">
     <div class="ff-hero-note" title="${fn:escapeXml(set.title)}">Dữ liệu nguồn: <c:out value="${set.title}"/></div>
    </c:if>
   </div>
   <div class="ff-hero-stats" aria-label="Thống kê bộ luyện nghe">
    <div class="ff-stat"><strong>${set.question_count}</strong><span>Câu hỏi</span></div>
    <div class="ff-stat"><strong>0${set.part_no}</strong><span>Part</span></div>
   </div>
  </header>
  <%-- Giữ nguyên method/action, CSRF và chức năng công bố. --%>
  <div class="ff-action-bar">
   <a class="btn btn-primary" href="#listening-questions">Xem câu hỏi / đáp án</a>
   <a class="btn btn-soft" href="${pageContext.request.contextPath}/admin/listening/media">Kho audio / ảnh</a>
   <a class="btn btn-soft" href="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/edit">Sửa thông tin bộ</a>
   <form method="post" action="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/publish">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="hidden" name="published" value="${not set.is_published}"/>
    <button type="submit" class="btn btn-primary">${set.is_published ? 'Chuyển về nháp' : 'Công bố bộ nghe'}</button>
   </form>
  </div>
  <c:if test="${not empty successMessage}"><div class="alert alert-success"><c:out value="${successMessage}"/></div></c:if>
  <c:if test="${not empty errorMessage}"><div class="alert alert-danger"><c:out value="${errorMessage}"/></div></c:if>
  <c:if test="${set.attempt_count gt 0}"><div class="alert alert-info">Bộ đã có lượt làm, hệ thống khóa chỉnh sửa nội dung để bảo toàn kết quả học viên.</div></c:if>
  <c:if test="${set.is_published}"><div class="alert alert-info">Muốn sửa nội dung, hãy chuyển về bản nháp trước.</div></c:if>
  <!-- N11 LISTENING V8: compact question thumbnails -->
  <section id="listening-questions" class="panel-card listening-questions-panel mb-4">
   <div class="listening-section-head">
    <div><div class="listening-eyebrow">NGÂN HÀNG CÂU HỎI</div><h2 class="account-section-title mb-0">Câu hỏi và đáp án</h2>
     <p class="small-meta mb-0">Ảnh minh họa lấy từ câu hỏi hoặc đoạn nghe liên kết; bấm ảnh để xem lớn.</p></div>
    <a class="btn btn-primary listening-action-main" href="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/questions/new">+ Thêm câu hỏi</a>
   </div>
   <div class="listening-table-scroll" role="region" aria-label="Danh sách câu hỏi Listening" tabindex="0">
    <table class="table listening-q-table align-middle">
     <thead><tr><th class="listening-col-no">STT</th><th class="listening-col-picture">Ảnh</th><th class="listening-col-question">Câu hỏi</th><th class="listening-col-choices">Các lựa chọn / Đáp án đúng</th><th class="listening-col-audio">Audio</th><th class="listening-col-actions">Thao tác</th></tr></thead>
     <tbody>
      <c:forEach items="${questions}" var="q">
       <tr>
        <td><span class="listening-q-number"><c:out value="${q.sort_order}"/></span></td>
        <td class="listening-q-picture">
         <c:choose>
          <c:when test="${not empty q.image_url}">
           <c:url value="${q.image_url}" var="listeningQuestionImageUrl"/>
           <a href="${listeningQuestionImageUrl}" target="_blank" rel="noopener noreferrer" title="Xem ảnh câu ${q.sort_order}">
            <img src="${listeningQuestionImageUrl}" class="listening-question-thumb" loading="lazy" alt="Ảnh minh họa câu ${q.sort_order}"/>
           </a>
          </c:when>
          <c:when test="${set.part_no eq 1}"><span class="listening-image-missing">Thiếu ảnh</span></c:when>
          <c:otherwise><span class="listening-image-na">—</span></c:otherwise>
         </c:choose>
        </td>
        <td class="listening-q-prompt"><div class="listening-question-text"><c:out value="${q.question_text}"/></div>
         <c:if test="${not empty q.passage_id}"><div class="listening-passage-ref">Đoạn nghe #<c:out value="${q.passage_id}"/></div></c:if>
        </td>
        <td class="listening-options-cell">
         <c:if test="${empty q.correct_label}"><div class="listening-option-error">Chưa có đáp án đúng</div></c:if>
         <div class="listening-choices">
          <c:if test="${not empty q.option_a}"><div class="listening-option-row ${q.correct_label eq 'A' ? 'is-correct' : ''}"><b>A</b><span><c:out value="${q.option_a}"/></span><c:if test="${q.correct_label eq 'A'}"><strong>Đúng</strong></c:if></div></c:if>
          <c:if test="${not empty q.option_b}"><div class="listening-option-row ${q.correct_label eq 'B' ? 'is-correct' : ''}"><b>B</b><span><c:out value="${q.option_b}"/></span><c:if test="${q.correct_label eq 'B'}"><strong>Đúng</strong></c:if></div></c:if>
          <c:if test="${not empty q.option_c}"><div class="listening-option-row ${q.correct_label eq 'C' ? 'is-correct' : ''}"><b>C</b><span><c:out value="${q.option_c}"/></span><c:if test="${q.correct_label eq 'C'}"><strong>Đúng</strong></c:if></div></c:if>
          <c:if test="${not empty q.option_d}"><div class="listening-option-row ${q.correct_label eq 'D' ? 'is-correct' : ''}"><b>D</b><span><c:out value="${q.option_d}"/></span><c:if test="${q.correct_label eq 'D'}"><strong>Đúng</strong></c:if></div></c:if>
         </div>
        </td>
        <td class="listening-q-player">
         <c:choose><c:when test="${not empty q.audio_url}">
          <c:url value="${q.audio_url}" var="listeningQuestionAudioUrl"/>
          <audio controls preload="metadata" class="listening-question-audio" src="${listeningQuestionAudioUrl}" aria-label="Audio câu ${q.sort_order}"></audio>
          <a class="listening-media-link" target="_blank" rel="noopener noreferrer" href="${listeningQuestionAudioUrl}">Mở MP3</a>
         </c:when><c:otherwise><span class="listening-image-missing">Thiếu audio</span></c:otherwise></c:choose>
        </td>
        <td class="listening-q-actions"><div class="listening-row-actions">
         <a class="btn btn-soft btn-sm" href="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/questions/${q.id}/edit">Sửa</a>
         <form method="post" action="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/questions/${q.id}/delete" onsubmit="return confirm('Xóa câu hỏi và các đáp án?');">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><button type="submit" class="btn btn-outline-danger btn-sm">Xóa</button>
         </form></div></td>
       </tr>
      </c:forEach>
      <c:if test="${empty questions}"><tr><td colspan="6" class="text-center small-meta py-4">Chưa có câu hỏi.</td></tr></c:if>
     </tbody>
    </table>
   </div>
   <p class="listening-help-text">Điều kiện công bố: Part 2 có 3 đáp án; Part 1, 3, 4 có 4 đáp án; mỗi câu có 1 đáp án đúng và audio. Part 1 bắt buộc có ảnh.</p>
  </section>

  <section id="listening-passages" class="panel-card mb-4"><div class="d-flex justify-content-between align-items-center flex-wrap gap-2 mb-3">
   <h2 class="account-section-title mb-0">Đoạn nghe / Transcript / Hình ảnh</h2></div>
   <p class="small-meta">Part 3–4: một đoạn nghe thường dùng chung cho ba câu hỏi. Part 1 có thể gắn ảnh, Part 2 có thể gắn audio trực tiếp vào câu hỏi.</p>
   <div class="table-responsive"><table class="table align-middle"><thead><tr><th>ID</th><th>Transcript</th><th>Audio</th><th>Ảnh</th><th>Thứ tự</th><th>Thao tác</th></tr></thead><tbody>
    <c:forEach items="${passages}" var="p">
     <c:if test="${not empty p.audio_url}"><c:url value="${p.audio_url}" var="listeningPreviewAudioUrl"/></c:if>
     <c:if test="${not empty p.image_url}"><c:url value="${p.image_url}" var="listeningPreviewImageUrl"/></c:if>
     <tr>
     <td>${p.id}</td><td class="listening-short"><c:out value="${p.passage_text}"/></td>
     <td><c:choose><c:when test="${not empty p.audio_url}"><audio controls preload="metadata" src="${listeningPreviewAudioUrl}" class="listening-audio"></audio><a class="listening-media-link" href="${listeningPreviewAudioUrl}" target="_blank" rel="noopener noreferrer">Mở MP3</a></c:when><c:otherwise>—</c:otherwise></c:choose></td>
     <td><c:choose><c:when test="${not empty p.image_url}"><a href="${listeningPreviewImageUrl}" target="_blank" rel="noopener noreferrer" title="Mở ảnh gốc"><img alt="Ảnh minh họa đoạn nghe" class="listening-thumb" src="${listeningPreviewImageUrl}" style="width:120px;max-width:120px;height:90px;max-height:90px;object-fit:cover;border-radius:8px;"/></a></c:when><c:otherwise>—</c:otherwise></c:choose></td>
     <td>${p.sort_order}</td><td><div class="d-flex gap-2 flex-wrap">
      <a class="btn btn-soft btn-sm" href="${pageContext.request.contextPath}/admin/listening/sets/${set.id}?editPassage=${p.id}#passage-form">Sửa</a>
      <form method="post" action="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/passages/${p.id}/delete" onsubmit="return confirm('Xóa đoạn nghe này?');">
       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><button class="btn btn-outline-danger btn-sm" type="submit">Xóa</button></form></div></td>
    </tr></c:forEach><c:if test="${empty passages}"><tr><td colspan="6" class="text-center small-meta">Chưa có đoạn nghe.</td></tr></c:if></tbody></table></div>
   <div id="passage-form" class="listening-subpanel"><h3 class="h6">${empty passageForm.id ? 'Thêm đoạn nghe' : 'Sửa đoạn nghe'}</h3>
    <form method="post" action="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/passages/save">
     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
     <c:if test="${not empty passageForm.id}"><input type="hidden" name="id" value="${passageForm.id}"/></c:if>
     <div class="row g-3"><div class="col-12"><label class="form-label" for="transcript">Transcript / Nội dung đoạn nghe</label>
       <textarea id="transcript" name="transcript" rows="3" class="form-control"><c:out value="${passageForm.passage_text}"/></textarea></div>
      <div class="col-md-5"><label class="form-label" for="passage-audio">Audio</label><select class="form-select" name="audioId" id="passage-audio">
       <option value="">Không chọn</option><c:forEach items="${media}" var="m"><c:if test="${m.media_type eq 'AUDIO'}"><option value="${m.id}" ${passageForm.audio_media_id eq m.id ? 'selected' : ''}>Audio #${m.id}</option></c:if></c:forEach></select></div>
      <div class="col-md-5"><label class="form-label" for="passage-image">Hình ảnh</label><select class="form-select" name="imageId" id="passage-image">
       <option value="">Không chọn</option><c:forEach items="${media}" var="m"><c:if test="${m.media_type eq 'IMAGE'}"><option value="${m.id}" ${passageForm.image_media_id eq m.id ? 'selected' : ''}>Ảnh #${m.id}</option></c:if></c:forEach></select></div>
      <div class="col-md-2"><label class="form-label" for="passage-sort">Thứ tự</label><input type="number" min="0" id="passage-sort" name="sortOrder" class="form-control" value="${empty passageForm.sort_order ? 0 : passageForm.sort_order}"/></div>
     </div><div class="d-flex gap-2 mt-3"><button type="submit" class="btn btn-primary">Lưu đoạn nghe</button>
       <c:if test="${not empty passageForm.id}"><a class="btn btn-soft" href="${pageContext.request.contextPath}/admin/listening/sets/${set.id}#passage-form">Hủy sửa</a></c:if></div>
    </form></div>
  </section>
  <c:if test="${empty questions and empty passages and not set.is_published}"><form method="post" action="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/delete" onsubmit="return confirm('Xóa bộ Listening trống?');">
   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><button type="submit" class="btn btn-outline-danger">Xóa bộ trống</button></form></c:if>
 </div></div></div></main>
<%@ include file="../../fragments/scripts.jspf" %>
