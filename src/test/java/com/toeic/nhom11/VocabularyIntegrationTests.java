package com.toeic.nhom11;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.transaction.annotation.Transactional;

import com.toeic.nhom11.vocabulary.dto.VocabularyQuiz;
import com.toeic.nhom11.vocabulary.dto.VocabularyLessonSummary;

import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Transactional
class VocabularyIntegrationTests {
    @Autowired MockMvc mvc;
    @Autowired JdbcTemplate jdbc;

    @Test
    void guestCanBrowseVocabularyTopics() throws Exception {
        mvc.perform(get("/vocabulary"))
            .andExpect(status().isOk())
            .andExpect(view().name("vocabulary/index"))
            .andExpect(model().attributeExists("topics", "flashcard"));
    }

    @Test
    @WithMockUser(username = "stale-session@example.test")
    void authenticatedSessionWithoutLocalAccountCanBrowseVocabulary() throws Exception {
        mvc.perform(get("/vocabulary"))
            .andExpect(status().isOk())
            .andExpect(view().name("vocabulary/index"))
            .andExpect(model().attributeExists("topics", "flashcard", "preferences"));
    }

    @Test
    void guestCanViewVocabularyTermsByTopic() throws Exception {
        mvc.perform(get("/vocabulary/1"))
            .andExpect(status().isOk())
            .andExpect(view().name("vocabulary/detail"))
            .andExpect(model().attributeExists("topic", "words"));
    }

    @Test
    @WithMockUser(username = "student@n11.local", roles = "STUDENT")
    void lessonUsesOnlyWordsAssignedToItsTopic() throws Exception {
        Long lessonId = jdbc.queryForObject("""
            SELECT id FROM vocabulary_lessons WHERE topic_id=4 AND sort_order=1
            """, Long.class);
        MvcResult lesson = mvc.perform(get("/vocabulary/4/lessons/" + lessonId))
            .andExpect(status().isOk())
            .andExpect(view().name("vocabulary/lesson"))
            .andReturn();
        @SuppressWarnings("unchecked")
        List<Object> words = (List<Object>) lesson.getModelAndView().getModel().get("words");
        assertEquals(10, words.size());
    }

    @Test
    void guestCanGetRandomVocabularyTerm() throws Exception {
        mvc.perform(get("/vocabulary"))
            .andExpect(status().isOk())
            .andExpect(model().attributeExists("flashcard"));
    }

    @Test
    void guestCannotSubmitQuizWithoutAuthentication() throws Exception {
        mvc.perform(post("/vocabulary/1/submit")
            .param("answer_1", "1")
            .param("answer_2", "2")
            .with(csrf()))
            .andExpect(status().is3xxRedirection());
    }

    @Test
    @WithMockUser(username = "student@n11.local", roles = "STUDENT")
    void signedInUserCanSubmitVocabularyQuiz() throws Exception {
        mvc.perform(post("/vocabulary/1/submit")
            .param("answer_1", "1")
            .param("answer_2", "2")
            .with(csrf()))
            .andExpect(status().is3xxRedirection())
            .andExpect(redirectedUrlPattern("/vocabulary/attempts/*"));
    }

    @Test
    @WithMockUser(username = "student@n11.local", roles = "STUDENT")
    void signedInUserCanViewQuizAttempt() throws Exception {
        // Insert a quiz attempt
        jdbc.update("""
            INSERT INTO vocabulary_quiz_attempts (user_id, topic_id, question_count, correct_count)
            VALUES (?, ?, ?, ?)""", 2, 1, 5, 3);

        Long attemptId = jdbc.queryForObject("SELECT MAX(id) FROM vocabulary_quiz_attempts WHERE user_id=2", Long.class);

        mvc.perform(get("/vocabulary/attempts/" + attemptId))
            .andExpect(status().isOk())
            .andExpect(view().name("vocabulary/result"))
            .andExpect(model().attributeExists("attempt", "answers"));
    }

    @Test
    @WithMockUser(username = "student@n11.local", roles = "STUDENT")
    void signedInUserCanViewQuizHistory() throws Exception {
        mvc.perform(get("/vocabulary/history"))
            .andExpect(status().isOk())
            .andExpect(view().name("vocabulary/history"))
            .andExpect(model().attributeExists("attempts"));
    }

    @Test
    @WithMockUser(username = "student@n11.local", roles = "STUDENT")
    void signedInUserCanUpdateProgress() throws Exception {
        mvc.perform(post("/vocabulary/1/progress")
            .param("status", "MASTERED")
            .with(csrf()))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.success").value(true));

        assertEquals(1, jdbc.queryForObject("""
            SELECT COUNT(*) FROM user_vocabulary_progress
            WHERE user_id=2 AND term_id=1 AND learning_status='MASTERED'""", Integer.class));
    }

    @Test
    @WithMockUser(username = "student@n11.local", roles = "STUDENT")
    void signedInUserCanToggleFavorite() throws Exception {
        mvc.perform(post("/vocabulary/1/favorite")
            .param("favorite", "true")
            .with(csrf()))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.success").value(true))
            .andExpect(jsonPath("$.favorite").value(true));

        assertEquals(1, jdbc.queryForObject("""
            SELECT COUNT(*) FROM user_vocabulary_progress
            WHERE user_id=2 AND term_id=1 AND is_favorite=true""", Integer.class));
    }

    @Test
    void nonExistentTopicReturns404() throws Exception {
        mvc.perform(get("/vocabulary/99999"))
            .andExpect(status().isNotFound());
    }

    @Test
    void seedPublishes25TopicsWithThreeIncreasingLessonTargets() {
        assertEquals(25, jdbc.queryForObject("""
            SELECT COUNT(*) FROM vocabulary_topics WHERE is_published=1
            """, Integer.class));
        assertEquals(75, jdbc.queryForObject("""
            SELECT COUNT(*) FROM vocabulary_lessons WHERE is_published=1
            """, Integer.class));
        assertEquals(25, jdbc.queryForObject("""
            SELECT COUNT(*) FROM (
                SELECT topic_id FROM vocabulary_lessons
                WHERE is_published=1
                GROUP BY topic_id
                HAVING COUNT(*)=3
            ) topics_with_three_lessons
            """, Integer.class));
        assertEquals(10, jdbc.queryForObject("""
            SELECT target_word_count FROM vocabulary_lessons
            WHERE topic_id=1 AND sort_order=1
            """, Integer.class));
        assertEquals(20, jdbc.queryForObject("""
            SELECT target_word_count FROM vocabulary_lessons
            WHERE topic_id=1 AND sort_order=2
            """, Integer.class));
        assertEquals(30, jdbc.queryForObject("""
            SELECT target_word_count FROM vocabulary_lessons
            WHERE topic_id=1 AND sort_order=3
            """, Integer.class));
    }

    @Test
    void everyPublishedTopicContainsAtLeastThirtyVocabularyTerms() {
        assertEquals(0, jdbc.queryForObject("""
            SELECT COUNT(*) FROM vocabulary_topics t
            WHERE t.is_published=1
              AND (SELECT COUNT(*) FROM vocabulary_terms term
                   WHERE term.topic_id=t.id) < 30
            """, Integer.class));
        assertTrue(jdbc.queryForObject(
            "SELECT COUNT(*) FROM vocabulary_terms", Integer.class) >= 750);
    }

    @Test
    void everyTopicRoadmapHasTenTwentyAndThirtyTermLessons() {
        assertEquals(75, jdbc.queryForObject("""
            SELECT COUNT(*) FROM (
                SELECT l.id
                FROM vocabulary_lessons l
                JOIN vocabulary_lesson_terms lt ON lt.lesson_id=l.id
                WHERE l.is_published=1
                GROUP BY l.id, l.target_word_count
                HAVING COUNT(DISTINCT lt.term_id)=CASE
                    WHEN l.target_word_count > 30 THEN 30
                    ELSE l.target_word_count
                END
            ) complete_lessons
            """, Integer.class));
    }

    @Test
    void vocabularyAdministrationRequiresAdminRole() throws Exception {
        mvc.perform(get("/admin/vocabulary"))
            .andExpect(status().is3xxRedirection());
    }

    @Test
    @WithMockUser(username = "student@n11.local", roles = "STUDENT")
    void studentCannotOpenVocabularyAdministration() throws Exception {
        mvc.perform(get("/admin/vocabulary"))
            .andExpect(status().isForbidden());
    }

    @Test
    @WithMockUser(username = "admin@n11.local", roles = "ADMIN")
    void adminCanManageVocabularyTopicsTermsAndLessons() throws Exception {
        mvc.perform(get("/admin/vocabulary"))
            .andExpect(status().isOk())
            .andExpect(view().name("vocabulary/admin/index"))
            .andExpect(model().attributeExists("topics", "stats"));

        mvc.perform(get("/admin/vocabulary/topics/1"))
            .andExpect(status().isOk())
            .andExpect(view().name("vocabulary/admin/topic"))
            .andExpect(model().attributeExists("topic", "lessons", "terms"));

        mvc.perform(get("/admin/vocabulary/topics/1/terms/new"))
            .andExpect(status().isOk())
            .andExpect(view().name("vocabulary/admin/term"));

        mvc.perform(post("/admin/vocabulary/terms/save")
                .param("topicId", "1")
                .param("word", "administration example")
                .param("meaningVi", "ví dụ quản trị")
                .param("definitionEn", "A term saved through vocabulary administration.")
                .param("exampleEn", "The admin saved an administration example.")
                .param("exampleVi", "Quản trị viên đã lưu một ví dụ.")
                .with(csrf()))
            .andExpect(status().is3xxRedirection())
            .andExpect(redirectedUrl("/admin/vocabulary/topics/1"));

        assertEquals(1, jdbc.queryForObject("""
            SELECT COUNT(*) FROM vocabulary_terms
            WHERE topic_id=1 AND word='administration example'
            """, Integer.class));
    }

    @Test
    @WithMockUser(username = "admin@n11.local", roles = "ADMIN")
    void publishedTopicCannotBeReducedBelowThirtyTerms() throws Exception {
        Long termId = jdbc.queryForObject("""
            SELECT id FROM vocabulary_terms WHERE topic_id=4 ORDER BY id LIMIT 1
            """, Long.class);
        mvc.perform(post("/admin/vocabulary/topics/4/terms/" + termId + "/delete")
                .with(csrf()))
            .andExpect(status().is3xxRedirection())
            .andExpect(flash().attributeExists("error"));

        assertEquals(30, jdbc.queryForObject("""
            SELECT COUNT(*) FROM vocabulary_terms WHERE topic_id=4
            """, Integer.class));
    }

    @Test
    void travelAndTransportHasTenTwentyAndThirtyWordLessons() {
        assertEquals(3, jdbc.queryForObject("""
            SELECT COUNT(*) FROM (
                SELECT l.id
                FROM vocabulary_lessons l
                JOIN vocabulary_topics t ON t.id=l.topic_id
                JOIN vocabulary_lesson_terms lt ON lt.lesson_id=l.id
                WHERE t.title='Travel and Transport'
                GROUP BY l.id, l.target_word_count
                HAVING COUNT(DISTINCT lt.term_id)=l.target_word_count
            ) lessons_with_progressive_words
            """, Integer.class));
    }

    @Test
    void guestCannotStartPlacementTest() throws Exception {
        // N11_V45_GUEST_TESTS
        mvc.perform(get("/vocabulary/1/lessons/1")).andExpect(status().is3xxRedirection());
        mvc.perform(get("/vocabulary/1/lessons/1/quiz/exercise")).andExpect(status().is3xxRedirection());
        mvc.perform(get("/vocabulary/history")).andExpect(status().is3xxRedirection());
        mvc.perform(get("/vocabulary/1/placement"))
            .andExpect(status().is3xxRedirection());
    }

    // N11_V46_FREE_STUDY
    @Test
    @WithMockUser(username = "student@n11.local", roles = "STUDENT")
    void publishedLessonsCanBeStudiedInAnyOrder() throws Exception {
        Long lastLesson = jdbc.queryForObject("SELECT id FROM vocabulary_lessons WHERE topic_id=1 AND sort_order=3", Long.class);
        MvcResult topic = mvc.perform(get("/vocabulary/1")).andExpect(status().isOk()).andReturn();
        @SuppressWarnings("unchecked")
        List<VocabularyLessonSummary> lessons = (List<VocabularyLessonSummary>) topic.getModelAndView().getModel().get("lessons");
        assertEquals(false, lessons.stream().anyMatch(lesson -> "LOCKED".equals(lesson.getState())));
        mvc.perform(get("/vocabulary/1/lessons/" + lastLesson)).andExpect(status().isOk());
        mvc.perform(get("/vocabulary/1/lessons/" + lastLesson + "/quiz/exercise")).andExpect(status().isOk());
    }

    @Test
    @WithMockUser(username = "student@n11.local", roles = "STUDENT")
    void placementTestRequires25Of30ToPass() throws Exception {
        MvcResult failedTest = startPlacementTest();
        VocabularyQuiz quiz = (VocabularyQuiz) failedTest.getModelAndView()
            .getModel().get("quiz");
        assertEquals(30, quiz.getQuestions().size());
        assertEquals(25L, quiz.getQuestions().stream()
            .filter(question -> "MULTIPLE_CHOICE".equals(question.getKind())).count());
        assertEquals(5L, quiz.getQuestions().stream()
            .filter(question -> "DICTATION".equals(question.getKind())).count());

        submitPlacementTest(failedTest, 24);
        assertEquals(false, jdbc.queryForObject("""
            SELECT passed FROM vocabulary_quiz_attempts
            WHERE user_id=2 AND topic_id=1 AND quiz_type='PLACEMENT'
            ORDER BY id DESC LIMIT 1
            """, Boolean.class));

        MvcResult passingTest = startPlacementTest();
        submitPlacementTest(passingTest, 25);
        assertEquals(true, jdbc.queryForObject("""
            SELECT passed FROM vocabulary_quiz_attempts
            WHERE user_id=2 AND topic_id=1 AND quiz_type='PLACEMENT'
            ORDER BY id DESC LIMIT 1
            """, Boolean.class));

        MvcResult topic = mvc.perform(get("/vocabulary/1"))
            .andExpect(status().isOk())
            .andReturn();
        @SuppressWarnings("unchecked")
        List<VocabularyLessonSummary> lessons = (List<VocabularyLessonSummary>)
            topic.getModelAndView().getModel().get("lessons");
        assertEquals(3, lessons.size());
        assertEquals(false, lessons.stream().anyMatch(lesson -> "LOCKED".equals(lesson.getState())));
    }

    @Test
    @WithMockUser(username = "student@n11.local", roles = "STUDENT")
    void lessonQuizCompletionPersistsScoreAndStars() throws Exception {
        MvcResult started = mvc.perform(get("/vocabulary/1/lessons/1/quiz/exercise"))
            .andExpect(status().isOk())
            .andReturn();
        VocabularyQuiz quiz = (VocabularyQuiz) started.getModelAndView()
            .getModel().get("quiz");
        assertEquals(10, quiz.getQuestions().size());

        Map<String, String> params = new java.util.HashMap<>();
        params.put("quizToken", quiz.getToken());
        quiz.getQuestions().stream().limit(7).forEach(question ->
            params.put("answer_" + question.getNumber(), Long.toString(question.getTerm().getId())));
        submitQuiz(started, "/vocabulary/1/lessons/1/quiz/exercise/submit", params);

        assertEquals(1, jdbc.queryForObject("""
            SELECT COUNT(*) FROM user_vocabulary_lesson_progress
            WHERE user_id=2 AND lesson_id=1 AND status='COMPLETED'
                AND best_score=70 AND stars=1
            """, Integer.class));
        assertEquals(10, jdbc.queryForObject("""
            SELECT COUNT(*) FROM vocabulary_quiz_answers a
            JOIN vocabulary_quiz_attempts q ON q.id=a.attempt_id
            WHERE q.user_id=2 AND q.lesson_id=1 AND q.quiz_type='LESSON'
            """, Integer.class));
    }

    @Test
    @WithMockUser(username = "student@n11.local", roles = "STUDENT")
    void signedInUserCanSaveDisplayPreferences() throws Exception {
        mvc.perform(post("/vocabulary/preferences")
            .param("theme", "DARK")
            .param("fontSize", "LARGE")
            .param("language", "EN")
            .with(csrf()))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.success").value(true));

        assertEquals(1, jdbc.queryForObject("""
            SELECT COUNT(*) FROM user_vocabulary_preferences
            WHERE user_id=2 AND theme='DARK' AND font_size='LARGE' AND language='EN'
            """, Integer.class));
    }

    private MvcResult startPlacementTest() throws Exception {
        return mvc.perform(get("/vocabulary/1/placement"))
            .andExpect(status().isOk())
            .andReturn();
    }

    private void submitPlacementTest(MvcResult started, int correctQuestionCount) throws Exception {
        VocabularyQuiz quiz = (VocabularyQuiz) started.getModelAndView()
            .getModel().get("quiz");
        Map<String, String> params = new java.util.HashMap<>();
        params.put("quizToken", quiz.getToken());
        quiz.getQuestions().stream().limit(correctQuestionCount).forEach(question -> {
            if ("DICTATION".equals(question.getKind())) {
                params.put("dictation_" + question.getNumber(), question.getTerm().getWord());
            } else {
                params.put("answer_" + question.getNumber(),
                    Long.toString(question.getTerm().getId()));
            }
        });
        submitQuiz(started, "/vocabulary/1/placement/submit", params);
    }

    private void submitQuiz(MvcResult started, String path, Map<String, String> params)
        throws Exception {
        MockHttpSession session = (MockHttpSession) started.getRequest().getSession(false);
        var request = post(path).session(session).with(csrf());
        for (Map.Entry<String, String> entry : params.entrySet()) {
            request.param(entry.getKey(), entry.getValue());
        }
        mvc.perform(request).andExpect(status().is3xxRedirection())
            .andExpect(redirectedUrlPattern("/vocabulary/attempts/*"));
    }
}
