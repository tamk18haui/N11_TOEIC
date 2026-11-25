<%-- N11_ACCOUNT_UI_V40 --%>
<%-- N11 SOURCE NOTES V24: JSP dựng bố cục và hiển thị dữ liệu từ Controller. class="..." nối CSS; form action/method xác định endpoint và phương thức gửi. c:forEach lặp dữ liệu; c:if kiểm tra điều kiện; c:out hiển thị văn bản an toàn. Không đặt nghiệp vụ ở JSP. --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../fragments/head.jspf" %>

<%-- Form dùng chung cho thêm/sửa; thay nhãn và layout tại đây. --%>
<main data-n11-src="admin/account-form.jsp|1" class="admin-shell n11-account-v40 n11-account-form-v40">
 <div data-n11-src="admin/account-form.jsp|2" class="container container-n11">
  <div data-n11-src="admin/account-form.jsp|3" class="row g-4">
   <div data-n11-src="admin/account-form.jsp|4" class="col-lg-3"><%@ include file="../fragments/admin-sidebar.jspf" %></div>
   <div data-n11-src="admin/account-form.jsp|5" class="col-lg-9">
    <a data-n11-src="admin/account-form.jsp|6" class="account-back" href="${pageContext.request.contextPath}/admin/accounts">← Quay về danh sách</a>
    <h1 data-n11-src="admin/account-form.jsp|7" class="account-title mt-3 mb-4">${formMode eq 'new' ? 'Thêm tài khoản' : 'Chỉnh sửa tài khoản'}</h1>
    <p class="n11-account-intro">${formMode eq 'new' ? 'Tạo tài khoản học viên hoặc quản trị viên mới.' : 'Cập nhật thông tin cá nhân và vai trò của tài khoản.'}</p>
    <div data-n11-src="admin/account-form.jsp|8" class="panel-card n11-account-edit-panel">
     <div class="n11-account-form-heading"><span class="n11-account-form-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="9" cy="8" r="3"/><path d="M3 20v-2a6 6 0 0 1 12 0v2M16 5a3 3 0 0 1 0 6m2 3a5 5 0 0 1 3 5v1"/></svg></span><div><h2>Thông tin tài khoản</h2><p>Các trường có dấu * là bắt buộc.</p></div></div>
     <c:if test="${not empty formError}"><div data-n11-src="admin/account-form.jsp|9" class="alert alert-danger" role="alert"><c:out value="${formError}" /></div></c:if>
     <c:choose>
      <c:when test="${formMode eq 'new'}"><c:url var="formAction" value="/admin/accounts" /></c:when>
      <c:otherwise><c:url var="formAction" value="/admin/accounts/${accountId}" /></c:otherwise>
     </c:choose>
     <form data-n11-src="admin/account-form.jsp|10" class="n11-account-editor" autocomplete="off" method="post" action="<c:out value='${formAction}' />">
      <%-- CSRF token bảo vệ yêu cầu POST. --%><input data-n11-src="admin/account-form.jsp|11" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <%-- NHÓM TRƯỜNG 1: Thông tin cơ bản lấy từ user_profiles và users. --%>
      <div data-n11-src="admin/account-form.jsp|12" class="row g-3">
       <div data-n11-src="admin/account-form.jsp|13" class="col-md-6"><label data-n11-src="admin/account-form.jsp|14" for="accountName" class="form-label">Họ và tên *</label>
        <input data-n11-src="admin/account-form.jsp|15" id="accountName" name="fullName" autocomplete="off" placeholder="Ví dụ: Nguyễn Văn An" class="form-control" maxlength="120" required value="<c:out value='${accountForm.fullName}' />" /></div>
       <div data-n11-src="admin/account-form.jsp|16" class="col-md-6"><label data-n11-src="admin/account-form.jsp|17" for="accountEmail" class="form-label">Email *</label>
        <input data-n11-src="admin/account-form.jsp|18" id="accountEmail" name="email" autocomplete="off" placeholder="email@example.com" type="email" class="form-control" maxlength="191" required value="<c:out value='${accountForm.email}' />" /></div>
       <div data-n11-src="admin/account-form.jsp|19" class="col-md-6"><label data-n11-src="admin/account-form.jsp|20" for="accountPhone" class="form-label">Số điện thoại</label>
        <input data-n11-src="admin/account-form.jsp|21" id="accountPhone" name="phone" autocomplete="off" inputmode="tel" placeholder="Ví dụ: 0912345678" type="tel" class="form-control" maxlength="20" value="<c:out value='${accountForm.phone}' />" /></div>
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
       <input data-n11-src="admin/account-form.jsp|27" id="accountPassword" name="password" placeholder="Nhập mật khẩu ban đầu" type="password" class="form-control" autocomplete="new-password" maxlength="64" required />
       <div data-n11-src="admin/account-form.jsp|28" class="form-text">8–64 ký tự, có chữ hoa, chữ thường và ký tự đặc biệt.</div>
      </div>
      </c:if>
      <c:if test="${formMode ne 'new'}"><div class="n11-account-security-note"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 3 4 6v6c0 5 8 9 8 9s8-4 8-9V6l-8-3Z"/><path d="m9 12 2 2 4-4"/></svg><span>Mật khẩu hiện tại được giữ nguyên khi lưu thay đổi.</span></div></c:if>
      <div data-n11-src="admin/account-form.jsp|29" class="d-flex gap-2 flex-wrap n11-account-form-actions">
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
