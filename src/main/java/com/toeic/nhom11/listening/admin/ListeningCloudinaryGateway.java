package com.toeic.nhom11.listening.admin;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;
import org.springframework.stereotype.Component;

/** Signed backend-only uploads. Credentials never appear in JSP/browser/Git. */
@Component
public class ListeningCloudinaryGateway {

    private Properties settings() {
        var values = new Properties();
        var file = Path.of(".env.cloudinary").toAbsolutePath().normalize();
        if (Files.isRegularFile(file)) {
            try (var reader = Files.newBufferedReader(file, StandardCharsets.UTF_8)) {
                values.load(reader);
            } catch (IOException e) {
                throw new IllegalStateException("Không đọc được .env.cloudinary trên máy chủ.", e);
            }
        }
        for (String key : new String[] { "CLOUDINARY_CLOUD_NAME", "CLOUDINARY_API_KEY", "CLOUDINARY_API_SECRET", "CLOUDINARY_FOLDER", "CLOUDINARY_ENABLED" }) {
            String environment = System.getenv(key);
            if (environment != null && !environment.isBlank()) values.setProperty(key, environment);
        }
        return values;
    }

    public boolean configured() {
        if ("LOCAL".equals(MediaStorageMode.get())) return false; // N11 V36 Local default
        return syncConfigured();
    }

    // N11 V37: dong bo explicit, doc lap voi che do luu media moi.
    public boolean syncConfigured() {
        Properties p = settings();
        if ("false".equalsIgnoreCase(p.getProperty("CLOUDINARY_ENABLED", "true").trim())) return false;
        String name = p.getProperty("CLOUDINARY_CLOUD_NAME", "").trim();
        String key = p.getProperty("CLOUDINARY_API_KEY", "").trim();
        String secret = p.getProperty("CLOUDINARY_API_SECRET", "").trim();
        if (name.isEmpty() && key.isEmpty() && secret.isEmpty()) return false;
        if (name.isEmpty() || key.isEmpty() || secret.isEmpty()) {
            throw new IllegalArgumentException("Cloudinary chưa đủ CLOUD_NAME / API_KEY / API_SECRET trong .env.cloudinary.");
        }
        return true;
    }

    public String upload(byte[] data, String extension) {
        return uploadInternal(data, extension, null);
    }

    public String syncUpload(byte[] data, String extension) {
        if (!syncConfigured()) throw new IllegalArgumentException("Cloudinary chưa bật hoặc thiếu cấu hình.");
        if (!java.util.Set.of("mp3","wav","ogg","png","jpg","jpeg","webp").contains(extension)) throw new IllegalArgumentException("Định dạng không hỗ trợ.");
        try {
            String hash=java.util.HexFormat.of().formatHex(java.security.MessageDigest.getInstance("SHA-256").digest(data));
            return uploadInternal(data,extension,"sync-v37/"+extension+"/"+hash);
        } catch (java.security.NoSuchAlgorithmException e) { throw new IllegalStateException(e); }
    }

    private String uploadInternal(byte[] data, String extension, String syncId) {
        Properties p = settings();
        String folder = p.getProperty("CLOUDINARY_FOLDER", "n11_toeic/listening").trim().replaceAll("^/+|/+$", "");
        if (!folder.matches("[A-Za-z0-9_/-]{1,120}") || folder.contains("..") || !folder.endsWith("/listening")) {
            throw new IllegalArgumentException("CLOUDINARY_FOLDER phải dạng n11_toeic/listening.");
        }
        boolean audio = extension.equals("mp3") || extension.equals("wav") || extension.equals("ogg");
        String resource = audio ? "video" : "image";
        String cloudName = p.getProperty("CLOUDINARY_CLOUD_NAME", "").trim();
        Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", cloudName,
            "api_key", p.getProperty("CLOUDINARY_API_KEY", "").trim(),
            "api_secret", p.getProperty("CLOUDINARY_API_SECRET", "").trim(),
            "secure", true));
        try {
            // N11 V37: content-addressed public ID; overwrite=false preserves existing assets.
            String publicId=syncId==null?UUID.randomUUID().toString():folder+"/"+syncId;
            Map<String,Object> options=new java.util.HashMap<>();
            options.put("resource_type",resource);options.put("type","upload");
            options.put("public_id",publicId);options.put("overwrite",false);options.put("unique_filename",false);
            if(syncId==null)options.put("folder",folder+(audio?"/audio":"/image"));
            @SuppressWarnings("unchecked")
            Map<String,Object> response = cloudinary.uploader().upload(data,options);
            if(syncId!=null&&!publicId.equals(java.util.Objects.toString(response.get("public_id"),"")))
                throw new IllegalStateException("Cloudinary trả về public ID không khớp.");
            Object urlValue = response.get("secure_url");
            String url = urlValue == null ? "" : urlValue.toString();
            if (!url.startsWith("https://res.cloudinary.com/" + cloudName + "/") ||
                    !url.contains("/" + resource + "/upload/") || url.length() > 700) {
                throw new IllegalStateException("URL phản hồi từ Cloudinary không hợp lệ.");
            }
            return url;
        } catch (IOException ex) {
            throw new IllegalArgumentException("Upload Cloudinary thất bại; dữ liệu chưa được ghi vào MySQL.", ex);
        }
    }
}
