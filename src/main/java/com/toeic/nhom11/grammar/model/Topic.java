package com.toeic.nhom11.grammar.model;

public class Topic {
    private Long id;
    private String title;
    private String description;
    private int sortOrder;
    private boolean published;
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public int getSortOrder() { return sortOrder; }
    public void setSortOrder(int sortOrder) { this.sortOrder = sortOrder; }
    public boolean getPublished() { return published; }
    public void setPublished(boolean published) { this.published = published; }
}
