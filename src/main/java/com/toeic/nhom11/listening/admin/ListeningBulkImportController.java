package com.toeic.nhom11.listening.admin;

import jakarta.annotation.PreDestroy;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/** Admin-only bulk import from an explicitly configured LOCAL SQLite source.
 * No paths or executable names come from HTTP input; no changes to Reading/student endpoints.
 */
@Controller
@RequestMapping("/admin/listening/import")
public class ListeningBulkImportController {
    private final Path project = Path.of("").toAbsolutePath().normalize();
    private final String bank;
    private final String mediaRoot;
    private final AtomicBoolean running = new AtomicBoolean(false);
    private final ExecutorService worker = Executors.newSingleThreadExecutor(task -> {
        Thread t = new Thread(task,"n11-listening-import");
        t.setDaemon(true);
        return t;
    });
    private volatile String status="Chưa kiểm tra";
    private volatile boolean scanned=false;
    private volatile String output="";
    private volatile Process process;

    public ListeningBulkImportController(
            @Value("${N11_LISTENING_IMPORT_DB:}") String configuredBank,
            @Value("${N11_LISTENING_IMPORT_MEDIA_ROOT:E:/AnhNgu24H_TOEIC_Offline}") String mediaRoot) {
        this.mediaRoot=mediaRoot;
        this.bank=detectLocalBank(configuredBank, mediaRoot);
    }

    // Ưu tiên cơ sở dữ liệu đã xử lý; nếu chưa có thì kiểm tra toeic.db gốc.
    // Việc phát hiện đường dẫn KHÔNG đồng nghĩa dữ liệu tương thích: luôn quét trước.
    private static String detectLocalBank(String configured, String rootText) {
        if (configured != null && !configured.isBlank()) return configured;
        Path root = Path.of(rootText);
        for (String candidate : List.of(
                "imported_bank/toeic_part_bank.db", "toeic_part_bank.db",
                "toeic.db", "imported_bank/toeic.db")) {
            Path file=root.resolve(candidate);
            if (Files.isRegularFile(file)) return file.toString();
        }
        if (Files.isDirectory(root)) {
            try (var files = Files.walk(root, 5)) {
                return files.filter(Files::isRegularFile)
                    .filter(path -> path.getFileName().toString().equalsIgnoreCase("toeic_part_bank.db"))
                    .findFirst().map(Path::toString).orElseGet(() -> {
                        try (var fallback = Files.walk(root, 5)) {
                            return fallback.filter(Files::isRegularFile)
                                .filter(path -> path.getFileName().toString().equalsIgnoreCase("toeic.db"))
                                .findFirst().map(Path::toString)
                                .orElse(root.resolve("imported_bank/toeic_part_bank.db").toString());
                        } catch (java.io.IOException ignored) {
                            return root.resolve("imported_bank/toeic_part_bank.db").toString();
                        }
                    });
            } catch (java.io.IOException ignored) { }
        }
        return root.resolve("imported_bank/toeic_part_bank.db").toString();
    }

    @ModelAttribute
    void common(Model model) {
        model.addAttribute("activePage","admin-listening");
        model.addAttribute("pageTitle","Nhập hàng loạt Listening");
    }

    @GetMapping
    public String view(Model model) {
        model.addAttribute("bankPath",bank);
        model.addAttribute("mediaPath",mediaRoot);
        model.addAttribute("importStatus",status);
        model.addAttribute("importOutput",output);
        model.addAttribute("importRunning",running.get());
        return "admin/listening/import";
    }

    @PostMapping("/scan")
    public String scan() { launch(false); return "redirect:/admin/listening/import"; }

    @PostMapping("/apply")
    public String apply() { launch(true); return "redirect:/admin/listening/import"; }

    private void launch(boolean apply) {
        if (apply && !scanned) {
            status="Cần quét và kiểm tra dữ liệu trước khi nhập MySQL.";
            return;
        }
        if (!running.compareAndSet(false,true)) return;
        status = apply?"Đang nhập vào MySQL":"Đang kiểm tra dữ liệu";
        output = "Đọc dữ liệu từ SQLite trên máy chủ ứng dụng...";
        worker.submit(() -> {
            try {
                Path script=project.resolve("tools/listening_bulk/IMPORT_LISTENING.py");
                if (!Files.isRegularFile(script))
                    throw new IllegalArgumentException("Không tìm thấy IMPORT_LISTENING.py. Hãy chạy script cài đặt bổ sung V2.");
                if (!Files.isRegularFile(Path.of(bank)))
                    throw new IllegalArgumentException("Không tìm thấy kho SQLite: "+bank);
                List<String> command=new ArrayList<>(List.of("py","-3","-u",script.toString(),
                        "--source",bank,"--media-root",mediaRoot,"--project",project.toString(),
                        "--report",project.resolve("listening-import-report.json").toString()));
                if (apply) command.add("--apply");
                ProcessBuilder pb=new ProcessBuilder(command);
                pb.directory(project.toFile());
                pb.redirectErrorStream(true);
                pb.environment().put("PYTHONIOENCODING","utf-8");
                process=pb.start();
                StringBuilder messages=new StringBuilder();
                try (BufferedReader reader=new BufferedReader(
                        new InputStreamReader(process.getInputStream(),StandardCharsets.UTF_8))) {
                    String line;
                    while ((line=reader.readLine())!=null) {
                        messages.append(line).append('\n');
                        if (messages.length()>25000) messages.delete(0,messages.length()-20000);
                        output=messages.toString();
                    }
                }
                int code=process.waitFor();
                if (!apply) scanned=(code==0);
                status=code==0?(apply?"Nhập hoàn tất – kiểm tra bộ nháp":"Kiểm tra xong – xem báo cáo")
                        :"Thất bại – xem thông báo bên dưới";
            } catch(Exception ex) {
                status="Thất bại – cần kiểm tra cấu hình";
                output=output+"\n"+ex.getMessage();
                if (ex instanceof InterruptedException) Thread.currentThread().interrupt();
            } finally {
                process=null;
                running.set(false);
            }
        });
    }

    @PreDestroy
    void close() {
        if (process!=null && process.isAlive()) process.destroy();
        worker.shutdownNow();
    }
}
