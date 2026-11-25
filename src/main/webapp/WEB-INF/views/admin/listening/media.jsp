<%-- N11 SOURCE NOTES V24: JSP dựng bố cục và hiển thị dữ liệu từ Controller. class="..." nối CSS; form action/method xác định endpoint và phương thức gửi. c:forEach lặp dữ liệu; c:if kiểm tra điều kiện; c:out hiển thị văn bản an toàn. Không đặt nghiệp vụ ở JSP. --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ include file="../../fragments/head.jspf" %>
<main data-n11-src="admin/listening/media.jsp|1" class="admin-shell listening-admin-page"><div data-n11-src="admin/listening/media.jsp|2" class="container container-n11 listening-container"><div data-n11-src="admin/listening/media.jsp|3" class="row g-4 listening-layout">
 <div data-n11-src="admin/listening/media.jsp|4" class="col-lg-3 listening-sidebar-col"><%@ include file="../../fragments/admin-sidebar.jspf" %></div>
 <div data-n11-src="admin/listening/media.jsp|5" class="col-lg-9 listening-content-col">
  <a data-n11-src="admin/listening/media.jsp|6" class="account-back" href="${pageContext.request.contextPath}/admin/listening">← Quản lý Listening</a>
  <h1 data-n11-src="admin/listening/media.jsp|7" class="account-title mt-3">Kho tài nguyên Listening</h1>
  <p data-n11-src="admin/listening/media.jsp|8" class="small-meta">Quản lý âm thanh và hình ảnh.</p>
  <c:if test="${not empty successMessage}"><div data-n11-src="admin/listening/media.jsp|9" class="alert alert-success"><c:out value="${successMessage}"/></div></c:if>
  <c:if test="${not empty errorMessage}"><div data-n11-src="admin/listening/media.jsp|10" class="alert alert-danger"><c:out value="${errorMessage}"/></div></c:if>
  <section data-n11-src="admin/listening/media.jsp|11" class="panel-card mb-4"><h2 data-n11-src="admin/listening/media.jsp|12" class="account-section-title">Thêm tài nguyên</h2>
   <form data-n11-src="admin/listening/media.jsp|13" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/admin/listening/media/upload">
    <%-- CSRF token bảo vệ yêu cầu POST. --%><input data-n11-src="admin/listening/media.jsp|14" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div data-n11-src="admin/listening/media.jsp|15" class="row g-3 align-items-end"><div data-n11-src="admin/listening/media.jsp|16" class="col-md-7"><label data-n11-src="admin/listening/media.jsp|17" class="form-label" for="file">Chọn file *</label>
      <input data-n11-src="admin/listening/media.jsp|18" id="file" type="file" name="file" class="form-control" required accept=".mp3,.wav,.ogg,.png,.jpg,.jpeg,.webp"/></div>
      <div data-n11-src="admin/listening/media.jsp|19" class="col-md-3"><label data-n11-src="admin/listening/media.jsp|20" class="form-label" for="duration">Thời lượng (giây)</label>
       <input data-n11-src="admin/listening/media.jsp|21" id="duration" type="number" name="durationSeconds" class="form-control" min="0" max="86400" placeholder="Audio"/></div>
      <div data-n11-src="admin/listening/media.jsp|22" class="col-md-2"><button data-n11-src="admin/listening/media.jsp|23" class="btn btn-primary w-100" type="submit">Tải lên</button></div></div>
    <p data-n11-src="admin/listening/media.jsp|24" class="small-meta mt-2 mb-0">Hỗ trợ MP3, WAV, OGG, PNG, JPG, WEBP · tối đa 25 MB/file.</p>
   </form></section>
  <%-- Khối nội dung: CSS panel-card điều chỉnh nền, viền và khoảng cách. --%><section data-n11-src="admin/listening/media.jsp|25" class="panel-card"><h2 data-n11-src="admin/listening/media.jsp|26" class="account-section-title">Tài nguyên đã tải lên</h2>
   <div data-n11-src="admin/listening/media.jsp|27" class="table-responsive"><table data-n11-src="admin/listening/media.jsp|28" class="table align-middle"><thead data-n11-src="admin/listening/media.jsp|29"><tr data-n11-src="admin/listening/media.jsp|30"><th data-n11-src="admin/listening/media.jsp|31">ID</th><th data-n11-src="admin/listening/media.jsp|32">Loại</th><th data-n11-src="admin/listening/media.jsp|33">Nghe/Xem thử</th><th data-n11-src="admin/listening/media.jsp|34">Đường dẫn</th><th data-n11-src="admin/listening/media.jsp|35">Thao tác</th></tr></thead><tbody data-n11-src="admin/listening/media.jsp|36">
    <c:forEach items="${media}" var="m">
     <c:choose><c:when test="${fn:startsWith(m.file_url, 'https://res.cloudinary.com/')}"><c:set var="listeningAssetUrl" value="${m.file_url}"/></c:when>
     <c:otherwise><c:set var="listeningAssetUrl" value="${pageContext.request.contextPath}${m.file_url}"/></c:otherwise></c:choose>
     <tr data-n11-src="admin/listening/media.jsp|37" id="media-${m.id}"><td data-n11-src="admin/listening/media.jsp|38">#${m.id}</td><td data-n11-src="admin/listening/media.jsp|39"><c:out value="${m.media_type}"/></td>
     <td data-n11-src="admin/listening/media.jsp|40"><c:choose><c:when test="${m.media_type eq 'AUDIO'}"><audio data-n11-src="admin/listening/media.jsp|41" class="listening-audio" controls preload="none" src="${listeningAssetUrl}"></audio></c:when>
     <c:otherwise><img data-n11-src="admin/listening/media.jsp|42" class="listening-thumb" alt="Hình ảnh Listening" src="${listeningAssetUrl}"/></c:otherwise></c:choose></td>
     <td data-n11-src="admin/listening/media.jsp|43"><code class="listening-code"><c:out value="${m.file_url}"/></code>
       <details data-n11-src="admin/listening/media.jsp|44" class="mt-2"><summary data-n11-src="admin/listening/media.jsp|45" class="btn btn-soft btn-sm" style="cursor:pointer">Sửa URL đang lưu</summary>
        <form data-n11-src="admin/listening/media.jsp|46" method="post" class="mt-2" action="${pageContext.request.contextPath}/admin/listening/media/${m.id}/repair">
          <input data-n11-src="admin/listening/media.jsp|47" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          <label data-n11-src="admin/listening/media.jsp|48" class="form-label small" for="repair-${m.id}">URL Cloudinary mới (giữ nguyên ID #${m.id})</label>
          <input data-n11-src="admin/listening/media.jsp|49" id="repair-${m.id}" class="form-control form-control-sm" name="fileUrl" type="url" maxlength="1900" required value="<c:out value='${m.file_url}'/>" placeholder="https://res.cloudinary.com/..."/>
          <button data-n11-src="admin/listening/media.jsp|50" class="btn btn-primary btn-sm mt-2" type="submit">Lưu URL mới</button>
        </form>
       </details></td>
     <td data-n11-src="admin/listening/media.jsp|51"><form data-n11-src="admin/listening/media.jsp|52" method="post" action="${pageContext.request.contextPath}/admin/listening/media/${m.id}/delete" onsubmit="return confirm('Xóa tài nguyên này? Chỉ xóa được nếu không có câu hỏi/đoạn nghe tham chiếu.');">
      <input data-n11-src="admin/listening/media.jsp|53" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><button data-n11-src="admin/listening/media.jsp|54" class="btn btn-outline-danger btn-sm" type="submit">Xóa</button></form></td></tr></c:forEach>
    <c:if test="${empty media}"><tr data-n11-src="admin/listening/media.jsp|55"><td data-n11-src="admin/listening/media.jsp|56" colspan="5" class="text-center small-meta py-4">Chưa có tài nguyên nào.</td></tr></c:if>
   </tbody></table></div></section>
 </div></div></div></main>
<%@ include file="../../fragments/scripts.jspf" %>
