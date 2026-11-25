package com.toeic.nhom11.listening.admin;
import jakarta.servlet.http.HttpServletRequest;
import java.util.Set;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/exams/offline/media-sync")
public class MediaSyncControllerV37 {
    private final MediaSyncV37 service;
    public MediaSyncControllerV37(MediaSyncV37 service){this.service=service;}
    private void local(HttpServletRequest r){if(!r.isUserInRole("ADMIN")||!Set.of("127.0.0.1","::1","0:0:0:0:0:0:0:1").contains(r.getRemoteAddr())||!Set.of("localhost","127.0.0.1","::1","[::1]").contains(r.getServerName()))throw new ResponseStatusException(HttpStatus.FORBIDDEN);}
    @GetMapping public String page(Model m,HttpServletRequest r){local(r);m.addAttribute("activePage","admin-exams");m.addAttribute("pageTitle","Đồng bộ media Cloudinary");m.addAttribute("scan",service.scan());m.addAttribute("sync",service.status());m.addAttribute("directory",service.directory());m.addAttribute("cloudReady",service.credentialsReady());m.addAttribute("mode",MediaStorageMode.get());return "admin/exam/media-sync-v37";}
    @PostMapping("/apply") public String apply(HttpServletRequest r,@RequestParam(defaultValue="false") boolean confirmed,RedirectAttributes f){local(r);if(!confirmed){f.addFlashAttribute("errorMessage","Xác nhận sao lưu và quyền sử dụng trước khi đồng bộ.");}else{try{if(!service.start())f.addFlashAttribute("errorMessage","Đang có tác vụ đồng bộ.");}catch(RuntimeException e){f.addFlashAttribute("errorMessage","Không thể bắt đầu; kiểm tra Cloudinary đã bật, đủ thông tin và MySQL đang chạy.");}}return "redirect:/admin/exams/offline/media-sync";}
}
