package com.toeic.nhom11.grammar.model;

import java.util.List;

/** Phản hồi từ server sau khi chọn ở chế độ luyện hoặc sau khi nộp bài thi. */
public record QuestionReview(boolean correct, List<OptionReview> options) {
    public record OptionReview(String label, String text, boolean correct,
                               boolean selected, String explanation) {}
}
