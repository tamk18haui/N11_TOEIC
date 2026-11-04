<%-- File: index.jsp. Trang tổng quan Admin và các liên kết tới phân hệ quản trị TOEIC. --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/admin-layout-start.jspf" %>

<%-- Banner Dashboard: phối màu xanh trời và cam theo ảnh Anhngu24h. --%>
<section class="admin-welcome mb-4" aria-labelledby="adminDashboardTitle">
 <div class="d-flex flex-wrap align-items-center justify-content-between gap-3">
  <div>
   <span class="admin-hero-tag">✦ N11 TOEIC · Bảng điều khiển Admin</span>
   <h1 id="adminDashboardTitle" class="account-title mt-3">Quản trị TOEIC<br/><span class="admin-gradient-text">trực quan mỗi ngày</span></h1>
   <p class="small-meta mb-0">Quản lý học viên, học liệu và luyện thi TOEIC Listening &amp; Reading.</p>
  </div>
  <span class="admin-chip admin-chip-outline">Không gian quản trị</span>
 </div>
</section>

<%-- Các chỉ số tổng quan: giữ dấu gạch ngang đến khi kết nối dữ liệu thật. --%>
<div class="row g-3 mb-4">
 <div class="col-sm-6 col-xl-3"><div class="admin-stat admin-stat-modern admin-stat-sky"><span class="admin-stat-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#users"></use></svg></span><div class="small-meta">Học viên</div><strong class="num">—</strong><span class="admin-stat-note">Chờ kết nối thống kê</span></div></div>
 <div class="col-sm-6 col-xl-3"><div class="admin-stat admin-stat-modern admin-stat-warm"><span class="admin-stat-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#book"></use></svg></span><div class="small-meta">Bài ngữ pháp</div><strong class="num">—</strong><span class="admin-stat-note">Chờ kết nối thống kê</span></div></div>
 <div class="col-sm-6 col-xl-3"><div class="admin-stat admin-stat-modern admin-stat-mint"><span class="admin-stat-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#file-text"></use></svg></span><div class="small-meta">Đề thi</div><strong class="num">—</strong><span class="admin-stat-note">Chờ kết nối thống kê</span></div></div>
 <div class="col-sm-6 col-xl-3"><div class="admin-stat admin-stat-modern admin-stat-warm"><span class="admin-stat-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#trend"></use></svg></span><div class="small-meta">Lượt làm bài</div><strong class="num">—</strong><span class="admin-stat-note">Chờ kết nối thống kê</span></div></div>
</div>

<%-- Danh sách phân hệ quản trị; các thẻ dẫn đến trang tương ứng. --%>
<div class="d-flex align-items-center justify-content-between flex-wrap gap-2 mb-3">
 <h2 class="account-section-title mb-0">Quản lý chức năng TOEIC</h2>
 <span class="small-meta">Chức năng thực và khung giao diện đang phát triển</span>
</div>
<div class="row g-3 admin-module-grid mb-4">
 <div class="col-sm-6 col-xl-4"><a class="admin-module-card" href="${pageContext.request.contextPath}/admin/accounts"><span class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#users"></use></svg></span><strong>Tài khoản</strong><small>Học viên, Admin và phân quyền</small><span class="admin-chip admin-chip-green">Có xử lý MySQL</span></a></div>
 <div class="col-sm-6 col-xl-4"><a class="admin-module-card" href="${pageContext.request.contextPath}/admin/vocabulary"><span class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#book-open"></use></svg></span><strong>Từ vựng</strong><small>Chủ đề, từ vựng và học liệu</small><span class="admin-chip">Khung giao diện</span></a></div>
 <div class="col-sm-6 col-xl-4"><a class="admin-module-card" href="${pageContext.request.contextPath}/admin/grammar"><span class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#book"></use></svg></span><strong>Ngữ pháp</strong><small>Chuyên đề, bài học và câu hỏi</small><span class="admin-chip">Khung giao diện</span></a></div>
 <div class="col-sm-6 col-xl-4"><a class="admin-module-card" href="${pageContext.request.contextPath}/admin/listening"><span class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#headphones"></use></svg></span><strong>Listening</strong><small>Nghe hiểu TOEIC Part 1–4</small><span class="admin-chip">Khung giao diện</span></a></div>
 <div class="col-sm-6 col-xl-4"><a class="admin-module-card" href="${pageContext.request.contextPath}/admin/reading"><span class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#file-text"></use></svg></span><strong>Reading</strong><small>Đọc hiểu TOEIC Part 5–7</small><span class="admin-chip">Khung giao diện</span></a></div>
 <div class="col-sm-6 col-xl-4"><a class="admin-module-card" href="${pageContext.request.contextPath}/admin/exams"><span class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#file-text"></use></svg></span><strong>Đề thi thử</strong><small>Ngân hàng đề và thang điểm</small><span class="admin-chip">Khung giao diện</span></a></div>
 <div class="col-sm-6 col-xl-4"><a class="admin-module-card" href="${pageContext.request.contextPath}/admin/roadmap"><span class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#trend"></use></svg></span><strong>Lộ trình học</strong><small>Kế hoạch và nội dung học</small><span class="admin-chip">Khung giao diện</span></a></div>
 <div class="col-sm-6 col-xl-4"><a class="admin-module-card" href="${pageContext.request.contextPath}/admin/progress"><span class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#trend"></use></svg></span><strong>Tiến độ & thống kê</strong><small>Hoạt động học tập, kết quả</small><span class="admin-chip">Khung giao diện</span></a></div>
</div>

<%-- Thông báo phạm vi: không ghi giả số liệu học tập. --%>
<div class="admin-info-strip">Dữ liệu quản lý tài khoản lấy từ MySQL. Các phân hệ khác đã có khung giao diện, sẽ kết nối nghiệp vụ khi nhóm triển khai.</div>
<%@ include file="../fragments/admin-layout-end.jspf" %>
