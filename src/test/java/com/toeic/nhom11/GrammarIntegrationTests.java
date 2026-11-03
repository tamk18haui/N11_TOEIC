package com.toeic.nhom11;

import com.toeic.nhom11.grammar.dao.GrammarDao;
import com.toeic.nhom11.grammar.model.*;
import com.toeic.nhom11.grammar.service.GrammarService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import java.util.*;
import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Transactional
class GrammarIntegrationTests {
    @Autowired GrammarService service;
    @Autowired GrammarDao dao;
    @Autowired JdbcTemplate jdbc;
    @Autowired MockMvc mvc;

    @Test void gradesAndPersistsAllAnswers() {
        Map<Long,Long> answers=new HashMap<>();
        service.questions(1).forEach(q->answers.put(q.getId(),q.getOptions().stream().filter(Option::getCorrect).findFirst().orElseThrow().getId()));
        long id=service.submit(1,"student@n11.local",answers);
        var result=service.attempt(id,"student@n11.local");
        assertEquals(5,result.getCorrectCount());assertEquals("100.00",result.getScorePercent().toPlainString());
        assertEquals(5,service.answers(id,"student@n11.local").size());
    }
    @Test void blankAnswersReceiveZeroAndAreSaved() {
        long id=service.submit(1,"student@n11.local",Map.of());
        assertEquals(0,service.attempt(id,"student@n11.local").getCorrectCount());
        assertTrue(service.answers(id,"student@n11.local").stream().allMatch(a->a.getSelectedOptionId()==null));
    }
    @Test void mixedAnswersAreGradedOnTheServer() {
        var q=service.questions(1).get(0);var right=q.getOptions().stream().filter(Option::getCorrect).findFirst().orElseThrow();
        long id=service.submit(1,"student@n11.local",Map.of(q.getId(),right.getId()));
        assertEquals("20.00",service.attempt(id,"student@n11.local").getScorePercent().toPlainString());
    }
    @Test void rejectsAnOptionBelongingToAnotherQuestionWithoutSaving() {
        long before=jdbc.queryForObject("SELECT COUNT(*) FROM grammar_attempts",Long.class);
        var qs=service.questions(1);
        assertThrows(IllegalArgumentException.class,()->service.submit(1,"student@n11.local",Map.of(qs.get(0).getId(),qs.get(1).getOptions().get(0).getId())));
        assertEquals(before,jdbc.queryForObject("SELECT COUNT(*) FROM grammar_attempts",Long.class));
    }
    @Test void rejectsAQuestionFromAnotherLesson() {
        assertThrows(IllegalArgumentException.class,()->service.submit(1,"student@n11.local",Map.of(6L,21L)));
    }
    @Test void historyIsPrivateToItsOwner() {
        long id=service.submit(1,"student@n11.local",Map.of());
        assertThrows(ResponseStatusException.class,()->service.attempt(id,"admin@n11.local"));
    }
    @Test void lessonCrudAndHtmlSanitization() {
        Lesson l=draft();l.setContentHtml("<h2>Grammar</h2><script>alert(1)</script><p onclick='evil()'>Safe</p>");
        long id=service.saveLesson(l);l=service.lesson(id,true);assertFalse(l.getContentHtml().contains("script"));assertFalse(l.getContentHtml().contains("onclick"));
        l.setTitle("Updated lesson");service.saveLesson(l);assertEquals("Updated lesson",service.lesson(id,true).getTitle());
        service.deleteLesson(id);assertThrows(ResponseStatusException.class,()->service.lesson(id,true));
    }
    @Test void draftIsHiddenFromPublicListingAndDetail() {
        long id=service.saveLesson(draft());assertThrows(ResponseStatusException.class,()->service.lesson(id,false));
        assertTrue(service.lessons("Draft test",null,null,false).isEmpty());
    }
    @Test void cannotPublishIncompleteLesson() {
        Lesson l=draft();l.setPublished(true);assertThrows(IllegalArgumentException.class,()->service.saveLesson(l));
    }
    @Test void questionRequiresExactlyOneCorrectOption() {
        Question q=service.questions(1).get(0);q.getOptions().forEach(o->o.setCorrect(true));
        assertThrows(IllegalArgumentException.class,()->service.saveQuestion(q));
    }
    @Test void cannotChangeQuestionsOrDeleteLessonsWithAttempts() {
        service.submit(1,"student@n11.local",Map.of());
        assertThrows(IllegalArgumentException.class,()->service.saveQuestion(service.questions(1).get(0)));
        assertThrows(IllegalArgumentException.class,()->service.deleteLesson(1));
    }
    @Test void topicAndExampleAndQuestionCrud() {
        Topic t=new Topic();t.setTitle("Test topic");long topic=service.saveTopic(t);t.setId(topic);t.setTitle("Renamed topic");service.saveTopic(t);
        Lesson l=draft();l.setTopicId(topic);long id=service.saveLesson(l);
        Example e=new Example();e.setLessonId(id);e.setSentence("We work here.");e.setTranslation("Chúng tôi làm việc ở đây.");long example=service.saveExample(e);e.setId(example);e.setNote("Present simple");service.saveExample(e);
        Question q=service.questions(1).get(0);q.setId(null);q.setLessonId(id);long question=service.saveQuestion(q);q.setId(question);q.setQuestionText("Updated question");service.saveQuestion(q);
        assertEquals("Updated question",service.questions(id).get(0).getQuestionText());
        service.deleteQuestion(question,id);service.deleteExample(example,id);service.deleteLesson(id);service.deleteTopic(topic);
        assertTrue(dao.topic(topic).isEmpty());
    }
    @Test void searchAndCategoryFiltersUseBoundParameters() {
        assertEquals(1,service.lessons("Present Simple",1L,"BASIC",false).size());
        assertTrue(service.lessons("' OR 1=1 --",null,null,false).isEmpty());
    }
    @Test void guestCanReadAndAdminRequiresLogin() throws Exception {
        mvc.perform(get("/grammar")).andExpect(status().isOk()).andExpect(view().name("grammar/index"));
        mvc.perform(get("/admin/grammar")).andExpect(status().is3xxRedirection());
    }
    @Test @WithMockUser(username="student@n11.local",roles="STUDENT")
    void studentCannotManageContentAndPostsNeedCsrf() throws Exception {
        mvc.perform(get("/admin/grammar")).andExpect(status().isForbidden());
        mvc.perform(post("/grammar/1/submit")).andExpect(status().isForbidden());
        mvc.perform(post("/grammar/1/submit").with(csrf())).andExpect(status().is3xxRedirection());
    }
    @Test @WithMockUser(username="admin@n11.local",roles="ADMIN")
    void adminCanAccessDashboard() throws Exception {mvc.perform(get("/admin/grammar")).andExpect(status().isOk());}
    @Test void newRegistrationCanLogInAndStudyGrammar() throws Exception {
        var get=mvc.perform(get("/register")).andExpect(status().isOk()).andReturn();
        var session=(org.springframework.mock.web.MockHttpSession)get.getRequest().getSession();
        String token=(String)session.getAttribute(com.toeic.nhom11.controller.RegistrationCsrfAdvice.SESSION_KEY);
        mvc.perform(post("/register").session(session).with(csrf())
            .param("_registrationCsrf",token).param("fullName","Grammar Student")
            .param("email","grammar.integration@example.com").param("password","Strong@123")
            .param("confirmPassword","Strong@123"))
            .andExpect(status().is3xxRedirection()).andExpect(redirectedUrl("/register"));
        assertEquals(1,jdbc.queryForObject("SELECT COUNT(*) FROM users u JOIN user_profiles p ON p.user_id=u.id WHERE u.email=?",Integer.class,"grammar.integration@example.com"));
        mvc.perform(post("/login").with(csrf()).param("email","grammar.integration@example.com").param("password","Strong@123"))
            .andExpect(status().is3xxRedirection()).andExpect(redirectedUrl("/grammar"));
    }
    private Lesson draft() {
        Lesson l=new Lesson();l.setTopicId(1);l.setTitle("Draft test");l.setSummary("Test summary");l.setContentHtml("<p>Test lesson</p>");l.setLevel("BASIC");return l;
    }
}
