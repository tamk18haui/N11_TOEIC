package com.toeic.nhom11;

import com.toeic.nhom11.reading.service.ReadingService;
import com.toeic.nhom11.reading.dao.ReadingDao;
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
import java.util.List;
import java.util.Map;
import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Transactional
class ReadingIntegrationTests {
    private static final String STUDENT="student@n11.local", ADMIN="admin@n11.local";
    @Autowired ReadingService service;
    @Autowired ReadingDao dao;
    @Autowired JdbcTemplate jdbc;
    @Autowired MockMvc mvc;
    private long n(Object value) {return ((Number)value).longValue();}
    @SuppressWarnings("unchecked")
    private List<Map<String,Object>> questions(long attempt) {return (List<Map<String,Object>>)service.state(attempt,STUDENT).get("questions");}
    private long correct(long question) {return jdbc.queryForObject("SELECT id FROM practice_options WHERE question_id=? AND is_correct=TRUE",Long.class,question);}
    private long incorrect(long question) {return jdbc.queryForObject("SELECT MIN(id) FROM practice_options WHERE question_id=? AND is_correct=FALSE",Long.class,question);}

    @Test void fiveLevelsHaveRealContentAndValidQuestions() {
        assertEquals(5,service.levels(null).size());
        for(int level=1;level<=5;level++) {
            assertEquals(6,n(service.level(level,null).get("total")));
            long attempt=service.start(level,STUDENT);
            assertEquals(6,questions(attempt).size());
            for(var q:questions(attempt)) {
                assertFalse(q.containsKey("correct_option")); assertFalse(q.containsKey("explanation"));
                assertFalse(q.get("translation").toString().isBlank());
                assertFalse(((List<?>)q.get("vocabulary")).isEmpty());
                assertFalse(q.toString().contains("is_correct"));
            }
        }
    }
    @Test void startResumesAndSnapshotDoesNotGrowWithNewQuestions() {
        long id=service.start(1,STUDENT); assertEquals(id,service.start(1,STUDENT));
        long set=n(dao.level(1).orElseThrow().get("id"));
        jdbc.update("INSERT INTO practice_questions(practice_set_id,question_text,sort_order) VALUES(?, 'new question',99)",set);
        assertEquals(6,questions(id).size()); assertEquals(6,n(service.state(id,STUDENT).get("total")));
    }
    @Test void gradesOnServerAndPersistsImmediateProgress() {
        long id=service.start(1,STUDENT); var qs=questions(id);
        long q1=n(qs.get(0).get("id")),q2=n(qs.get(1).get("id"));
        service.answer(id,q1,correct(q1),STUDENT); service.answer(id,q2,incorrect(q2),STUDENT);
        var state=service.state(id,STUDENT);
        assertEquals(2,n(state.get("answered"))); assertEquals(1,n(state.get("correct")));
        assertEquals(2,n(service.level(1,STUDENT).get("practiced")));
        assertEquals(0,n(service.level(1,ADMIN).get("practiced")));
        assertTrue(questions(id).get(0).containsKey("explanation")); assertFalse(questions(id).get(2).containsKey("explanation"));
    }
    @Test void rejectsForeignQuestionAndOptionWithoutSaving() {
        long id=service.start(1,STUDENT), other=service.start(2,STUDENT);
        long q=n(questions(id).get(0).get("id")), foreign=n(questions(other).get(0).get("id"));
        assertThrows(ResponseStatusException.class,()->service.answer(id,q,correct(foreign),STUDENT));
        assertThrows(ResponseStatusException.class,()->service.answer(id,foreign,correct(foreign),STUDENT));
        assertEquals(0,n(service.state(id,STUDENT).get("answered")));
    }
    @Test void firstAnswerIsFinalAndRetryIsIdempotent() {
        long id=service.start(1,STUDENT), q=n(questions(id).get(0).get("id")), option=incorrect(q);
        service.answer(id,q,option,STUDENT); service.answer(id,q,option,STUDENT);
        assertThrows(ResponseStatusException.class,()->service.answer(id,q,correct(q),STUDENT));
        assertEquals(1,n(service.state(id,STUDENT).get("answered"))); assertEquals(0,n(service.state(id,STUDENT).get("correct")));
    }
    @Test void finishCountsSkippedQuestionsAndCanBeRetried() {
        long id=service.start(1,STUDENT), q=n(questions(id).get(0).get("id"));
        service.answer(id,q,correct(q),STUDENT); service.finish(id,STUDENT); service.finish(id,STUDENT);
        var result=service.state(id,STUDENT); assertEquals(true,result.get("finished")); assertEquals(16.67,result.get("score"));
        assertTrue(questions(id).stream().allMatch(item->item.containsKey("correct_option")));
        assertEquals("16.67",jdbc.queryForObject("SELECT score_percent FROM practice_attempts WHERE id=?",java.math.BigDecimal.class,id).toPlainString());
        assertThrows(ResponseStatusException.class,()->service.answer(id,q,correct(q),STUDENT));
        assertNotEquals(id,service.start(1,STUDENT));
        assertEquals(1,n(service.level(1,STUDENT).get("practiced")));
    }
    @Test void allCorrectGetsOneHundredAndBlankGetsZero() {
        long id=service.start(1,STUDENT);
        for(var q:questions(id)) {long qid=n(q.get("id")); service.answer(id,qid,correct(qid),STUDENT);}
        service.finish(id,STUDENT); assertEquals(100.0,service.state(id,STUDENT).get("score"));
        long blank=service.start(1,STUDENT); service.finish(blank,STUDENT);
        assertEquals(0.0,service.state(blank,STUDENT).get("score"));
        assertEquals(6,n(service.level(1,STUDENT).get("practiced")));
    }
    @Test void attemptsAndHistoryArePrivate() {
        long id=service.start(1,STUDENT), q=n(questions(id).get(0).get("id"));
        assertThrows(ResponseStatusException.class,()->service.state(id,ADMIN));
        assertThrows(ResponseStatusException.class,()->service.answer(id,q,correct(q),ADMIN));
        assertThrows(ResponseStatusException.class,()->service.finish(id,ADMIN));
        service.finish(id,STUDENT); assertTrue(service.history(ADMIN).isEmpty()); assertEquals(1,service.history(STUDENT).size());
    }
    @Test void draftsAndInvalidLevelsCannotBeStarted() {
        jdbc.update("UPDATE practice_sets SET is_published=FALSE WHERE id=?",dao.level(1).orElseThrow().get("id"));
        assertEquals(0,n(service.level(1,null).get("total")));
        assertThrows(ResponseStatusException.class,()->service.start(1,STUDENT));
        assertThrows(ResponseStatusException.class,()->service.level(6,null));
    }
    @Test void incompleteQuestionSetIsNotStarted() {
        long set=n(dao.level(1).orElseThrow().get("id")), q=n(dao.questions(set).get(0).get("id"));
        jdbc.update("UPDATE practice_options SET is_correct=FALSE WHERE question_id=?",q);
        assertThrows(ResponseStatusException.class,()->service.start(1,STUDENT));
        assertEquals(0,jdbc.queryForObject("SELECT COUNT(*) FROM practice_attempts",Integer.class));
    }
    @Test @WithMockUser(username=STUDENT,roles="STUDENT") void studentCanBrowseReadingLevels() throws Exception {
        mvc.perform(get("/reading")).andExpect(status().isOk()).andExpect(view().name("reading/index"));
        mvc.perform(get("/reading/part5/2")).andExpect(status().isOk()).andExpect(view().name("reading/intro"));
        mvc.perform(get("/reading/part5/9")).andExpect(status().isNotFound());
    }
    @Test void readingPagesAndPracticeRequireLogin() throws Exception {
        // N11_V45_GUEST_TESTS
        mvc.perform(get("/reading")).andExpect(status().isOk());
        mvc.perform(get("/reading/part5")).andExpect(status().isOk());
        mvc.perform(get("/reading/part6")).andExpect(status().isOk());
        mvc.perform(get("/reading/part7")).andExpect(status().isOk());
        mvc.perform(get("/reading/part5/2")).andExpect(status().is3xxRedirection());
        mvc.perform(get("/reading/api/attempts/1")).andExpect(status().is3xxRedirection());
        mvc.perform(post("/reading/part5/1/start").with(csrf())).andExpect(status().is3xxRedirection()).andExpect(redirectedUrl("/login"));
    }
    @Test @WithMockUser(username=STUDENT,roles="STUDENT") void mvcRequiresCsrfAndHidesAnswerUntilChecked() throws Exception {
        mvc.perform(post("/reading/part5/1/start")).andExpect(status().isForbidden());
        long id=service.start(1,STUDENT),q=n(questions(id).get(0).get("id"));
        mvc.perform(get("/reading/api/attempts/"+id)).andExpect(status().isOk()).andExpect(jsonPath("$.questions[0].correct_option").doesNotExist());
        mvc.perform(post("/reading/api/attempts/"+id+"/answers").with(csrf()).contentType("application/json").content("{\"questionId\":"+q+",\"optionId\":"+correct(q)+"}"))
            .andExpect(status().isOk()).andExpect(jsonPath("$.correct").value(1)).andExpect(jsonPath("$.questions[0].correct_option").exists());
        mvc.perform(post("/reading/api/attempts/"+id+"/finish")).andExpect(status().isForbidden());
        mvc.perform(post("/reading/api/attempts/"+id+"/finish").with(csrf())).andExpect(status().isOk()).andExpect(jsonPath("$.finished").value(true));
    }
    @Test @WithMockUser(username=ADMIN,roles="ADMIN") void apiRejectsAnotherAccountsAttempt() throws Exception {
        long id=service.start(1,STUDENT);
        mvc.perform(get("/reading/api/attempts/"+id)).andExpect(status().isNotFound());
        mvc.perform(get("/reading/attempts/"+id)).andExpect(status().isNotFound());
    }
    @Test void loginReturnsToTheSelectedLevelWithoutStartingAnAttempt() throws Exception {
        var request=mvc.perform(get("/reading/part5/2/ready")).andExpect(status().is3xxRedirection()).andReturn();
        var session=(org.springframework.mock.web.MockHttpSession)request.getRequest().getSession();
        var login=mvc.perform(post("/login").session(session).with(csrf()).param("email",STUDENT).param("password","N11@Demo2026"))
            .andExpect(status().is3xxRedirection()).andReturn();
        assertTrue(login.getResponse().getHeader("Location").contains("/reading/part5/2/ready"));
        mvc.perform(get("/reading/part5/2/ready").session(session)).andExpect(status().isOk()).andExpect(view().name("reading/intro"));
        assertEquals(0,jdbc.queryForObject("SELECT COUNT(*) FROM practice_attempts",Integer.class));
    }
}
