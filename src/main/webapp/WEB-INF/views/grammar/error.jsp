<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %><%@ include file="../fragments/header.jspf" %>
<main class="grammar-page"><div class="container grammar-detail"><div class="grammar-empty"><h1 class="h3">Vui lòng kiểm tra dữ liệu</h1><p><c:out value="${error}"/></p><a class="btn grammar-btn" href="${pageContext.request.contextPath}/grammar">Về danh sách bài học</a></div></div></main>
<%@ include file="../fragments/footer.jspf" %><%@ include file="../fragments/scripts.jspf" %>
