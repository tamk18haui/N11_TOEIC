<%-- N11 SOURCE NOTES V24: JSP dựng bố cục và hiển thị dữ liệu từ Controller. class="..." nối CSS; form action/method xác định endpoint và phương thức gửi. c:forEach lặp dữ liệu; c:if kiểm tra điều kiện; c:out hiển thị văn bản an toàn. Không đặt nghiệp vụ ở JSP. --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../../fragments/head.jspf" %>
<c:if test="${importRunning}">
 <script>setTimeout(function(){window.location.reload();},3000);</script>
</c:if>
<main data-n11-src="admin/listening/import.jsp|1" class="admin-shell listening-admin-page"><div data-n11-src="admin/listening/import.jsp|2" class="container container-n11 listening-container"><div data-n11-src="admin/listening/import.jsp|3" class="row g-4 listening-layout">
 <div data-n11-src="admin/listening/import.jsp|4" class="col-lg-3 listening-sidebar-col"><%@ include file="../../fragments/admin-sidebar.jspf" %></div>
 <div data-n11-src="admin/listening/import.jsp|5" class="col-lg-9 listening-content-col">
 <a data-n11-src="admin/listening/import.jsp|6" class="account-back" href="${pageContext.request.contextPath}/admin/listening">← Quản lý Listening</a>
 <h1 data-n11-src="admin/listening/import.jsp|7" class="account-title mt-3 mb-3">Nhập hàng loạt dữ liệu Listening</h1>
 <p data-n11-src="admin/listening/import.jsp|8" class="small-meta">Nhập học liệu Listening từ kho dữ liệu cục bộ.</p>
<a data-n11-src="admin/listening/import.jsp|900" class="btn btn-soft mb-3" href="${pageContext.request.contextPath}/admin/exams/offline">Cài đặt Local / Cloudinary</a>
 <section data-n11-src="admin/listening/import.jsp|9" class="panel-card mb-4">
  <h2 data-n11-src="admin/listening/import.jsp|10" class="account-section-title">Nguồn dữ liệu hiện tại</h2>
  <p data-n11-src="admin/listening/import.jsp|11" class="mb-1"><strong data-n11-src="admin/listening/import.jsp|12">CSDL SQLite:</strong> <code><c:out value="${bankPath}"/></code></p>
  <p data-n11-src="admin/listening/import.jsp|13" class="mb-3"><strong data-n11-src="admin/listening/import.jsp|14">Kho audio/ảnh:</strong> <code><c:out value="${mediaPath}"/></code></p>
  
  <div data-n11-src="admin/listening/import.jsp|15" class="d-flex flex-wrap gap-3">
   <form data-n11-src="admin/listening/import.jsp|16" method="post" action="${pageContext.request.contextPath}/admin/listening/import/scan">
    <%-- CSRF token bảo vệ yêu cầu POST. --%><input data-n11-src="admin/listening/import.jsp|17" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <button data-n11-src="admin/listening/import.jsp|18" type="submit" class="btn btn-soft" ${importRunning ? 'disabled' : ''}>1. Quét, kiểm tra dữ liệu</button>
   </form>
   <form data-n11-src="admin/listening/import.jsp|19" method="post" action="${pageContext.request.contextPath}/admin/listening/import/apply" onsubmit="return confirm('Chỉ nhập câu đủ đáp án, tạo bộ Listening ở trạng thái NHÁP. Bạn đã xem kết quả kiểm tra và sao lưu CSDL?');">
    <input data-n11-src="admin/listening/import.jsp|20" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <button data-n11-src="admin/listening/import.jsp|21" type="submit" class="btn btn-primary" ${importRunning ? 'disabled' : ''}>2. Nhập dữ liệu</button>
   </form>
  </div>
 </section>
 <section data-n11-src="admin/listening/import.jsp|22" class="panel-card mb-4">
  <h2 data-n11-src="admin/listening/import.jsp|23" class="account-section-title">Trạng thái: <c:out value="${importStatus}"/></h2>
  <pre style="max-height:420px;overflow:auto;white-space:pre-wrap;overflow-wrap:anywhere;font-size:13px;line-height:1.5"><c:out value="${importOutput}"/></pre>
  
 </section>
 <div data-n11-src="admin/listening/import.jsp|24" class="alert alert-warning">Các bộ mới được nhập sẽ để <strong data-n11-src="admin/listening/import.jsp|25">Bản nháp</strong>. Bạn cần kiểm tra Part, audio, ảnh, transcript và đáp án trước khi công bố. Câu thiếu đáp án không được tự đoán.</div>
 </div></div></div></main>
<%@ include file="../../fragments/scripts.jspf" %>
