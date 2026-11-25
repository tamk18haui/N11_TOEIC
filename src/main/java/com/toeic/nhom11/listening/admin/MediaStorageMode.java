package com.toeic.nhom11.listening.admin;

import java.io.IOException;
import java.nio.file.*;
import java.util.Set;

/** Cấu hình của máy chủ, không lưu khóa Cloudinary trong file này. */
public final class MediaStorageMode {
    private static final Path FILE=Path.of(".local","n11-media-mode.txt");
    private MediaStorageMode() {}
    public static synchronized String get() {
        try { if(Files.isRegularFile(FILE)) {String value=Files.readString(FILE).strip();if(Set.of("LOCAL","CLOUD").contains(value))return value;} }
        catch(IOException e){throw new IllegalStateException("Không đọc được cấu hình lưu trữ",e);}
        return "LOCAL";
    }
    public static synchronized void set(String value) {
        if(!Set.of("LOCAL","CLOUD").contains(value))throw new IllegalArgumentException("Nguồn không hợp lệ");
        try {Files.createDirectories(FILE.getParent());Path temp=Files.createTempFile(FILE.getParent(),"media-mode-",".tmp");try{Files.writeString(temp,value);Files.move(temp,FILE,StandardCopyOption.REPLACE_EXISTING);}finally{Files.deleteIfExists(temp);}}
        catch(IOException e){throw new IllegalStateException("Không lưu được cấu hình",e);}
    }
}
