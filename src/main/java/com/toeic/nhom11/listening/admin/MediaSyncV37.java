package com.toeic.nhom11.listening.admin;

import jakarta.annotation.PreDestroy;
import java.io.IOException;
import java.net.URI;
import java.net.http.*;
import java.nio.file.*;
import java.nio.charset.StandardCharsets;
import java.time.*;
import java.util.*;
import java.util.concurrent.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

/** Đồng bộ từng tài nguyên; không sửa ID, không xóa file, không ghi đè URL vừa được sửa bởi Admin khác. */
@Service
public class MediaSyncV37 {
    static final String PREFIX="/listening-media/";
    static final long MAX=25L*1024*1024;
    static final Map<String,String> TYPES=Map.of("mp3","AUDIO","wav","AUDIO","ogg","AUDIO","png","IMAGE","jpg","IMAGE","jpeg","IMAGE","webp","IMAGE");
    public record Asset(long id,String type,String url) {}
    public record Item(long id,String type,String url,long bytes,String state) {}
    public record Scan(List<Item> items,int local,int ready,int cloud,int other,long bytes) {}
    public record Status(boolean running,int total,int done,int success,int failed,String message,List<String> log) {}
    private final JdbcTemplate db;
    private final ListeningCloudinaryGateway gateway;
    private final Path root;
    private final ExecutorService worker=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"n11-media-sync-v37");t.setDaemon(true);return t;});
    private final HttpClient http=HttpClient.newBuilder().connectTimeout(Duration.ofSeconds(10)).followRedirects(HttpClient.Redirect.NEVER).build();
    private volatile Status status=new Status(false,0,0,0,0,"Chưa đồng bộ",List.of());
    public MediaSyncV37(JdbcTemplate db,ListeningCloudinaryGateway gateway,@Value("${N11_LISTENING_UPLOAD_DIR:./listening-uploads}") String dir){this.db=db;this.gateway=gateway;this.root=Path.of(dir).toAbsolutePath().normalize();}
    public String directory(){return root.toString();}
    public Status status(){return status;}
    private List<Asset> assets(){return db.query("SELECT id,media_type,file_url FROM media_assets ORDER BY id",(rs,n)->new Asset(rs.getLong("id"),rs.getString("media_type"),rs.getString("file_url")));}
    static String extension(String url){if(url==null||!url.startsWith(PREFIX))return "";String name=url.substring(PREFIX.length());if(!name.matches("[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}\\.(mp3|wav|ogg|png|jpg|jpeg|webp)"))return "";return name.substring(name.lastIndexOf('.')+1);}
    private Path file(Asset a)throws IOException {String ext=extension(a.url());if(ext.isEmpty()||!Objects.equals(TYPES.get(ext),a.type()))throw new IOException("Đường dẫn hoặc loại media không hợp lệ");Path base=root.toRealPath();Path p=base.resolve(a.url().substring(PREFIX.length()));if(Files.isSymbolicLink(p)||!Files.isRegularFile(p,LinkOption.NOFOLLOW_LINKS)||!Files.isReadable(p))throw new IOException("Thiếu file hoặc không đọc được");long len=Files.size(p);if(len<12||len>MAX)throw new IOException("File rỗng hoặc quá 25 MB");return p;}
    private static boolean ascii(byte[] b,int off,String s){for(int i=0;i<s.length();i++)if(b[off+i]!=(byte)s.charAt(i))return false;return true;}
    static boolean signature(String ext,byte[] b){if(b.length<12)return false;int x=b[0]&255,y=b[1]&255,z=b[2]&255;return switch(ext){case "mp3"->ascii(b,0,"ID3")||x==255&&(y&224)==224;case "wav"->ascii(b,0,"RIFF")&&ascii(b,8,"WAVE");case "ogg"->ascii(b,0,"OggS");case "png"->x==137&&y==80&&z==78&&(b[3]&255)==71;case "jpg","jpeg"->x==255&&y==216&&z==255;case "webp"->ascii(b,0,"RIFF")&&ascii(b,8,"WEBP");default->false;};}
    public Scan scan(){List<Item> rows=new ArrayList<>();int local=0,ready=0,cloud=0,other=0;long bytes=0;Set<String> counted=new HashSet<>();for(Asset a:assets()){String u=Objects.toString(a.url(),"");if(u.startsWith(PREFIX)){local++;try{Path p=file(a);long n=Files.size(p);try(var in=Files.newInputStream(p)){if(!signature(extension(u),in.readNBytes(12)))throw new IOException("Sai định dạng file");}rows.add(new Item(a.id(),a.type(),u,n,"Sẵn sàng"));ready++;if(counted.add(u))bytes+=n;}catch(IOException e){rows.add(new Item(a.id(),a.type(),u,0,"Thiếu file / không hợp lệ"));}}else if(u.startsWith("https://res.cloudinary.com/")){cloud++;}else{other++;}}return new Scan(List.copyOf(rows),local,ready,cloud,other,bytes);}
    public boolean credentialsReady(){try{return gateway.syncConfigured();}catch(RuntimeException e){return false;}}
    public synchronized boolean start(){if(status.running())return false;if(!gateway.syncConfigured())throw new IllegalArgumentException("Cloudinary chưa bật hoặc chưa cấu hình đủ khóa trong .env.cloudinary.");List<Asset> rows=assets().stream().filter(a->a.url()!=null&&a.url().startsWith(PREFIX)).toList();status=new Status(true,rows.size(),0,0,0,"Đang đồng bộ",List.of());worker.submit(()->run(rows));return true;}
    void verify(String url,String type)throws IOException,InterruptedException {URI uri=URI.create(url);if(!"https".equals(uri.getScheme())||!"res.cloudinary.com".equals(uri.getHost())||uri.getUserInfo()!=null||uri.getPort()!=-1)throw new IOException("URL Cloudinary không hợp lệ");var r=http.send(HttpRequest.newBuilder(uri).timeout(Duration.ofSeconds(20)).method("HEAD",HttpRequest.BodyPublishers.noBody()).build(),HttpResponse.BodyHandlers.discarding());String mime=r.headers().firstValue("Content-Type").orElse("").toLowerCase(Locale.ROOT);if(r.statusCode()<200||r.statusCode()>=300||!("AUDIO".equals(type)?mime.startsWith("audio/")||mime.startsWith("video/"):mime.startsWith("image/")))throw new IOException("CDN chưa phát được tài nguyên công khai");}
    // Nhật ký trước khi UPDATE để có thể phục hồi URL cũ khi cần. Không chứa khóa API.
    private void journal(Asset a,String url)throws IOException {Path dir=Path.of(".local");Files.createDirectories(dir);Files.writeString(dir.resolve("n11-media-sync-v37.tsv"),Instant.now()+"\t"+a.id()+"\t"+a.url()+"\t"+url+"\n",StandardCharsets.UTF_8,StandardOpenOption.CREATE,StandardOpenOption.APPEND);}
    private void run(List<Asset> rows){int done=0,ok=0,fail=0;List<String> log=new ArrayList<>();Map<String,String> cache=new HashMap<>();String message="Đã xử lý";try{for(Asset a:rows){if(Thread.currentThread().isInterrupted()){message="Đã dừng; chạy lại để tiếp tục";break;}String result;try{Path p=file(a);byte[] data=Files.readAllBytes(p);String ext=extension(a.url());if(data.length>MAX||!signature(ext,data))throw new IOException("File không hợp lệ");String digest=HexFormat.of().formatHex(java.security.MessageDigest.getInstance("SHA-256").digest(data));String key=a.type()+":"+ext+":"+digest;String url=cache.get(key);if(url==null){url=gateway.syncUpload(data,ext);verify(url,a.type());cache.put(key,url);}journal(a,url);int changed=db.update("UPDATE media_assets SET file_url=? WHERE id=? AND file_url=? AND media_type=?",url,a.id(),a.url(),a.type());if(changed!=1)throw new IOException("URL đã được thay đổi bởi tác vụ khác");ok++;result="OK";}catch(InterruptedException e){Thread.currentThread().interrupt();message="Đã dừng; chạy lại để tiếp tục";break;}catch(Exception e){fail++;result="LỖI – giữ nguyên URL (kiểm tra file, Cloudinary, mạng hoặc MySQL)";}done++;log.add("#"+a.id()+" · "+a.type()+" · "+result);if(log.size()>100)log.remove(0);status=new Status(true,rows.size(),done,ok,fail,"Đang đồng bộ",List.copyOf(log));}}finally{status=new Status(false,rows.size(),done,ok,fail,message+"; quét lại để kiểm tra media còn Local.",List.copyOf(log));}}
    @PreDestroy void close(){worker.shutdownNow();}
}
