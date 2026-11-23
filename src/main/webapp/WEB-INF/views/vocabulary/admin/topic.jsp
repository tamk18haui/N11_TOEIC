<%@ page pageEncoding="UTF-8" %>
<%@ include file="../../fragments/head.jspf" %><%@ include file="../../fragments/header.jspf" %>
<main class="grammar-page grammar-admin"><div class="container grammar-wrap">
<%@ include file="../../grammar/alerts.jspf" %>
<a class="grammar-back" href="${pageContext.request.contextPath}/admin/vocabulary">← Dashboard từ vựng</a>
<h1 class="h2 mb-4">${empty topic.id ? 'Thêm chủ đề' : 'Chỉnh sửa chủ đề'}</h1>
<section class="panel-card"><form method="post" action="${pageContext.request.contextPath}/admin/vocabulary/topics/save">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"><input type="hidden" name="id" value="${topic.id}">
  <div class="row"><div class="col-md-8 mb-3"><label class="form-label w-100">Tên chủ đề<input class="form-control" type="text" name="title" value="<c:out value='${topic.title}'/>" required maxlength="180"></label></div>
  <div class="col-md-4 mb-3"><label class="form-label w-100">Mức độ<select class="form-select" name="level"><option value="BASIC" ${topic.level eq 'BASIC' ? 'selected' : ''}>Cơ bản</option><option value="INTERMEDIATE" ${topic.level eq 'INTERMEDIATE' ? 'selected' : ''}>Trung cấp</option><option value="ADVANCED" ${topic.level eq 'ADVANCED' ? 'selected' : ''}>Nâng cao</option></select></label></div></div>
  <div class="mb-3"><label class="form-label w-100">Mô tả<textarea class="form-control" name="description" rows="3" maxlength="2000"><c:out value="${topic.description}"/></textarea></label></div>
  <div class="row"><div class="col-md-3 mb-3"><label class="form-label w-100">Thứ tự<input class="form-control" type="number" name="sortOrder" min="0" value="${topic.sortOrder}" required></label></div><div class="col-md-4"><label class="form-check mt-4"><input class="form-check-input" name="published" type="checkbox" value="true" ${topic.published ? 'checked' : ''}> Công bố chủ đề</label></div></div>
  <button class="btn grammar-btn" type="submit">Lưu chủ đề</button>
</form></section>

<c:if test="${not empty topic.id}">
  <section class="panel-card"><div class="d-flex justify-content-between align-items-center mb-3"><h2 class="h4 m-0">Bài học</h2><a class="btn btn-soft" href="${pageContext.request.contextPath}/admin/vocabulary/topics/${topic.id}/lessons/new">+ Thêm bài học</a></div>
  <c:forEach items="${lessons}" var="lesson"><div class="example-card d-flex justify-content-between gap-3"><div><strong><c:out value="${lesson.title}"/></strong><div class="small text-muted">Mục tiêu ${lesson.targetWordCount} từ · Thứ tự ${lesson.sortOrder}</div></div><a class="btn btn-sm btn-soft" href="${pageContext.request.contextPath}/admin/vocabulary/topics/${topic.id}/lessons/${lesson.id}">Sửa</a></div></c:forEach></section>
  <section class="panel-card"><div class="d-flex justify-content-between align-items-center mb-3"><div><h2 class="h4 m-0">Kho từ vựng</h2><p class="text-muted small mb-0">Tối thiểu 30 từ cho mỗi chủ đề.</p></div><a class="btn btn-soft" href="${pageContext.request.contextPath}/admin/vocabulary/topics/${topic.id}/terms/new">+ Thêm từ</a></div>
  <div class="grammar-notice mb-3">${terms.size()} / tối thiểu 30 từ</div>
  <div class="table-responsive"><table class="table"><thead><tr><th>Từ</th><th>Nghĩa</th><th>Ví dụ</th><th></th></tr></thead><tbody><c:forEach items="${terms}" var="term"><tr><td><strong><c:out value="${term.word}"/></strong><div class="small text-muted"><c:out value="${term.ipa}"/></div></td><td><c:out value="${term.meaningVi}"/></td><td><c:out value="${term.exampleEn}"/></td><td><a class="btn btn-sm btn-soft" href="${pageContext.request.contextPath}/admin/vocabulary/topics/${topic.id}/terms/${term.id}">Sửa</a></td></tr></c:forEach></tbody></table></div></section>
  <form method="post" action="${pageContext.request.contextPath}/admin/vocabulary/topics/${topic.id}/delete" onsubmit="return confirm('Chỉ xóa được chủ đề trống. Tiếp tục?');"><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"><button class="btn btn-outline-danger" type="submit">Xóa chủ đề</button></form>
</c:if>
</div></main>
<%@ include file="../../fragments/footer.jspf" %><%@ include file="../../fragments/scripts.jspf" %>
