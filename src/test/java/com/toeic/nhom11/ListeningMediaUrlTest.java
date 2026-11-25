package com.toeic.nhom11;

import com.toeic.nhom11.service.ListeningService;
import org.junit.jupiter.api.Test;
import java.lang.reflect.Method;
import static org.junit.jupiter.api.Assertions.*;

/** Kiem tra quy tac URL tai nguyen, khong can MySQL. */
class ListeningMediaUrlTest {
    private Object valid(Object value) throws Exception {
        Method m = ListeningService.class.getDeclaredMethod("validMedia", Object.class);
        m.setAccessible(true);
        return m.invoke(null, value);
    }
    @Test void acceptsLocalAudioAndImage() throws Exception {
        String path = "/listening-media/12345678-abcd-1234-abcd-123456789abc";
        assertEquals(path + ".mp3", valid(path + ".mp3"));
        assertEquals(path + ".jpg", valid(path + ".jpg"));
    }
    @Test void acceptsCloudinary() throws Exception {
        String url = "https://res.cloudinary.com/demo/video/upload/sample.mp3";
        assertEquals(url, valid(url));
    }
    @Test void rejectsUnexpectedLocalPaths() throws Exception {
        assertNull(valid(null));
        assertNull(valid("/listening-media/../secret.mp3"));
        assertNull(valid("//example.com/audio.mp3"));
        assertNull(valid("http://example.com/audio.mp3"));
        assertNull(valid("/listening-media/12345678-abcd-1234-abcd-123456789abc.html"));
    }
}
