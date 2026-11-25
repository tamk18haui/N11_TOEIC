<%-- N11 SOURCE NOTES V24: JSP dựng bố cục và hiển thị dữ liệu từ Controller. class="..." nối CSS; form action/method xác định endpoint và phương thức gửi. c:forEach lặp dữ liệu; c:if kiểm tra điều kiện; c:out hiển thị văn bản an toàn. Không đặt nghiệp vụ ở JSP. --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ include file="../../fragments/head.jspf" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin-lr-v47.css?v=47.1" />
<main data-n11-src="admin/listening/index.jsp|1" class="admin-shell listening-admin-page n11-lr-v47"><div data-n11-src="admin/listening/index.jsp|2" class="container container-n11 listening-container"><div data-n11-src="admin/listening/index.jsp|3" class="row g-4 listening-layout">
 <div data-n11-src="admin/listening/index.jsp|4" class="col-lg-3 listening-sidebar-col"><%@ include file="../../fragments/admin-sidebar.jspf" %></div>
 <div data-n11-src="admin/listening/index.jsp|5" class="col-lg-9 listening-content-col">
  <!-- N11 FORUM V9: HERO -->
  <%-- Khu vuc tieu de: co the sua chu truc tiep tai day. --%>
  <header data-n11-src="admin/listening/index.jsp|6" class="ff-hero">
   <div data-n11-src="admin/listening/index.jsp|7" class="ff-hero-main">
    <span data-n11-src="admin/listening/index.jsp|8" class="ff-kicker">QUẢN TRỊ NỘI DUNG · TOEIC</span>
    <h1 data-n11-src="admin/listening/index.jsp|9">Quản lý Listening</h1>
    <p data-n11-src="admin/listening/index.jsp|10">Quản lý bộ luyện nghe, câu hỏi, đáp án và tài nguyên Part 1–4.</p>
   </div>
   <div data-n11-src="admin/listening/index.jsp|11" class="ff-hero-stats" aria-label="Thống kê Listening">
    <div data-n11-src="admin/listening/index.jsp|12" class="ff-stat"><strong data-n11-src="admin/listening/index.jsp|13">${fn:length(sets)}</strong><span data-n11-src="admin/listening/index.jsp|14">Bộ luyện nghe</span></div>
    <div data-n11-src="admin/listening/index.jsp|15" class="ff-stat"><strong data-n11-src="admin/listening/index.jsp|16">04</strong><span data-n11-src="admin/listening/index.jsp|17">Part 1–4</span></div>
   </div>
  </header>
  <%-- Nut giu nguyen duong dan Java/Spring Boot dang su dung. --%>
  <%-- Thanh thao tác: các thẻ a điều hướng; form gửi yêu cầu công bố/ẩn. --%><div data-n11-src="admin/listening/index.jsp|18" class="ff-action-bar">
   <a data-n11-src="admin/listening/index.jsp|19" class="btn btn-primary" href="${pageContext.request.contextPath}/admin/listening/sets/new">+ Tạo bộ luyện nghe</a>
   <a data-n11-src="admin/listening/index.jsp|20" class="btn btn-soft" href="${pageContext.request.contextPath}/admin/listening/import">Nhập hàng loạt</a>
   <a data-n11-src="admin/listening/index.jsp|21" class="btn btn-soft" href="${pageContext.request.contextPath}/admin/listening/media">Kho audio / hình ảnh</a>
  </div>
  <c:if test="${not empty successMessage}"><div data-n11-src="admin/listening/index.jsp|22" class="alert alert-success" role="status"><c:out value="${successMessage}" /></div></c:if>
  <c:if test="${not empty levelSuccessMessage}"><div data-n11-src="admin/listening/index.jsp|23" class="n11-level-feedback" role="status"><c:out value="${levelSuccessMessage}"/></div></c:if>
  <c:if test="${not empty errorMessage}"><div data-n11-src="admin/listening/index.jsp|24" class="alert alert-danger" role="alert"><c:out value="${errorMessage}" /></div></c:if>
<!-- N11 LISTENING V8: responsive index -->
  <section data-n11-src="admin/listening/index.jsp|25" class="panel-card listening-filter-panel mb-4">
   <form data-n11-src="admin/listening/index.jsp|26" method="get" action="${pageContext.request.contextPath}/admin/listening" class="listening-filter-form">
    <div data-n11-src="admin/listening/index.jsp|27" class="listening-filter-field"><label data-n11-src="admin/listening/index.jsp|28" class="form-label" for="partSelect">Lọc theo Part</label>
     <select data-n11-src="admin/listening/index.jsp|29" id="partSelect" name="part" class="form-select">
      <option value="">Tất cả Part</option><c:forEach begin="1" end="4" var="n"><option value="${n}" ${partFilter eq n ? 'selected' : ''}>Part ${n}</option></c:forEach>
     </select></div>
    <button data-n11-src="admin/listening/index.jsp|30" class="btn btn-primary" type="submit">Áp dụng bộ lọc</button>
    <span data-n11-src="admin/listening/index.jsp|31" class="listening-filter-result">Hiển thị <b data-n11-src="admin/listening/index.jsp|32">${fn:length(sets)}</b> bộ luyện nghe</span>
   </form>
  </section>
    <section data-n11-src="admin/listening/index.jsp|33" class="panel-card listening-sets-panel">
   <div data-n11-src="admin/listening/index.jsp|34" class="listening-section-head"><div data-n11-src="admin/listening/index.jsp|35"><div data-n11-src="admin/listening/index.jsp|36" class="listening-eyebrow">QUẢN LÝ NỘI DUNG</div><h2 data-n11-src="admin/listening/index.jsp|37" class="account-section-title mb-0">Các bộ luyện nghe</h2></div><span data-n11-src="admin/listening/index.jsp|38" class="listening-set-total">${fn:length(sets)} bộ</span></div>
   <div data-n11-src="admin/listening/index.jsp|39" class="listening-table-scroll" role="region" aria-label="Các bộ luyện nghe" tabindex="0"><table data-n11-src="admin/listening/index.jsp|40" class="table listening-sets-table align-middle">
    <thead data-n11-src="admin/listening/index.jsp|41"><tr data-n11-src="admin/listening/index.jsp|42"><th data-n11-src="admin/listening/index.jsp|43">Bộ luyện nghe</th><th data-n11-src="admin/listening/index.jsp|44">Part</th><th data-n11-src="admin/listening/index.jsp|45">Cấp độ học viên</th><th data-n11-src="admin/listening/index.jsp|46">Câu</th><th data-n11-src="admin/listening/index.jsp|47">Đoạn</th><th data-n11-src="admin/listening/index.jsp|48">Trạng thái</th><th data-n11-src="admin/listening/index.jsp|49">Thao tác</th></tr></thead>
    <tbody data-n11-src="admin/listening/index.jsp|50"><c:forEach items="${sets}" var="s"><tr data-n11-src="admin/listening/index.jsp|51">
     <td data-n11-src="admin/listening/index.jsp|52" class="listening-set-name"><strong data-n11-src="admin/listening/index.jsp|53">
       <c:choose><c:when test="${fn:contains(s.title, 'UNKNOWN - batch')}">Listening Part ${s.part_no} · Bộ #${s.id}</c:when><c:otherwise><c:out value="${s.title}"/></c:otherwise></c:choose>
      </strong><c:if test="${fn:contains(s.title, 'UNKNOWN - batch')}"><div data-n11-src="admin/listening/index.jsp|54" class="listening-set-subtitle" title="${fn:escapeXml(s.title)}">Dữ liệu nhập tự động · <c:out value="${s.title}"/></div></c:if>
      <div data-n11-src="admin/listening/index.jsp|55" class="listening-set-code">Mã bộ: #${s.id}</div></td>
     <td data-n11-src="admin/listening/index.jsp|56"><span data-n11-src="admin/listening/index.jsp|57" class="listening-part-pill">Part ${s.part_no}</span></td>
     <td data-n11-src="admin/listening/index.jsp|58"><%-- Nút cấp độ: summary mở menu; select chọn cấp; form POST gửi lựa chọn lên Controller. --%><details data-n11-src="admin/listening/index.jsp|59" class="n11-level-compact"><summary data-n11-src="admin/listening/index.jsp|60" title="Đổi cấp độ bộ luyện" aria-label="Đổi cấp độ bộ luyện"><svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" aria-hidden="true"><path d="M4 7h16M4 17h16"/><circle cx="9" cy="7" r="2.5" fill="white"/><circle cx="15" cy="17" r="2.5" fill="white"/></svg><span data-n11-src="admin/listening/index.jsp|61"><c:choose><c:when test="${fn:contains(s.instructions, '[LISTENING_LEVEL:1]')}">Cấp 1</c:when><c:when test="${fn:contains(s.instructions, '[LISTENING_LEVEL:2]')}">Cấp 2</c:when><c:when test="${fn:contains(s.instructions, '[LISTENING_LEVEL:3]')}">Cấp 3</c:when><c:when test="${fn:contains(s.instructions, '[LISTENING_LEVEL:4]')}">Cấp 4</c:when><c:when test="${fn:contains(s.instructions, '[LISTENING_LEVEL:5]')}">Cấp 5</c:when><c:otherwise>Chưa gán</c:otherwise></c:choose></span></summary><div data-n11-src="admin/listening/index.jsp|62" class="n11-level-menu"><form data-n11-src="admin/listening/index.jsp|63" class="n11-level-form" method="post" action="${pageContext.request.contextPath}/admin/practice-levels/listening/${s.id}">
<%-- CSRF token bảo vệ yêu cầu POST. --%><input data-n11-src="admin/listening/index.jsp|64" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><input data-n11-src="admin/listening/index.jsp|65" type="hidden" name="back" value="list"/>
<select data-n11-src="admin/listening/index.jsp|66" class="form-select" name="level" aria-label="Cấp độ bộ luyện"><option value="0" ${not fn:contains(s.instructions, '[LISTENING_LEVEL:1]') and not fn:contains(s.instructions, '[LISTENING_LEVEL:2]') and not fn:contains(s.instructions, '[LISTENING_LEVEL:3]') and not fn:contains(s.instructions, '[LISTENING_LEVEL:4]') and not fn:contains(s.instructions, '[LISTENING_LEVEL:5]') ? 'selected' : ''}>Chưa gán</option><option value="1" ${fn:contains(s.instructions, '[LISTENING_LEVEL:1]') ? 'selected' : ''}>1 · Rất dễ</option><option value="2" ${fn:contains(s.instructions, '[LISTENING_LEVEL:2]') ? 'selected' : ''}>2 · Dễ</option><option value="3" ${fn:contains(s.instructions, '[LISTENING_LEVEL:3]') ? 'selected' : ''}>3 · Trung bình</option><option value="4" ${fn:contains(s.instructions, '[LISTENING_LEVEL:4]') ? 'selected' : ''}>4 · Khó</option><option value="5" ${fn:contains(s.instructions, '[LISTENING_LEVEL:5]') ? 'selected' : ''}>5 · Rất khó</option></select>
<button data-n11-src="admin/listening/index.jsp|67" class="btn btn-soft btn-sm" name="mode" value="manual" type="submit">Lưu cấp</button><button data-n11-src="admin/listening/index.jsp|68" class="btn btn-sm n11-level-random" name="mode" value="random" type="submit" onclick="return confirm('Gán cấp độ ngẫu nhiên?')">Random</button></form></div></details></td>
     <td data-n11-src="admin/listening/index.jsp|69" class="listening-numeric">${s.question_count}</td><td data-n11-src="admin/listening/index.jsp|70" class="listening-numeric">${s.passage_count}</td>
     <td data-n11-src="admin/listening/index.jsp|71"><span data-n11-src="admin/listening/index.jsp|72" class="badge-status ${s.is_published ? 'good' : 'warn'}">${s.is_published ? 'Đã công bố' : 'Bản nháp'}</span></td>
     <td data-n11-src="admin/listening/index.jsp|73" class="listening-set-action"><a data-n11-src="admin/listening/index.jsp|74" class="btn btn-soft btn-sm" href="${pageContext.request.contextPath}/admin/listening/sets/${s.id}">Quản lý</a></td>
    </tr></c:forEach><c:if test="${empty sets}"><tr data-n11-src="admin/listening/index.jsp|75"><td data-n11-src="admin/listening/index.jsp|76" colspan="7" class="text-center text-muted py-4">Chưa có bộ luyện nghe nào trong CSDL.</td></tr></c:if></tbody>
   </table></div>
  </section>
  
 </div></div></div></main>
<script defer src="${pageContext.request.contextPath}/assets/js/admin-lr-v47.js?v=47"></script>
<%@ include file="../../fragments/scripts.jspf" %>
