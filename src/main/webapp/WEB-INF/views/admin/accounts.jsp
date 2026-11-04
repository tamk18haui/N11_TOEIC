<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/header.jspf" %>
<%-- Trang tổng: sửa bố cục tại đây; màu, kích thước ở admin-accounts.css. --%>
<main class="admin-shell">
 <div class="container container-n11">
  <div class="row g-4">
   <div class="col-lg-3"><%@ include file="../fragments/admin-sidebar.jspf" %></div>
   <div class="col-lg-9">

    <%-- KHU VỰC 1: Tiêu đề và nút thêm tài khoản. --%>
    <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-4">
     <div><div class="section-caption">QUẢN TRỊ HỆ THỐNG</div><h1 class="account-title">Quản lý tài khoản</h1>
      <p class="small-meta mb-0">Dữ liệu thực từ MySQL, chỉ có hai vai trò Học viên và Admin.</p></div>
     <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/accounts/new">+ Thêm tài khoản</a>
    </div>

    <%-- KHU VỰC 2: Thông báo kết quả thao tác POST. --%>
    <c:if test="${not empty successMessage}"><div class="alert alert-success" role="status"><c:out value="${successMessage}" /></div></c:if>
    <c:if test="${not empty errorMessage}"><div class="alert alert-danger" role="alert"><c:out value="${errorMessage}" /></div></c:if>

    <%-- KHU VỰC 3: Các ô thống kê được truy vấn từ bảng users. --%>
    <div class="row g-3 mb-4">
     <div class="col-sm-6 col-xl-3"><div class="admin-stat"><span class="small-meta">Tổng tài khoản</span><div class="num"><c:out value="${countAll}" /></div></div></div>
     <div class="col-sm-6 col-xl-3"><div class="admin-stat"><span class="small-meta">Học viên</span><div class="num"><c:out value="${countStudent}" /></div></div></div>
     <div class="col-sm-6 col-xl-3"><div class="admin-stat"><span class="small-meta">Admin</span><div class="num"><c:out value="${countAdmin}" /></div></div></div>
     <div class="col-sm-6 col-xl-3"><div class="admin-stat"><span class="small-meta">Đã khóa</span><div class="num"><c:out value="${countLocked}" /></div></div></div>
    </div>

    <%-- KHU VỰC 4: Tìm kiếm/lọc dữ liệu; GET giúp chia sẻ đường dẫn bộ lọc. --%>
    <div class="panel-card mb-4">
     <form method="get" action="${pageContext.request.contextPath}/admin/accounts" class="row g-3 align-items-end">
      <div class="col-lg-5"><label class="form-label" for="accountSearch">Tên hoặc email</label>
       <input id="accountSearch" class="form-control" type="search" name="q" maxlength="100" placeholder="Nhập họ tên hoặc email..." value="<c:out value='${q}' />" /></div>
      <div class="col-sm-6 col-lg-3"><label class="form-label" for="roleFilter">Vai trò</label>
       <select class="form-select" id="roleFilter" name="role">
        <option value="">Tất cả</option>
        <option value="STUDENT" ${roleFilter eq 'STUDENT' ? 'selected' : ''}>Học viên</option>
        <option value="ADMIN" ${roleFilter eq 'ADMIN' ? 'selected' : ''}>Admin</option>
       </select></div>
      <div class="col-sm-6 col-lg-2"><label class="form-label" for="statusFilter">Trạng thái</label>
       <select class="form-select" id="statusFilter" name="status">
        <option value="">Tất cả</option>
        <option value="ACTIVE" ${statusFilter eq 'ACTIVE' ? 'selected' : ''}>Hoạt động</option>
        <option value="LOCKED" ${statusFilter eq 'LOCKED' ? 'selected' : ''}>Đã khóa</option>
       </select></div>
      <div class="col-lg-2"><button type="submit" class="btn btn-primary w-100">Lọc</button></div>
     </form>
    </div>

    <%-- KHU VỰC 5: Danh sách thật từ accountPage.items (không có dữ liệu demo). --%>
    <div class="panel-card">
     <div class="d-flex flex-wrap align-items-center justify-content-between gap-2 mb-3">
      <h2 class="account-section-title mb-0">Danh sách tài khoản</h2>
      <span class="small-meta"><c:out value="${accountPage.total}" /> kết quả</span>
     </div>
     <div class="admin-table-wrap">
      <table class="table align-middle account-table">
       <thead><tr><th scope="col">Họ tên</th><th scope="col">Email</th><th scope="col">Vai trò</th><th scope="col">Trạng thái</th><th scope="col">Ngày tạo</th><th scope="col">Thao tác</th></tr></thead>
       <tbody>
        <c:forEach var="account" items="${accountPage.items}">
         <tr>
          <td class="fw-bold"><c:out value="${account.fullName}" /></td>
          <td><c:out value="${account.email}" /></td>
          <td><span class="account-role ${account.role eq 'ADMIN' ? 'account-role-admin' : ''}">${account.role eq 'ADMIN' ? 'Admin' : 'Học viên'}</span></td>
          <td><span class="badge-status ${account.status eq 'ACTIVE' ? 'good' : 'warn'}">${account.status eq 'ACTIVE' ? 'Hoạt động' : 'Đã khóa'}</span></td>
          <td class="text-muted-n11"><c:out value="${account.createdAt}" /></td>
          <td><div class="d-flex gap-2 account-actions">
           <a class="btn btn-soft btn-sm" href="${pageContext.request.contextPath}/admin/accounts/${account.id}/edit">Sửa</a>
           <form method="post" action="${pageContext.request.contextPath}/admin/accounts/${account.id}/status" data-confirm="${account.status eq 'ACTIVE' ? 'Khóa tài khoản này?' : 'Mở khóa tài khoản này?'}">
            <input type="hidden" name="_adminCsrf" value="<c:out value='${adminCsrfToken}' />" />
            <input type="hidden" name="status" value="${account.status eq 'ACTIVE' ? 'LOCKED' : 'ACTIVE'}" />
            <button class="btn btn-outline-primary btn-sm" type="submit">${account.status eq 'ACTIVE' ? 'Khóa' : 'Mở khóa'}</button>
           </form>
          </div></td>
         </tr>
        </c:forEach>
        <c:if test="${empty accountPage.items}"><tr><td colspan="6" class="text-center py-5 text-muted-n11">Không tìm thấy tài khoản phù hợp.</td></tr></c:if>
       </tbody>
      </table>
     </div>

     <%-- KHU VỰC 6: Phân trang; giữ lại bộ lọc khi chuyển trang. --%>
     <c:if test="${accountPage.pages gt 1}">
      <nav class="account-pagination" aria-label="Phân trang tài khoản">
       <c:url var="prevPage" value="/admin/accounts"><c:param name="q" value="${q}" /><c:param name="role" value="${roleFilter}" /><c:param name="status" value="${statusFilter}" /><c:param name="page" value="${accountPage.page - 1}" /></c:url>
       <c:url var="nextPage" value="/admin/accounts"><c:param name="q" value="${q}" /><c:param name="role" value="${roleFilter}" /><c:param name="status" value="${statusFilter}" /><c:param name="page" value="${accountPage.page + 1}" /></c:url>
       <c:if test="${accountPage.hasPrevious}"><a class="btn btn-soft btn-sm" href="<c:out value='${prevPage}' />">Trang trước</a></c:if>
       <span class="small-meta">Trang <c:out value="${accountPage.page}" /> / <c:out value="${accountPage.pages}" /></span>
       <c:if test="${accountPage.hasNext}"><a class="btn btn-soft btn-sm" href="<c:out value='${nextPage}' />">Trang sau</a></c:if>
      </nav>
     </c:if>
    </div>
   </div>
  </div>
 </div>
</main>
<script defer src="${pageContext.request.contextPath}/assets/js/admin-accounts.js"></script>
<%@ include file="../fragments/footer.jspf" %>
<%@ include file="../fragments/scripts.jspf" %>
