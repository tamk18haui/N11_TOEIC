<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/exam-student.css?v=2.0" />
<%@ include file="../fragments/header.jspf" %>
<main class="n11-exam"><div class="container container-n11 py-5"><div class="exam-empty"><div class="exam-empty-symbol">!</div><h1>Chưa thể mở bài thi</h1><p><c:out value="${message}" default="Đã xảy ra lỗi khi xử lý bài thi." /></p><a href="${pageContext.request.contextPath}/exams" class="exam-primary-button exam-button-link">Quay về danh sách đề</a></div></div></main>
<%@ include file="../fragments/footer.jspf" %>
<%@ include file="../fragments/scripts.jspf" %>
