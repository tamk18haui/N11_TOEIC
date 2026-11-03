package com.toeic.nhom11.grammar.model;

public class Example {
    private Long id;
    private long lessonId;
    private String sentence;
    private String translation;
    private String note;
    private int sortOrder;
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public long getLessonId() { return lessonId; }
    public void setLessonId(long lessonId) { this.lessonId = lessonId; }
    public String getSentence() { return sentence; }
    public void setSentence(String sentence) { this.sentence = sentence; }
    public String getTranslation() { return translation; }
    public void setTranslation(String translation) { this.translation = translation; }
    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }
    public int getSortOrder() { return sortOrder; }
    public void setSortOrder(int sortOrder) { this.sortOrder = sortOrder; }
}
