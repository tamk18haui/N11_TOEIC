package com.toeic.nhom11.exam.admin;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;
import java.util.*;
import java.util.stream.*;

class ExamAdminServiceTest {
    private ExamAdminService.Group group(long id,int size){
        var q=new ArrayList<Map<String,Object>>();
        for(int i=0;i<size;i++)q.add(Map.of("id",id*10+i));
        return new ExamAdminService.Group(id,7,q);
    }
    @Test void exactSelectionNeverSplitsOrDuplicatesGroups(){
        var pool=List.of(group(1,2),group(2,3),group(3,5),group(4,4));
        for(int seed=0;seed<50;seed++){
            var result=ExamAdminService.exact(pool,9,new Random(seed));
            assertEquals(9,result.stream().mapToInt(ExamAdminService.Group::size).sum());
            assertEquals(result.size(),new HashSet<>(result).size());
            assertTrue(pool.containsAll(result));
        }
    }
    @Test void rejectsImpossibleTargetAndInvalidAmount(){
        var pool=List.of(group(1,3),group(2,3));
        assertThrows(IllegalArgumentException.class,()->ExamAdminService.exact(pool,4,new Random(1)));
        assertThrows(IllegalArgumentException.class,()->ExamAdminService.exact(pool,0,new Random(1)));
        assertThrows(IllegalArgumentException.class,()->ExamAdminService.exact(pool,201,new Random(1)));
    }
    @Test void verifiesCompleteMonotonicScoreTable(){
        // Dữ liệu tổng hợp để kiểm thử thuật toán, không phải thang điểm TOEIC thật.
        String test=IntStream.rangeClosed(0,100).mapToObj(x->x+"="+Math.min(495,5+x*5)).collect(Collectors.joining("\n"));
        assertEquals(101,ExamAdminService.parseScale(test).size());
        assertThrows(IllegalArgumentException.class,()->ExamAdminService.parseScale("0=5"));
        assertThrows(IllegalArgumentException.class,()->ExamAdminService.parseScale(test+"\n0=5"));
        assertThrows(IllegalArgumentException.class,()->ExamAdminService.parseScale(test.replace("99=495","99=5")));
        assertTrue(ExamAdminService.parseScale("").isEmpty());
    }
    @Test void previewAcceptsOnlyExpectedMediaUrls(){
        assertTrue(ExamAdminService.media("https://example.com/a.mp3"));
        assertTrue(ExamAdminService.media("/listening-media/abc-123.mp3"));
        assertFalse(ExamAdminService.media("javascript:alert(1)"));
        assertFalse(ExamAdminService.media("/listening-media/../a.mp3"));
    }
}
