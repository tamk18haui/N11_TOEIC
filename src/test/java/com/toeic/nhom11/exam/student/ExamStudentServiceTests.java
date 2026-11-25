package com.toeic.nhom11.exam.student;

import org.junit.jupiter.api.Test;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

class ExamStudentServiceTests {
    private static final String EMAIL="student@example.test";
    private final ExamStudentDao dao=mock(ExamStudentDao.class);
    private final ExamStudentService service=new ExamStudentService(dao);

    @Test
    void manualSubmitSavesLatestAnswersBeforeGrading() {
        exam("LR_CUSTOM",30,60);
        allow(8,81,"READING");
        when(dao.answerRows(1)).thenReturn(List.of(Map.of("selectedOptionId",81L)));

        var result=service.submit(1,EMAIL,Map.of(8L,81L));

        assertEquals("SUBMITTED",result.get("status"));
        assertEquals(1,result.get("answeredCount"));
        var order=inOrder(dao);
        order.verify(dao).saveAnswer(1,8,81L);
        order.verify(dao).gradeAnswers(1);
        order.verify(dao).finishAttempt(1,"SUBMITTED",0,0,null,null,null);
    }

    @Test
    void invalidAnswerPreventsBothWritingAndSubmitting() {
        exam("LR_CUSTOM",30,60);
        allow(8,81,"READING");
        when(dao.questionSkill(2,9)).thenReturn(Optional.of("READING"));

        assertEquals(400,assertThrows(ResponseStatusException.class,
            ()->service.submit(1,EMAIL,Map.of(8L,81L,9L,999L))).getStatusCode().value());
        verify(dao,never()).saveAnswer(anyLong(),anyLong(),any());
        verify(dao,never()).gradeAnswers(anyLong());
    }

    @Test
    void expiredAttemptGradesOnlyServerConfirmedAnswers() {
        exam("LR_FULL",0,7200);
        when(dao.answerRows(1)).thenReturn(List.of(Map.of("selectedOptionId",81L)));

        var result=service.submit(1,EMAIL,Map.of(9L,91L));

        assertEquals("EXPIRED",result.get("status"));
        assertEquals(1,result.get("answeredCount"));
        verify(dao,never()).saveAnswer(anyLong(),anyLong(),any());
        verify(dao).finishAttempt(1,"EXPIRED",0,0,null,null,null);
    }

    @Test
    void listeningClosesExactlyWhenReadingBegins() {
        exam("LR_FULL",4500,2700);
        allow(8,81,"LISTENING");

        assertEquals(409,assertThrows(ResponseStatusException.class,
            ()->service.submit(1,EMAIL,Map.of(8L,81L))).getStatusCode().value());
        verify(dao,never()).saveAnswer(anyLong(),anyLong(),any());
        verify(dao,never()).gradeAnswers(anyLong());
    }

    @Test
    void readingUsesOnlyEnglishFromStructuredBankContent() {
        assertEquals("Memo\n\nRead this [131].",ExamContent.passage("""
            {"title":"Memo","lines":[{"en":"Read this [131].","vi":"Dịch nghĩa"}],"glossary":{"read":"đọc"}}
            """));
        assertEquals("Office\n\nEmail\nPlease reply.\n\nNotice\nDoors open at 8.",ExamContent.passage("""
            {"title":"Office","documents":[
              {"title":"Email","title_vi":"Thư","lines":[{"en":"Please reply.","vi":"Vui lòng trả lời."}]},
              {"title":"Notice","lines":[{"en":"Doors open at 8."}]}
            ]}
            """));
        assertEquals("",ExamContent.passage("{broken}"));
        assertEquals("Plain text",ExamContent.passage("Plain text"));
        assertEquals("Evidence",ExamContent.explanation("""
            {"explanation":"Evidence","options_vi":{"A":"Giải nghĩa"}}
            """));
        assertEquals("Read [135] then [139].",ExamContent.renumberGaps("Read [131] then [135].",
            Map.of("131","135","135","139")));
    }

    @Test
    void readyAcceptsPart6WithOnlyAPassageImageAndPart7WithOnlyAQuestionImage() {
        prepareReading(List.of(
            readingQuestion(6,1,Map.of("passageImageUrl","/assets/email.png")),
            readingQuestion(7,2,Map.of("imageUrl","https://example.test/notice.png"))));

        assertEquals(2,service.ready(2,EMAIL).get("questionCount"));
    }

    @Test
    void readyRejectsReadingQuestionsWithoutTextOrAUsableImage() {
        prepareReading(List.of(readingQuestion(7,1,Map.of("imageUrl","javascript:alert(1)"))));

        assertEquals(409,assertThrows(ResponseStatusException.class,
            ()->service.ready(2,EMAIL)).getStatusCode().value());
    }

    @Test
    void readingShowsTheSharedAndQuestionImagesDuringAndAfterTheExam() {
        String passage="/assets/email.png";
        String question="/assets/question.png";
        var both=readingQuestion(6,1,Map.of("passageImageUrl",passage,"imageUrl",question));
        var duplicate=readingQuestion(7,2,Map.of("passageImageUrl",passage,"imageUrl",passage));
        when(dao.questionRows(2)).thenReturn(List.of(both,duplicate));
        exam("LR_CUSTOM",30,60);

        var active=(List<?>)service.state(1,EMAIL).get("questions");
        assertImages((Map<?,?>)active.get(0),passage,question);
        assertImages((Map<?,?>)active.get(1),passage,"");

        when(dao.ownedAttempt(1,EMAIL,true)).thenReturn(Optional.of(Map.of("examPaperId",2L,"status","SUBMITTED")));
        var result=(List<?>)service.result(1,EMAIL,0,false).get("questions");
        assertImages((Map<?,?>)result.get(0),passage,question);
        assertImages((Map<?,?>)result.get(1),passage,"");
    }

    @Test
    void readingGroupsUsePassageIdsAndFullPart6CanGroupScanOnlyQuestions() {
        exam("LR_FULL",4500,2700);
        String scan="/assets/reading.webp";
        when(dao.questionRows(2)).thenReturn(List.of(
            readingQuestion(6,131,Map.of("imageUrl",scan)),
            readingQuestion(6,134,Map.of("imageUrl",scan)),
            readingQuestion(6,135,Map.of("imageUrl",scan)),
            readingQuestion(7,147,Map.of("passageId",5,"passageImageUrl",scan)),
            readingQuestion(7,148,Map.of("passageId",5,"passageImageUrl",scan)),
            readingQuestion(7,149,Map.of("passageId",6,"passageImageUrl",scan))));

        var state=(List<?>)service.state(1,EMAIL).get("questions");
        var groups=state.stream().map(row->((Map<?,?>)row).get("readingGroup")).toList();
        assertEquals(List.of("part6-0","part6-0","part6-1","passage-5","passage-5","passage-6"),groups);
    }

    private void prepareReading(List<Map<String,Object>> questions) {
        when(dao.activeUser(EMAIL)).thenReturn(Optional.of(8L));
        when(dao.publishedPaper(2)).thenReturn(Optional.of(Map.of("examType","LR_CUSTOM","durationMinutes",20)));
        when(dao.questionRows(2)).thenReturn(questions);
        when(dao.optionQuality(2)).thenReturn(questions.stream().map(q->Map.<String,Object>of(
            "examQuestionId",q.get("examQuestionId"),"correctCount",1,"optionCount",4)).toList());
    }

    private static Map<String,Object> readingQuestion(int part,int order,Map<String,Object> materials) {
        var question=new HashMap<String,Object>(Map.of("examQuestionId",order,"questionId",order,
            "questionOrder",order,"partNo",part,"skill","READING"));
        question.putAll(materials);
        return question;
    }

    private static void assertImages(Map<?,?> row,String primary,String secondary) {
        assertEquals(primary,row.get("image"));
        assertEquals(secondary,row.get("questionImage"));
    }

    private void exam(String type,int remaining,int elapsed) {
        when(dao.ownedAttempt(1,EMAIL,true)).thenReturn(Optional.of(Map.of(
            "id",1L,"examPaperId",2L,"status","IN_PROGRESS","examType",type,
            "remainingSeconds",remaining,"elapsedSeconds",elapsed)));
        when(dao.gradeAnswers(1)).thenReturn(Map.of());
        when(dao.scaledScore(eq(2L),anyString(),anyInt())).thenReturn(null);
    }

    private void allow(long question,long option,String skill) {
        when(dao.questionSkill(2,question)).thenReturn(Optional.of(skill));
        when(dao.optionBelongs(2,question,option)).thenReturn(true);
    }
}
