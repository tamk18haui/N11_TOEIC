<%-- File: index.jsp. Trang tổng quan Admin và các liên kết tới phân hệ quản trị TOEIC. --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<main class="admin-shell"><div class="container container-n11"><div class="row g-4">
  <div class="col-lg-3"><%@ include file="../fragments/admin-sidebar.jspf" %></div>
  <div class="col-lg-9">

<%-- Banner Dashboard: phối màu xanh trời và cam theo ảnh Anhngu24h. --%>
<%-- =============================================================
     DASHBOARD ADMIN V10 - Thiet ke tong mau ForumFlash.
     Chu va lien ket co the sua ngay tai day, khong can sua Java.
     ============================================================= --%>
<%-- =============================================================
  ADMIN DASHBOARD - V13
  PHẦN DỄ SỬA: tiêu đề, mô tả, liên kết trong banner ở đây.
  MÀU/KÍCH THƯỚC: assets/css/admin-polish-v13.css
  HÌNH TRANG TRÍ: assets/img/admin-study-v13.svg
  Không thay đổi dữ liệu thật từ MySQL hay nội dung các trang khác.
============================================================= --%>
<section class="admin-welcome af-home-hero n11-hero-v13 mb-4" aria-labelledby="adminDashboardTitle">
  <div class="n11-hero-v13__layout">
    <div class="n11-hero-v13__content">
      <span class="n11-hero-v13__eyebrow"><span aria-hidden="true" class="n11-hero-v13__dot"></span>N11 TOEIC <span class="n11-hero-v13__sep">/</span> QUẢN TRỊ HỌC TẬP</span>
      <h1 id="adminDashboardTitle" class="n11-hero-v13__title">
        Quản lý dễ dàng.<br/><span>Học tập hiệu quả.</span>
      </h1>
      <p class="n11-hero-v13__description">Quản lý học viên, nội dung và ngân hàng luyện thi TOEIC trong một không gian thống nhất.</p>
      <div class="n11-hero-v13__actions">
        <a class="btn n11-hero-v13__btn-main" href="${pageContext.request.contextPath}/admin/listening">Quản lý Listening <span aria-hidden="true">&#8594;</span></a>
        <a class="btn n11-hero-v13__btn-outline" href="${pageContext.request.contextPath}/admin/accounts">Quản lý tài khoản</a>
      </div>
      <div class="n11-hero-v13__footer" aria-label="Các phân hệ TOEIC">
        <span>LISTENING <b>PART 1–4</b></span>
        <span aria-hidden="true" class="n11-hero-v13__footer-sep"></span>
        <span>READING <b>PART 5–7</b></span>
      </div>
    </div>
    <%-- Ảnh SVG do dự án lưu cục bộ: không cần mạng, không chèn ảnh của website tham khảo. --%>
    <div class="n11-hero-v13__visual" aria-hidden="true">
      <img class="n11-hero-v13__art" src="${pageContext.request.contextPath}/assets/img/admin-study-v13.svg" alt="" />
    </div>
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
 <div class="col-sm-6 col-xl-4"><a class="admin-module-card" href="${pageContext.request.contextPath}/admin/listening"><span class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#headphones"></use></svg></span><strong>Listening</strong><small>Nghe hiểu TOEIC Part 1–4</small><span class="admin-chip admin-chip-green">Có trang quản lý</span></a></div>
 <div class="col-sm-6 col-xl-4"><a class="admin-module-card" href="${pageContext.request.contextPath}/admin/reading"><span class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#file-text"></use></svg></span><strong>Reading</strong><small>Đọc hiểu TOEIC Part 5–7</small><span class="admin-chip">Khung giao diện</span></a></div>
 <div class="col-sm-6 col-xl-4"><a class="admin-module-card" href="${pageContext.request.contextPath}/admin/exams"><span class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#file-text"></use></svg></span><strong>Đề thi thử</strong><small>Ngân hàng đề và thang điểm</small><span class="admin-chip">Khung giao diện</span></a></div>
 <div class="col-sm-6 col-xl-4"><a class="admin-module-card" href="${pageContext.request.contextPath}/admin/roadmap"><span class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#trend"></use></svg></span><strong>Lộ trình học</strong><small>Kế hoạch và nội dung học</small><span class="admin-chip">Khung giao diện</span></a></div>
 <div class="col-sm-6 col-xl-4"><a class="admin-module-card" href="${pageContext.request.contextPath}/admin/progress"><span class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#trend"></use></svg></span><strong>Tiến độ & thống kê</strong><small>Hoạt động học tập, kết quả</small><span class="admin-chip">Khung giao diện</span></a></div>
</div>

<%-- Thông báo phạm vi: không ghi giả số liệu học tập. --%>
<div class="admin-info-strip">Dữ liệu quản lý tài khoản lấy từ MySQL. Các phân hệ khác đã có khung giao diện, sẽ kết nối nghiệp vụ khi nhóm triển khai.</div>
  </div>
</div></div></main>
<%@ include file="../fragments/scripts.jspf" %>
