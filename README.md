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

- Xem 16 bài học thuộc 4 chủ điểm, gồm đủ 12 thì; tìm theo từ khóa, lọc chủ điểm và mức độ.
- Ba tab Bài giảng, Ví dụ và Bài tập; 64 ví dụ song ngữ. Mỗi bài có bộ 20 câu với phân tích A–D, tổng 320 câu mới. Giữ 80 câu cũ để xem lịch sử.
- Đọc bài giảng/ví dụ không cần đăng nhập. Học viên đăng nhập để chọn đáp án, nộp bài, nhận điểm phần trăm và giải thích; xem 100 lượt làm gần nhất của chính mình.
- Admin có dashboard số liệu thật, CRUD chủ điểm, bài học, ví dụ và câu hỏi A/B/C/D; kiểm tra dữ liệu ở service và form.
- Lưu bản nháp rồi thêm ví dụ/câu hỏi trước khi công bố. Bài đã có lượt làm được khóa tên và bộ câu hỏi; có thể bỏ công bố.
- Chấm điểm trên server, transaction cho lưu lượt làm + đáp án, truy vấn có tham số, CSRF, phân quyền và lọc HTML.

Các trang từ vựng, nghe, đọc, thi thử, lộ trình, quản lý tài khoản vẫn thuộc phần khung giao diện ban đầu của nhóm. Phần đăng nhập tối thiểu hiện dùng `users` để demo ngữ pháp; đã tích hợp đăng ký từ main (dd43351); chưa triển khai quên mật khẩu hay quản lý tài khoản thay cho thành viên khác.

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

## Cập nhật học liệu cho database đang dùng

Chọn đúng database của dự án trong MySQL (máy hiện tại dùng `n11_toeic_team`), rồi chạy lần lượt `database/updates/001_complete_tenses.sql` và `database/updates/002_quiz_modes.sql`. Script tìm chủ điểm **Các thì** và chỉ thêm bài chưa có, nên có thể chạy lại tuần tự. Database mới dùng file `database/n11_toeic.sql`.

## Chỉnh giao diện Ngữ pháp

| Muốn sửa | Mở file và tìm |
| --- | --- |
| Banner, thanh tìm kiếm, số cột | `views/grammar/index.jsp` trong `src/main/webapp/WEB-INF`. Tìm các chú thích về banner, bộ lọc và lưới bài học. |
| Nhãn tab, cách trình bày ví dụ, nút nộp | `views/grammar/detail.jsp` trong `src/main/webapp/WEB-INF`. |
| Màu nền, khoảng cách, kích cỡ thẻ, bố cục điện thoại | `src/main/resources/static/assets/css/grammar.css`. Tìm `.grammar-hero`, `.grammar-card`, `.lesson-tabs` và các khối `@media`. |
| Điều hướng câu, phản hồi luyện tập và xác nhận nộp bài | `src/main/resources/static/assets/js/grammar-exercise.js`. |
| Nội dung bài giảng, ví dụ và câu hỏi | Mở trang Quản trị Ngữ pháp. Nội dung đọc từ MySQL, còn JSP quyết định cách hiển thị. |

Khi sửa JSP, giữ nguyên tên trường gửi đến server và biểu thức JSTL như `<c:out>`. Cách chấm điểm nằm trong `GrammarService`, truy vấn nằm trong `JdbcGrammarDao`.

## Nguồn tham khảo cho 12 thì

Phần lý thuyết được diễn giải bằng tiếng Việt. Ví dụ công sở, phương án và lời giải được biên soạn riêng cho dự án.

- British Council LearnEnglish: [các dạng quá khứ](https://learnenglish.britishcouncil.org/free-resources/grammar/english-grammar-reference/past-tense), [cách diễn đạt tương lai](https://learnenglish.britishcouncil.org/free-resources/grammar/english-grammar-reference/talking-about-future), [tương lai tiếp diễn và hoàn thành](https://learnenglish.britishcouncil.org/free-resources/grammar/b1-b2/future-continuous-future-perfect).
- Cambridge English Grammar Today: [tương lai hoàn thành tiếp diễn](https://dictionary.cambridge.org/uk/grammar/british-grammar/future-perfect-continuous-i-will-have-beenworking-here-ten-years).

## Hai chế độ bài tập

- **Luyện tập** chọn từng câu để server kiểm tra ngay. Đáp án đúng màu xanh, lựa chọn sai màu đỏ, bên dưới là phân tích A–D. Một câu chỉ chọn một lần trong lượt luyện, dùng Làm lại để bắt đầu lượt mới. Luyện tập chưa lưu điểm vào lịch sử.
- **Thi** cho phép đổi lựa chọn, nhảy qua bảng 20 câu. Chỉ sau Nộp bài mới xem điểm và lời giải. Câu bỏ trống tính sai. Điểm và từng câu được lưu trong lịch sử của người đăng nhập.
- Màn chọn chế độ và form ở `src/main/webapp/WEB-INF/views/grammar/quiz.jspf`, được nhúng vào `detail.jsp`. Trang kết quả ở `result.jsp`. Chỉnh màu/khoảng cách ở nhóm `.quiz-*` cuối `grammar.css`.
- Bộ 20 câu ưu tiên các câu có đủ phân tích A–D. Không xóa câu cũ đã có lượt làm. Với bài tự tạo chưa đủ 20 câu có phân tích, hệ thống dùng tối đa 20 câu hiện có và hiển thị đúng số lượng thực tế.
- Cột `grammar_questions.explanation` giữ nguyên schema, quy ước lời giải mới gồm dòng `[PHÂN TÍCH]` rồi bốn dòng `[A] ...`, `[B] ...`, `[C] ...`, `[D] ...`. Mỗi dòng giải thích tại sao phương án tương ứng phù hợp hoặc không phù hợp. Câu cũ vẫn đọc được lời giải chung. Không có dịch vụ AI.

Nguồn bổ sung là PDF **Ngữ pháp tiếng anh cơ bản toàn tập**, nội dung *English Grammar Review*, HP Group, do người dùng cung cấp. Tham khảo phần thì ở trang PDF 16–24 và các phần từ loại, điều kiện, bị động, mệnh đề quan hệ. Các lưu ý và ví dụ công sở được diễn giải/biên soạn cho dự án, không chép nguyên tài liệu. PDF nằm ngoài repo.
