package com.toeic.nhom11.listening.admin;

import jakarta.servlet.MultipartConfigElement;
import java.io.IOException;
import java.nio.file.*;
import java.util.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

/** Stores uploaded audio/images in a dedicated external directory, not under source control. */
@Component
public class ListeningMediaStore {
    public record Stored(String type, String url, String mime) { }
    private static final int MAX_BYTES = 25 * 1024 * 1024;
    private static final Map<String,String> MIMES = Map.of(
        "mp3","audio/mpeg", "wav","audio/wav", "ogg","audio/ogg",
        "png","image/png", "jpg","image/jpeg", "jpeg","image/jpeg", "webp","image/webp");
    private final Path root;
    private final ListeningCloudinaryGateway cloudinary;

    public ListeningMediaStore(@Value("${N11_LISTENING_UPLOAD_DIR:./listening-uploads}") String folder,
                               ListeningCloudinaryGateway cloudinary) {
        root=Paths.get(folder).toAbsolutePath().normalize();
        this.cloudinary=cloudinary;
    }

    public Stored save(MultipartFile upload) {
        if(upload==null || upload.isEmpty() || upload.getSize()>MAX_BYTES)
            throw new IllegalArgumentException("Chọn file MP3/WAV/OGG hoặc PNG/JPG/WEBP, tối đa 25 MB.");
        String original=Optional.ofNullable(upload.getOriginalFilename()).orElse("");
        int dot=original.lastIndexOf('.');
        String ext=dot<0?"":original.substring(dot+1).toLowerCase(Locale.ROOT);
        String mime=MIMES.get(ext);
        if(mime==null) throw new IllegalArgumentException("Định dạng file không hỗ trợ.");
        try {
            byte[] bytes=upload.getBytes();
            if(bytes.length==0 || bytes.length>MAX_BYTES || !signature(ext,bytes))
                throw new IllegalArgumentException("Nội dung file không khớp định dạng đã chọn.");
            // Once credentials are configured, upload directly from the backend.
            // Never fall back to local storage after a Cloudinary upload error.
            if (cloudinary.configured()) {
                String url = cloudinary.upload(bytes,ext);
                return new Stored(mime.startsWith("audio/")?"AUDIO":"IMAGE", url, mime);
            }
            Files.createDirectories(root);
            String file=UUID.randomUUID().toString()+"."+ext;
            Files.write(root.resolve(file),bytes,StandardOpenOption.CREATE_NEW);
            return new Stored(mime.startsWith("audio/")?"AUDIO":"IMAGE", "/listening-media/"+file, mime);
        } catch (IOException e) {
            throw new IllegalArgumentException("Không thể lưu file; hãy kiểm tra quyền ghi thư mục upload.",e);
        }
    }
    private static boolean signature(String ext,byte[] b) {
        if(b.length<12) return false;
        int a=b[0]&255,c=b[1]&255,d=b[2]&255;
        return switch(ext) {
            case "mp3" -> (a==73&&c==68&&d==51) || (a==255&&(c&0xE0)==0xE0);
            case "wav" -> ascii(b,0,"RIFF")&&ascii(b,8,"WAVE");
            case "ogg" -> ascii(b,0,"OggS");
            case "png" -> a==137&&c==80&&d==78&&(b[3]&255)==71;
            case "jpg","jpeg" -> a==255&&c==216&&d==255;
            case "webp" -> ascii(b,0,"RIFF")&&ascii(b,8,"WEBP");
            default -> false;
        };
    }
    private static boolean ascii(byte[] b,int at,String text) {
        for(int i=0;i<text.length();i++) if(b[at+i]!=(byte)text.charAt(i)) return false;
        return true;
    }

    public void remove(String url) {
        // Cloudinary assets are not deleted by local file cleanup.
        if (url == null || !url.startsWith("/listening-media/")) return;
        String name=url.substring(url.lastIndexOf('/')+1);
        if(!safe(name)) return;
        try { Files.deleteIfExists(root.resolve(name)); }
        catch(IOException ignored) { /* File cleanup can be retried; never delete arbitrary paths. */ }
    }
    public Resource find(String file) {
        if(!safe(file)) throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        Path path=root.resolve(file);
        try {
            Resource resource=new UrlResource(path.toUri());
            if(!resource.exists()||!resource.isReadable()) throw new ResponseStatusException(HttpStatus.NOT_FOUND);
            return resource;
        } catch(Exception e) { throw new ResponseStatusException(HttpStatus.NOT_FOUND); }
    }
    public MediaType type(String file) {
        String ext=file.substring(file.lastIndexOf('.')+1).toLowerCase(Locale.ROOT);
        return MediaType.parseMediaType(MIMES.getOrDefault(ext,"application/octet-stream"));
    }
    private static boolean safe(String file) {
        return file!=null && file.matches("[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}\\.(mp3|wav|ogg|png|jpg|jpeg|webp)");
    }
}

@Configuration
class ListeningMultipartConfig {
    @Bean
    MultipartConfigElement multipartConfigElement() {
        return new MultipartConfigElement("", 26L*1024*1024, 27L*1024*1024, 0);
    }
}
