<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/header.jspf" %>
<main class="auth-section"><div class="container container-n11"><div class="auth-card">
<span class="section-caption">CHÀO MỪNG QUAY LẠI</span><h1>Đăng nhập N11 TOEIC</h1><p>Học ngữ pháp, làm bài tập và lưu kết quả của bạn.</p>
<c:if test="${param.error != null}"><div class="alert alert-danger" role="alert">Email hoặc mật khẩu không đúng, hoặc tài khoản đã bị khóa.</div></c:if>
<form method="post" action="${pageContext.request.contextPath}/login">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<div class="mb-3"><label for="email" class="form-label">Email</label><input id="email" name="email" class="form-control" type="email" maxlength="191" autocomplete="username" required></div>
<div class="mb-4"><label for="password" class="form-label">Mật khẩu</label><input id="password" name="password" class="form-control" type="password" autocomplete="current-password" required></div>
<button class="btn btn-primary w-100" type="submit">Đăng nhập</button></form>
<p class="small text-muted mt-4 mb-0">Bạn vẫn có thể đọc bài giảng và ví dụ khi chưa đăng nhập.</p>
</div></div></main>
<%@ include file="../fragments/footer.jspf" %>
<%@ include file="../fragments/scripts.jspf" %>
