package com.toeic.nhom11.listening.admin;

import java.time.Duration;
import org.springframework.core.io.Resource;
import org.springframework.http.CacheControl;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/** Public playback URL for uploaded listening media; filenames are opaque UUIDs. */
@Controller
public class ListeningMediaController {
    private final ListeningMediaStore store;
    public ListeningMediaController(ListeningMediaStore store) { this.store=store; }

    @GetMapping("/listening-media/{file:.+}")
    @ResponseBody
    public ResponseEntity<Resource> get(@PathVariable String file) {
        return ResponseEntity.ok().contentType(store.type(file))
                .cacheControl(CacheControl.maxAge(Duration.ofDays(7)).cachePublic())
                .body(store.find(file));
    }
}
