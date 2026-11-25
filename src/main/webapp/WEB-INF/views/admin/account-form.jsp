<%-- N11 SOURCE NOTES V24: JSP dựng bố cục và hiển thị dữ liệu từ Controller. class="..." nối CSS; form action/method xác định endpoint và phương thức gửi. c:forEach lặp dữ liệu; c:if kiểm tra điều kiện; c:out hiển thị văn bản an toàn. Không đặt nghiệp vụ ở JSP. --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../fragments/head.jspf" %>

<%-- Form dùng chung cho thêm/sửa; thay nhãn và layout tại đây. --%>
<main data-n11-src="admin/account-form.jsp|1" class="admin-shell">
 <div data-n11-src="admin/account-form.jsp|2" class="container container-n11">
  <div data-n11-src="admin/account-form.jsp|3" class="row g-4">
   <div data-n11-src="admin/account-form.jsp|4" class="col-lg-3"><%@ include file="../fragments/admin-sidebar.jspf" %></div>
   <div data-n11-src="admin/account-form.jsp|5" class="col-lg-9">
    <a data-n11-src="admin/account-form.jsp|6" class="account-back" href="${pageContext.request.contextPath}/admin/accounts">← Quay về danh sách</a>
    <h1 data-n11-src="admin/account-form.jsp|7" class="account-title mt-3 mb-4">${formMode eq 'new' ? 'Thêm tài khoản' : 'Chỉnh sửa tài khoản'}</h1>
    <div data-n11-src="admin/account-form.jsp|8" class="panel-card">
     <c:if test="${not empty formError}"><div data-n11-src="admin/account-form.jsp|9" class="alert alert-danger" role="alert"><c:out value="${formError}" /></div></c:if>
     <c:choose>
      <c:when test="${formMode eq 'new'}"><c:url var="formAction" value="/admin/accounts" /></c:when>
      <c:otherwise><c:url var="formAction" value="/admin/accounts/${accountId}" /></c:otherwise>
     </c:choose>
     <form data-n11-src="admin/account-form.jsp|10" method="post" action="<c:out value='${formAction}' />">
      <%-- CSRF token bảo vệ yêu cầu POST. --%><input data-n11-src="admin/account-form.jsp|11" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <%-- NHÓM TRƯỜNG 1: Thông tin cơ bản lấy từ user_profiles và users. --%>
      <div data-n11-src="admin/account-form.jsp|12" class="row g-3">
       <div data-n11-src="admin/account-form.jsp|13" class="col-md-6"><label data-n11-src="admin/account-form.jsp|14" for="accountName" class="form-label">Họ và tên *</label>
        <input data-n11-src="admin/account-form.jsp|15" id="accountName" name="fullName" class="form-control" maxlength="120" required value="<c:out value='${accountForm.fullName}' />" /></div>
       <div data-n11-src="admin/account-form.jsp|16" class="col-md-6"><label data-n11-src="admin/account-form.jsp|17" for="accountEmail" class="form-label">Email *</label>
        <input data-n11-src="admin/account-form.jsp|18" id="accountEmail" name="email" type="email" class="form-control" maxlength="191" required value="<c:out value='${accountForm.email}' />" /></div>
       <div data-n11-src="admin/account-form.jsp|19" class="col-md-6"><label data-n11-src="admin/account-form.jsp|20" for="accountPhone" class="form-label">Số điện thoại</label>
        <input data-n11-src="admin/account-form.jsp|21" id="accountPhone" name="phone" type="tel" class="form-control" maxlength="20" value="<c:out value='${accountForm.phone}' />" /></div>
       <div data-n11-src="admin/account-form.jsp|22" class="col-md-6"><label data-n11-src="admin/account-form.jsp|23" for="accountRole" class="form-label">Vai trò *</label>
        <select data-n11-src="admin/account-form.jsp|24" id="accountRole" name="role" class="form-select" required>
         <option value="STUDENT" ${accountForm.role eq 'STUDENT' ? 'selected' : ''}>Học viên</option>
         <option value="ADMIN" ${accountForm.role eq 'ADMIN' ? 'selected' : ''}>Admin</option>
        </select></div>
      </div>
      <%-- NHÓM TRƯỜNG 2: Mật khẩu ban đầu, chỉ dùng khi tạo tài khoản. --%>
      <%-- N11_PASSWORD_CREATE_ONLY: chỉ nhập mật khẩu khi tạo tài khoản. --%>
      <c:if test="${formMode eq 'new'}">
       <div data-n11-src="admin/account-form.jsp|25" class="mt-3 mb-4">
       <label data-n11-src="admin/account-form.jsp|26" for="accountPassword" class="form-label">Mật khẩu *</label>
       <input data-n11-src="admin/account-form.jsp|27" id="accountPassword" name="password" type="password" class="form-control" autocomplete="new-password" maxlength="64" required />
       <div data-n11-src="admin/account-form.jsp|28" class="form-text">8–64 ký tự, có chữ hoa, chữ thường và ký tự đặc biệt.</div>
      </div>
      </c:if>
      <div data-n11-src="admin/account-form.jsp|29" class="d-flex gap-2 flex-wrap">
       <button data-n11-src="admin/account-form.jsp|30" type="submit" class="btn btn-primary">${formMode eq 'new' ? 'Tạo tài khoản' : 'Lưu thay đổi'}</button>
       <a data-n11-src="admin/account-form.jsp|31" class="btn btn-soft" href="${pageContext.request.contextPath}/admin/accounts">Hủy</a>
      </div>
     </form>
    </div>
   </div>
  </div>
 </div>
</main>

<%@ include file="../fragments/scripts.jspf" %>
