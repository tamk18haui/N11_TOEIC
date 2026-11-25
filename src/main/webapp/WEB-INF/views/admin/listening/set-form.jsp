<%-- N11 SOURCE NOTES V24: JSP dựng bố cục và hiển thị dữ liệu từ Controller. class="..." nối CSS; form action/method xác định endpoint và phương thức gửi. c:forEach lặp dữ liệu; c:if kiểm tra điều kiện; c:out hiển thị văn bản an toàn. Không đặt nghiệp vụ ở JSP. --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../../fragments/head.jspf" %>
<main data-n11-src="admin/listening/set-form.jsp|1" class="admin-shell listening-admin-page"><div data-n11-src="admin/listening/set-form.jsp|2" class="container container-n11 listening-container"><div data-n11-src="admin/listening/set-form.jsp|3" class="row g-4 listening-layout">
 <div data-n11-src="admin/listening/set-form.jsp|4" class="col-lg-3 listening-sidebar-col"><%@ include file="../../fragments/admin-sidebar.jspf" %></div>
 <div data-n11-src="admin/listening/set-form.jsp|5" class="col-lg-9 listening-content-col">
  <a data-n11-src="admin/listening/set-form.jsp|6" class="account-back" href="${pageContext.request.contextPath}/admin/listening">← Danh sách Listening</a>
  <h1 data-n11-src="admin/listening/set-form.jsp|7" class="account-title mt-3 mb-4">${empty setForm.id ? 'Tạo bộ Listening' : 'Sửa bộ Listening'}</h1>
  <%-- Khối nội dung: CSS panel-card điều chỉnh nền, viền và khoảng cách. --%><section data-n11-src="admin/listening/set-form.jsp|8" class="panel-card"><form data-n11-src="admin/listening/set-form.jsp|9" method="post" action="${pageContext.request.contextPath}/admin/listening/sets/save">
   <%-- CSRF token bảo vệ yêu cầu POST. --%><input data-n11-src="admin/listening/set-form.jsp|10" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
   <c:if test="${not empty setForm.id}"><input data-n11-src="admin/listening/set-form.jsp|11" type="hidden" name="id" value="${setForm.id}"/></c:if>
   <div data-n11-src="admin/listening/set-form.jsp|12" class="row g-3">
    <div data-n11-src="admin/listening/set-form.jsp|13" class="col-md-3"><label data-n11-src="admin/listening/set-form.jsp|14" for="part" class="form-label">Part *</label><select data-n11-src="admin/listening/set-form.jsp|15" id="part" name="part" class="form-select" required>
     <c:forEach begin="1" end="4" var="n"><option value="${n}" ${setForm.part_no eq n ? 'selected' : ''}>Part ${n}</option></c:forEach></select></div>
    <div data-n11-src="admin/listening/set-form.jsp|16" class="col-md-9"><label data-n11-src="admin/listening/set-form.jsp|17" for="title" class="form-label">Tên bộ luyện nghe *</label>
     <input data-n11-src="admin/listening/set-form.jsp|18" id="title" type="text" name="title" class="form-control" required maxlength="200" value="<c:out value='${setForm.title}'/>" placeholder="Ví dụ: Part 2 – Office Conversations"/></div>
    <div data-n11-src="admin/listening/set-form.jsp|19" class="col-md-4"><label data-n11-src="admin/listening/set-form.jsp|20" for="difficulty" class="form-label">Độ khó</label><select data-n11-src="admin/listening/set-form.jsp|21" id="difficulty" name="difficulty" class="form-select">
     <option value="EASY" ${setForm.difficulty eq 'EASY' ? 'selected' : ''}>Dễ</option>
     <option value="MEDIUM" ${setForm.difficulty eq 'MEDIUM' ? 'selected' : ''}>Trung bình</option>
     <option value="HARD" ${setForm.difficulty eq 'HARD' ? 'selected' : ''}>Khó</option></select></div>
    <div data-n11-src="admin/listening/set-form.jsp|22" class="col-12"><label data-n11-src="admin/listening/set-form.jsp|23" for="instructions" class="form-label">Hướng dẫn làm bài</label>
     <textarea data-n11-src="admin/listening/set-form.jsp|24" id="instructions" name="instructions" class="form-control" rows="5" maxlength="10000"><c:out value="${setForm.instructions}"/></textarea></div>
   </div>
   <p data-n11-src="admin/listening/set-form.jsp|25" class="small-meta mt-3">Bộ mới luôn ở trạng thái bản nháp. Thêm audio, đoạn nghe và câu hỏi trước khi công bố.</p>
   <div data-n11-src="admin/listening/set-form.jsp|26" class="d-flex gap-2"><button data-n11-src="admin/listening/set-form.jsp|27" type="submit" class="btn btn-primary">Lưu bộ Listening</button>
    <a data-n11-src="admin/listening/set-form.jsp|28" href="${pageContext.request.contextPath}/admin/listening" class="btn btn-soft">Hủy</a></div>
  </form></section>
 </div></div></div></main>
<%@ include file="../../fragments/scripts.jspf" %>
