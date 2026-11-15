package com.toeic.nhom11.vocabulary.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

public class VocabQuizAttempt {
    private Long id;
    private long userId;
    private long topicId;
    private int questionCount;
    private int correctCount;
    private BigDecimal scorePercent;
    private LocalDateTime submittedAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public long getUserId() { return userId; }
    public void setUserId(long userId) { this.userId = userId; }
    public long getTopicId() { return topicId; }
    public void setTopicId(long topicId) { this.topicId = topicId; }
    public int getQuestionCount() { return questionCount; }
    public void setQuestionCount(int questionCount) { this.questionCount = questionCount; }
    public int getCorrectCount() { return correctCount; }
    public void setCorrectCount(int correctCount) { this.correctCount = correctCount; }
    public BigDecimal getScorePercent() { return scorePercent; }
    public void setScorePercent(BigDecimal scorePercent) { this.scorePercent = scorePercent; }
    public LocalDateTime getSubmittedAt() { return submittedAt; }
    public void setSubmittedAt(LocalDateTime submittedAt) { this.submittedAt = submittedAt; }
}
