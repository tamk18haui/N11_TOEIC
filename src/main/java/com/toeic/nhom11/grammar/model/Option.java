package com.toeic.nhom11.grammar.model;

public class Option {
    private Long id;
    private long questionId;
    private String optionLabel;
    private String optionText;
    private boolean correct;
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public long getQuestionId() { return questionId; }
    public void setQuestionId(long questionId) { this.questionId = questionId; }
    public String getOptionLabel() { return optionLabel; }
    public void setOptionLabel(String optionLabel) { this.optionLabel = optionLabel; }
    public String getOptionText() { return optionText; }
    public void setOptionText(String optionText) { this.optionText = optionText; }
    public boolean getCorrect() { return correct; }
    public void setCorrect(boolean correct) { this.correct = correct; }
}
