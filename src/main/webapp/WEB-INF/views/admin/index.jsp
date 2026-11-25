<%-- N11 SOURCE NOTES V24: JSP dựng bố cục và hiển thị dữ liệu từ Controller. class="..." nối CSS; form action/method xác định endpoint và phương thức gửi. c:forEach lặp dữ liệu; c:if kiểm tra điều kiện; c:out hiển thị văn bản an toàn. Không đặt nghiệp vụ ở JSP. --%>
<%-- File: index.jsp. Trang tổng quan Admin và các liên kết tới phân hệ quản trị TOEIC. --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<main data-n11-src="admin/index.jsp|1" class="admin-shell"><div data-n11-src="admin/index.jsp|2" class="container container-n11"><div data-n11-src="admin/index.jsp|3" class="row g-4">
  <div data-n11-src="admin/index.jsp|4" class="col-lg-3"><%@ include file="../fragments/admin-sidebar.jspf" %></div>
  <div data-n11-src="admin/index.jsp|5" class="col-lg-9">

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
<section data-n11-src="admin/index.jsp|6" class="admin-welcome af-home-hero n11-hero-v13 mb-4" aria-labelledby="adminDashboardTitle">
  <div data-n11-src="admin/index.jsp|7" class="n11-hero-v13__layout">
    <div data-n11-src="admin/index.jsp|8" class="n11-hero-v13__content">
      <span data-n11-src="admin/index.jsp|9" class="n11-hero-v13__eyebrow"><span data-n11-src="admin/index.jsp|10" aria-hidden="true" class="n11-hero-v13__dot"></span>N11 TOEIC <span data-n11-src="admin/index.jsp|11" class="n11-hero-v13__sep">/</span> QUẢN TRỊ HỌC TẬP</span>
      <h1 data-n11-src="admin/index.jsp|12" id="adminDashboardTitle" class="n11-hero-v13__title">
        Quản lý dễ dàng.<br/><span data-n11-src="admin/index.jsp|13">Học tập hiệu quả.</span>
      </h1>
      <p data-n11-src="admin/index.jsp|14" class="n11-hero-v13__description">Quản lý học viên, nội dung và ngân hàng luyện thi TOEIC trong một không gian thống nhất.</p>
      <div data-n11-src="admin/index.jsp|15" class="n11-hero-v13__actions">
        <a data-n11-src="admin/index.jsp|16" class="btn n11-hero-v13__btn-main" href="${pageContext.request.contextPath}/admin/listening">Quản lý Listening <span data-n11-src="admin/index.jsp|17" aria-hidden="true">&#8594;</span></a>
        <a data-n11-src="admin/index.jsp|18" class="btn n11-hero-v13__btn-outline" href="${pageContext.request.contextPath}/admin/accounts">Quản lý tài khoản</a>
      </div>
      <div data-n11-src="admin/index.jsp|19" class="n11-hero-v13__footer" aria-label="Các phân hệ TOEIC">
        <span data-n11-src="admin/index.jsp|20">LISTENING <b data-n11-src="admin/index.jsp|21">PART 1–4</b></span>
        <span data-n11-src="admin/index.jsp|22" aria-hidden="true" class="n11-hero-v13__footer-sep"></span>
        <span data-n11-src="admin/index.jsp|23">READING <b data-n11-src="admin/index.jsp|24">PART 5–7</b></span>
      </div>
    </div>
    <%-- Ảnh SVG do dự án lưu cục bộ: không cần mạng, không chèn ảnh của website tham khảo. --%>
    <div data-n11-src="admin/index.jsp|25" class="n11-hero-v13__visual" aria-hidden="true">
      <img data-n11-src="admin/index.jsp|26" class="n11-hero-v13__art" src="${pageContext.request.contextPath}/assets/img/admin-study-v13.svg" alt="" />
    </div>
  </div>
</section>

<%-- Các chỉ số tổng quan: giữ dấu gạch ngang đến khi kết nối dữ liệu thật. --%>
<div data-n11-src="admin/index.jsp|27" class="row g-3 mb-4">
 <div data-n11-src="admin/index.jsp|28" class="col-sm-6 col-xl-3"><div data-n11-src="admin/index.jsp|29" class="admin-stat admin-stat-modern admin-stat-sky"><span data-n11-src="admin/index.jsp|30" class="admin-stat-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#users"></use></svg></span><div data-n11-src="admin/index.jsp|31" class="small-meta">Học viên</div><strong data-n11-src="admin/index.jsp|32" class="num">—</strong><span data-n11-src="admin/index.jsp|33" class="admin-stat-note">Chờ kết nối thống kê</span></div></div>
 <div data-n11-src="admin/index.jsp|34" class="col-sm-6 col-xl-3"><div data-n11-src="admin/index.jsp|35" class="admin-stat admin-stat-modern admin-stat-warm"><span data-n11-src="admin/index.jsp|36" class="admin-stat-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#book"></use></svg></span><div data-n11-src="admin/index.jsp|37" class="small-meta">Bài ngữ pháp</div><strong data-n11-src="admin/index.jsp|38" class="num">—</strong><span data-n11-src="admin/index.jsp|39" class="admin-stat-note">Chờ kết nối thống kê</span></div></div>
 <div data-n11-src="admin/index.jsp|40" class="col-sm-6 col-xl-3"><div data-n11-src="admin/index.jsp|41" class="admin-stat admin-stat-modern admin-stat-mint"><span data-n11-src="admin/index.jsp|42" class="admin-stat-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#file-text"></use></svg></span><div data-n11-src="admin/index.jsp|43" class="small-meta">Đề thi</div><strong data-n11-src="admin/index.jsp|44" class="num">—</strong><span data-n11-src="admin/index.jsp|45" class="admin-stat-note">Chờ kết nối thống kê</span></div></div>
 <div data-n11-src="admin/index.jsp|46" class="col-sm-6 col-xl-3"><div data-n11-src="admin/index.jsp|47" class="admin-stat admin-stat-modern admin-stat-warm"><span data-n11-src="admin/index.jsp|48" class="admin-stat-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#trend"></use></svg></span><div data-n11-src="admin/index.jsp|49" class="small-meta">Lượt làm bài</div><strong data-n11-src="admin/index.jsp|50" class="num">—</strong><span data-n11-src="admin/index.jsp|51" class="admin-stat-note">Chờ kết nối thống kê</span></div></div>
</div>

<%-- Danh sách phân hệ quản trị; các thẻ dẫn đến trang tương ứng. --%>
<div data-n11-src="admin/index.jsp|52" class="d-flex align-items-center justify-content-between flex-wrap gap-2 mb-3">
 <h2 data-n11-src="admin/index.jsp|53" class="account-section-title mb-0">Quản lý chức năng TOEIC</h2>
 <span data-n11-src="admin/index.jsp|54" class="small-meta">Chức năng thực và khung giao diện đang phát triển</span>
</div>
<div data-n11-src="admin/index.jsp|55" class="row g-3 admin-module-grid mb-4">
 <div data-n11-src="admin/index.jsp|56" class="col-sm-6 col-xl-4"><a data-n11-src="admin/index.jsp|57" class="admin-module-card" href="${pageContext.request.contextPath}/admin/accounts"><span data-n11-src="admin/index.jsp|58" class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#users"></use></svg></span><strong data-n11-src="admin/index.jsp|59">Tài khoản</strong><small data-n11-src="admin/index.jsp|60">Học viên, Admin và phân quyền</small></a></div>
 <div data-n11-src="admin/index.jsp|61" class="col-sm-6 col-xl-4"><a data-n11-src="admin/index.jsp|62" class="admin-module-card" href="${pageContext.request.contextPath}/admin/vocabulary"><span data-n11-src="admin/index.jsp|63" class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#book-open"></use></svg></span><strong data-n11-src="admin/index.jsp|64">Từ vựng</strong><small data-n11-src="admin/index.jsp|65">Chủ đề, từ vựng và học liệu</small><span data-n11-src="admin/index.jsp|66" class="admin-chip">Khung giao diện</span></a></div>
 <div data-n11-src="admin/index.jsp|67" class="col-sm-6 col-xl-4"><a data-n11-src="admin/index.jsp|68" class="admin-module-card" href="${pageContext.request.contextPath}/admin/grammar"><span data-n11-src="admin/index.jsp|69" class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#book"></use></svg></span><strong data-n11-src="admin/index.jsp|70">Ngữ pháp</strong><small data-n11-src="admin/index.jsp|71">Chuyên đề, bài học và câu hỏi</small><span data-n11-src="admin/index.jsp|72" class="admin-chip">Khung giao diện</span></a></div>
 <div data-n11-src="admin/index.jsp|73" class="col-sm-6 col-xl-4"><a data-n11-src="admin/index.jsp|74" class="admin-module-card" href="${pageContext.request.contextPath}/admin/listening"><span data-n11-src="admin/index.jsp|75" class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#headphones"></use></svg></span><strong data-n11-src="admin/index.jsp|76">Listening</strong><small data-n11-src="admin/index.jsp|77">Nghe hiểu TOEIC Part 1–4</small></a></div>
 <div data-n11-src="admin/index.jsp|78" class="col-sm-6 col-xl-4"><a data-n11-src="admin/index.jsp|79" class="admin-module-card" href="${pageContext.request.contextPath}/admin/reading"><span data-n11-src="admin/index.jsp|80" class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#file-text"></use></svg></span><strong data-n11-src="admin/index.jsp|81">Reading</strong><small data-n11-src="admin/index.jsp|82">Đọc hiểu TOEIC Part 5–7</small></a></div>
 <div data-n11-src="admin/index.jsp|83" class="col-sm-6 col-xl-4"><a data-n11-src="admin/index.jsp|84" class="admin-module-card" href="${pageContext.request.contextPath}/admin/exams"><span data-n11-src="admin/index.jsp|85" class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#file-text"></use></svg></span><strong data-n11-src="admin/index.jsp|86">Đề thi thử</strong><small data-n11-src="admin/index.jsp|87">Ngân hàng đề và thang điểm</small><span data-n11-src="admin/index.jsp|88" class="admin-chip">Khung giao diện</span></a></div>
 <div data-n11-src="admin/index.jsp|89" class="col-sm-6 col-xl-4"><a data-n11-src="admin/index.jsp|90" class="admin-module-card" href="${pageContext.request.contextPath}/admin/roadmap"><span data-n11-src="admin/index.jsp|91" class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#trend"></use></svg></span><strong data-n11-src="admin/index.jsp|92">Lộ trình học</strong><small data-n11-src="admin/index.jsp|93">Kế hoạch và nội dung học</small><span data-n11-src="admin/index.jsp|94" class="admin-chip">Khung giao diện</span></a></div>
 <div data-n11-src="admin/index.jsp|95" class="col-sm-6 col-xl-4"><a data-n11-src="admin/index.jsp|96" class="admin-module-card" href="${pageContext.request.contextPath}/admin/progress"><span data-n11-src="admin/index.jsp|97" class="admin-module-icon"><svg class="icon" aria-hidden="true"><use href="${pageContext.request.contextPath}/assets/img/icons.svg#trend"></use></svg></span><strong data-n11-src="admin/index.jsp|98">Tiến độ & thống kê</strong><small data-n11-src="admin/index.jsp|99">Hoạt động học tập, kết quả</small><span data-n11-src="admin/index.jsp|100" class="admin-chip">Khung giao diện</span></a></div>
</div>

<%-- Thông báo phạm vi: không ghi giả số liệu học tập. --%>

  </div>
</div></div></main>
<%@ include file="../fragments/scripts.jspf" %>
