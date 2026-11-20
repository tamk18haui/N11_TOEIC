<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ include file="../../fragments/head.jspf" %>
<main class="admin-shell listening-admin-page"><div class="container container-n11 listening-container"><div class="row g-4 listening-layout">
 <div class="col-lg-3 listening-sidebar-col"><%@ include file="../../fragments/admin-sidebar.jspf" %></div>
 <div class="col-lg-9 listening-content-col">
  <a class="account-back" href="${pageContext.request.contextPath}/admin/listening">← Quản lý Listening</a>
  <h1 class="account-title mt-3">Kho tài nguyên Listening</h1>
  <p class="small-meta">Upload audio và hình ảnh, sau đó chọn tài nguyên trong form đoạn nghe hoặc câu hỏi.</p>
  <c:if test="${not empty successMessage}"><div class="alert alert-success"><c:out value="${successMessage}"/></div></c:if>
  <c:if test="${not empty errorMessage}"><div class="alert alert-danger"><c:out value="${errorMessage}"/></div></c:if>
  <section class="panel-card mb-4"><h2 class="account-section-title">Thêm tài nguyên</h2>
   <form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/listening/media/upload">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div class="row g-3 align-items-end"><div class="col-md-7"><label class="form-label" for="file">Chọn file *</label>
      <input id="file" type="file" name="file" class="form-control" required accept=".mp3,.wav,.ogg,.png,.jpg,.jpeg,.webp"/></div>
      <div class="col-md-3"><label class="form-label" for="duration">Thời lượng (giây)</label>
       <input id="duration" type="number" name="durationSeconds" class="form-control" min="0" max="86400" placeholder="Audio"/></div>
      <div class="col-md-2"><button class="btn btn-primary w-100" type="submit">Tải lên</button></div></div>
    <p class="small-meta mt-2 mb-0">Hỗ trợ MP3, WAV, OGG, PNG, JPG, WEBP · tối đa 25 MB/file. Không tự động đưa file vào Git.</p>
   </form></section>
  <section class="panel-card"><h2 class="account-section-title">Tài nguyên đã tải lên</h2>
   <div class="table-responsive"><table class="table align-middle"><thead><tr><th>ID</th><th>Loại</th><th>Nghe/Xem thử</th><th>Đường dẫn</th><th>Thao tác</th></tr></thead><tbody>
    <c:forEach items="${media}" var="m">
     <c:choose><c:when test="${fn:startsWith(m.file_url, 'https://res.cloudinary.com/')}"><c:set var="listeningAssetUrl" value="${m.file_url}"/></c:when>
     <c:otherwise><c:set var="listeningAssetUrl" value="${pageContext.request.contextPath}${m.file_url}"/></c:otherwise></c:choose>
     <tr><td>#${m.id}</td><td><c:out value="${m.media_type}"/></td>
     <td><c:choose><c:when test="${m.media_type eq 'AUDIO'}"><audio class="listening-audio" controls preload="none" src="${listeningAssetUrl}"></audio></c:when>
     <c:otherwise><img class="listening-thumb" alt="Hình ảnh Listening" src="${listeningAssetUrl}"/></c:otherwise></c:choose></td>
     <td><code class="listening-code"><c:out value="${m.file_url}"/></code></td>
     <td><form method="post" action="${pageContext.request.contextPath}/admin/listening/media/${m.id}/delete" onsubmit="return confirm('Xóa tài nguyên này? Chỉ xóa được nếu không có câu hỏi/đoạn nghe tham chiếu.');">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><button class="btn btn-outline-danger btn-sm" type="submit">Xóa</button></form></td></tr></c:forEach>
    <c:if test="${empty media}"><tr><td colspan="5" class="text-center small-meta py-4">Chưa có tài nguyên nào.</td></tr></c:if>
   </tbody></table></div></section>
 </div></div></div></main>
<%@ include file="../../fragments/scripts.jspf" %>
