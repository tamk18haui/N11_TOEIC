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
            @SuppressWarnings("unchecked")
            Map<String,Object> response = cloudinary.uploader().upload(data, ObjectUtils.asMap(
                "resource_type", resource,
                "folder", folder + (audio ? "/audio" : "/image"),
                "public_id", UUID.randomUUID().toString(),
                "overwrite", false,
                "unique_filename", false));
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
