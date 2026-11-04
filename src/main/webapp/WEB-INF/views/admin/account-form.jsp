<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../fragments/head.jspf" %>

<%-- Form dùng chung cho thêm/sửa; thay nhãn và layout tại đây. --%>
<main class="admin-shell">
 <div class="container container-n11">
  <div class="row g-4">
   <div class="col-lg-3"><%@ include file="../fragments/admin-sidebar.jspf" %></div>
   <div class="col-lg-9">
    <a class="account-back" href="${pageContext.request.contextPath}/admin/accounts">← Quay về danh sách</a>
    <h1 class="account-title mt-3 mb-4">${formMode eq 'new' ? 'Thêm tài khoản' : 'Chỉnh sửa tài khoản'}</h1>
    <div class="panel-card">
     <c:if test="${not empty formError}"><div class="alert alert-danger" role="alert"><c:out value="${formError}" /></div></c:if>
     <c:choose>
      <c:when test="${formMode eq 'new'}"><c:url var="formAction" value="/admin/accounts" /></c:when>
      <c:otherwise><c:url var="formAction" value="/admin/accounts/${accountId}" /></c:otherwise>
     </c:choose>
     <form method="post" action="<c:out value='${formAction}' />">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <%-- NHÓM TRƯỜNG 1: Thông tin cơ bản lấy từ user_profiles và users. --%>
      <div class="row g-3">
       <div class="col-md-6"><label for="accountName" class="form-label">Họ và tên *</label>
        <input id="accountName" name="fullName" class="form-control" maxlength="120" required value="<c:out value='${accountForm.fullName}' />" /></div>
       <div class="col-md-6"><label for="accountEmail" class="form-label">Email *</label>
        <input id="accountEmail" name="email" type="email" class="form-control" maxlength="191" required value="<c:out value='${accountForm.email}' />" /></div>
       <div class="col-md-6"><label for="accountPhone" class="form-label">Số điện thoại</label>
        <input id="accountPhone" name="phone" type="tel" class="form-control" maxlength="20" value="<c:out value='${accountForm.phone}' />" /></div>
       <div class="col-md-6"><label for="accountRole" class="form-label">Vai trò *</label>
        <select id="accountRole" name="role" class="form-select" required>
         <option value="STUDENT" ${accountForm.role eq 'STUDENT' ? 'selected' : ''}>Học viên</option>
         <option value="ADMIN" ${accountForm.role eq 'ADMIN' ? 'selected' : ''}>Admin</option>
        </select></div>
      </div>
      <%-- NHÓM TRƯỜNG 2: Mật khẩu. Để trống khi sửa = giữ nguyên. Không đổ lại mật khẩu vào HTML. --%>
      <div class="mt-3 mb-4">
       <label for="accountPassword" class="form-label">${formMode eq 'new' ? 'Mật khẩu *' : 'Mật khẩu mới (không bắt buộc)'}</label>
       <input id="accountPassword" name="password" type="password" class="form-control" autocomplete="new-password" maxlength="64" ${formMode eq 'new' ? 'required' : ''} />
       <div class="form-text">8–64 ký tự, có chữ hoa, chữ thường và ký tự đặc biệt. Để trống khi sửa nếu không đổi mật khẩu.</div>
      </div>
      <div class="d-flex gap-2 flex-wrap">
       <button type="submit" class="btn btn-primary">${formMode eq 'new' ? 'Tạo tài khoản' : 'Lưu thay đổi'}</button>
       <a class="btn btn-soft" href="${pageContext.request.contextPath}/admin/accounts">Hủy</a>
      </div>
     </form>
    </div>
   </div>
  </div>
 </div>
</main>

<%@ include file="../fragments/scripts.jspf" %>
