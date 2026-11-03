package com.toeic.nhom11;

import com.toeic.nhom11.grammar.dao.LessonContentCodec;
import com.toeic.nhom11.grammar.model.Example;
import org.junit.jupiter.api.Test;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

class LessonContentCodecTests {
    @Test void structuredExamplesRoundTripInExistingContentColumn() {
        Example e=new Example();e.setId(7L);e.setSentence("A < B & C");e.setTranslation("Ví dụ tiếng Việt");e.setSortOrder(1);
        var html=LessonContentCodec.encode("Mô tả", "<h2>Bài giảng</h2>",List.of(e));
        var decoded=LessonContentCodec.decode(2,html);
        assertEquals("Mô tả",decoded.summary());assertTrue(decoded.lecture().contains("Bài giảng"));
        assertEquals("A < B & C",decoded.examples().get(0).getSentence());
        assertEquals(7L,decoded.examples().get(0).getId());assertEquals(2,decoded.examples().get(0).getLessonId());
    }
    @Test void existingPlainHtmlStillDisplaysWithoutMigration() {
        var decoded=LessonContentCodec.decode(1,"<h2>Present Simple</h2><p>We work here.</p>");
        assertTrue(decoded.lecture().contains("We work here."));assertTrue(decoded.summary().contains("Present Simple"));
        assertTrue(decoded.examples().isEmpty());
    }
}
