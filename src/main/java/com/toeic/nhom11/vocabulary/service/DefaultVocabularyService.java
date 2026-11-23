package com.toeic.nhom11.vocabulary.service;

import com.toeic.nhom11.vocabulary.dao.VocabularyDao;
import com.toeic.nhom11.vocabulary.dto.VocabularyLessonSummary;
import com.toeic.nhom11.vocabulary.dto.VocabularyQuiz;
import com.toeic.nhom11.vocabulary.dto.VocabularyTopicSummary;
import com.toeic.nhom11.vocabulary.model.*;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

import java.math.BigDecimal;
import java.text.Normalizer;
import java.util.*;

@Service
@Transactional(readOnly = true)
public class DefaultVocabularyService implements VocabularyService {
    private final VocabularyDao dao;

    public DefaultVocabularyService(VocabularyDao dao) {
        this.dao = dao;
    }

    @Override
    public List<VocabularyTopic> topics(boolean admin) {
        return dao.topics(!admin);
    }

    @Override
    public List<VocabularyTopicSummary> topicSummaries(String email) {
        long userId = userIdOrZero(email);
        return dao.topicSummaries(userId);
    }

    @Override
    public VocabularyTopic topic(long id, boolean admin) {
        var topic = dao.topic(id);
        if (topic.isEmpty() || (!admin && !topic.get().getPublished())) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy chủ đề");
        }
        return topic.get();
    }

    @Override
    public List<VocabularyLessonSummary> lessonSummaries(long topicId, String email) {
        topic(topicId, false);
        long userId = userIdOrZero(email);
        boolean placementPassed = userId > 0 && dao.placementPassed(topicId, userId);
        List<VocabularyLessonSummary> summaries = dao.lessonSummaries(topicId, userId);
        boolean previousLessonCompleted = true;
        for (VocabularyLessonSummary summary : summaries) {
            if ("COMPLETED".equals(summary.getState())) {
                previousLessonCompleted = true;
            } else if (placementPassed || previousLessonCompleted) {
                summary.setState("IN_PROGRESS".equals(summary.getState()) ? "IN_PROGRESS" : "OPEN");
                previousLessonCompleted = false;
            } else {
                summary.setState("LOCKED");
                previousLessonCompleted = false;
            }
        }
        return summaries;
    }

    @Override
    @Transactional
    public VocabularyLesson beginLesson(long topicId, long lessonId, String email) {
        VocabularyLesson lesson = dao.lesson(topicId, lessonId)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy bài học"));
        VocabularyLessonSummary summary = lessonSummaries(topicId, email).stream()
            .filter(item -> item.getLesson().getId() == lessonId)
            .findFirst()
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy bài học"));
        if ("LOCKED".equals(summary.getState())) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN, "Hãy hoàn thành bài học trước hoặc vượt qua bài kiểm tra đầu vào.");
        }
        if (email != null && !email.isBlank() && !"COMPLETED".equals(summary.getState())) {
            dao.updateLessonProgress(lessonId, userId(email), BigDecimal.ZERO, 0);
        }
        return lesson;
    }

    @Override
    public List<VocabularyWord> lessonWords(long topicId, long lessonId) {
        dao.lesson(topicId, lessonId)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy bài học"));
        return dao.lessonWords(lessonId);
    }

    @Override
    public List<VocabularyWord> words(long topicId) {
        topic(topicId, false);
        return dao.words(topicId);
    }

    @Override
    public VocabularyWord word(long id) {
        return dao.word(id)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy từ vựng"));
    }

    @Override
    public Optional<VocabularyWord> randomWord() {
        return dao.randomWord();
    }

    @Override
    @Transactional
    public long submit(long topicId, String email, Map<Long, Long> selections) {
        topic(topicId, false);
        if (email == null || email.isBlank()) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }
        long userId = dao.userId(email)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy tài khoản"));

        int correct = 0;
        for (long termId : selections.keySet()) {
            dao.word(termId).orElseThrow(() ->
                new ResponseStatusException(HttpStatus.BAD_REQUEST, "Từ vựng không hợp lệ"));
        }

        List<VocabularyWord> words = dao.words(topicId);
        Map<Long, Integer> correctAnswers = new HashMap<>();

        for (VocabularyWord w : words) {
            Long selected = selections.get(w.getId());
            if (selected != null && selected.equals(w.getId())) {
                correct++;
                correctAnswers.put(w.getId(), 1);
            } else {
                correctAnswers.put(w.getId(), 0);
            }
        }

        VocabularyQuizAttempt attempt = new VocabularyQuizAttempt();
        attempt.setUserId(userId);
        attempt.setTopicId(topicId);
        attempt.setQuestionCount(words.size());
        attempt.setCorrectCount(correct);

        long attemptId = dao.insertAttempt(attempt);

        int questionNumber = 1;
        for (VocabularyWord w : words) {
            VocabularyQuizAttemptAnswer answer = new VocabularyQuizAttemptAnswer();
            answer.setAttemptId(attemptId);
            answer.setQuestionNumber(questionNumber++);
            answer.setTermId(w.getId());
            Long selected = selections.get(w.getId());
            answer.setSelectedTermId(selected);
            answer.setCorrect(correctAnswers.get(w.getId()) == 1);
            dao.insertAnswer(answer);
        }

        return attemptId;
    }

    @Override
    public VocabularyQuizAttempt attempt(long id, String email) {
        if (email == null || email.isBlank()) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }
        long userId = dao.userId(email)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy tài khoản"));
        return dao.attempt(id, userId)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy bài kiểm tra"));
    }

    @Override
    public List<VocabularyQuizAttemptAnswer> answers(long attemptId, String email) {
        attempt(attemptId, email);
        return dao.answers(attemptId);
    }

    @Override
    public List<VocabularyQuizAttempt> history(String email) {
        if (email == null || email.isBlank()) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }
        long userId = dao.userId(email)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy tài khoản"));
        return dao.history(userId);
    }

    @Override
    public Map<Long, java.math.BigDecimal> bestScores(String email) {
        if (email == null || email.isBlank()) {
            return Collections.emptyMap();
        }
        return dao.userId(email).map(userId -> dao.bestScores(userId)).orElse(Collections.emptyMap());
    }

    @Override
    public boolean placementPassed(long topicId, String email) {
        long userId = userIdOrZero(email);
        return userId > 0 && dao.placementPassed(topicId, userId);
    }

    @Override
    public VocabularyQuiz startPlacementQuiz(long topicId, String email) {
        userId(email);
        topic(topicId, false);
        List<VocabularyWord> words = dao.words(topicId);
        if (words.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Chủ đề chưa có từ vựng để tạo bài kiểm tra.");
        }
        return createQuiz(topicId, null, "PLACEMENT", "Bài kiểm tra vượt cấp", words, 30, 25);
    }

    @Override
    @Transactional
    public VocabularyQuiz startLessonQuiz(long topicId, long lessonId, String mode, String email) {
        userId(email);
        beginLesson(topicId, lessonId, email);
        if (!"EXERCISE".equals(mode) && !"DICTATION".equals(mode)) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Chế độ học không hợp lệ.");
        }
        List<VocabularyWord> words = lessonWords(topicId, lessonId);
        if (words.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.CONFLICT, "Bài học chưa có từ vựng.");
        }
        boolean dictation = "DICTATION".equals(mode);
        int count = dictation ? 5 : 10;
        return createQuiz(topicId, lessonId, "LESSON",
            dictation ? "Luyện nghe viết" : "Bài tập từ vựng", words, count,
            dictation ? 0 : count);
    }

    private VocabularyQuiz createQuiz(long topicId, Long lessonId, String type, String title,
                                      List<VocabularyWord> words, int totalQuestions, int multipleChoiceCount) {
        List<VocabularyWord> allWords = dao.allWords();
        if (allWords.size() < 4) {
            allWords = words;
        }
        List<VocabularyQuiz.Question> questions = new ArrayList<>();
        for (int index = 0; index < totalQuestions; index++) {
            VocabularyWord term = words.get(index % words.size());
            VocabularyQuiz.Question question = new VocabularyQuiz.Question();
            question.setNumber(index + 1);
            question.setTerm(term);
            if (index < multipleChoiceCount) {
                question.setKind("MULTIPLE_CHOICE");
                List<VocabularyWord> options = new ArrayList<>();
                options.add(term);
                List<VocabularyWord> distractors = new ArrayList<>(allWords);
                Collections.shuffle(distractors);
                for (VocabularyWord candidate : distractors) {
                    if (!candidate.getId().equals(term.getId())
                        && options.stream().noneMatch(option -> option.getId().equals(candidate.getId()))) {
                        options.add(candidate);
                    }
                    if (options.size() == Math.min(4, allWords.size())) break;
                }
                Collections.shuffle(options);
                question.setOptions(options);
            } else {
                question.setKind("DICTATION");
                question.setOptions(List.of());
            }
            questions.add(question);
        }
        VocabularyQuiz quiz = new VocabularyQuiz();
        quiz.setToken(UUID.randomUUID().toString());
        quiz.setType(type);
        quiz.setTopicId(topicId);
        quiz.setLessonId(lessonId);
        quiz.setTitle(title);
        quiz.setQuestions(questions);
        return quiz;
    }

    @Override
    @Transactional
    public long submitLearningQuiz(VocabularyQuiz quiz, String email, Map<String, String> responses) {
        long userId = userId(email);
        int correct = 0;
        List<VocabularyQuizAttemptAnswer> answers = new ArrayList<>();
        for (VocabularyQuiz.Question question : quiz.getQuestions()) {
            VocabularyQuizAttemptAnswer answer = new VocabularyQuizAttemptAnswer();
            answer.setTermId(question.getTerm().getId());
            answer.setQuestionNumber(question.getNumber());
            if ("DICTATION".equals(question.getKind())) {
                String submitted = responses.getOrDefault("dictation_" + question.getNumber(), "").trim();
                if (submitted.length() > 500) {
                    throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Câu trả lời quá dài.");
                }
                answer.setTypedAnswer(submitted);
                answer.setCorrect(normalizeAnswer(submitted).equals(normalizeAnswer(question.getTerm().getWord())));
            } else {
                String submitted = responses.get("answer_" + question.getNumber());
                Long parsedSelection = parseSelection(submitted);
                boolean validOption = parsedSelection != null && question.getOptions().stream()
                    .anyMatch(option -> option.getId().equals(parsedSelection));
                Long selectedId = validOption ? parsedSelection : null;
                answer.setSelectedTermId(selectedId);
                answer.setCorrect(selectedId != null && selectedId.equals(question.getTerm().getId()));
            }
            if (answer.isCorrect()) correct++;
            answers.add(answer);
        }

        boolean passed = "PLACEMENT".equals(quiz.getType()) ? correct >= 25
            : correct * 100 >= quiz.getQuestions().size() * 70;
        VocabularyQuizAttempt attempt = new VocabularyQuizAttempt();
        attempt.setUserId(userId);
        attempt.setTopicId(quiz.getTopicId());
        attempt.setLessonId(quiz.getLessonId());
        attempt.setQuizType(quiz.getType());
        attempt.setQuestionCount(quiz.getQuestions().size());
        attempt.setCorrectCount(correct);
        attempt.setPassed(passed);
        long attemptId = dao.insertAttempt(attempt);

        for (VocabularyQuizAttemptAnswer answer : answers) {
            answer.setAttemptId(attemptId);
            dao.insertAnswer(answer);
        }
        if ("LESSON".equals(quiz.getType())) {
            BigDecimal score = BigDecimal.valueOf(correct * 100.0 / quiz.getQuestions().size());
            dao.updateLessonProgress(quiz.getLessonId(), userId, score, starsFor(score));
        }
        return attemptId;
    }

    private String normalizeAnswer(String answer) {
        String normalized = Normalizer.normalize(answer, Normalizer.Form.NFKC)
            .toLowerCase(Locale.ROOT).replaceAll("[^\\p{L}\\p{N}]+", " ").trim();
        return normalized.replaceAll("\\s+", " ");
    }

    private Long parseSelection(String selection) {
        if (selection == null) return null;
        try {
            return Long.parseLong(selection);
        } catch (NumberFormatException exception) {
            return null;
        }
    }

    private int starsFor(BigDecimal score) {
        if (score.compareTo(BigDecimal.valueOf(95)) >= 0) return 3;
        if (score.compareTo(BigDecimal.valueOf(80)) >= 0) return 2;
        if (score.compareTo(BigDecimal.valueOf(60)) >= 0) return 1;
        return 0;
    }

    @Override
    public VocabularyUserPreferences preferences(String email) {
        if (email == null || email.isBlank()) {
            return new VocabularyUserPreferences();
        }
        return dao.userId(email)
            .map(userId -> dao.preferences(userId))
            .orElseGet(VocabularyUserPreferences::new);
    }

    @Override
    @Transactional
    public void updatePreferences(String email, VocabularyUserPreferences preferences) {
        if (preferences.getTheme() == null || preferences.getFontSize() == null
            || preferences.getLanguage() == null
            || !Set.of("LIGHT", "DARK").contains(preferences.getTheme())
            || !Set.of("SMALL", "MEDIUM", "LARGE").contains(preferences.getFontSize())
            || !Set.of("VI", "EN").contains(preferences.getLanguage())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Tùy chọn giao diện không hợp lệ.");
        }
        dao.updatePreferences(userId(email), preferences);
    }

    private long userId(String email) {
        if (email == null || email.isBlank()) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }
        return dao.userId(email)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy tài khoản"));
    }

    private long userIdOrZero(String email) {
        return email == null || email.isBlank() ? 0 : dao.userId(email).orElse(0L);
    }

    @Override
    @Transactional
    public void updateProgress(long termId, String email, String learningStatus) {
        if (email == null || email.isBlank()) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }
        if (learningStatus == null || !Set.of("NEW", "LEARNING", "MASTERED").contains(learningStatus)) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Trạng thái học không hợp lệ.");
        }
        word(termId);
        long userId = dao.userId(email)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy tài khoản"));
        dao.updateProgress(userId, termId, learningStatus);
    }

    @Override
    @Transactional
    public void markFavorite(long termId, String email, boolean favorite) {
        if (email == null || email.isBlank()) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }
        word(termId);
        long userId = dao.userId(email)
            .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy tài khoản"));
        dao.markFavorite(userId, termId, favorite);
    }

    @Override
    public List<VocabularyLesson> lessons(long topicId) {
        topic(topicId, true);
        return dao.lessons(topicId);
    }

    @Override
    public List<VocabularyTerm> terms(long topicId) {
        topic(topicId, true);
        return dao.terms(topicId);
    }

    @Override
    public VocabularyTerm term(long id) {
        return dao.term(id).orElseThrow(() ->
            new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy từ vựng"));
    }

    @Override
    @Transactional
    public long saveTopic(VocabularyTopic topic) {
        requireText(topic.getTitle(), 180, "Tên chủ đề");
        requireOptionalText(topic.getDescription(), 2000, "Mô tả");
        if (topic.getSortOrder() < 0) {
            throw new IllegalArgumentException("Thứ tự phải không âm.");
        }
        if (!Set.of("BASIC", "INTERMEDIATE", "ADVANCED").contains(topic.getLevel())) {
            throw new IllegalArgumentException("Mức độ không hợp lệ.");
        }
        if (topic.getPublished()
            && (topic.getId() == null || dao.terms(topic.getId()).size() < 30)) {
            throw new IllegalArgumentException("Chủ đề cần ít nhất 30 từ trước khi công bố.");
        }
        if (topic.getId() != null) topic(topic.getId(), true);
        return dao.saveTopic(topic);
    }

    @Override
    @Transactional
    public void deleteTopic(long id) {
        topic(id, true);
        if (!dao.lessons(id).isEmpty() || !dao.terms(id).isEmpty()) {
            throw new IllegalArgumentException("Chủ đề còn bài học hoặc từ vựng. Hãy xóa nội dung trước.");
        }
        dao.deleteTopic(id);
    }

    @Override
    @Transactional
    public long saveLesson(VocabularyLesson lesson) {
        topic(lesson.getTopicId(), true);
        requireText(lesson.getTitle(), 200, "Tên bài học");
        requireOptionalText(lesson.getDescription(), 2000, "Mô tả");
        if (lesson.getSortOrder() < 0) {
            throw new IllegalArgumentException("Thứ tự phải không âm.");
        }
        if (lesson.getTargetWordCount() < 10 || lesson.getTargetWordCount() > 36) {
            throw new IllegalArgumentException("Mục tiêu từ vựng phải từ 10 đến 36.");
        }
        if (lesson.getId() != null) {
            dao.lesson(lesson.getTopicId(), lesson.getId())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Không tìm thấy bài học"));
        }
        if (lesson.getPublished() && dao.terms(lesson.getTopicId()).size() < lesson.getTargetWordCount()) {
            throw new IllegalArgumentException("Chủ đề chưa đủ số từ để công bố bài học.");
        }
        long lessonId = dao.saveLesson(lesson);
        dao.assignLessonTerms(lessonId, lesson.getTopicId(), lesson.getTargetWordCount());
        return lessonId;
    }

    @Override
    @Transactional
    public void deleteLesson(long id) {
        dao.deleteLesson(id);
    }

    @Override
    @Transactional
    public long saveTerm(VocabularyTerm term) {
        topic(term.getTopicId(), true);
        requireText(term.getWord(), 160, "Từ vựng");
        requireOptionalText(term.getIpa(), 160, "Phiên âm");
        requireText(term.getMeaningVi(), 500, "Nghĩa tiếng Việt");
        requireOptionalText(term.getDefinitionEn(), 4000, "Định nghĩa tiếng Anh");
        requireOptionalText(term.getExampleEn(), 4000, "Ví dụ tiếng Anh");
        requireOptionalText(term.getExampleVi(), 4000, "Bản dịch ví dụ");
        if (term.getId() != null) {
            VocabularyTerm existing = term(term.getId());
            if (existing.getTopicId() != term.getTopicId()) {
                throw new IllegalArgumentException("Không được chuyển từ vựng sang chủ đề khác.");
            }
        }
        return dao.saveTerm(term);
    }

    @Override
    @Transactional
    public void deleteTerm(long id) {
        VocabularyTerm existing = term(id);
        VocabularyTopic parent = topic(existing.getTopicId(), true);
        if (parent.getPublished() && dao.terms(parent.getId()).size() <= 30) {
            throw new IllegalArgumentException("Chủ đề đã công bố phải giữ ít nhất 30 từ.");
        }
        dao.deleteTerm(id);
    }

    @Override
    public Map<String, Object> statistics() {
        return dao.statistics();
    }

    private void requireText(String value, int max, String field) {
        if (value == null || value.isBlank() || value.length() > max) {
            throw new IllegalArgumentException(field + " không được trống và tối đa " + max + " ký tự.");
        }
    }

    private void requireOptionalText(String value, int max, String field) {
        if (value != null && value.length() > max) {
            throw new IllegalArgumentException(field + " tối đa " + max + " ký tự.");
        }
    }
}
