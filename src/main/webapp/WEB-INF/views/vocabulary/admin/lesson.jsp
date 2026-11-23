<%@ page pageEncoding="UTF-8" %>
<%@ include file="../../fragments/head.jspf" %><%@ include file="../../fragments/header.jspf" %>
<main class="grammar-page grammar-admin"><div class="container grammar-wrap">
<%@ include file="../../grammar/alerts.jspf" %>
<a class="grammar-back" href="${pageContext.request.contextPath}/admin/vocabulary/topics/${topic.id}">← Quay lại <c:out value="${topic.title}"/></a>
<h1 class="h2 mb-4">${empty lesson.id ? 'Thêm bài học' : 'Chỉnh sửa bài học'}</h1>
<section class="panel-card"><form method="post" action="${pageContext.request.contextPath}/admin/vocabulary/lessons/save">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"><input type="hidden" name="id" value="${lesson.id}"><input type="hidden" name="topicId" value="${lesson.topicId}">
  <div class="row"><div class="col-md-8 mb-3"><label class="form-label w-100">Tên bài học<input class="form-control" type="text" name="title" value="<c:out value='${lesson.title}'/>" required maxlength="200"></label></div><div class="col-md-4 mb-3"><label class="form-label w-100">Mục tiêu số từ<input class="form-control" type="number" name="targetWordCount" value="${lesson.targetWordCount}" min="10" max="36" required></label></div></div>
  <div class="mb-3"><label class="form-label w-100">Mô tả<textarea class="form-control" name="description" rows="4" maxlength="2000"><c:out value="${lesson.description}"/></textarea></label></div>
  <div class="row"><div class="col-md-4 mb-3"><label class="form-label w-100">Thứ tự<input class="form-control" type="number" name="sortOrder" min="0" value="${lesson.sortOrder}" required></label></div><div class="col-md-4"><label class="form-check mt-4"><input class="form-check-input" type="checkbox" name="published" value="true" ${lesson.published ? 'checked' : ''}> Công bố bài học</label></div></div>
  <button class="btn grammar-btn" type="submit">Lưu bài học</button>
</form></section>
<c:if test="${not empty lesson.id}"><form method="post" action="${pageContext.request.contextPath}/admin/vocabulary/topics/${topic.id}/lessons/${lesson.id}/delete" onsubmit="return confirm('Xóa bài học này?');"><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"><button class="btn btn-outline-danger" type="submit">Xóa bài học</button></form></c:if>
</div></main>
<%@ include file="../../fragments/footer.jspf" %><%@ include file="../../fragments/scripts.jspf" %>
