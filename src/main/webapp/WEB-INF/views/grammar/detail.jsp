<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/header.jspf" %>

<main class="grammar-page">
    <div class="container grammar-detail">
        <a class="grammar-back" href="${pageContext.request.contextPath}/grammar">← Tất cả chủ điểm</a>
        <div class="lesson-heading">
            <div class="d-flex justify-content-between gap-3 align-items-start">
                <h1><c:out value="${lesson.title}"/></h1><span class="grammar-badge">${lesson.level eq 'BASIC' ? 'Cơ bản' : lesson.level eq 'INTERMEDIATE' ? 'Trung cấp' : 'Nâng cao'}</span>
            </div><span class="small text-muted"><c:out value="${lesson.topicTitle}"/> · ${questions.size()} câu luyện tập</span>
            <p><c:out value="${lesson.summary}"/></p>
        </div>
        <%-- Thứ tự và nhãn ba tab. Giữ giá trị lecture/examples/exercises khớp với controller. --%>
        <nav class="lesson-tabs" aria-label="Nội dung bài học">
            <a class="${tab eq 'lecture' ? 'active' : ''}" href="?tab=lecture">◎ Bài giảng</a>
            <a class="examples ${tab eq 'examples' ? 'active' : ''}" href="?tab=examples">✎ Ví dụ</a>
            <a class="exercises ${tab eq 'exercises' ? 'active' : ''}" href="?tab=exercises">☷ Bài tập</a>
        </nav>
        <%@ include file="alerts.jspf" %>
        <section class="lesson-panel">
            <div class="lesson-panel-title"><span class="lesson-icon" aria-hidden="true">${tab eq 'lecture' ? '◎' : tab eq 'examples' ? '✎' : '☷'}</span>
                <h2>${tab eq 'lecture' ? 'BÀI GIẢNG' : tab eq 'examples' ? 'VÍ DỤ THỰC TẾ' : 'BÀI TẬP ÁP DỤNG'}</h2>
            </div>
            <div class="lesson-content">
                <c:choose>
                    <%-- HTML bài giảng được service làm sạch trước khi JSP hiển thị. Sửa nội dung qua trang quản trị. --%>
                    <c:when test="${tab eq 'lecture'}">
                        <div class="lecture">${lesson.contentHtml}</div>
                        <div class="text-end mt-4">
                            <a class="btn grammar-btn" href="?tab=examples">Xem ví dụ →</a>
                        </div>
                    </c:when>
                    <%-- Mỗi ví dụ gồm câu tiếng Anh, bản dịch và ghi chú. Chỉnh kiểu trong .example-card. --%>
                    <c:when test="${tab eq 'examples'}">
                        <c:forEach items="${examples}" var="example" varStatus="s">
                            <article class="example-card">
                                <div class="d-flex gap-3"><span class="grammar-badge align-self-start">${s.index+1}</span>
                                    <div class="flex-grow-1">
                                        <h3><c:out value="${example.sentence}"/></h3>
                                        <p class="translation">→ <c:out value="${example.translation}"/></p>
                                        <div class="example-note"><c:out value="${example.note}"/>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </c:forEach>
                        <div class="text-end mt-4">
                            <a class="btn grammar-btn" href="?tab=exercises">Luyện tập ngay →</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <%@ include file="quiz.jspf" %>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
    </div>
</main>
<%@ include file="../fragments/footer.jspf" %>
<%@ include file="../fragments/scripts.jspf" %>
