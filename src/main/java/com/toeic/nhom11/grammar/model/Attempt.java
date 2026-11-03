package com.toeic.nhom11.grammar.model;

public class Attempt {
    private Long id;
    private long userId;
    private long lessonId;
    private String lessonTitle;
    private int correctCount;
    private int totalQuestions;
    private java.math.BigDecimal scorePercent;
    private java.time.LocalDateTime submittedAt;
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public long getUserId() { return userId; }
    public void setUserId(long userId) { this.userId = userId; }
    public long getLessonId() { return lessonId; }
    public void setLessonId(long lessonId) { this.lessonId = lessonId; }
    public String getLessonTitle() { return lessonTitle; }
    public void setLessonTitle(String lessonTitle) { this.lessonTitle = lessonTitle; }
    public int getCorrectCount() { return correctCount; }
    public void setCorrectCount(int correctCount) { this.correctCount = correctCount; }
    public int getTotalQuestions() { return totalQuestions; }
    public void setTotalQuestions(int totalQuestions) { this.totalQuestions = totalQuestions; }
    public java.math.BigDecimal getScorePercent() { return scorePercent; }
    public void setScorePercent(java.math.BigDecimal scorePercent) { this.scorePercent = scorePercent; }
    public java.time.LocalDateTime getSubmittedAt() { return submittedAt; }
    public void setSubmittedAt(java.time.LocalDateTime submittedAt) { this.submittedAt = submittedAt; }
}
