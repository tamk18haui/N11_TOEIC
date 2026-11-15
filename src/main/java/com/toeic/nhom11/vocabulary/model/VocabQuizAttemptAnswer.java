package com.toeic.nhom11.vocabulary.model;

public class VocabQuizAttemptAnswer {
    private Long id;
    private long attemptId;
    private int questionNo;
    private String questionType;
    private long wordId;
    private Long selectedWordId;
    private boolean correct;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public long getAttemptId() { return attemptId; }
    public void setAttemptId(long attemptId) { this.attemptId = attemptId; }
    public int getQuestionNo() { return questionNo; }
    public void setQuestionNo(int questionNo) { this.questionNo = questionNo; }
    public String getQuestionType() { return questionType; }
    public void setQuestionType(String questionType) { this.questionType = questionType; }
    public long getWordId() { return wordId; }
    public void setWordId(long wordId) { this.wordId = wordId; }
    public Long getSelectedWordId() { return selectedWordId; }
    public void setSelectedWordId(Long selectedWordId) { this.selectedWordId = selectedWordId; }
    public boolean getCorrect() { return correct; }
    public void setCorrect(boolean correct) { this.correct = correct; }
}
