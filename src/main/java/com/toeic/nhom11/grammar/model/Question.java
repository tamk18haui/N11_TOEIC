package com.toeic.nhom11.grammar.model;

public class Question {
    private Long id;
    private long lessonId;
    private String questionText;
    private String explanation;
    private int difficulty;
    private int sortOrder;
    private java.util.List<Option> options = new java.util.ArrayList<>();
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public long getLessonId() { return lessonId; }
    public void setLessonId(long lessonId) { this.lessonId = lessonId; }
    public String getQuestionText() { return questionText; }
    public void setQuestionText(String questionText) { this.questionText = questionText; }
    public String getExplanation() { return explanation; }
    public void setExplanation(String explanation) { this.explanation = explanation; }
    public int getDifficulty() { return difficulty; }
    public void setDifficulty(int difficulty) { this.difficulty = difficulty; }
    public int getSortOrder() { return sortOrder; }
    public void setSortOrder(int sortOrder) { this.sortOrder = sortOrder; }
    public java.util.List<Option> getOptions() { return options; }
    public void setOptions(java.util.List<Option> options) { this.options = options; }
}
