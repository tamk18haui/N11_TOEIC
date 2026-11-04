package com.toeic.nhom11.grammar.model;

public class Answer {
    private Long id;
    private long attemptId;
    private long questionId;
    private Long selectedOptionId;
    private String questionText;
    private String selectedText;
    private String correctText;
    private String explanation;
    private boolean correct;
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public long getAttemptId() { return attemptId; }
    public void setAttemptId(long attemptId) { this.attemptId = attemptId; }
    public long getQuestionId() { return questionId; }
    public void setQuestionId(long questionId) { this.questionId = questionId; }
    public Long getSelectedOptionId() { return selectedOptionId; }
    public void setSelectedOptionId(Long selectedOptionId) { this.selectedOptionId = selectedOptionId; }
    public String getQuestionText() { return questionText; }
    public void setQuestionText(String questionText) { this.questionText = questionText; }
    public String getSelectedText() { return selectedText; }
    public void setSelectedText(String selectedText) { this.selectedText = selectedText; }
    public String getCorrectText() { return correctText; }
    public void setCorrectText(String correctText) { this.correctText = correctText; }
    public String getExplanation() { return explanation; }
    public void setExplanation(String explanation) { this.explanation = explanation; }
    public boolean getCorrect() { return correct; }
    public void setCorrect(boolean correct) { this.correct = correct; }
}
