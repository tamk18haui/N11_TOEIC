<%-- N11 SOURCE NOTES V24: JSP dựng bố cục và hiển thị dữ liệu từ Controller. class="..." nối CSS; form action/method xác định endpoint và phương thức gửi. c:forEach lặp dữ liệu; c:if kiểm tra điều kiện; c:out hiển thị văn bản an toàn. Không đặt nghiệp vụ ở JSP. --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ include file="../../fragments/head.jspf" %>
<main data-n11-src="admin/listening/detail.jsp|1" class="admin-shell listening-admin-page"><div data-n11-src="admin/listening/detail.jsp|2" class="container container-n11 listening-container"><div data-n11-src="admin/listening/detail.jsp|3" class="row g-4 listening-layout">
 <div data-n11-src="admin/listening/detail.jsp|4" class="col-lg-3 listening-sidebar-col"><%@ include file="../../fragments/admin-sidebar.jspf" %></div>
 <div data-n11-src="admin/listening/detail.jsp|5" class="col-lg-9 listening-content-col">
  <!-- N11 FORUM V9: HERO -->
  <a data-n11-src="admin/listening/detail.jsp|6" class="ff-back" href="${pageContext.request.contextPath}/admin/listening">← Danh sách Listening</a>
  <%-- Ten hien thi gon hon; KHONG thay doi ten goc trong MySQL. --%>
  <header data-n11-src="admin/listening/detail.jsp|7" class="ff-hero ff-hero-detail">
   <div data-n11-src="admin/listening/detail.jsp|8" class="ff-hero-main">
    <span data-n11-src="admin/listening/detail.jsp|9" class="ff-kicker">LISTENING · PART ${set.part_no}</span>
    <h1 data-n11-src="admin/listening/detail.jsp|10">
     <c:choose>
      <c:when test="${fn:contains(set.title, 'UNKNOWN - batch')}">Listening Part ${set.part_no} · Bộ #${set.id}</c:when>
      <c:otherwise><c:out value="${set.title}"/></c:otherwise>
     </c:choose>
    </h1>
    <p data-n11-src="admin/listening/detail.jsp|11">Quản lý câu hỏi, đáp án, âm thanh và hình ảnh của bộ luyện nghe.</p>
    <div data-n11-src="admin/listening/detail.jsp|12" class="ff-hero-status">
     <span data-n11-src="admin/listening/detail.jsp|13" class="badge-status ${set.is_published ? 'good' : 'warn'}">${set.is_published ? 'Đã công bố' : 'Bản nháp'}</span>
     <span data-n11-src="admin/listening/detail.jsp|14" class="small-meta">${set.question_count} câu hỏi · ${set.attempt_count} lượt làm</span>
    </div>
    <c:if test="${fn:contains(set.title, 'UNKNOWN - batch')}">
     <div data-n11-src="admin/listening/detail.jsp|15" class="ff-hero-note" title="${fn:escapeXml(set.title)}">Dữ liệu nguồn: <c:out value="${set.title}"/></div>
    </c:if>
   </div>
   <div data-n11-src="admin/listening/detail.jsp|16" class="ff-hero-stats" aria-label="Thống kê bộ luyện nghe">
    <div data-n11-src="admin/listening/detail.jsp|17" class="ff-stat"><strong data-n11-src="admin/listening/detail.jsp|18">${set.question_count}</strong><span data-n11-src="admin/listening/detail.jsp|19">Câu hỏi</span></div>
    <div data-n11-src="admin/listening/detail.jsp|20" class="ff-stat"><strong data-n11-src="admin/listening/detail.jsp|21">0${set.part_no}</strong><span data-n11-src="admin/listening/detail.jsp|22">Part</span></div>
   </div>
  </header>
  <%-- Giữ nguyên method/action, CSRF và chức năng công bố. --%>
  <%-- Thanh thao tác: các thẻ a điều hướng; form gửi yêu cầu công bố/ẩn. --%><div data-n11-src="admin/listening/detail.jsp|23" class="ff-action-bar">
   <a data-n11-src="admin/listening/detail.jsp|24" class="btn btn-primary" href="#listening-questions">Xem câu hỏi / đáp án</a>
   <a data-n11-src="admin/listening/detail.jsp|25" class="btn btn-soft" href="${pageContext.request.contextPath}/admin/listening/media">Kho audio / ảnh</a>
   <a data-n11-src="admin/listening/detail.jsp|26" class="btn btn-soft" href="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/edit">Sửa thông tin bộ</a>
   <form data-n11-src="admin/listening/detail.jsp|27" method="post" action="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/publish">
    <%-- CSRF token bảo vệ yêu cầu POST. --%><input data-n11-src="admin/listening/detail.jsp|28" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input data-n11-src="admin/listening/detail.jsp|29" type="hidden" name="published" value="${not set.is_published}"/>
    <button data-n11-src="admin/listening/detail.jsp|30" type="submit" class="btn btn-primary">${set.is_published ? 'Chuyển về nháp' : 'Công bố bộ nghe'}</button>
   </form>
  </div>
  <c:if test="${not empty successMessage}"><div data-n11-src="admin/listening/detail.jsp|31" class="alert alert-success"><c:out value="${successMessage}"/></div></c:if>
  <c:if test="${not empty levelSuccessMessage}"><div data-n11-src="admin/listening/detail.jsp|32" class="n11-level-feedback" role="status"><c:out value="${levelSuccessMessage}"/></div></c:if>
  <c:if test="${not empty errorMessage}"><div data-n11-src="admin/listening/detail.jsp|33" class="alert alert-danger"><c:out value="${errorMessage}"/></div></c:if>
  <%-- V19: exact publication diagnostics; links go directly to the broken question/media. --%>
  <c:if test="${not empty publicationIssues}">
    <section data-n11-src="admin/listening/detail.jsp|34" class="panel-card mb-4" id="publish-errors" style="border:1px solid #f1c0b4;background:#fffaf8">
      <h2 data-n11-src="admin/listening/detail.jsp|35" class="account-section-title" style="color:#a94632">Câu cần sửa trước khi công bố (${publicationIssues.size()})</h2>
      <p data-n11-src="admin/listening/detail.jsp|36" class="small-meta">Hệ thống kiểm tra A–D, đáp án đúng, file_url MySQL và sự tồn tại của file /listening-media/ trên ổ đĩa. Link Cloudinary chỉ được kiểm tra cú pháp, không xác nhận truy cập từ Internet.</p>
      <div data-n11-src="admin/listening/detail.jsp|37" class="table-responsive"><table data-n11-src="admin/listening/detail.jsp|38" class="table align-middle"><thead data-n11-src="admin/listening/detail.jsp|39"><tr data-n11-src="admin/listening/detail.jsp|40"><th data-n11-src="admin/listening/detail.jsp|41">Câu</th><th data-n11-src="admin/listening/detail.jsp|42">Nội dung</th><th data-n11-src="admin/listening/detail.jsp|43">Lỗi cụ thể</th><th data-n11-src="admin/listening/detail.jsp|44">Cách sửa</th></tr></thead><tbody data-n11-src="admin/listening/detail.jsp|45">
        <c:forEach items="${publicationIssues}" var="issue">
          <tr data-n11-src="admin/listening/detail.jsp|46">
            <td data-n11-src="admin/listening/detail.jsp|47"><strong data-n11-src="admin/listening/detail.jsp|48">#${issue.sortOrder}</strong><div data-n11-src="admin/listening/detail.jsp|49" class="small-meta">ID ${issue.questionId}</div></td>
            <td data-n11-src="admin/listening/detail.jsp|50"><c:out value="${issue.questionText}"/></td>
            <td data-n11-src="admin/listening/detail.jsp|51"><c:forEach items="${issue.problems}" var="problem"><div data-n11-src="admin/listening/detail.jsp|52" class="mb-2" style="color:#ae4030">• <c:out value="${problem}"/></div></c:forEach></td>
            <td data-n11-src="admin/listening/detail.jsp|53"><div data-n11-src="admin/listening/detail.jsp|54" class="d-flex flex-column gap-2">
              <a data-n11-src="admin/listening/detail.jsp|55" class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/questions/${issue.questionId}/edit">Sửa câu hỏi</a>
              <c:if test="${not empty issue.audioId}"><a data-n11-src="admin/listening/detail.jsp|56" class="btn btn-soft btn-sm" href="${pageContext.request.contextPath}/admin/listening/media#media-${issue.audioId}">Sửa audio #${issue.audioId}</a></c:if>
              <c:if test="${not empty issue.imageId}"><a data-n11-src="admin/listening/detail.jsp|57" class="btn btn-soft btn-sm" href="${pageContext.request.contextPath}/admin/listening/media#media-${issue.imageId}">Sửa ảnh #${issue.imageId}</a></c:if>
            </div></td>
          </tr>
        </c:forEach>
      </tbody></table></div>
      <p data-n11-src="admin/listening/detail.jsp|58" class="small-meta mb-0">Sau khi sửa, quay lại trang bộ nghe, bấm Công bố để kiểm tra lại.</p>
    </section>
  </c:if>
  <c:if test="${set.attempt_count gt 0}"><div data-n11-src="admin/listening/detail.jsp|59" class="alert alert-info">Đã có lượt làm. Không thể chỉnh sửa nội dung.</div></c:if>
  
  <div data-n11-src="admin/listening/detail.jsp|60" class="n11-level-panel"><span data-n11-src="admin/listening/detail.jsp|61" class="n11-level-caption">Cấp độ</span><%-- Nút cấp độ: summary mở menu; select chọn cấp; form POST gửi lựa chọn lên Controller. --%><details data-n11-src="admin/listening/detail.jsp|62" class="n11-level-compact"><summary data-n11-src="admin/listening/detail.jsp|63" title="Đổi cấp độ bộ luyện" aria-label="Đổi cấp độ bộ luyện"><svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" aria-hidden="true"><path d="M4 7h16M4 17h16"/><circle cx="9" cy="7" r="2.5" fill="white"/><circle cx="15" cy="17" r="2.5" fill="white"/></svg><span data-n11-src="admin/listening/detail.jsp|64"><c:choose><c:when test="${fn:contains(set.instructions, '[LISTENING_LEVEL:1]')}">Cấp 1</c:when><c:when test="${fn:contains(set.instructions, '[LISTENING_LEVEL:2]')}">Cấp 2</c:when><c:when test="${fn:contains(set.instructions, '[LISTENING_LEVEL:3]')}">Cấp 3</c:when><c:when test="${fn:contains(set.instructions, '[LISTENING_LEVEL:4]')}">Cấp 4</c:when><c:when test="${fn:contains(set.instructions, '[LISTENING_LEVEL:5]')}">Cấp 5</c:when><c:otherwise>Chưa gán</c:otherwise></c:choose></span></summary><div data-n11-src="admin/listening/detail.jsp|65" class="n11-level-menu"><form data-n11-src="admin/listening/detail.jsp|66" class="n11-level-form" method="post" action="${pageContext.request.contextPath}/admin/practice-levels/listening/${set.id}">
<input data-n11-src="admin/listening/detail.jsp|67" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><input data-n11-src="admin/listening/detail.jsp|68" type="hidden" name="back" value="detail"/>
<select data-n11-src="admin/listening/detail.jsp|69" class="form-select" name="level" aria-label="Cấp độ bộ luyện"><option value="0" ${not fn:contains(set.instructions, '[LISTENING_LEVEL:1]') and not fn:contains(set.instructions, '[LISTENING_LEVEL:2]') and not fn:contains(set.instructions, '[LISTENING_LEVEL:3]') and not fn:contains(set.instructions, '[LISTENING_LEVEL:4]') and not fn:contains(set.instructions, '[LISTENING_LEVEL:5]') ? 'selected' : ''}>Chưa gán</option><option value="1" ${fn:contains(set.instructions, '[LISTENING_LEVEL:1]') ? 'selected' : ''}>1 · Rất dễ</option><option value="2" ${fn:contains(set.instructions, '[LISTENING_LEVEL:2]') ? 'selected' : ''}>2 · Dễ</option><option value="3" ${fn:contains(set.instructions, '[LISTENING_LEVEL:3]') ? 'selected' : ''}>3 · Trung bình</option><option value="4" ${fn:contains(set.instructions, '[LISTENING_LEVEL:4]') ? 'selected' : ''}>4 · Khó</option><option value="5" ${fn:contains(set.instructions, '[LISTENING_LEVEL:5]') ? 'selected' : ''}>5 · Rất khó</option></select>
<button data-n11-src="admin/listening/detail.jsp|70" class="btn btn-soft btn-sm" name="mode" value="manual" type="submit">Lưu cấp</button><button data-n11-src="admin/listening/detail.jsp|71" class="btn btn-sm n11-level-random" name="mode" value="random" type="submit" onclick="return confirm('Gán cấp độ ngẫu nhiên?')">Random</button></form></div></details>
</div>
<!-- N11 LISTENING V8: compact question thumbnails -->
  <section data-n11-src="admin/listening/detail.jsp|72" id="listening-questions" class="panel-card listening-questions-panel mb-4">
   <div data-n11-src="admin/listening/detail.jsp|73" class="listening-section-head">
    <div data-n11-src="admin/listening/detail.jsp|74"><div data-n11-src="admin/listening/detail.jsp|75" class="listening-eyebrow">NGÂN HÀNG CÂU HỎI</div><h2 data-n11-src="admin/listening/detail.jsp|76" class="account-section-title mb-0">Câu hỏi và đáp án</h2>
     </div>
    <a data-n11-src="admin/listening/detail.jsp|77" class="btn btn-primary listening-action-main" href="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/questions/new">+ Thêm câu hỏi</a>
   </div>
   <div data-n11-src="admin/listening/detail.jsp|78" class="listening-table-scroll" role="region" aria-label="Danh sách câu hỏi Listening" tabindex="0">
    <table data-n11-src="admin/listening/detail.jsp|79" class="table listening-q-table align-middle">
     <thead data-n11-src="admin/listening/detail.jsp|80"><tr data-n11-src="admin/listening/detail.jsp|81"><th data-n11-src="admin/listening/detail.jsp|82" class="listening-col-no">STT</th><th data-n11-src="admin/listening/detail.jsp|83" class="listening-col-picture">Ảnh</th><th data-n11-src="admin/listening/detail.jsp|84" class="listening-col-question">Câu hỏi</th><th data-n11-src="admin/listening/detail.jsp|85" class="listening-col-choices">Các lựa chọn / Đáp án đúng</th><th data-n11-src="admin/listening/detail.jsp|86" class="listening-col-audio">Audio</th><th data-n11-src="admin/listening/detail.jsp|87" class="listening-col-actions">Thao tác</th></tr></thead>
     <tbody data-n11-src="admin/listening/detail.jsp|88">
      <c:forEach items="${questions}" var="q">
       <tr data-n11-src="admin/listening/detail.jsp|89">
        <td data-n11-src="admin/listening/detail.jsp|90"><span data-n11-src="admin/listening/detail.jsp|91" class="listening-q-number"><c:out value="${q.sort_order}"/></span></td>
        <td data-n11-src="admin/listening/detail.jsp|92" class="listening-q-picture">
         <c:choose>
          <c:when test="${not empty q.image_url}">
           <c:url value="${q.image_url}" var="listeningQuestionImageUrl"/>
           <a data-n11-src="admin/listening/detail.jsp|93" href="${listeningQuestionImageUrl}" target="_blank" rel="noopener noreferrer" title="Xem ảnh câu ${q.sort_order}">
            <img data-n11-src="admin/listening/detail.jsp|94" src="${listeningQuestionImageUrl}" class="listening-question-thumb" loading="lazy" alt="Ảnh minh họa câu ${q.sort_order}"/>
           </a>
          </c:when>
          <c:when test="${set.part_no eq 1}"><span data-n11-src="admin/listening/detail.jsp|95" class="listening-image-missing">Thiếu ảnh</span></c:when>
          <c:otherwise><span data-n11-src="admin/listening/detail.jsp|96" class="listening-image-na">—</span></c:otherwise>
         </c:choose>
        </td>
        <td data-n11-src="admin/listening/detail.jsp|97" class="listening-q-prompt"><div data-n11-src="admin/listening/detail.jsp|98" class="listening-question-text"><c:out value="${q.question_text}"/></div>
         <c:if test="${not empty q.passage_id}"><div data-n11-src="admin/listening/detail.jsp|99" class="listening-passage-ref">Đoạn nghe #<c:out value="${q.passage_id}"/></div></c:if>
        </td>
        <td data-n11-src="admin/listening/detail.jsp|100" class="listening-options-cell">
         <c:if test="${empty q.correct_label}"><div data-n11-src="admin/listening/detail.jsp|101" class="listening-option-error">Chưa có đáp án đúng</div></c:if>
         <div data-n11-src="admin/listening/detail.jsp|102" class="listening-choices">
          <c:if test="${not empty q.option_a}"><div data-n11-src="admin/listening/detail.jsp|103" class="listening-option-row ${q.correct_label eq 'A' ? 'is-correct' : ''}"><b data-n11-src="admin/listening/detail.jsp|104">A</b><span data-n11-src="admin/listening/detail.jsp|105"><c:out value="${q.option_a}"/></span><c:if test="${q.correct_label eq 'A'}"><strong data-n11-src="admin/listening/detail.jsp|106">Đúng</strong></c:if></div></c:if>
          <c:if test="${not empty q.option_b}"><div data-n11-src="admin/listening/detail.jsp|107" class="listening-option-row ${q.correct_label eq 'B' ? 'is-correct' : ''}"><b data-n11-src="admin/listening/detail.jsp|108">B</b><span data-n11-src="admin/listening/detail.jsp|109"><c:out value="${q.option_b}"/></span><c:if test="${q.correct_label eq 'B'}"><strong data-n11-src="admin/listening/detail.jsp|110">Đúng</strong></c:if></div></c:if>
          <c:if test="${not empty q.option_c}"><div data-n11-src="admin/listening/detail.jsp|111" class="listening-option-row ${q.correct_label eq 'C' ? 'is-correct' : ''}"><b data-n11-src="admin/listening/detail.jsp|112">C</b><span data-n11-src="admin/listening/detail.jsp|113"><c:out value="${q.option_c}"/></span><c:if test="${q.correct_label eq 'C'}"><strong data-n11-src="admin/listening/detail.jsp|114">Đúng</strong></c:if></div></c:if>
          <c:if test="${not empty q.option_d}"><div data-n11-src="admin/listening/detail.jsp|115" class="listening-option-row ${q.correct_label eq 'D' ? 'is-correct' : ''}"><b data-n11-src="admin/listening/detail.jsp|116">D</b><span data-n11-src="admin/listening/detail.jsp|117"><c:out value="${q.option_d}"/></span><c:if test="${q.correct_label eq 'D'}"><strong data-n11-src="admin/listening/detail.jsp|118">Đúng</strong></c:if></div></c:if>
         </div>
        </td>
        <td data-n11-src="admin/listening/detail.jsp|119" class="listening-q-player">
         <c:choose><c:when test="${not empty q.audio_url}">
          <c:url value="${q.audio_url}" var="listeningQuestionAudioUrl"/>
          <audio data-n11-src="admin/listening/detail.jsp|120" controls preload="metadata" class="listening-question-audio" src="${listeningQuestionAudioUrl}" aria-label="Audio câu ${q.sort_order}"></audio>
          <a data-n11-src="admin/listening/detail.jsp|121" class="listening-media-link" target="_blank" rel="noopener noreferrer" href="${listeningQuestionAudioUrl}">Mở MP3</a>
         </c:when><c:otherwise><span data-n11-src="admin/listening/detail.jsp|122" class="listening-image-missing">Thiếu audio</span></c:otherwise></c:choose>
        </td>
        <td data-n11-src="admin/listening/detail.jsp|123" class="listening-q-actions"><div data-n11-src="admin/listening/detail.jsp|124" class="listening-row-actions">
         <a data-n11-src="admin/listening/detail.jsp|125" class="btn btn-soft btn-sm" href="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/questions/${q.id}/edit">Sửa</a>
         <form data-n11-src="admin/listening/detail.jsp|126" method="post" action="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/questions/${q.id}/delete" onsubmit="return confirm('Xóa câu hỏi và các đáp án?');">
          <input data-n11-src="admin/listening/detail.jsp|127" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><button data-n11-src="admin/listening/detail.jsp|128" type="submit" class="btn btn-outline-danger btn-sm">Xóa</button>
         </form></div></td>
       </tr>
      </c:forEach>
      <c:if test="${empty questions}"><tr data-n11-src="admin/listening/detail.jsp|129"><td data-n11-src="admin/listening/detail.jsp|130" colspan="6" class="text-center small-meta py-4">Chưa có câu hỏi.</td></tr></c:if>
     </tbody>
    </table>
   </div>
   <p data-n11-src="admin/listening/detail.jsp|131" class="listening-help-text">Điều kiện công bố: Part 2 có 3 đáp án; Part 1, 3, 4 có 4 đáp án; mỗi câu có 1 đáp án đúng và audio. Part 1 bắt buộc có ảnh.</p>
  </section>

  <section data-n11-src="admin/listening/detail.jsp|132" id="listening-passages" class="panel-card mb-4"><div data-n11-src="admin/listening/detail.jsp|133" class="d-flex justify-content-between align-items-center flex-wrap gap-2 mb-3">
   <h2 data-n11-src="admin/listening/detail.jsp|134" class="account-section-title mb-0">Đoạn nghe / Transcript / Hình ảnh</h2></div>
   
   <div data-n11-src="admin/listening/detail.jsp|135" class="table-responsive"><table data-n11-src="admin/listening/detail.jsp|136" class="table align-middle"><thead data-n11-src="admin/listening/detail.jsp|137"><tr data-n11-src="admin/listening/detail.jsp|138"><th data-n11-src="admin/listening/detail.jsp|139">ID</th><th data-n11-src="admin/listening/detail.jsp|140">Transcript</th><th data-n11-src="admin/listening/detail.jsp|141">Audio</th><th data-n11-src="admin/listening/detail.jsp|142">Ảnh</th><th data-n11-src="admin/listening/detail.jsp|143">Thứ tự</th><th data-n11-src="admin/listening/detail.jsp|144">Thao tác</th></tr></thead><tbody data-n11-src="admin/listening/detail.jsp|145">
    <c:forEach items="${passages}" var="p">
     <c:if test="${not empty p.audio_url}"><c:url value="${p.audio_url}" var="listeningPreviewAudioUrl"/></c:if>
     <c:if test="${not empty p.image_url}"><c:url value="${p.image_url}" var="listeningPreviewImageUrl"/></c:if>
     <tr data-n11-src="admin/listening/detail.jsp|146">
     <td data-n11-src="admin/listening/detail.jsp|147">${p.id}</td><td data-n11-src="admin/listening/detail.jsp|148" class="listening-short"><c:out value="${p.passage_text}"/></td>
     <td data-n11-src="admin/listening/detail.jsp|149"><c:choose><c:when test="${not empty p.audio_url}"><audio data-n11-src="admin/listening/detail.jsp|150" controls preload="metadata" src="${listeningPreviewAudioUrl}" class="listening-audio"></audio><a data-n11-src="admin/listening/detail.jsp|151" class="listening-media-link" href="${listeningPreviewAudioUrl}" target="_blank" rel="noopener noreferrer">Mở MP3</a></c:when><c:otherwise>—</c:otherwise></c:choose></td>
     <td data-n11-src="admin/listening/detail.jsp|152"><c:choose><c:when test="${not empty p.image_url}"><a data-n11-src="admin/listening/detail.jsp|153" href="${listeningPreviewImageUrl}" target="_blank" rel="noopener noreferrer" title="Mở ảnh gốc"><img data-n11-src="admin/listening/detail.jsp|154" alt="Ảnh minh họa đoạn nghe" class="listening-thumb" src="${listeningPreviewImageUrl}" style="width:120px;max-width:120px;height:90px;max-height:90px;object-fit:cover;border-radius:8px;"/></a></c:when><c:otherwise>—</c:otherwise></c:choose></td>
     <td data-n11-src="admin/listening/detail.jsp|155">${p.sort_order}</td><td data-n11-src="admin/listening/detail.jsp|156"><div data-n11-src="admin/listening/detail.jsp|157" class="d-flex gap-2 flex-wrap">
      <a data-n11-src="admin/listening/detail.jsp|158" class="btn btn-soft btn-sm" href="${pageContext.request.contextPath}/admin/listening/sets/${set.id}?editPassage=${p.id}#passage-form">Sửa</a>
      <form data-n11-src="admin/listening/detail.jsp|159" method="post" action="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/passages/${p.id}/delete" onsubmit="return confirm('Xóa đoạn nghe này?');">
       <input data-n11-src="admin/listening/detail.jsp|160" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><button data-n11-src="admin/listening/detail.jsp|161" class="btn btn-outline-danger btn-sm" type="submit">Xóa</button></form></div></td>
    </tr></c:forEach><c:if test="${empty passages}"><tr data-n11-src="admin/listening/detail.jsp|162"><td data-n11-src="admin/listening/detail.jsp|163" colspan="6" class="text-center small-meta">Chưa có đoạn nghe.</td></tr></c:if></tbody></table></div>
   <div data-n11-src="admin/listening/detail.jsp|164" id="passage-form" class="listening-subpanel"><h3 data-n11-src="admin/listening/detail.jsp|165" class="h6">${empty passageForm.id ? 'Thêm đoạn nghe' : 'Sửa đoạn nghe'}</h3>
    <form data-n11-src="admin/listening/detail.jsp|166" method="post" action="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/passages/save">
     <input data-n11-src="admin/listening/detail.jsp|167" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
     <c:if test="${not empty passageForm.id}"><input data-n11-src="admin/listening/detail.jsp|168" type="hidden" name="id" value="${passageForm.id}"/></c:if>
     <div data-n11-src="admin/listening/detail.jsp|169" class="row g-3"><div data-n11-src="admin/listening/detail.jsp|170" class="col-12"><label data-n11-src="admin/listening/detail.jsp|171" class="form-label" for="transcript">Transcript / Nội dung đoạn nghe</label>
       <textarea data-n11-src="admin/listening/detail.jsp|172" id="transcript" name="transcript" rows="3" class="form-control"><c:out value="${passageForm.passage_text}"/></textarea></div>
      <div data-n11-src="admin/listening/detail.jsp|173" class="col-md-5"><label data-n11-src="admin/listening/detail.jsp|174" class="form-label" for="passage-audio">Audio</label><select data-n11-src="admin/listening/detail.jsp|175" class="form-select" name="audioId" id="passage-audio">
       <option value="">Không chọn</option><c:forEach items="${media}" var="m"><c:if test="${m.media_type eq 'AUDIO'}"><option value="${m.id}" ${passageForm.audio_media_id eq m.id ? 'selected' : ''}>Audio #${m.id}</option></c:if></c:forEach></select></div>
      <div data-n11-src="admin/listening/detail.jsp|176" class="col-md-5"><label data-n11-src="admin/listening/detail.jsp|177" class="form-label" for="passage-image">Hình ảnh</label><select data-n11-src="admin/listening/detail.jsp|178" class="form-select" name="imageId" id="passage-image">
       <option value="">Không chọn</option><c:forEach items="${media}" var="m"><c:if test="${m.media_type eq 'IMAGE'}"><option value="${m.id}" ${passageForm.image_media_id eq m.id ? 'selected' : ''}>Ảnh #${m.id}</option></c:if></c:forEach></select></div>
      <div data-n11-src="admin/listening/detail.jsp|179" class="col-md-2"><label data-n11-src="admin/listening/detail.jsp|180" class="form-label" for="passage-sort">Thứ tự</label><input data-n11-src="admin/listening/detail.jsp|181" type="number" min="0" id="passage-sort" name="sortOrder" class="form-control" value="${empty passageForm.sort_order ? 0 : passageForm.sort_order}"/></div>
     </div><div data-n11-src="admin/listening/detail.jsp|182" class="d-flex gap-2 mt-3"><button data-n11-src="admin/listening/detail.jsp|183" type="submit" class="btn btn-primary">Lưu đoạn nghe</button>
       <c:if test="${not empty passageForm.id}"><a data-n11-src="admin/listening/detail.jsp|184" class="btn btn-soft" href="${pageContext.request.contextPath}/admin/listening/sets/${set.id}#passage-form">Hủy sửa</a></c:if></div>
    </form></div>
  </section>
  <c:if test="${empty questions and empty passages and not set.is_published}"><form data-n11-src="admin/listening/detail.jsp|185" method="post" action="${pageContext.request.contextPath}/admin/listening/sets/${set.id}/delete" onsubmit="return confirm('Xóa bộ Listening trống?');">
   <input data-n11-src="admin/listening/detail.jsp|186" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><button data-n11-src="admin/listening/detail.jsp|187" type="submit" class="btn btn-outline-danger">Xóa bộ trống</button></form></c:if>
 </div></div></div></main>
<%@ include file="../../fragments/scripts.jspf" %>
