<%-- N11 SOURCE NOTES V24: JSP dựng bố cục và hiển thị dữ liệu từ Controller. class="..." nối CSS; form action/method xác định endpoint và phương thức gửi. c:forEach lặp dữ liệu; c:if kiểm tra điều kiện; c:out hiển thị văn bản an toàn. Không đặt nghiệp vụ ở JSP. --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../../fragments/head.jspf" %>
<main data-n11-src="admin/listening/question-form.jsp|1" class="admin-shell listening-admin-page"><div data-n11-src="admin/listening/question-form.jsp|2" class="container container-n11 listening-container"><div data-n11-src="admin/listening/question-form.jsp|3" class="row g-4 listening-layout">
 <div data-n11-src="admin/listening/question-form.jsp|4" class="col-lg-3 listening-sidebar-col"><%@ include file="../../fragments/admin-sidebar.jspf" %></div>
 <div data-n11-src="admin/listening/question-form.jsp|5" class="col-lg-9 listening-content-col">
  <a data-n11-src="admin/listening/question-form.jsp|6" class="account-back" href="${pageContext.request.contextPath}/admin/listening/sets/${set.id}">← Quay về bộ Listening</a>
  <div data-n11-src="admin/listening/question-form.jsp|7" class="section-caption mt-3">PART ${set.part_no} · <c:out value="${set.title}"/></div>
  <h1 data-n11-src="admin/listening/question-form.jsp|8" class="account-title mb-4">${empty question.id ? 'Thêm câu hỏi' : 'Sửa câu hỏi'}</h1>
  <c:if test="${not empty errorMessage}"><div data-n11-src="admin/listening/question-form.jsp|9" class="alert alert-danger"><c:out value="${errorMessage}"/></div></c:if>
  <%-- Khối nội dung: CSS panel-card điều chỉnh nền, viền và khoảng cách. --%><section data-n11-src="admin/listening/question-form.jsp|10" class="panel-card"><form data-n11-src="admin/listening/question-form.jsp|11" method="post" action="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/questions/save">
   <%-- CSRF token bảo vệ yêu cầu POST. --%><input data-n11-src="admin/listening/question-form.jsp|12" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
   <c:if test="${not empty question.id}"><input data-n11-src="admin/listening/question-form.jsp|13" type="hidden" name="id" value="${question.id}"/></c:if>
   <div data-n11-src="admin/listening/question-form.jsp|14" class="row g-3">
    <div data-n11-src="admin/listening/question-form.jsp|15" class="col-12"><label data-n11-src="admin/listening/question-form.jsp|16" class="form-label" for="questionText">Nội dung câu hỏi *</label>
     <textarea data-n11-src="admin/listening/question-form.jsp|17" class="form-control" id="questionText" rows="3" name="questionText" required><c:out value="${question.question_text}"/></textarea></div>
    <div data-n11-src="admin/listening/question-form.jsp|18" class="col-md-8"><label data-n11-src="admin/listening/question-form.jsp|19" class="form-label" for="passageId">Đoạn nghe dùng chung (tùy chọn)</label>
     <select data-n11-src="admin/listening/question-form.jsp|20" name="passageId" id="passageId" class="form-select"><option value="">Không dùng đoạn nghe</option>
      <c:forEach items="${passages}" var="p"><option value="${p.id}" ${question.passage_id eq p.id ? 'selected' : ''}>Đoạn nghe #${p.id} — thứ tự ${p.sort_order}</option></c:forEach>
     </select></div>
    <div data-n11-src="admin/listening/question-form.jsp|21" class="col-md-4"><label data-n11-src="admin/listening/question-form.jsp|22" class="form-label" for="sortOrder">Thứ tự</label>
     <input data-n11-src="admin/listening/question-form.jsp|23" type="number" id="sortOrder" name="sortOrder" min="0" class="form-control" value="${empty question.sort_order ? 0 : question.sort_order}"/></div>
    <div data-n11-src="admin/listening/question-form.jsp|24" class="col-md-4"><label data-n11-src="admin/listening/question-form.jsp|25" for="questionLevel" class="form-label">Cấp độ</label><%-- Trường cấp độ câu hỏi: value là cấp gửi đến Controller. --%><select data-n11-src="admin/listening/question-form.jsp|26" name="questionLevel" id="questionLevel" class="form-select"><option value="0" ${not fn:contains(set.instructions, '[LISTENING_LEVEL:1]') and not fn:contains(set.instructions, '[LISTENING_LEVEL:2]') and not fn:contains(set.instructions, '[LISTENING_LEVEL:3]') and not fn:contains(set.instructions, '[LISTENING_LEVEL:4]') and not fn:contains(set.instructions, '[LISTENING_LEVEL:5]') ? 'selected' : ''}>Chưa phân loại</option><option value="1" ${fn:contains(set.instructions, '[LISTENING_LEVEL:1]') ? 'selected' : ''}>1 · Rất dễ</option><option value="2" ${fn:contains(set.instructions, '[LISTENING_LEVEL:2]') ? 'selected' : ''}>2 · Dễ</option><option value="3" ${fn:contains(set.instructions, '[LISTENING_LEVEL:3]') ? 'selected' : ''}>3 · Trung bình</option><option value="4" ${fn:contains(set.instructions, '[LISTENING_LEVEL:4]') ? 'selected' : ''}>4 · Khó</option><option value="5" ${fn:contains(set.instructions, '[LISTENING_LEVEL:5]') ? 'selected' : ''}>5 · Rất khó</option></select><c:if test="${set.part_no ne 5}"><small data-n11-src="admin/listening/question-form.jsp|27" class="form-text">Đổi cấp áp dụng cho cả đoạn.</small></c:if></div>
    <div data-n11-src="admin/listening/question-form.jsp|28" class="col-md-6"><label data-n11-src="admin/listening/question-form.jsp|29" class="form-label" for="audioId">Audio riêng cho câu hỏi</label>
     <select data-n11-src="admin/listening/question-form.jsp|30" name="audioId" id="audioId" class="form-select"><option value="">Dùng audio đoạn nghe hoặc bỏ trống</option>
      <c:forEach items="${media}" var="m"><c:if test="${m.media_type eq 'AUDIO'}"><option value="${m.id}" ${question.audio_media_id eq m.id ? 'selected' : ''}>Audio #${m.id}</option></c:if></c:forEach></select></div>
    <div data-n11-src="admin/listening/question-form.jsp|31" class="col-md-6"><label data-n11-src="admin/listening/question-form.jsp|32" class="form-label" for="imageId">Ảnh riêng cho câu hỏi (Part 1)</label>
     <select data-n11-src="admin/listening/question-form.jsp|33" name="imageId" id="imageId" class="form-select"><option value="">Dùng ảnh đoạn nghe hoặc bỏ trống</option>
      <c:forEach items="${media}" var="m"><c:if test="${m.media_type eq 'IMAGE'}"><option value="${m.id}" ${question.image_media_id eq m.id ? 'selected' : ''}>Ảnh #${m.id}</option></c:if></c:forEach></select></div>
   </div>
   <hr/><h2 data-n11-src="admin/listening/question-form.jsp|34" class="h5">Các phương án A–D</h2><p data-n11-src="admin/listening/question-form.jsp|35" class="small-meta">Part 2 có 3 đáp án (A–C); Part 1, 3, 4 có 4 đáp án (A–D). Chọn một đáp án đúng.</p>
   <c:forTokens items="A,B,C,D" delims="," var="label">
    <c:if test="${label ne 'D' or set.part_no ne 2}">
     <div data-n11-src="admin/listening/question-form.jsp|36" class="input-group mb-3"><span data-n11-src="admin/listening/question-form.jsp|37" class="input-group-text">${label}</span>
      <input data-n11-src="admin/listening/question-form.jsp|38" type="text" class="form-control" name="option${label}" value="<c:out value='${options[label]}'/>" placeholder="Nội dung đáp án ${label}" ${label eq 'D' ? '' : 'required'}/>
      <span data-n11-src="admin/listening/question-form.jsp|39" class="input-group-text"><input data-n11-src="admin/listening/question-form.jsp|40" class="form-check-input mt-0" type="radio" name="correctLabel" value="${label}" aria-label="Đáp án đúng ${label}" ${correctLabel eq label ? 'checked' : ''}/><span data-n11-src="admin/listening/question-form.jsp|41" class="ms-2 small">Đúng</span></span>
     </div>
    </c:if>
   </c:forTokens>
   <div data-n11-src="admin/listening/question-form.jsp|42" class="mb-4"><label data-n11-src="admin/listening/question-form.jsp|43" for="explanation" class="form-label">Giải thích đáp án</label>
    <textarea data-n11-src="admin/listening/question-form.jsp|44" id="explanation" name="explanation" rows="3" class="form-control"><c:out value="${question.explanation}"/></textarea></div>
   <div data-n11-src="admin/listening/question-form.jsp|45" class="d-flex gap-2"><button data-n11-src="admin/listening/question-form.jsp|46" type="submit" class="btn btn-primary">Lưu câu hỏi</button>
    <a data-n11-src="admin/listening/question-form.jsp|47" class="btn btn-soft" href="${pageContext.request.contextPath}/admin/listening/sets/${set.id}">Hủy</a></div>
  </form></section>
 </div></div></div></main>
<%@ include file="../../fragments/scripts.jspf" %>
