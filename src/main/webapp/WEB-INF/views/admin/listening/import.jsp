<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../../fragments/head.jspf" %>
<c:if test="${importRunning}">
 <script>setTimeout(function(){window.location.reload();},3000);</script>
</c:if>
<main class="admin-shell listening-admin-page"><div class="container container-n11 listening-container"><div class="row g-4 listening-layout">
 <div class="col-lg-3 listening-sidebar-col"><%@ include file="../../fragments/admin-sidebar.jspf" %></div>
 <div class="col-lg-9 listening-content-col">
 <a class="account-back" href="${pageContext.request.contextPath}/admin/listening">← Quản lý Listening</a>
 <h1 class="account-title mt-3 mb-3">Nhập hàng loạt dữ liệu Listening</h1>
 <p class="small-meta">Đồng bộ dữ liệu đã cào từ kho SQLite trên máy tính. Chỉ dành cho Admin, không sửa module Luyện Listening của học viên.</p>
 <section class="panel-card mb-4">
  <h2 class="account-section-title">Nguồn dữ liệu hiện tại</h2>
  <p class="mb-1"><strong>CSDL SQLite:</strong> <code><c:out value="${bankPath}"/></code></p>
  <p class="mb-3"><strong>Kho audio/ảnh:</strong> <code><c:out value="${mediaPath}"/></code></p>
  <p class="small-meta">Chỉ đọc dữ liệu cục bộ từ máy chạy Spring Boot; không tải dữ liệu từ web. Có thể đổi nguồn qua biến môi trường <code>N11_LISTENING_IMPORT_DB</code> và <code>N11_LISTENING_IMPORT_MEDIA_ROOT</code>.</p>
  <div class="d-flex flex-wrap gap-3">
   <form method="post" action="${pageContext.request.contextPath}/admin/listening/import/scan">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <button type="submit" class="btn btn-soft" ${importRunning ? 'disabled' : ''}>1. Quét, kiểm tra dữ liệu</button>
   </form>
   <form method="post" action="${pageContext.request.contextPath}/admin/listening/import/apply" onsubmit="return confirm('Chỉ nhập câu đủ đáp án, tạo bộ Listening ở trạng thái NHÁP. Bạn đã xem kết quả kiểm tra và sao lưu CSDL?');">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary" ${importRunning ? 'disabled' : ''}>2. Nhập vào MySQL</button>
   </form>
  </div>
 </section>
 <section class="panel-card mb-4">
  <h2 class="account-section-title">Trạng thái: <c:out value="${importStatus}"/></h2>
  <pre style="max-height:420px;overflow:auto;white-space:pre-wrap;overflow-wrap:anywhere;font-size:13px;line-height:1.5"><c:out value="${importOutput}"/></pre>
  <p class="small-meta mb-0">Báo cáo chi tiết lưu tại <code>listening-import-report.json</code> trong thư mục dự án. Nếu không nhận diện được cấu trúc SQLite, công cụ dừng trước khi ghi MySQL.</p>
 </section>
 <div class="alert alert-warning">Các bộ mới được nhập sẽ để <strong>Bản nháp</strong>. Bạn cần kiểm tra Part, audio, ảnh, transcript và đáp án trước khi công bố. Câu thiếu đáp án không được tự đoán.</div>
 </div></div></div></main>
<%@ include file="../../fragments/scripts.jspf" %>
