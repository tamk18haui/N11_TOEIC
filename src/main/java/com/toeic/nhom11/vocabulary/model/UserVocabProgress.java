package com.toeic.nhom11.vocabulary.model;

import java.time.LocalDateTime;

public class UserVocabProgress {
    private Long id;
    private long userId;
    private long wordId;
    private String status;
    private boolean bookmarked;
    private int reviewCount;
    private LocalDateTime lastReviewedAt;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public long getUserId() { return userId; }
    public void setUserId(long userId) { this.userId = userId; }
    public long getWordId() { return wordId; }
    public void setWordId(long wordId) { this.wordId = wordId; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public boolean getBookmarked() { return bookmarked; }
    public void setBookmarked(boolean bookmarked) { this.bookmarked = bookmarked; }
    public int getReviewCount() { return reviewCount; }
    public void setReviewCount(int reviewCount) { this.reviewCount = reviewCount; }
    public LocalDateTime getLastReviewedAt() { return lastReviewedAt; }
    public void setLastReviewedAt(LocalDateTime lastReviewedAt) { this.lastReviewedAt = lastReviewedAt; }
}
