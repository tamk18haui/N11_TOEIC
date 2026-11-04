package com.toeic.nhom11.grammar.model;

public class Lesson {
    private Long id;
    private long topicId;
    private String topicTitle;
    private String title;
    private String summary;
    private String contentHtml;
    private String level;
    private int sortOrder;
    private boolean published;
    private int questionCount;
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public long getTopicId() { return topicId; }
    public void setTopicId(long topicId) { this.topicId = topicId; }
    public String getTopicTitle() { return topicTitle; }
    public void setTopicTitle(String topicTitle) { this.topicTitle = topicTitle; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getSummary() { return summary; }
    public void setSummary(String summary) { this.summary = summary; }
    public String getContentHtml() { return contentHtml; }
    public void setContentHtml(String contentHtml) { this.contentHtml = contentHtml; }
    public String getLevel() { return level; }
    public void setLevel(String level) { this.level = level; }
    public int getSortOrder() { return sortOrder; }
    public void setSortOrder(int sortOrder) { this.sortOrder = sortOrder; }
    public boolean getPublished() { return published; }
    public void setPublished(boolean published) { this.published = published; }
    public int getQuestionCount() { return questionCount; }
    public void setQuestionCount(int questionCount) { this.questionCount = questionCount; }
}
