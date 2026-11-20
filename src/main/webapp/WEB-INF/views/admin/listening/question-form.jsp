<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../../fragments/head.jspf" %>
<main class="admin-shell listening-admin-page"><div class="container container-n11 listening-container"><div class="row g-4 listening-layout">
 <div class="col-lg-3 listening-sidebar-col"><%@ include file="../../fragments/admin-sidebar.jspf" %></div>
 <div class="col-lg-9 listening-content-col">
  <a class="account-back" href="${pageContext.request.contextPath}/admin/listening/sets/${set.id}">← Quay về bộ Listening</a>
  <div class="section-caption mt-3">PART ${set.part_no} · <c:out value="${set.title}"/></div>
  <h1 class="account-title mb-4">${empty question.id ? 'Thêm câu hỏi' : 'Sửa câu hỏi'}</h1>
  <c:if test="${not empty errorMessage}"><div class="alert alert-danger"><c:out value="${errorMessage}"/></div></c:if>
  <section class="panel-card"><form method="post" action="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/questions/save">
   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
   <c:if test="${not empty question.id}"><input type="hidden" name="id" value="${question.id}"/></c:if>
   <div class="row g-3">
    <div class="col-12"><label class="form-label" for="questionText">Nội dung câu hỏi *</label>
     <textarea class="form-control" id="questionText" rows="3" name="questionText" required><c:out value="${question.question_text}"/></textarea></div>
    <div class="col-md-8"><label class="form-label" for="passageId">Đoạn nghe dùng chung (tùy chọn)</label>
     <select name="passageId" id="passageId" class="form-select"><option value="">Không dùng đoạn nghe</option>
      <c:forEach items="${passages}" var="p"><option value="${p.id}" ${question.passage_id eq p.id ? 'selected' : ''}>Đoạn nghe #${p.id} — thứ tự ${p.sort_order}</option></c:forEach>
     </select></div>
    <div class="col-md-4"><label class="form-label" for="sortOrder">Thứ tự</label>
     <input type="number" id="sortOrder" name="sortOrder" min="0" class="form-control" value="${empty question.sort_order ? 0 : question.sort_order}"/></div>
    <div class="col-md-6"><label class="form-label" for="audioId">Audio riêng cho câu hỏi</label>
     <select name="audioId" id="audioId" class="form-select"><option value="">Dùng audio đoạn nghe hoặc bỏ trống</option>
      <c:forEach items="${media}" var="m"><c:if test="${m.media_type eq 'AUDIO'}"><option value="${m.id}" ${question.audio_media_id eq m.id ? 'selected' : ''}>Audio #${m.id}</option></c:if></c:forEach></select></div>
    <div class="col-md-6"><label class="form-label" for="imageId">Ảnh riêng cho câu hỏi (Part 1)</label>
     <select name="imageId" id="imageId" class="form-select"><option value="">Dùng ảnh đoạn nghe hoặc bỏ trống</option>
      <c:forEach items="${media}" var="m"><c:if test="${m.media_type eq 'IMAGE'}"><option value="${m.id}" ${question.image_media_id eq m.id ? 'selected' : ''}>Ảnh #${m.id}</option></c:if></c:forEach></select></div>
   </div>
   <hr/><h2 class="h5">Các phương án A–D</h2><p class="small-meta">Part 2 có 3 đáp án (A–C); Part 1, 3, 4 có 4 đáp án (A–D). Chọn một đáp án đúng.</p>
   <c:forTokens items="A,B,C,D" delims="," var="label">
    <c:if test="${label ne 'D' or set.part_no ne 2}">
     <div class="input-group mb-3"><span class="input-group-text">${label}</span>
      <input type="text" class="form-control" name="option${label}" value="<c:out value='${options[label]}'/>" placeholder="Nội dung đáp án ${label}" ${label eq 'D' ? '' : 'required'}/>
      <span class="input-group-text"><input class="form-check-input mt-0" type="radio" name="correctLabel" value="${label}" aria-label="Đáp án đúng ${label}" ${correctLabel eq label ? 'checked' : ''}/><span class="ms-2 small">Đúng</span></span>
     </div>
    </c:if>
   </c:forTokens>
   <div class="mb-4"><label for="explanation" class="form-label">Giải thích đáp án</label>
    <textarea id="explanation" name="explanation" rows="3" class="form-control"><c:out value="${question.explanation}"/></textarea></div>
   <div class="d-flex gap-2"><button type="submit" class="btn btn-primary">Lưu câu hỏi</button>
    <a class="btn btn-soft" href="${pageContext.request.contextPath}/admin/listening/sets/${set.id}">Hủy</a></div>
  </form></section>
 </div></div></div></main>
<%@ include file="../../fragments/scripts.jspf" %>
