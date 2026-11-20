<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../../fragments/head.jspf" %>
<main class="admin-shell listening-admin-page"><div class="container container-n11 listening-container"><div class="row g-4 listening-layout">
 <div class="col-lg-3 listening-sidebar-col"><%@ include file="../../fragments/admin-sidebar.jspf" %></div>
 <div class="col-lg-9 listening-content-col">
  <a class="account-back" href="${pageContext.request.contextPath}/admin/listening">← Danh sách Listening</a>
  <h1 class="account-title mt-3 mb-4">${empty setForm.id ? 'Tạo bộ Listening' : 'Sửa bộ Listening'}</h1>
  <section class="panel-card"><form method="post" action="${pageContext.request.contextPath}/admin/listening/sets/save">
   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
   <c:if test="${not empty setForm.id}"><input type="hidden" name="id" value="${setForm.id}"/></c:if>
   <div class="row g-3">
    <div class="col-md-3"><label for="part" class="form-label">Part *</label><select id="part" name="part" class="form-select" required>
     <c:forEach begin="1" end="4" var="n"><option value="${n}" ${setForm.part_no eq n ? 'selected' : ''}>Part ${n}</option></c:forEach></select></div>
    <div class="col-md-9"><label for="title" class="form-label">Tên bộ luyện nghe *</label>
     <input id="title" type="text" name="title" class="form-control" required maxlength="200" value="<c:out value='${setForm.title}'/>" placeholder="Ví dụ: Part 2 – Office Conversations"/></div>
    <div class="col-md-4"><label for="difficulty" class="form-label">Độ khó</label><select id="difficulty" name="difficulty" class="form-select">
     <option value="EASY" ${setForm.difficulty eq 'EASY' ? 'selected' : ''}>Dễ</option>
     <option value="MEDIUM" ${setForm.difficulty eq 'MEDIUM' ? 'selected' : ''}>Trung bình</option>
     <option value="HARD" ${setForm.difficulty eq 'HARD' ? 'selected' : ''}>Khó</option></select></div>
    <div class="col-12"><label for="instructions" class="form-label">Hướng dẫn làm bài</label>
     <textarea id="instructions" name="instructions" class="form-control" rows="5" maxlength="10000"><c:out value="${setForm.instructions}"/></textarea></div>
   </div>
   <p class="small-meta mt-3">Bộ mới luôn ở trạng thái bản nháp. Thêm audio, đoạn nghe và câu hỏi trước khi công bố.</p>
   <div class="d-flex gap-2"><button type="submit" class="btn btn-primary">Lưu bộ Listening</button>
    <a href="${pageContext.request.contextPath}/admin/listening" class="btn btn-soft">Hủy</a></div>
  </form></section>
 </div></div></div></main>
<%@ include file="../../fragments/scripts.jspf" %>
