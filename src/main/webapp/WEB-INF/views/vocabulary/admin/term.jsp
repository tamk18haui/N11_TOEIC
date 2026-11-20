<%@ page pageEncoding="UTF-8" %>
<%@ include file="../../fragments/head.jspf" %><%@ include file="../../fragments/header.jspf" %>
<main class="grammar-page grammar-admin"><div class="container grammar-wrap">
<%@ include file="../../grammar/alerts.jspf" %>
<a class="grammar-back" href="${pageContext.request.contextPath}/admin/vocabulary/topics/${topic.id}">← Quay lại <c:out value="${topic.title}"/></a>
<h1 class="h2 mb-4">${empty term.id ? 'Thêm từ vựng' : 'Chỉnh sửa từ vựng'}</h1>
<section class="panel-card"><form method="post" action="${pageContext.request.contextPath}/admin/vocabulary/terms/save">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"><input type="hidden" name="id" value="${term.id}"><input type="hidden" name="topicId" value="${term.topicId}">
  <div class="row"><div class="col-md-5 mb-3"><label class="form-label w-100">Từ tiếng Anh<input class="form-control" type="text" name="word" value="<c:out value='${term.word}'/>" required maxlength="160"></label></div><div class="col-md-4 mb-3"><label class="form-label w-100">Phiên âm IPA<input class="form-control" type="text" name="ipa" value="<c:out value='${term.ipa}'/>" maxlength="160"></label></div><div class="col-md-3 mb-3"><label class="form-label w-100">Audio media ID<input class="form-control" type="number" name="audioMediaId" value="${term.audioMediaId}" min="1"></label></div></div>
  <div class="mb-3"><label class="form-label w-100">Nghĩa tiếng Việt<input class="form-control" type="text" name="meaningVi" value="<c:out value='${term.meaningVi}'/>" required maxlength="500"></label></div>
  <div class="mb-3"><label class="form-label w-100">Định nghĩa tiếng Anh<textarea class="form-control" name="definitionEn" rows="3" maxlength="4000"><c:out value="${term.definitionEn}"/></textarea></label></div>
  <div class="mb-3"><label class="form-label w-100">Ví dụ tiếng Anh<textarea class="form-control" name="exampleEn" rows="3" maxlength="4000"><c:out value="${term.exampleEn}"/></textarea></label></div>
  <div class="mb-3"><label class="form-label w-100">Dịch ví dụ tiếng Việt<textarea class="form-control" name="exampleVi" rows="3" maxlength="4000"><c:out value="${term.exampleVi}"/></textarea></label></div>
  <button class="btn grammar-btn" type="submit">Lưu từ vựng</button>
</form></section>
<c:if test="${not empty term.id}"><form method="post" action="${pageContext.request.contextPath}/admin/vocabulary/topics/${topic.id}/terms/${term.id}/delete" onsubmit="return confirm('Xóa từ vựng này?');"><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"><button class="btn btn-outline-danger" type="submit">Xóa từ vựng</button></form></c:if>
</div></main>
<%@ include file="../../fragments/footer.jspf" %><%@ include file="../../fragments/scripts.jspf" %>
