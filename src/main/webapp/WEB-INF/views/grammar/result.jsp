<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/header.jspf" %>

<main class="grammar-page">
    <div class="container grammar-detail">
        <a class="grammar-back" href="${pageContext.request.contextPath}/grammar/history">← Lịch sử làm bài</a>
        <section class="result-summary quiz-result-summary">
            <span class="grammar-eyebrow">Kết quả bài thi</span>
            <h1 class="h3 mt-3"><c:out value="${attempt.lessonTitle}"/></h1>
            <div class="result-score">${attempt.correctCount}/${attempt.totalQuestions}</div>
            <p>${attempt.scorePercent}% · Đã lưu kết quả vào lịch sử</p>
            <a class="btn grammar-btn" href="${pageContext.request.contextPath}/grammar/${attempt.lessonId}?tab=exercises&amp;mode=exam">Thi lại</a>
            <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/grammar/${attempt.lessonId}?tab=exercises">Đổi chế độ</a>
        </section>

        <%-- Duyệt đúng các câu của lượt thi đã lưu, kể cả lượt thi từ dữ liệu cũ. --%>
        <h2 class="h4 mb-4">Đáp án và giải thích</h2>
        <c:forEach items="${answers}" var="answer" varStatus="s">
            <article class="quiz-question mb-4">
                <div class="quiz-question-head">
                    <strong>Câu ${s.count}</strong>
                    <span class="badge ${answer.correct ? 'bg-success' : empty answer.selectedText ? 'bg-secondary' : 'bg-danger'}">
                        ${answer.correct ? 'Đúng' : empty answer.selectedText ? 'Bỏ trống' : 'Sai'}
                    </span>
                </div>
                <div class="quiz-question-body">
                    <h3 class="h5"><c:out value="${answer.questionText}"/></h3>
                    <c:set var="review" value="${reviews[answer.questionId]}"/>
                    <div class="quiz-options">
                        <c:forEach items="${review.options()}" var="option">
                            <div class="quiz-option ${option.correct() ? 'is-correct' : option.selected() ? 'is-wrong' : ''}">
                                <strong class="quiz-letter">${option.label()}</strong>
                                <span><c:out value="${option.text()}"/></span>
                                <c:if test="${option.correct() || option.selected()}">
                                    <small class="ms-auto">${option.correct() ? 'Đáp án đúng' : 'Bạn chọn'}</small>
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="quiz-analysis">
                    <h4 class="h6">Phân tích từng đáp án</h4>
                    <c:forEach items="${review.options()}" var="option">
                        <c:if test="${not empty option.explanation()}">
                            <p class="quiz-note ${option.correct() ? 'is-correct' : ''}">
                                <strong>${option.label()}. ${option.correct() ? 'Đúng' : 'Sai'}.</strong>
                                <c:out value="${option.explanation()}"/>
                            </p>
                        </c:if>
                    </c:forEach>
                </div>
            </article>
        </c:forEach>
    </div>
</main>
<%@ include file="../fragments/footer.jspf" %>
<%@ include file="../fragments/scripts.jspf" %>
