package com.toeic.nhom11.exam.admin;

import com.toeic.nhom11.listening.admin.MediaStorageMode;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.annotation.PreDestroy;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.security.Principal;
import java.util.*;
import java.util.concurrent.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/** Công cụ offline của máy chủ demo. Chỉ Admin kết nối loopback; không nhận đường dẫn/SQL/lệnh từ HTTP. */
@Controller
@RequestMapping("/admin/exams/offline")
public class OfflineExamImportController {
    private final Path project=Path.of("").toAbsolutePath().normalize();
    private volatile Path root;
    private final Path media;
    private final String url,user,password;
    private final ExecutorService worker=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"n11-offline-import");t.setDaemon(true);return t;});
    private volatile boolean running=false,scanned=false;
    private volatile String status="Chưa quét",output="";
    private volatile Process process;
    public OfflineExamImportController(@Value("${N11_OFFLINE_ROOT:E:/AnhNgu24H_TOEIC_Offline}") String root,
       @Value("${N11_LISTENING_UPLOAD_DIR:./listening-uploads}") String media,
       @Value("${spring.datasource.url}") String url,@Value("${spring.datasource.username}") String user,
       @Value("${spring.datasource.password:}") String password){
        this.root=Path.of(root).toAbsolutePath().normalize();this.media=Path.of(media).toAbsolutePath().normalize();this.url=url;this.user=user;this.password=password;
    }
    private void local(HttpServletRequest request){
        // Không tin X-Forwarded-For. Không bật chức năng này sau reverse proxy public.
        if(!Set.of("127.0.0.1","::1","0:0:0:0:0:0:0:1").contains(request.getRemoteAddr())||!Set.of("localhost","127.0.0.1","::1","[::1]").contains(request.getServerName()))throw new ResponseStatusException(HttpStatus.FORBIDDEN);
    }
    @GetMapping public String index(Model m,HttpServletRequest request){local(request);m.addAttribute("activePage","admin-exams");m.addAttribute("pageTitle","Nguồn học liệu offline");m.addAttribute("root",root.toString());m.addAttribute("media",media.toString());m.addAttribute("contentReady",Files.isRegularFile(root.resolve("content.db")));m.addAttribute("toeicReady",Files.isRegularFile(root.resolve("toeic.db")));m.addAttribute("rawReady",Files.isDirectory(root.resolve("raw")));m.addAttribute("mediaReady",Files.isDirectory(root.resolve("media")));m.addAttribute("mode",MediaStorageMode.get());m.addAttribute("running",running);m.addAttribute("scanned",scanned);m.addAttribute("status",status);m.addAttribute("output",output);return "admin/exam/offline";}
    @PostMapping("/mode") public String mode(@RequestParam String mode,HttpServletRequest request,RedirectAttributes f){local(request);try{MediaStorageMode.set(mode);f.addFlashAttribute("successMessage","Đã lưu chế độ media.");}catch(IllegalArgumentException|IllegalStateException e){f.addFlashAttribute("errorMessage",e.getMessage());}return "redirect:/admin/exams/offline";}
    @PostMapping("/scan") public String scan(HttpServletRequest request,Principal p,@RequestParam(required=false) String sourceRoot,RedirectAttributes f){
        local(request);
        synchronized(this){
            if(running){f.addFlashAttribute("errorMessage","Đang có tác vụ, không thể đổi nguồn.");return "redirect:/admin/exams/offline";}
            try{
                if(sourceRoot!=null&&!sourceRoot.isBlank()){
                    if(sourceRoot.length()>1000)throw new IllegalArgumentException("Đường dẫn quá dài.");
                    Path supplied=Path.of(sourceRoot.trim());
                    if(!supplied.isAbsolute()||sourceRoot.trim().startsWith("\\")||sourceRoot.trim().startsWith("//"))throw new IllegalArgumentException("Chỉ chọn thư mục ổ đĩa cục bộ.");
                    Path selected=supplied.toRealPath();
                    if(selected.getFileName()!=null&&"raw".equalsIgnoreCase(selected.getFileName().toString()))selected=selected.getParent();
                    if(selected==null||!Files.isDirectory(selected.resolve("raw"))||(!Files.isRegularFile(selected.resolve("content.db"))&&!Files.isRegularFile(selected.resolve("toeic.db"))))
                        throw new IllegalArgumentException("Chọn thư mục AnhNgu24H Offline có raw và ít nhất một file content.db/toeic.db.");
                    root=selected;
                }
                launch(false,p.getName());
            }catch(IOException|IllegalArgumentException e){scanned=false;f.addFlashAttribute("errorMessage","Đường dẫn nguồn không hợp lệ hoặc thiếu raw / SQLite.");}
        }
        return "redirect:/admin/exams/offline";
    }
    @PostMapping("/apply") public synchronized String apply(HttpServletRequest request,Principal p,@RequestParam(defaultValue="false") boolean confirmed,RedirectAttributes f){local(request);if(running||!confirmed||!scanned){f.addFlashAttribute("errorMessage","Quét dữ liệu trước và xác nhận quyền sử dụng, sao lưu MySQL.");return "redirect:/admin/exams/offline";}launch(true,p.getName());return "redirect:/admin/exams/offline";}
    private synchronized void launch(boolean apply,String email){
        if(running)return;final Path selectedRoot=root;if(!apply)scanned=false;running=true;status=apply?"Đang nhập bản nháp":"Đang quét";output="";
        worker.submit(()->{try{
            Path script=project.resolve("tools/offline_exams/IMPORT_OFFLINE_EXAMS.py");if(!Files.isRegularFile(script)||!Files.isDirectory(selectedRoot.resolve("raw")))throw new IOException("Thiếu tool hoặc thư mục raw");
            List<String> cmd=new ArrayList<>(List.of("py","-3","-u",script.toString(),"--server","--root",selectedRoot.toString(),"--project",project.toString(),"--media-dir",media.toString(),"--out",project.resolve(".local/n11-offline-import").toString()));if(apply)cmd.add("--apply");
            ProcessBuilder pb=new ProcessBuilder(cmd).directory(project.toFile()).redirectErrorStream(true);var env=pb.environment();env.put("PYTHONIOENCODING","utf-8");env.put("N11_IMPORT_JDBC_URL",url);env.put("N11_IMPORT_DB_USER",user);env.put("N11_IMPORT_DB_PASSWORD",password);env.put("N11_IMPORT_ADMIN_EMAIL",email);
            process=pb.start();try(var reader=new BufferedReader(new InputStreamReader(process.getInputStream(),StandardCharsets.UTF_8))){String line;StringBuilder b=new StringBuilder();while((line=reader.readLine())!=null){b.append(line).append('\n');if(b.length()>20000)b.delete(0,b.length()-16000);output=b.toString();}}
            int code=process.waitFor();if(!apply)scanned=code==0;status=code==0?(apply?"Đã chạy nhập – xem kết quả từng đề":"Quét xong – có đề có thể nhập"):code==3?"Không có đề đủ điều kiện – xem lỗi từng câu / từng đề bên dưới":"Có lỗi khi chạy công cụ – xem chi tiết bên dưới";
        }catch(Exception e){status="Không chạy được công cụ";output="Kiểm tra Python 3, cấu hình kho offline và quyền truy cập máy chủ. Loại lỗi: "+e.getClass().getSimpleName();if(e instanceof InterruptedException)Thread.currentThread().interrupt();}finally{process=null;running=false;}});
    }
    @PreDestroy void close(){if(process!=null)process.destroy();worker.shutdownNow();}
}
