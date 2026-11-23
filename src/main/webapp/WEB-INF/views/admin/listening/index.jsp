<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ include file="../../fragments/head.jspf" %>
<main class="admin-shell listening-admin-page"><div class="container container-n11 listening-container"><div class="row g-4 listening-layout">
 <div class="col-lg-3 listening-sidebar-col"><%@ include file="../../fragments/admin-sidebar.jspf" %></div>
 <div class="col-lg-9 listening-content-col">
  <!-- N11 FORUM V9: HERO -->
  <%-- Khu vuc tieu de: co the sua chu truc tiep tai day. --%>
  <header class="ff-hero">
   <div class="ff-hero-main">
    <span class="ff-kicker">QUẢN TRỊ NỘI DUNG · TOEIC</span>
    <h1>Quản lý Listening</h1>
    <p>Quản lý bộ luyện nghe, câu hỏi, đáp án và tài nguyên Part 1–4.</p>
   </div>
   <div class="ff-hero-stats" aria-label="Thống kê Listening">
    <div class="ff-stat"><strong>${fn:length(sets)}</strong><span>Bộ luyện nghe</span></div>
    <div class="ff-stat"><strong>04</strong><span>Part 1–4</span></div>
   </div>
  </header>
  <%-- Nut giu nguyen duong dan Java/Spring Boot dang su dung. --%>
  <div class="ff-action-bar">
   <a class="btn btn-primary" href="${pageContext.request.contextPath}/admin/listening/sets/new">+ Tạo bộ luyện nghe</a>
   <a class="btn btn-soft" href="${pageContext.request.contextPath}/admin/listening/import">Nhập hàng loạt</a>
   <a class="btn btn-soft" href="${pageContext.request.contextPath}/admin/listening/media">Kho audio / hình ảnh</a>
  </div>
  <c:if test="${not empty successMessage}"><div class="alert alert-success" role="status"><c:out value="${successMessage}" /></div></c:if>
  <c:if test="${not empty errorMessage}"><div class="alert alert-danger" role="alert"><c:out value="${errorMessage}" /></div></c:if>
<!-- N11 LISTENING V8: responsive index -->
  <section class="panel-card listening-filter-panel mb-4">
   <form method="get" action="${pageContext.request.contextPath}/admin/listening" class="listening-filter-form">
    <div class="listening-filter-field"><label class="form-label" for="partSelect">Lọc theo Part</label>
     <select id="partSelect" name="part" class="form-select">
      <option value="">Tất cả Part</option><c:forEach begin="1" end="4" var="n"><option value="${n}" ${partFilter eq n ? 'selected' : ''}>Part ${n}</option></c:forEach>
     </select></div>
    <button class="btn btn-primary" type="submit">Áp dụng bộ lọc</button>
    <span class="listening-filter-result">Hiển thị <b>${fn:length(sets)}</b> bộ luyện nghe</span>
   </form>
  </section>
    <section class="panel-card listening-sets-panel">
   <div class="listening-section-head"><div><div class="listening-eyebrow">QUẢN LÝ NỘI DUNG</div><h2 class="account-section-title mb-0">Các bộ luyện nghe</h2></div><span class="listening-set-total">${fn:length(sets)} bộ</span></div>
   <div class="listening-table-scroll" role="region" aria-label="Các bộ luyện nghe" tabindex="0"><table class="table listening-sets-table align-middle">
    <thead><tr><th>Bộ luyện nghe</th><th>Part</th><th>Độ khó</th><th>Câu</th><th>Đoạn</th><th>Trạng thái</th><th>Thao tác</th></tr></thead>
    <tbody><c:forEach items="${sets}" var="s"><tr>
     <td class="listening-set-name"><strong>
       <c:choose><c:when test="${fn:contains(s.title, 'UNKNOWN - batch')}">Listening Part ${s.part_no} · Bộ #${s.id}</c:when><c:otherwise><c:out value="${s.title}"/></c:otherwise></c:choose>
      </strong><c:if test="${fn:contains(s.title, 'UNKNOWN - batch')}"><div class="listening-set-subtitle" title="${fn:escapeXml(s.title)}">Dữ liệu nhập tự động · <c:out value="${s.title}"/></div></c:if>
      <div class="listening-set-code">Mã bộ: #${s.id}</div></td>
     <td><span class="listening-part-pill">Part ${s.part_no}</span></td>
     <td><span class="listening-level"><c:out value="${s.difficulty}"/></span></td>
     <td class="listening-numeric">${s.question_count}</td><td class="listening-numeric">${s.passage_count}</td>
     <td><span class="badge-status ${s.is_published ? 'good' : 'warn'}">${s.is_published ? 'Đã công bố' : 'Bản nháp'}</span></td>
     <td class="listening-set-action"><a class="btn btn-soft btn-sm" href="${pageContext.request.contextPath}/admin/listening/sets/${s.id}">Quản lý</a></td>
    </tr></c:forEach><c:if test="${empty sets}"><tr><td colspan="7" class="text-center text-muted py-4">Chưa có bộ luyện nghe nào trong CSDL.</td></tr></c:if></tbody>
   </table></div>
  </section>
  <p class="small-meta mt-3">Dữ liệu dùng chung các bảng practice_* với Reading. Trang này chỉ quản lý các bản ghi có skill=LISTENING.</p>
 </div></div></div></main>
<%@ include file="../../fragments/scripts.jspf" %>
