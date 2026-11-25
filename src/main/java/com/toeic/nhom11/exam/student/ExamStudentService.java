package com.toeic.nhom11.exam.student;

import java.util.*;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;

/**
 * Student flow: published papers -> timed attempts -> saved answers -> server grading.
 * No Admin CRUD and no changes to existing practice attempts.
 */
@Service
public class ExamStudentService {
    private static final Map<Integer,Integer> FULL_COUNTS=Map.of(
        1,6,2,25,3,39,4,30,5,30,6,16,7,54);
    private static final int LISTENING_SECONDS = 45*60;
    private static final int FULL_SECONDS = 120*60;

    /** For a full test, only the first 45 minutes allow Listening answers. */
    static String phaseOf(Map<String,Object> attempt) {
        if (!"LR_FULL".equals(attempt.get("examType"))) return "CUSTOM";
        return intVal(attempt.get("elapsedSeconds")) < LISTENING_SECONDS ? "LISTENING" : "READING";
    }

    static int phaseSeconds(Map<String,Object> attempt) {
        int total=Math.max(0,intVal(attempt.get("remainingSeconds")));
        if (!"LR_FULL".equals(attempt.get("examType"))) return total;
        if ("LISTENING".equals(phaseOf(attempt)))
            return Math.min(total,Math.max(0,LISTENING_SECONDS - Math.max(0,intVal(attempt.get("elapsedSeconds")))));
        return total;
    }
    private final ExamStudentDao dao;
    public ExamStudentService(ExamStudentDao dao){this.dao=dao;}

    private static long longVal(Object value) {return ((Number)value).longValue();}
    private static int intVal(Object value) {return ((Number)value).intValue();}
    private static ResponseStatusException error(HttpStatus status,String message){
        return new ResponseStatusException(status,message);
    }
    private String email(String principal) {
        if(principal==null||principal.isBlank())
            throw error(HttpStatus.UNAUTHORIZED,"Vui lòng đăng nhập để thi thử.");
        return principal.trim().toLowerCase(Locale.ROOT);
    }
    private long userId(String principal) {
        return dao.activeUser(email(principal)).orElseThrow(
            ()->error(HttpStatus.FORBIDDEN,"Tài khoản không còn hoạt động."));
    }
    private Map<String,Object> attempt(long id,String principal,boolean lock) {
        return dao.ownedAttempt(id,email(principal),lock).orElseThrow(
            ()->error(HttpStatus.NOT_FOUND,"Không tìm thấy lượt thi của bạn."));
    }

    public List<Map<String,Object>> papers(){return dao.publishedPapers();}

    @Transactional(readOnly=true)
    public Map<String,Object> ready(long paperId,String principal){
        long uid=userId(principal);
        var paper=new LinkedHashMap<>(dao.publishedPaper(paperId).orElseThrow(
            ()->error(HttpStatus.NOT_FOUND,"Đề thi chưa được công bố.")));
        for (long attemptId:dao.inProgressAttempts(paperId,uid)) {
            var existing=attempt(attemptId,principal,false);
            if ("IN_PROGRESS".equals(existing.get("status")) && intVal(existing.get("remainingSeconds"))>0) {
                paper.put("resumeAttemptId",attemptId);
                return paper;
            }
        }
        paper.put("questionCount",checkPaperReady(paperId,paper));
        return paper;
    }

    private static String audioGroup(Map<String,Object> question) {
        int part=intVal(question.get("partNo"));
        Object passage=question.get("passageId");
        return (part==3 || part==4) && passage!=null
            ? "passage-"+passage : "question-"+question.get("examQuestionId");
    }

    private record Pictures(String primary,String question) {}

    private static Pictures pictures(Map<String,Object> row,int part) {
        String question=ExamContent.media(row.get("imageUrl"));
        String passage=ExamContent.media(row.get("passageImageUrl"));
        if (part>=6 && !passage.isBlank())
            return new Pictures(passage,passage.equals(question)?"":question);
        return new Pictures(question.isBlank()?passage:question,"");
    }

    private static String readingGroup(Map<String,Object> question,boolean full) {
        int part=intVal(question.get("partNo"));
        Object passage=question.get("passageId");
        if (passage!=null) return "passage-"+passage;
        int order=intVal(question.get("questionOrder"));
        if (full && part==6 && order>=131 && order<=146)
            return "part6-"+((order-131)/4);
        return "";
    }

    private Map<Object,Map<String,String>> gapNumbers(List<Map<String,Object>> questions) {
        Map<Object,Map<String,String>> numbers=new HashMap<>();
        for (var question:questions) {
            if (intVal(question.get("partNo"))!=6 || question.get("passageId")==null) continue;
            String original=ExamContent.gapNumber(question.get("questionText"));
            if (!original.isEmpty()) {
                numbers.computeIfAbsent(question.get("passageId"),key->new HashMap<>())
                    .put(original,question.get("questionOrder").toString());
            }
        }
        return numbers;
    }

    /** Admin is the sole source of question composition and publication. */
    private int checkPaperReady(long paperId,Map<String,Object> paper){
        var questions=dao.questionRows(paperId);
        if(questions.isEmpty()||questions.size()>200)
            throw error(HttpStatus.CONFLICT,"Đề thi chưa có số lượng câu hợp lệ. Vui lòng liên hệ quản trị viên.");
        int minutes=intVal(paper.get("durationMinutes"));
        if(minutes<1||minutes>240)
            throw error(HttpStatus.CONFLICT,"Thời gian làm bài chưa hợp lệ.");
        boolean full="LR_FULL".equals(paper.get("examType"));
        if(full && minutes!=FULL_SECONDS/60)
            throw error(HttpStatus.CONFLICT,"Full Test cần đặt thời gian 120 phút để chia 45 phút Listening và 75 phút Reading.");
        Map<Integer,Integer> counts=new HashMap<>();
        Set<Long> uniqueOrders=new HashSet<>();
        Set<Long> questionIds=new HashSet<>();
        int previousPart=0;
        long expectedOrder=1;
        for(var q:questions){
            int part=intVal(q.get("partNo"));
            if(part<1||part>7 || part<previousPart
                || !(part<=4?"LISTENING":"READING").equals(q.get("skill"))
                || longVal(q.get("questionOrder"))!=expectedOrder++
                || !uniqueOrders.add(longVal(q.get("questionOrder")))
                || !questionIds.add(longVal(q.get("questionId"))))
                throw error(HttpStatus.CONFLICT,"Đề thi chứa câu hỏi hoặc thứ tự bị trùng, sai Part.");
            counts.merge(part,1,Integer::sum);
            previousPart=part;
        }
        if(full){
            if(questions.size()!=200||!counts.equals(FULL_COUNTS))
                throw error(HttpStatus.CONFLICT,"Đề Full Test chưa đủ 200 câu theo đúng cấu trúc 7 Part TOEIC.");
            checkListeningGroups(questions);
        }
        Map<Long,Integer> quality=new HashMap<>();
        for(var r:dao.optionQuality(paperId)){
            if(intVal(r.get("correctCount"))!=1)
                throw error(HttpStatus.CONFLICT,"Có câu hỏi chưa có chính xác một đáp án đúng.");
            quality.put(longVal(r.get("examQuestionId")),intVal(r.get("optionCount")));
        }
        for(var q:questions){
            int part=intVal(q.get("partNo"));
            int requiredOptions=part==2?3:4;
            if(!Objects.equals(quality.get(longVal(q.get("examQuestionId"))),requiredOptions))
                throw error(HttpStatus.CONFLICT,"Đề có câu chưa đủ phương án trả lời A/B/C/D (Part 2 dùng A/B/C).");
            if(part<=4&&ExamContent.media(q.get("audioUrl")).isBlank())
                throw error(HttpStatus.CONFLICT,"Đề thi còn câu Listening thiếu audio. Quản trị viên cần liên kết media trước.");
            String image=pictures(q,part).primary();
            if(part==1&&image.isBlank())
                throw error(HttpStatus.CONFLICT,"Đề thi còn câu Part 1 thiếu hình ảnh.");
            if(part>=6&&ExamContent.passage(q.get("passageText")).isBlank()&&image.isBlank())
                throw error(HttpStatus.CONFLICT,"Đề thi còn câu Part 6–7 thiếu đoạn văn tiếng Anh hoặc ảnh bài đọc.");
        }
        return questions.size();
    }

    private void checkListeningGroups(List<Map<String,Object>> questions) {
        var groups=new HashSet<String>();
        var grouped=questions.stream().filter(q -> {
            int part=intVal(q.get("partNo"));
            return part==3 || part==4;
        }).toList();
        for (int i=0;i<grouped.size();i+=3) {
            var first=grouped.get(i);
            String group=audioGroup(first);
            String audio=ExamContent.media(first.get("audioUrl"));
            if (first.get("passageId")==null || !groups.add(group) || grouped.subList(i,i+3).stream()
                .anyMatch(q -> !Objects.equals(first.get("partNo"),q.get("partNo"))
                    || !group.equals(audioGroup(q)) || !audio.equals(ExamContent.media(q.get("audioUrl"))))) {
                throw error(HttpStatus.CONFLICT,"Part 3–4 của Full Test cần mỗi nhóm đúng 3 câu liền nhau dùng chung một đoạn âm thanh.");
            }
        }
    }

    @Transactional
    public long start(long paperId,String principal){
        long uid=userId(principal);
        dao.lockUser(uid);
        Map<String,Object> paper=dao.publishedPaper(paperId).orElseThrow(
            ()->error(HttpStatus.NOT_FOUND,"Đề thi chưa được công bố."));
        // A refresh or a second start click should resume the current live attempt.
        for(Long id:dao.inProgressAttempts(paperId,uid)){
            var existing=attempt(id,principal,true);
            if(intVal(existing.get("remainingSeconds"))<=0){
                gradeLocked(existing,"EXPIRED");
            } else return id;
        }
        checkPaperReady(paperId,paper);
        return dao.insertAttempt(paperId,uid);
    }

    private void gradeLocked(Map<String,Object> a,String status){
        long attemptId=longVal(a.get("id"));
        long paperId=longVal(a.get("examPaperId"));
        Map<String,Integer> counts=dao.gradeAnswers(attemptId);
        int listening=counts.getOrDefault("LISTENING",0);
        int reading=counts.getOrDefault("READING",0);
        // No invented conversion. If a scale row does not exist, keep the score NULL.
        Integer listeningScaled=dao.scaledScore(paperId,"LISTENING",listening);
        Integer readingScaled=dao.scaledScore(paperId,"READING",reading);
        Integer totalScaled=listeningScaled!=null&&readingScaled!=null
            ? listeningScaled+readingScaled:null;
        dao.finishAttempt(attemptId,status,listening,reading,
            listeningScaled,readingScaled,totalScaled);
    }

    @Transactional
    public Map<String,Object> state(long attemptId,String principal){
        Map<String,Object> a=attempt(attemptId,principal,true);
        if("IN_PROGRESS".equals(a.get("status"))&&intVal(a.get("remainingSeconds"))<=0){
            gradeLocked(a,"EXPIRED");
            a=attempt(attemptId,principal,false);
        }
        Map<String,Object> out=new LinkedHashMap<>();
        out.put("attemptId",attemptId);
        out.put("paperId",a.get("examPaperId"));
        out.put("title",a.get("title"));
        out.put("examType",a.get("examType"));
        out.put("status",a.get("status"));
        out.put("remainingSeconds",Math.max(0,intVal(a.get("remainingSeconds"))));
        out.put("durationMinutes",a.get("durationMinutes"));
        out.put("phase",phaseOf(a));
        out.put("phaseRemainingSeconds",phaseSeconds(a));
        if(!"IN_PROGRESS".equals(a.get("status"))) {
            out.put("resultUrl","/exams/attempts/"+attemptId+"/result");
            return out;
        }
        long paperId=longVal(a.get("examPaperId"));
        String phase=phaseOf(a);
        List<Map<String,Object>> qs=dao.questionRows(paperId);
        int examTotal=qs.size();
        if(!"CUSTOM".equals(phase))
            qs=qs.stream().filter(q->phase.equals(q.get("skill"))).toList();
        var gapNumbers=gapNumbers(qs);
        Map<Long,List<Map<String,Object>>> optionMap=new HashMap<>();
        for(var o:dao.optionRows(paperId)){
            Map<String,Object> item=new LinkedHashMap<>();
            item.put("id",o.get("optionId"));
            item.put("label",o.get("optionLabel"));
            item.put("text",o.get("optionText"));
            optionMap.computeIfAbsent(longVal(o.get("examQuestionId")),k->new ArrayList<>()).add(item);
        }
        List<Map<String,Object>> display=new ArrayList<>();
        for(var q:qs){
            int part=intVal(q.get("partNo"));
            Map<String,Object> row=new LinkedHashMap<>();
            long questionId=longVal(q.get("examQuestionId"));
            row.put("id",questionId);
            row.put("order",q.get("questionOrder"));
            row.put("part",part);
            row.put("skill",q.get("skill"));
            var numbers=gapNumbers.getOrDefault(q.get("passageId"),Map.of());
            row.put("text",part==1?"Look at the photograph and select the best statement."
                :part==2?"Listen and select the best response.":ExamContent.renumberGaps(ExamContent.plain(q.get("questionText")),numbers));
            row.put("passage",part<=4?"":ExamContent.renumberGaps(ExamContent.passage(q.get("passageText")),numbers));
            row.put("audio",part<=4?ExamContent.media(q.get("audioUrl")):"");
            if(part<=4) row.put("audioGroup",audioGroup(q));
            Pictures images=pictures(q,part);
            row.put("image",images.primary());
            row.put("questionImage",images.question());
            if (part>=6) {
                row.put("readingGroup",readingGroup(q,"LR_FULL".equals(a.get("examType"))));
                row.put("passageImage",ExamContent.media(q.get("passageImageUrl")));
            }
            List<Map<String,Object>> choices=new ArrayList<>();
            for(var option:optionMap.getOrDefault(questionId,List.of())){
                // In the actual TOEIC Listening Parts 1-2, choices are heard, not printed.
                Map<String,Object> shown=new LinkedHashMap<>(option);
                if(part<=2) shown.put("text","");
                choices.add(shown);
            }
            row.put("options",choices);
            display.add(row);
        }
        Map<String,Long> answers=new LinkedHashMap<>();
        Set<Long> allowedIds=new HashSet<>();
        for(var q:display) allowedIds.add(longVal(q.get("id")));
        for(var answer:dao.answerRows(attemptId)){
            Object selected=answer.get("selectedOptionId");
            if(selected!=null && allowedIds.contains(longVal(answer.get("examQuestionId"))))
                answers.put(String.valueOf(answer.get("examQuestionId")),longVal(selected));
        }
        out.put("questions",display);
        out.put("answers",answers);
        out.put("answeredCount",answers.size());
        out.put("totalQuestions",display.size());
        out.put("examTotalQuestions",examTotal);
        return out;
    }

    @Transactional
    public Map<String,Object> saveAnswer(long attemptId,long examQuestionId,Long optionId,String principal){
        Map<String,Object> a=attempt(attemptId,principal,true);
        if(!"IN_PROGRESS".equals(a.get("status")))
            throw error(HttpStatus.CONFLICT,"Lượt thi đã kết thúc, không thể sửa đáp án.");
        if(intVal(a.get("remainingSeconds"))<=0){
            gradeLocked(a,"EXPIRED");
            return Map.of("saved",false,"expired",true,"remainingSeconds",0);
        }
        validateAnswer(a,examQuestionId,optionId);
        dao.saveAnswer(attemptId,examQuestionId,optionId);
        return Map.of("saved",true,"answeredCount",answeredCount(attemptId),
            "phase",phaseOf(a),"phaseRemainingSeconds",phaseSeconds(a),
            "remainingSeconds",Math.max(0,intVal(a.get("remainingSeconds"))));
    }

    private void validateAnswer(Map<String,Object> a,long examQuestionId,Long optionId) {
        long paperId=longVal(a.get("examPaperId"));
        String questionSkill=dao.questionSkill(paperId,examQuestionId).orElseThrow(
            ()->error(HttpStatus.BAD_REQUEST,"Câu hỏi không thuộc đề thi."));
        if("LR_FULL".equals(a.get("examType")) && !phaseOf(a).equals(questionSkill))
            throw error(HttpStatus.CONFLICT,"Phần Listening đã hết giờ hoặc phần Reading chưa bắt đầu. Hãy tải lại phòng thi.");
        if(optionId!=null && !dao.optionBelongs(paperId,examQuestionId,optionId))
            throw error(HttpStatus.BAD_REQUEST,"Đáp án không thuộc câu hỏi của đề thi này.");
    }

    private int answeredCount(long attemptId) {
        return (int)dao.answerRows(attemptId).stream().filter(row->row.get("selectedOptionId")!=null).count();
    }

    @Transactional
    public Map<String,Object> submit(long attemptId,String principal,Map<Long,Long> answers){
        Map<String,Object> a=attempt(attemptId,principal,true);
        String status=Objects.toString(a.get("status"));
        if ("IN_PROGRESS".equals(status)) {
            if (intVal(a.get("remainingSeconds"))<=0) {
                status="EXPIRED";
            } else {
                if (answers!=null) {
                    if (answers.size()>200 || answers.keySet().stream().anyMatch(Objects::isNull))
                        throw error(HttpStatus.BAD_REQUEST,"Danh sách đáp án không hợp lệ.");
                    answers.forEach((question,option)->validateAnswer(a,question,option));
                    answers.forEach((question,option)->dao.saveAnswer(attemptId,question,option));
                }
                status="SUBMITTED";
            }
            gradeLocked(a,status);
        }
        return Map.of("resultUrl","/exams/attempts/"+attemptId+"/result",
            "status",status,"answeredCount",answeredCount(attemptId));
    }

    @Transactional
    public Map<String,Object> result(long attemptId,String principal,int partFilter,boolean needsReview){
        Map<String,Object> a=attempt(attemptId,principal,true);
        if("IN_PROGRESS".equals(a.get("status"))&&intVal(a.get("remainingSeconds"))<=0){
            gradeLocked(a,"EXPIRED");a=attempt(attemptId,principal,false);
        }
        if("IN_PROGRESS".equals(a.get("status")))
            throw error(HttpStatus.CONFLICT,"Bạn cần nộp bài trước khi xem đáp án.");
        long paperId=longVal(a.get("examPaperId"));
        Map<Long,Map<String,Object>> reviewsById=new HashMap<>();
        for(var row:dao.reviewAnswers(attemptId))
            reviewsById.put(longVal(row.get("examQuestionId")),row);
        Map<Long,List<Map<String,Object>>> choicesById=new HashMap<>();
        for(var row:dao.reviewChoices(paperId)) {
            Map<String,Object> choice=new LinkedHashMap<>();
            choice.put("label",row.get("optionLabel"));
            choice.put("text",row.get("optionText"));
            choice.put("correct",row.get("correct"));
            choicesById.computeIfAbsent(longVal(row.get("examQuestionId")),k->new ArrayList<>()).add(choice);
        }
        List<Map<String,Object>> questions=new ArrayList<>();
        Map<Integer,int[]> partCounts=new LinkedHashMap<>();
        var rows=dao.questionRows(paperId);
        var gapNumbers=gapNumbers(rows);
        for(var q:rows){
            Map<String,Object> record=new LinkedHashMap<>();
            long id=longVal(q.get("examQuestionId"));
            var selected=reviewsById.getOrDefault(id,Map.of());
            record.put("order",q.get("questionOrder"));
            int part=intVal(q.get("partNo"));
            record.put("part",part);
            var numbers=gapNumbers.getOrDefault(q.get("passageId"),Map.of());
            record.put("text",ExamContent.renumberGaps(ExamContent.plain(q.get("questionText")),numbers));
            record.put("explanation",ExamContent.explanation(q.get("explanation")));
            record.put("options",choicesById.getOrDefault(id,List.of()));
            record.put("audio",ExamContent.media(q.get("audioUrl")));
            Pictures images=pictures(q,part);
            record.put("image",images.primary());
            record.put("questionImage",images.question());
            record.put("passage",part<=4?ExamContent.plain(q.get("passageText"))
                :ExamContent.renumberGaps(ExamContent.passage(q.get("passageText")),numbers));
            record.put("selectedLabel",selected.get("selectedLabel"));
            record.put("correctLabel",selected.get("correctLabel"));
            Object flag=selected.get("isCorrect");
            boolean correct=Boolean.TRUE.equals(flag) || flag instanceof Number n && n.intValue()==1;
            record.put("correct",correct);
            int[] count=partCounts.computeIfAbsent(part,ignored->new int[2]);
            count[0]++;
            if(correct) count[1]++;
            questions.add(record);
        }
        Map<String,Object> result=new LinkedHashMap<>();
        result.putAll(a);
        result.put("questions",questions.stream()
            .filter(q->partFilter==0 || intVal(q.get("part"))==partFilter)
            .filter(q->!needsReview || !Boolean.TRUE.equals(q.get("correct"))).toList());
        result.put("totalQuestions",questions.size());
        result.put("answeredCount",answeredCount(attemptId));
        result.put("hasScaledScore",a.get("totalScaled")!=null);
        result.put("parts",partCounts.entrySet().stream().map(entry -> {
            int part=entry.getKey();
            int[] count=entry.getValue();
            return Map.of("number",part,"total",count[0],"correct",count[1],
                "practiceUrl",part<=4?"/listening?part="+part:"/reading/part"+part);
        }).toList());
        return result;
    }

    @Transactional
    public List<Map<String,Object>> history(String principal){
        long uid=userId(principal);
        List<Map<String,Object>> rows=dao.history(uid);
        boolean updated=false;
        for(var row:rows){
            if("IN_PROGRESS".equals(row.get("status")) && intVal(row.get("remainingSeconds"))<=0){
                Map<String,Object> a=attempt(longVal(row.get("id")),principal,true);
                if("IN_PROGRESS".equals(a.get("status"))) gradeLocked(a,"EXPIRED");
                updated=true;
            }
        }
        return updated ? dao.history(uid) : rows;
    }
}
