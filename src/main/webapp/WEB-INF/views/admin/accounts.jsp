<%-- N11_ACCOUNT_UI_V40 --%>
<%-- N11 SOURCE NOTES V24: JSP dựng bố cục và hiển thị dữ liệu từ Controller. class="..." nối CSS; form action/method xác định endpoint và phương thức gửi. c:forEach lặp dữ liệu; c:if kiểm tra điều kiện; c:out hiển thị văn bản an toàn. Không đặt nghiệp vụ ở JSP. --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../fragments/head.jspf" %>

<%-- Trang tổng: sửa bố cục tại đây; màu, kích thước ở admin-accounts.css. --%>
<main data-n11-src="admin/accounts.jsp|1" class="admin-shell n11-account-v40 n11-account-list-v40">
 <div data-n11-src="admin/accounts.jsp|2" class="container container-n11">
  <div data-n11-src="admin/accounts.jsp|3" class="row g-4">
   <div data-n11-src="admin/accounts.jsp|4" class="col-lg-3"><%@ include file="../fragments/admin-sidebar.jspf" %></div>
   <div data-n11-src="admin/accounts.jsp|5" class="col-lg-9">

    <%-- KHU VỰC 1: Tiêu đề và nút thêm tài khoản. --%>
    <div data-n11-src="admin/accounts.jsp|6" class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-4 n11-account-hero">
     <div data-n11-src="admin/accounts.jsp|7"><div data-n11-src="admin/accounts.jsp|8" class="section-caption">QUẢN TRỊ HỆ THỐNG</div><h1 data-n11-src="admin/accounts.jsp|9" class="account-title">Quản lý tài khoản</h1>
      <p data-n11-src="admin/accounts.jsp|10" class="small-meta mb-0">Theo dõi người dùng, cập nhật thông tin và kiểm soát quyền truy cập.</p></div>
     <a data-n11-src="admin/accounts.jsp|11" class="btn btn-primary" href="${pageContext.request.contextPath}/admin/accounts/new"><span aria-hidden="true" class="n11-account-plus">+</span> Thêm tài khoản</a>
    </div>

    <%-- KHU VỰC 2: Thông báo kết quả thao tác POST. --%>
    <c:if test="${not empty successMessage}"><div data-n11-src="admin/accounts.jsp|12" class="alert alert-success" role="status"><c:out value="${successMessage}" /></div></c:if>
    <c:if test="${not empty errorMessage}"><div data-n11-src="admin/accounts.jsp|13" class="alert alert-danger" role="alert"><c:out value="${errorMessage}" /></div></c:if>

    <%-- KHU VỰC 3: Các ô thống kê được truy vấn từ bảng users. --%>
    <div data-n11-src="admin/accounts.jsp|14" class="row g-3 mb-4 n11-account-stats">
     <div data-n11-src="admin/accounts.jsp|15" class="col-sm-6 col-xl-3"><div data-n11-src="admin/accounts.jsp|16" class="admin-stat"><span class="n11-account-stat-icon" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="9" cy="8" r="3"/><path d="M3 20v-2a6 6 0 0 1 12 0v2M16 5a3 3 0 0 1 0 6m2 3a5 5 0 0 1 3 5v1"/></svg></span><span data-n11-src="admin/accounts.jsp|17" class="small-meta">Tổng tài khoản</span><div data-n11-src="admin/accounts.jsp|18" class="num"><c:out value="${countAll}" /></div></div></div>
     <div data-n11-src="admin/accounts.jsp|19" class="col-sm-6 col-xl-3"><div data-n11-src="admin/accounts.jsp|20" class="admin-stat"><span class="n11-account-stat-icon" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="m2 9 10-5 10 5-10 5-10-5Zm4 2v6c4 3 8 3 12 0v-6m4-2v7"/></svg></span><span data-n11-src="admin/accounts.jsp|21" class="small-meta">Học viên</span><div data-n11-src="admin/accounts.jsp|22" class="num"><c:out value="${countStudent}" /></div></div></div>
     <div data-n11-src="admin/accounts.jsp|23" class="col-sm-6 col-xl-3"><div data-n11-src="admin/accounts.jsp|24" class="admin-stat"><span class="n11-account-stat-icon" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 3 4 6v6c0 5 8 9 8 9s8-4 8-9V6l-8-3Z"/><path d="m9 12 2 2 4-4"/></svg></span><span data-n11-src="admin/accounts.jsp|25" class="small-meta">Admin</span><div data-n11-src="admin/accounts.jsp|26" class="num"><c:out value="${countAdmin}" /></div></div></div>
     <div data-n11-src="admin/accounts.jsp|27" class="col-sm-6 col-xl-3"><div data-n11-src="admin/accounts.jsp|28" class="admin-stat"><span class="n11-account-stat-icon" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="5" y="10" width="14" height="11" rx="3"/><path d="M8 10V7a4 4 0 0 1 8 0v3m-4 4v3"/></svg></span><span data-n11-src="admin/accounts.jsp|29" class="small-meta">Đã khóa</span><div data-n11-src="admin/accounts.jsp|30" class="num"><c:out value="${countLocked}" /></div></div></div>
    </div>

    <%-- KHU VỰC 4: Tìm kiếm/lọc dữ liệu; GET giúp chia sẻ đường dẫn bộ lọc. --%>
    <div data-n11-src="admin/accounts.jsp|31" class="panel-card mb-4 n11-account-filter">
     <div class="n11-account-panel-heading"><strong>Bộ lọc tài khoản</strong><span>Tìm theo tên, email hoặc trạng thái</span></div>
     <form data-n11-src="admin/accounts.jsp|32" method="get" action="${pageContext.request.contextPath}/admin/accounts" class="row g-3 align-items-end">
      <div data-n11-src="admin/accounts.jsp|33" class="col-lg-5"><label data-n11-src="admin/accounts.jsp|34" class="form-label" for="accountSearch">Tên hoặc email</label>
       <input data-n11-src="admin/accounts.jsp|35" id="accountSearch" class="form-control" type="search" name="q" maxlength="100" placeholder="Nhập họ tên hoặc email..." value="<c:out value='${q}' />" /></div>
      <div data-n11-src="admin/accounts.jsp|36" class="col-sm-6 col-lg-3"><label data-n11-src="admin/accounts.jsp|37" class="form-label" for="roleFilter">Vai trò</label>
       <select data-n11-src="admin/accounts.jsp|38" class="form-select" id="roleFilter" name="role">
        <option value="">Tất cả</option>
        <option value="STUDENT" ${roleFilter eq 'STUDENT' ? 'selected' : ''}>Học viên</option>
        <option value="ADMIN" ${roleFilter eq 'ADMIN' ? 'selected' : ''}>Admin</option>
       </select></div>
      <div data-n11-src="admin/accounts.jsp|39" class="col-sm-6 col-lg-2"><label data-n11-src="admin/accounts.jsp|40" class="form-label" for="statusFilter">Trạng thái</label>
       <select data-n11-src="admin/accounts.jsp|41" class="form-select" id="statusFilter" name="status">
        <option value="">Tất cả</option>
        <option value="ACTIVE" ${statusFilter eq 'ACTIVE' ? 'selected' : ''}>Hoạt động</option>
        <option value="LOCKED" ${statusFilter eq 'LOCKED' ? 'selected' : ''}>Đã khóa</option>
       </select></div>
      <div data-n11-src="admin/accounts.jsp|42" class="col-lg-2"><button data-n11-src="admin/accounts.jsp|43" type="submit" class="btn btn-primary w-100">Lọc</button></div>
     </form>
    </div>

    <%-- KHU VỰC 5: Danh sách thật từ accountPage.items (không có dữ liệu demo). --%>
    <div data-n11-src="admin/accounts.jsp|44" class="panel-card n11-account-results">
     <div data-n11-src="admin/accounts.jsp|45" class="d-flex flex-wrap align-items-center justify-content-between gap-2 mb-3">
      <h2 data-n11-src="admin/accounts.jsp|46" class="account-section-title mb-0">Danh sách tài khoản</h2>
      <span data-n11-src="admin/accounts.jsp|47" class="small-meta"><c:out value="${accountPage.total}" /> kết quả</span>
     </div>
     <%-- Bảng danh sách: thead là tiêu đề, tbody chứa các bản ghi từ Controller. --%><div data-n11-src="admin/accounts.jsp|48" class="admin-table-wrap">
      <table data-n11-src="admin/accounts.jsp|49" class="table align-middle account-table">
       <thead data-n11-src="admin/accounts.jsp|50"><tr data-n11-src="admin/accounts.jsp|51"><th data-n11-src="admin/accounts.jsp|52" scope="col">Họ tên</th><th data-n11-src="admin/accounts.jsp|53" scope="col">Email</th><th data-n11-src="admin/accounts.jsp|54" scope="col">Vai trò</th><th data-n11-src="admin/accounts.jsp|55" scope="col">Trạng thái</th><th data-n11-src="admin/accounts.jsp|56" scope="col">Ngày tạo</th><th data-n11-src="admin/accounts.jsp|57" scope="col">Thao tác</th></tr></thead>
       <tbody data-n11-src="admin/accounts.jsp|58">
        <c:forEach var="account" items="${accountPage.items}">
         <tr data-n11-src="admin/accounts.jsp|59">
          <td data-n11-src="admin/accounts.jsp|60" class="fw-bold"><span class="n11-account-avatar" aria-hidden="true"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="9" cy="8" r="3"/><path d="M3 20v-2a6 6 0 0 1 12 0v2M16 5a3 3 0 0 1 0 6m2 3a5 5 0 0 1 3 5v1"/></svg></span><c:out value="${account.fullName}" /></td>
          <td data-n11-src="admin/accounts.jsp|61"><c:out value="${account.email}" /></td>
          <td data-n11-src="admin/accounts.jsp|62"><span data-n11-src="admin/accounts.jsp|63" class="account-role ${account.role eq 'ADMIN' ? 'account-role-admin' : ''}">${account.role eq 'ADMIN' ? 'Admin' : 'Học viên'}</span></td>
          <td data-n11-src="admin/accounts.jsp|64"><span data-n11-src="admin/accounts.jsp|65" class="badge-status ${account.status eq 'ACTIVE' ? 'good' : 'warn'}">${account.status eq 'ACTIVE' ? 'Hoạt động' : 'Đã khóa'}</span></td>
          <td data-n11-src="admin/accounts.jsp|66" class="text-muted-n11"><c:out value="${account.createdAt}" /></td>
          <td data-n11-src="admin/accounts.jsp|67"><div data-n11-src="admin/accounts.jsp|68" class="d-flex gap-2 account-actions">
           <a data-n11-src="admin/accounts.jsp|69" class="btn btn-soft btn-sm" href="${pageContext.request.contextPath}/admin/accounts/${account.id}/edit">Sửa</a>
           <form data-n11-src="admin/accounts.jsp|70" method="post" action="${pageContext.request.contextPath}/admin/accounts/${account.id}/status" data-confirm="${account.status eq 'ACTIVE' ? 'Khóa tài khoản này?' : 'Mở khóa tài khoản này?'}">
            <%-- CSRF token bảo vệ yêu cầu POST. --%><input data-n11-src="admin/accounts.jsp|71" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input data-n11-src="admin/accounts.jsp|72" type="hidden" name="status" value="${account.status eq 'ACTIVE' ? 'LOCKED' : 'ACTIVE'}" />
            <button data-n11-src="admin/accounts.jsp|73" class="btn btn-outline-primary btn-sm" type="submit">${account.status eq 'ACTIVE' ? 'Khóa' : 'Mở khóa'}</button>
           </form>
          </div></td>
         </tr>
        </c:forEach>
        <c:if test="${empty accountPage.items}"><tr data-n11-src="admin/accounts.jsp|74"><td data-n11-src="admin/accounts.jsp|75" colspan="6" class="text-center py-5 text-muted-n11">Không tìm thấy tài khoản phù hợp.</td></tr></c:if>
       </tbody>
      </table>
     </div>

     <%-- KHU VỰC 6: Phân trang; giữ lại bộ lọc khi chuyển trang. --%>
     <c:if test="${accountPage.pages gt 1}">
      <nav data-n11-src="admin/accounts.jsp|76" class="account-pagination" aria-label="Phân trang tài khoản">
       <c:url var="prevPage" value="/admin/accounts"><c:param name="q" value="${q}" /><c:param name="role" value="${roleFilter}" /><c:param name="status" value="${statusFilter}" /><c:param name="page" value="${accountPage.page - 1}" /></c:url>
       <c:url var="nextPage" value="/admin/accounts"><c:param name="q" value="${q}" /><c:param name="role" value="${roleFilter}" /><c:param name="status" value="${statusFilter}" /><c:param name="page" value="${accountPage.page + 1}" /></c:url>
       <c:if test="${accountPage.hasPrevious}"><a data-n11-src="admin/accounts.jsp|77" class="btn btn-soft btn-sm" href="<c:out value='${prevPage}' />">Trang trước</a></c:if>
       <span data-n11-src="admin/accounts.jsp|78" class="small-meta">Trang <c:out value="${accountPage.page}" /> / <c:out value="${accountPage.pages}" /></span>
       <c:if test="${accountPage.hasNext}"><a data-n11-src="admin/accounts.jsp|79" class="btn btn-soft btn-sm" href="<c:out value='${nextPage}' />">Trang sau</a></c:if>
      </nav>
     </c:if>
    </div>
   </div>
  </div>
 </div>
</main>
<script defer src="${pageContext.request.contextPath}/assets/js/admin-accounts.js"></script>

<%@ include file="../fragments/scripts.jspf" %>
