package com.toeic.nhom11.vocabulary.dto;

import java.time.LocalDateTime;

public class VocabularyTopicSummary {
    private Long id;
    private String title;
    private String description;
    private String level;
    private int displayOrder;
    private boolean published;
    private LocalDateTime createdAt;
    private long totalWords;
    private long masteredWords;
    private long learningWords;
    private long bookmarkedWords;
    private double progressPercent;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getLevel() { return level; }
    public void setLevel(String level) { this.level = level; }
    public int getDisplayOrder() { return displayOrder; }
    public void setDisplayOrder(int displayOrder) { this.displayOrder = displayOrder; }
    public boolean getPublished() { return published; }
    public void setPublished(boolean published) { this.published = published; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    public long getTotalWords() { return totalWords; }
    public void setTotalWords(long totalWords) { this.totalWords = totalWords; }
    public long getMasteredWords() { return masteredWords; }
    public void setMasteredWords(long masteredWords) { this.masteredWords = masteredWords; }
    public long getLearningWords() { return learningWords; }
    public void setLearningWords(long learningWords) { this.learningWords = learningWords; }
    public long getBookmarkedWords() { return bookmarkedWords; }
    public void setBookmarkedWords(long bookmarkedWords) { this.bookmarkedWords = bookmarkedWords; }
    public double getProgressPercent() { return progressPercent; }
    public void setProgressPercent(double progressPercent) { this.progressPercent = progressPercent; }
}
