<%@ page pageEncoding="UTF-8" %>
<%@ include file="../../fragments/head.jspf" %><%@ include file="../../fragments/header.jspf" %>
<main class="grammar-page grammar-admin"><div class="container grammar-wrap">
<%@ include file="../../grammar/alerts.jspf" %>

<div class="d-flex justify-content-between gap-3 flex-wrap mb-4">
  <div><span class="section-caption">QUẢN TRỊ NỘI DUNG</span><h1 class="h2">Từ vựng TOEIC</h1><p class="text-muted">Quản lý chủ đề, bài học và kho từ vựng theo cùng mô hình ngữ pháp.</p></div>
  <a class="btn grammar-btn" href="${pageContext.request.contextPath}/admin/vocabulary/topics/new">+ Thêm chủ đề</a>
</div>
<div class="row g-3 mb-4">
  <div class="col-6 col-lg-3"><div class="stat-card"><span>Chủ đề</span><h2>${stats.topics}</h2></div></div>
  <div class="col-6 col-lg-3"><div class="stat-card"><span>Bài học</span><h2>${stats.lessons}</h2></div></div>
  <div class="col-6 col-lg-3"><div class="stat-card"><span>Từ vựng</span><h2>${stats.terms}</h2></div></div>
  <div class="col-6 col-lg-3"><div class="stat-card"><span>Lượt làm bài</span><h2>${stats.attempts}</h2></div></div>
</div>
<section class="panel-card"><h2 class="h4 mb-3">Chủ đề từ vựng</h2>
  <div class="table-responsive"><table class="table"><thead><tr><th>Chủ đề</th><th>Mức độ</th><th>Trạng thái</th><th>Thao tác</th></tr></thead>
  <tbody><c:forEach items="${topics}" var="topic"><tr>
    <td><a class="fw-bold" href="${pageContext.request.contextPath}/admin/vocabulary/topics/${topic.id}"><c:out value="${topic.title}"/></a><div class="small text-muted"><c:out value="${topic.description}"/></div></td>
    <td>${topic.level}</td><td><span class="badge ${topic.published ? 'bg-success' : 'bg-secondary'}">${topic.published ? 'Công bố' : 'Bản nháp'}</span></td>
    <td><a class="btn btn-sm btn-soft" href="${pageContext.request.contextPath}/admin/vocabulary/topics/${topic.id}">Quản lý</a></td>
  </tr></c:forEach></tbody></table></div>
</section>
</div></main>
<%@ include file="../../fragments/footer.jspf" %><%@ include file="../../fragments/scripts.jspf" %>
