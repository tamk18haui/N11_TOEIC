# N11 TOEIC — Chức năng Ngữ pháp

Spring Boot 4.1.2, Java 17+, MySQL 8+, JSP/JSTL, Bootstrap 5 và JDBC (`JdbcTemplate`). Giữ trang chủ và các trang giao diện của nhóm từ nhánh `main`; phần Ngữ pháp có nghiệp vụ thật.

## Chạy ứng dụng

1. Mở **thư mục chứa `pom.xml` này** trong IntelliJ hoặc terminal.
2. Với MySQL trống, import `database/n11_toeic.sql` bằng MySQL Workbench/DBeaver hoặc chạy trong MySQL CLI:

   ```sql
   SOURCE C:/duong-dan/N11_TOEIC/database/n11_toeic.sql;
   ```

   File gồm đúng 31 bảng của `CSDL.docx` và dữ liệu demo. **Chỉ import seed vào database trống** vì ID mẫu cố định. Nếu nhóm đã có CSDL và tài khoản, dùng schema của nhóm và nhập học liệu qua trang quản trị; không import đè seed. `CREATE TABLE IF NOT EXISTS` không cập nhật cấu trúc bảng cũ.
3. Sao chép `application-local.example.yaml` thành `application-local.yaml` và điền thông tin MySQL. File này đã được Git bỏ qua. Hoặc dùng biến môi trường `DB_URL`, `DB_USERNAME`, `DB_PASSWORD`.
4. Chạy:

   ```powershell
   mvn spring-boot:run
   ```

5. Mở [Ngữ pháp](http://localhost:8080/grammar) hoặc [Quản trị ngữ pháp](http://localhost:8080/admin/grammar).

Trên máy đang triển khai, `application-local.yaml` trỏ đến **`n11_toeic_team`**, bản thử riêng theo đúng CSDL mới. Database `n11_toeic` tạo ở lần thử trước được giữ nguyên và không còn được ứng dụng sử dụng. Khi tích hợp, cấu hình kết nối tới database chung đã có schema của nhóm.

## Tài khoản demo

| Vai trò | Email | Mật khẩu demo |
| --- | --- | --- |
| Học viên | student@n11.local | N11@Demo2026 |
| Quản trị | admin@n11.local | N11@Demo2026 |

Mật khẩu tài khoản trong SQL đã băm BCrypt. Đây là hai tài khoản phục vụ demo cục bộ; đổi hoặc loại bỏ trước khi đưa ứng dụng lên mạng. Mật khẩu MySQL không được đưa vào file nguồn hoặc SQL export.

## Các luồng đã triển khai

- Xem 8 bài học thuộc 4 chủ điểm; tìm theo từ khóa, lọc chủ điểm và mức độ.
- Ba tab Bài giảng, Ví dụ và Bài tập; 24 ví dụ song ngữ, 40 câu hỏi, 160 lựa chọn.
- Đọc bài giảng/ví dụ không cần đăng nhập. Học viên đăng nhập để chọn đáp án, nộp bài, nhận điểm phần trăm và giải thích; xem 100 lượt làm gần nhất của chính mình.
- Admin có dashboard số liệu thật, CRUD chủ điểm, bài học, ví dụ và câu hỏi A/B/C/D; kiểm tra dữ liệu ở service và form.
- Lưu bản nháp rồi thêm ví dụ/câu hỏi trước khi công bố. Bài đã có lượt làm được khóa tên và bộ câu hỏi; có thể bỏ công bố.
- Chấm điểm trên server, transaction cho lưu lượt làm + đáp án, truy vấn có tham số, CSRF, phân quyền và lọc HTML.

Các trang từ vựng, nghe, đọc, thi thử, lộ trình, đăng ký và quản lý tài khoản vẫn thuộc phần khung giao diện ban đầu của nhóm. Phần đăng nhập tối thiểu hiện dùng `users` để demo ngữ pháp; chưa triển khai đăng ký/quên mật khẩu hay quản lý tài khoản thay cho thành viên khác.

## Đồng bộ CSDL nhóm

- `database/team-schema.sql`: nội dung SQL trích từ `CSDL.docx` mới, giữ nguyên 31 bảng/53 FK.
- `database/schema.sql`: cùng các định nghĩa bảng, không gắn tên database.
- `database/seed.sql`: học liệu và hai tài khoản demo, chỉ dùng bảng/cột đã có.
- `database/n11_toeic.sql`: schema nhóm + seed để cài từ đầu.
- Không thêm `grammar_examples`, `summary`, `lesson_title` hay cột lưu bản sao câu trả lời.
- Ví dụ và mô tả ngắn nằm trong `grammar_lessons.content_html`; xem [quy ước lưu nội dung](docs/CSDL_INTEGRATION.md).

## Kiểm thử và đóng gói

```powershell
mvn test
mvn package
java -jar target/nhom11-0.0.1-SNAPSHOT.war
```

Chạy lệnh tại thư mục repo để đọc được file cấu hình cục bộ. Bản WAR chạy nhúng Tomcat hỗ trợ JSP. Test mặc định dùng H2 độc lập, không ghi vào MySQL. Bộ test cũng đã được chạy với MySQL 8.4 theo schema nhóm; xem [hướng dẫn kiểm thử](docs/TESTING.md).

## Cấu trúc mã nguồn

```text
controller/UiPageController.java       Các trang khung của nhóm
config/SecurityConfig.java             Đăng nhập, BCrypt, phân quyền, CSRF
grammar/controller/                   Điều hướng JSP, nhận form
grammar/service/GrammarService.java    Hợp đồng nghiệp vụ
grammar/service/DefaultGrammarService.java
grammar/dao/GrammarDao.java            Hợp đồng truy cập dữ liệu
grammar/dao/JdbcGrammarDao.java        SQL tham số qua JDBC
grammar/dao/LessonContentCodec.java    Tách/gộp nội dung trong content_html
grammar/model/                        JavaBean dùng cho DAO và JSP
src/main/webapp/WEB-INF/views/grammar/ Giao diện học và quản trị
database/                             Schema và dữ liệu demo
docs/                                 Đặc tả TX1, UML, kịch bản demo/test
```

Tài liệu [thiết kế TX1 cho phần Ngữ pháp](docs/TX1_GRAMMAR.md) gồm use case tổng quát, 3 use case chi tiết và 2 sequence diagram. Đây là tài liệu phần việc Ngữ pháp để ghép vào báo cáo/slide chung, không thay thế báo cáo Word và slide của toàn nhóm.
