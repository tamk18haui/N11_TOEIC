<%-- N11 SOURCE NOTES V24: JSP dựng bố cục và hiển thị dữ liệu từ Controller. class="..." nối CSS; form action/method xác định endpoint và phương thức gửi. c:forEach lặp dữ liệu; c:if kiểm tra điều kiện; c:out hiển thị văn bản an toàn. Không đặt nghiệp vụ ở JSP. --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ include file="../../fragments/head.jspf" %>
<main data-n11-src="admin/reading/index.jsp|1" class="admin-shell admin-reading-page" data-reading-admin data-base="${pageContext.request.contextPath}">
 <div data-n11-src="admin/reading/index.jsp|2" class="container container-n11"><div data-n11-src="admin/reading/index.jsp|3" class="row g-4">
  <div data-n11-src="admin/reading/index.jsp|4" class="col-lg-3"><%@ include file="../../fragments/admin-sidebar.jspf" %></div>
  <div data-n11-src="admin/reading/index.jsp|5" class="col-lg-9">
   <header data-n11-src="admin/reading/index.jsp|6" class="reading-admin-hero"><div data-n11-src="admin/reading/index.jsp|7"><span data-n11-src="admin/reading/index.jsp|8" class="section-caption">QUẢN TRỊ HỌC LIỆU · TOEIC</span><h1 data-n11-src="admin/reading/index.jsp|9">Quản lý Reading</h1><p data-n11-src="admin/reading/index.jsp|10">Quản lý bộ luyện Part 5, 6, 7 · câu hỏi, đoạn văn, đáp án và trạng thái công bố.</p></div>
    <a data-n11-src="admin/reading/index.jsp|11" href="${pageContext.request.contextPath}/admin/reading/sets/new" class="btn btn-primary">+ Tạo bộ Reading</a>
   </header>
   <div data-n11-src="admin/reading/index.jsp|12" id="readingAjaxMessage" role="status" aria-live="polite" hidden></div>
   <c:if test="${not empty successMessage}"><div data-n11-src="admin/reading/index.jsp|13" class="alert alert-success"><c:out value="${successMessage}"/></div></c:if>
  <c:if test="${not empty levelSuccessMessage}"><div data-n11-src="admin/reading/index.jsp|14" class="n11-level-feedback" role="status"><c:out value="${levelSuccessMessage}"/></div></c:if>
   <c:if test="${not empty errorMessage}"><div data-n11-src="admin/reading/index.jsp|15" class="alert alert-danger"><c:out value="${errorMessage}"/></div></c:if>
   <section data-n11-src="admin/reading/index.jsp|16" class="panel-card mb-4">
    <form data-n11-src="admin/reading/index.jsp|17" action="${pageContext.request.contextPath}/admin/reading" method="get" class="row align-items-end g-3">
     <div data-n11-src="admin/reading/index.jsp|18" class="col-md-8"><label data-n11-src="admin/reading/index.jsp|19" for="partFilter" class="form-label">Lọc theo Part</label>
      <select data-n11-src="admin/reading/index.jsp|20" class="form-select" name="part" id="partFilter"><option value="">Tất cả Part</option>
       <option value="5" ${partFilter eq 5 ? 'selected' : ''}>Part 5 · Incomplete Sentences</option>
       <option value="6" ${partFilter eq 6 ? 'selected' : ''}>Part 6 · Text Completion</option>
       <option value="7" ${partFilter eq 7 ? 'selected' : ''}>Part 7 · Reading Comprehension</option>
      </select></div>
     <div data-n11-src="admin/reading/index.jsp|21" class="col-md-4"><button data-n11-src="admin/reading/index.jsp|22" type="submit" class="btn btn-primary w-100">Lọc danh sách</button></div>
    </form>
   </section>
   <%-- Khối nội dung: CSS panel-card điều chỉnh nền, viền và khoảng cách. --%><section data-n11-src="admin/reading/index.jsp|23" class="panel-card">
    <div data-n11-src="admin/reading/index.jsp|24" class="d-flex justify-content-between align-items-center mb-3"><h2 data-n11-src="admin/reading/index.jsp|25" class="account-section-title mb-0">Danh sách bộ luyện</h2><span data-n11-src="admin/reading/index.jsp|26" class="small-meta">${fn:length(sets)} bộ</span></div>
    <%-- Bảng danh sách: thead là tiêu đề, tbody chứa các bản ghi từ Controller. --%><div data-n11-src="admin/reading/index.jsp|27" class="admin-table-wrap"><table data-n11-src="admin/reading/index.jsp|28" class="table align-middle reading-admin-table">
     <thead data-n11-src="admin/reading/index.jsp|29"><tr data-n11-src="admin/reading/index.jsp|30"><th data-n11-src="admin/reading/index.jsp|31">Bộ Reading</th><th data-n11-src="admin/reading/index.jsp|32">Part</th><th data-n11-src="admin/reading/index.jsp|33">Cấp</th><th data-n11-src="admin/reading/index.jsp|34">Câu</th><th data-n11-src="admin/reading/index.jsp|35">Đoạn</th><th data-n11-src="admin/reading/index.jsp|36">Trạng thái</th><th data-n11-src="admin/reading/index.jsp|37">Thao tác</th></tr></thead>
     <tbody data-n11-src="admin/reading/index.jsp|38">
      <c:forEach items="${sets}" var="s"><tr data-n11-src="admin/reading/index.jsp|39">
       <td data-n11-src="admin/reading/index.jsp|40"><a data-n11-src="admin/reading/index.jsp|41" class="reading-admin-link" href="${pageContext.request.contextPath}/admin/reading/sets/${s.id}"><c:out value="${s.title}"/></a><small data-n11-src="admin/reading/index.jsp|42" class="d-block small-meta">#${s.id} · ${s.difficulty}</small></td>
       <td data-n11-src="admin/reading/index.jsp|43">Part ${s.part_no}</td><td data-n11-src="admin/reading/index.jsp|44"><%-- Nút cấp độ: summary mở menu; select chọn cấp; form POST gửi lựa chọn lên Controller. --%><details data-n11-src="admin/reading/index.jsp|45" class="n11-level-compact"><summary data-n11-src="admin/reading/index.jsp|46" title="Đổi cấp độ bộ luyện" aria-label="Đổi cấp độ bộ luyện"><svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" aria-hidden="true"><path d="M4 7h16M4 17h16"/><circle cx="9" cy="7" r="2.5" fill="white"/><circle cx="15" cy="17" r="2.5" fill="white"/></svg><span data-n11-src="admin/reading/index.jsp|47"><c:choose><c:when test="${s.level eq 1}">Cấp 1</c:when><c:when test="${s.level eq 2}">Cấp 2</c:when><c:when test="${s.level eq 3}">Cấp 3</c:when><c:when test="${s.level eq 4}">Cấp 4</c:when><c:when test="${s.level eq 5}">Cấp 5</c:when><c:otherwise>Chưa gán</c:otherwise></c:choose></span></summary><div data-n11-src="admin/reading/index.jsp|48" class="n11-level-menu"><form data-n11-src="admin/reading/index.jsp|49" class="n11-level-form" method="post" action="${pageContext.request.contextPath}/admin/practice-levels/reading/${s.id}">
<%-- CSRF token bảo vệ yêu cầu POST. --%><input data-n11-src="admin/reading/index.jsp|50" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><input data-n11-src="admin/reading/index.jsp|51" type="hidden" name="back" value="list"/>
<select data-n11-src="admin/reading/index.jsp|52" class="form-select" name="level" aria-label="Cấp độ bộ luyện"><option value="0" ${s.level eq 0 ? 'selected' : ''}>Chưa gán</option><option value="1" ${s.level eq 1 ? 'selected' : ''}>1 · Rất dễ</option><option value="2" ${s.level eq 2 ? 'selected' : ''}>2 · Dễ</option><option value="3" ${s.level eq 3 ? 'selected' : ''}>3 · Trung bình</option><option value="4" ${s.level eq 4 ? 'selected' : ''}>4 · Khó</option><option value="5" ${s.level eq 5 ? 'selected' : ''}>5 · Rất khó</option></select>
<button data-n11-src="admin/reading/index.jsp|53" class="btn btn-soft btn-sm" name="mode" value="manual" type="submit">Lưu cấp</button><button data-n11-src="admin/reading/index.jsp|54" class="btn btn-sm n11-level-random" name="mode" value="random" type="submit" onclick="return confirm('Gán cấp độ ngẫu nhiên?')">Random</button></form></div></details></td><td data-n11-src="admin/reading/index.jsp|55">${s.question_count}</td><td data-n11-src="admin/reading/index.jsp|56">${s.passage_count}</td>
       <td data-n11-src="admin/reading/index.jsp|57"><span data-n11-src="admin/reading/index.jsp|58" class="badge-status ${s.is_published ? 'good' : 'warn'}" data-publication-label>${s.is_published ? 'Đã công bố' : 'Bản nháp'}</span></td>
       <td data-n11-src="admin/reading/index.jsp|59"><div data-n11-src="admin/reading/index.jsp|60" class="reading-actions">
        <a data-n11-src="admin/reading/index.jsp|61" class="btn btn-soft btn-sm" href="${pageContext.request.contextPath}/admin/reading/sets/${s.id}">Quản lý</a>
        <form data-n11-src="admin/reading/index.jsp|62" action="${pageContext.request.contextPath}/admin/reading/sets/${s.id}/publish" method="post" data-ajax-publication data-set-id="${s.id}">
         <input data-n11-src="admin/reading/index.jsp|63" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
         <input data-n11-src="admin/reading/index.jsp|64" type="hidden" name="published" value="${s.is_published ? 'false' : 'true'}" />
         <button data-n11-src="admin/reading/index.jsp|65" class="btn btn-outline-primary btn-sm" type="submit">${s.is_published ? 'Ẩn' : 'Công bố'}</button>
        </form>
       </div></td></tr></c:forEach>
      <c:if test="${empty sets}"><tr data-n11-src="admin/reading/index.jsp|66"><td data-n11-src="admin/reading/index.jsp|67" colspan="7" class="text-center py-5">Chưa có bộ Reading.</td></tr></c:if>
     </tbody></table></div>
    <p data-n11-src="admin/reading/index.jsp|68" class="small-meta mt-3 mb-0">Part 6: 4 câu/đoạn. Part 7: 2–5 câu/đoạn.</p>
   </section>
  </div></div></div>
</main>
<script defer src="${pageContext.request.contextPath}/assets/js/admin-reading-ajax-v18.js?v=18"></script>
<%@ include file="../../fragments/scripts.jspf" %>
