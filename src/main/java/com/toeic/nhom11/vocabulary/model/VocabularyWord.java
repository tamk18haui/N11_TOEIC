package com.toeic.nhom11.vocabulary.model;

public class VocabularyWord {
    private Long id;
    private long topicId;
    private String word;
    private String phonetic;
    private String partOfSpeech;
    private String meaningVi;
    private String definitionEn;
    private String exampleSentence;
    private String exampleMeaning;
    private String audioUrl;
    private String imageUrl;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public long getTopicId() { return topicId; }
    public void setTopicId(long topicId) { this.topicId = topicId; }
    public String getWord() { return word; }
    public void setWord(String word) { this.word = word; }
    public String getPhonetic() { return phonetic; }
    public void setPhonetic(String phonetic) { this.phonetic = phonetic; }
    public String getPartOfSpeech() { return partOfSpeech; }
    public void setPartOfSpeech(String partOfSpeech) { this.partOfSpeech = partOfSpeech; }
    public String getMeaningVi() { return meaningVi; }
    public void setMeaningVi(String meaningVi) { this.meaningVi = meaningVi; }
    public String getDefinitionEn() { return definitionEn; }
    public void setDefinitionEn(String definitionEn) { this.definitionEn = definitionEn; }
    public String getExampleSentence() { return exampleSentence; }
    public void setExampleSentence(String exampleSentence) { this.exampleSentence = exampleSentence; }
    public String getExampleMeaning() { return exampleMeaning; }
    public void setExampleMeaning(String exampleMeaning) { this.exampleMeaning = exampleMeaning; }
    public String getAudioUrl() { return audioUrl; }
    public void setAudioUrl(String audioUrl) { this.audioUrl = audioUrl; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
}
