<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="activePage" value="admin-vocabulary" scope="request" />
<%@ include file="../../fragments/head.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vocabulary-v44.css?v=44" />
<%-- Bố cục JSP: sidebar, lưới 3/9 và nội dung. Màu/kích thước: admin-content-v19.css. --%>
<main data-n11-src="vocabulary/admin/index.jsp|1" class="v44-admin admin-shell grammar-page grammar-admin n11-admin-content"><div data-n11-src="vocabulary/admin/index.jsp|2" class="container container-n11"><div data-n11-src="vocabulary/admin/index.jsp|3" class="row g-4">
<div data-n11-src="vocabulary/admin/index.jsp|4" class="col-lg-3"><%@ include file="../../fragments/admin-sidebar.jspf" %></div>
<div data-n11-src="vocabulary/admin/index.jsp|5" class="col-lg-9 n11-content-main">
<%@ include file="../../grammar/alerts.jspf" %>

<div data-n11-src="vocabulary/admin/index.jsp|6" class="n11-content-hero">
  <div data-n11-src="vocabulary/admin/index.jsp|7"><span data-n11-src="vocabulary/admin/index.jsp|8" class="section-caption">QUẢN TRỊ NỘI DUNG</span><h1 data-n11-src="vocabulary/admin/index.jsp|9" class="account-title">Từ vựng TOEIC</h1><p data-n11-src="vocabulary/admin/index.jsp|10" class="text-muted">Quản lý chủ đề, bài học và kho từ vựng theo cùng mô hình ngữ pháp.</p></div>
  <a data-n11-src="vocabulary/admin/index.jsp|11" class="btn btn-primary" href="${pageContext.request.contextPath}/admin/vocabulary/topics/new">+ Thêm chủ đề</a>
</div>
<div data-n11-src="vocabulary/admin/index.jsp|12" class="row g-3 mb-4">
  <div data-n11-src="vocabulary/admin/index.jsp|13" class="col-6 col-lg-3"><div data-n11-src="vocabulary/admin/index.jsp|14" class="admin-stat n11-content-stat"><span data-n11-src="vocabulary/admin/index.jsp|15">Chủ đề</span><h2 data-n11-src="vocabulary/admin/index.jsp|16">${stats.topics}</h2></div></div>
  <div data-n11-src="vocabulary/admin/index.jsp|17" class="col-6 col-lg-3"><div data-n11-src="vocabulary/admin/index.jsp|18" class="admin-stat n11-content-stat"><span data-n11-src="vocabulary/admin/index.jsp|19">Bài học</span><h2 data-n11-src="vocabulary/admin/index.jsp|20">${stats.lessons}</h2></div></div>
  <div data-n11-src="vocabulary/admin/index.jsp|21" class="col-6 col-lg-3"><div data-n11-src="vocabulary/admin/index.jsp|22" class="admin-stat n11-content-stat"><span data-n11-src="vocabulary/admin/index.jsp|23">Từ vựng</span><h2 data-n11-src="vocabulary/admin/index.jsp|24">${stats.terms}</h2></div></div>
  <div data-n11-src="vocabulary/admin/index.jsp|25" class="col-6 col-lg-3"><div data-n11-src="vocabulary/admin/index.jsp|26" class="admin-stat n11-content-stat"><span data-n11-src="vocabulary/admin/index.jsp|27">Lượt làm bài</span><h2 data-n11-src="vocabulary/admin/index.jsp|28">${stats.attempts}</h2></div></div>
</div>
<section data-n11-src="vocabulary/admin/index.jsp|29" class="panel-card"><h2 data-n11-src="vocabulary/admin/index.jsp|30" class="h4 mb-3">Chủ đề từ vựng</h2>
  <div data-n11-src="vocabulary/admin/index.jsp|31" class="admin-table-wrap"><table data-n11-src="vocabulary/admin/index.jsp|32" class="table"><thead data-n11-src="vocabulary/admin/index.jsp|33"><tr data-n11-src="vocabulary/admin/index.jsp|34"><th data-n11-src="vocabulary/admin/index.jsp|35">Chủ đề</th><th data-n11-src="vocabulary/admin/index.jsp|36">Mức độ</th><th data-n11-src="vocabulary/admin/index.jsp|37">Trạng thái</th><th data-n11-src="vocabulary/admin/index.jsp|38">Thao tác</th></tr></thead>
  <tbody data-n11-src="vocabulary/admin/index.jsp|39"><c:forEach items="${topics}" var="topic"><tr data-n11-src="vocabulary/admin/index.jsp|40">
    <td data-n11-src="vocabulary/admin/index.jsp|41"><a data-n11-src="vocabulary/admin/index.jsp|42" class="fw-bold" href="${pageContext.request.contextPath}/admin/vocabulary/topics/${topic.id}"><c:out value="${topic.title}"/></a><div data-n11-src="vocabulary/admin/index.jsp|43" class="small text-muted"><c:out value="${topic.description}"/></div></td>
    <td data-n11-src="vocabulary/admin/index.jsp|44">${topic.level}</td><td data-n11-src="vocabulary/admin/index.jsp|45"><span data-n11-src="vocabulary/admin/index.jsp|46" class="badge ${topic.published ? 'bg-success' : 'bg-secondary'}">${topic.published ? 'Công bố' : 'Bản nháp'}</span></td>
    <td data-n11-src="vocabulary/admin/index.jsp|47"><a data-n11-src="vocabulary/admin/index.jsp|48" class="btn btn-sm btn-soft" href="${pageContext.request.contextPath}/admin/vocabulary/topics/${topic.id}">Quản lý</a></td>
  </tr></c:forEach><c:if test="${empty topics}"><tr data-n11-src="vocabulary/admin/index.jsp|49"><td data-n11-src="vocabulary/admin/index.jsp|50" colspan="4" class="n11-empty">Chưa có chủ đề. Chọn Thêm chủ đề để bắt đầu.</td></tr></c:if></tbody></table></div>
</section>
</div></div></div></main>
<script src="${pageContext.request.contextPath}/assets/js/vocabulary-v44.js?v=44"></script>
<%@ include file="../../fragments/scripts.jspf" %>
