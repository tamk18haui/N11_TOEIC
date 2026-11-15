package com.toeic.nhom11.vocabulary.dto;

import com.toeic.nhom11.vocabulary.model.UserVocabProgress;
import com.toeic.nhom11.vocabulary.model.VocabularyWord;

public class VocabularyWordProgressView {
    private VocabularyWord word;
    private UserVocabProgress progress;

    public VocabularyWord getWord() { return word; }
    public void setWord(VocabularyWord word) { this.word = word; }
    public UserVocabProgress getProgress() { return progress; }
    public void setProgress(UserVocabProgress progress) { this.progress = progress; }
}
