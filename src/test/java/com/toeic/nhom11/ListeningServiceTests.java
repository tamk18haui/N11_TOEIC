package com.toeic.nhom11;

import com.toeic.nhom11.dao.ListeningDao;
import com.toeic.nhom11.model.ListeningSubmission;
import com.toeic.nhom11.service.ListeningService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

class ListeningServiceTests {
    private static final String EMAIL="listener@example.test";
    private static final long SET=7, ATTEMPT=12, USER=3;
    private final ListeningDao dao=mock(ListeningDao.class);
    private final ListeningService service=new ListeningService(dao);

    @BeforeEach
    void setUp() {
        when(dao.activeUser(EMAIL)).thenReturn(Optional.of(USER));
        when(dao.set(SET)).thenReturn(Optional.of(Map.of(
            "part_no",3,"instructions","[LISTENING_LEVEL:1]")));
        when(dao.lockedAttempt(ATTEMPT,USER,SET)).thenReturn(Optional.of(Map.of("total_questions",3)));
        when(dao.questions(SET)).thenReturn(List.of(
            Map.of("id",1L,"passage_id",21L),
            Map.of("id",2L,"passage_id",21L),
            Map.of("id",3L,"passage_id",22L)));
        when(dao.options(anyLong(),eq(true))).thenReturn(List.of(
            option(101,"A",true),option(102,"B",false),option(103,"C",false),option(104,"D",false)));
        when(dao.explanations(SET)).thenReturn(List.of(
            Map.of("id",1L,"explanation","Evidence one","passage_text","Shared audio transcript"),
            Map.of("id",2L,"explanation","Evidence two","passage_text","Shared audio transcript")));
    }

    @Test
    void rejectsSingleQuestionSubmissionForSharedAudio() {
        assertThrows(ResponseStatusException.class,()->service.checkAnswer(SET,ATTEMPT,1,101,EMAIL));
        verify(dao,never()).saveAnswer(anyLong(),anyLong(),any(),anyBoolean());
    }

    @Test
    void checksGroupOnlyAfterEveryChoiceIsValid() {
        assertThrows(ResponseStatusException.class,()->service.checkGroup(SET,ATTEMPT,1,
            new ListeningSubmission(Map.of("1",101L)),EMAIL));
        assertThrows(ResponseStatusException.class,()->service.checkGroup(SET,ATTEMPT,1,
            new ListeningSubmission(Map.of("1",101L,"2",999L)),EMAIL));
        assertThrows(ResponseStatusException.class,()->service.checkGroup(SET,ATTEMPT,1,
            new ListeningSubmission(Map.of("1",101L,"2",102L,"3",103L)),EMAIL));
        verify(dao,never()).saveAnswer(anyLong(),anyLong(),any(),anyBoolean());

        var result=reviews(service.checkGroup(SET,ATTEMPT,1,
            new ListeningSubmission(Map.of("1",101L,"2",102L)),EMAIL));
        assertEquals(2,result.size());
        assertEquals(true,result.get(0).get("correct"));
        assertEquals(false,result.get(1).get("correct"));
        assertEquals("Shared audio transcript",result.get(0).get("transcript"));
        verify(dao).saveAnswer(ATTEMPT,1,101L,true);
        verify(dao).saveAnswer(ATTEMPT,2,102L,false);
        verify(dao).refreshAttempt(ATTEMPT,3);
    }

    @Test
    void resumesLegacyPartialGroupWithoutRevealingItsTranscript() {
        when(dao.checkedAnswers(ATTEMPT)).thenReturn(List.of(saved(1,101)));
        var existing=reviews(service.viewAttempt(SET,ATTEMPT,EMAIL));
        assertEquals(List.of(Map.of("questionId",1L,"selectedId",101L)),existing);

        var checked=reviews(service.checkGroup(SET,ATTEMPT,2,
            new ListeningSubmission(Map.of("2",102L)),EMAIL));
        assertEquals(2,checked.size());
        assertEquals("Shared audio transcript",checked.get(0).get("transcript"));
        verify(dao,never()).saveAnswer(eq(ATTEMPT),eq(1L),any(),anyBoolean());
        verify(dao).saveAnswer(ATTEMPT,2,102L,false);
    }

    @Test
    void repeatingGroupCheckReturnsSavedChoicesWithoutWriting() {
        when(dao.checkedAnswers(ATTEMPT)).thenReturn(List.of(saved(1,101),saved(2,102)));
        var result=reviews(service.checkGroup(SET,ATTEMPT,1,
            new ListeningSubmission(Map.of("1",104L,"2",104L)),EMAIL));
        assertEquals(101L,result.get(0).get("selectedId"));
        assertEquals(102L,result.get(1).get("selectedId"));
        verify(dao,never()).saveAnswer(anyLong(),anyLong(),any(),anyBoolean());
    }

    @Test
    void doesNotExposeAnotherAccountsHistory() {
        when(dao.lockedAttempt(ATTEMPT,USER,SET)).thenReturn(Optional.empty());
        assertEquals(404,assertThrows(ResponseStatusException.class,
            ()->service.viewAttempt(SET,ATTEMPT,EMAIL)).getStatusCode().value());
        verify(dao,never()).checkedAnswers(ATTEMPT);
    }

    private static Map<String,Object> option(long id,String label,boolean correct) {
        return Map.of("id",id,"option_label",label,"option_text",label,"is_correct",correct);
    }

    private static Map<String,Object> saved(long question,long option) {
        return Map.of("question_id",question,"selected_option_id",option);
    }

    @SuppressWarnings("unchecked")
    private static List<Map<String,Object>> reviews(Map<String,Object> result) {
        return (List<Map<String,Object>>)result.get("review");
    }
}
