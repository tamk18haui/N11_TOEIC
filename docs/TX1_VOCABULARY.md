# Module Từ vựng — thiết kế và kịch bản kiểm thử

## 1. Phạm vi và nguyên tắc

Module cung cấp lộ trình từ vựng TOEIC theo chủ đề, flashcard, phát âm, bài tập,
nghe viết, kiểm tra đầu vào, đánh dấu tiến độ và quản trị nội dung.

Thiết kế tham khảo trải nghiệm lộ trình theo chặng, học theo bài và theo dõi tiến độ.
Toàn bộ source, nội dung SQL, giao diện và hành vi của dự án được triển khai độc lập;
không sao chép mã nguồn, HTML hoặc tài liệu bản quyền của website tham khảo.

## 2. Cơ sở dữ liệu đang sử dụng

Module dùng chín bảng nằm trong cùng schema nhóm:

- `vocabulary_topics`: chủ đề và mức độ.
- `vocabulary_lessons`: bài học trong từng chủ đề.
- `vocabulary_terms`: kho từ, phiên âm, nghĩa, định nghĩa và ví dụ.
- `vocabulary_lesson_terms`: gán từ vào từng bài học.
- `user_vocabulary_progress`: trạng thái học và mục yêu thích của từng từ.
- `user_vocabulary_lesson_progress`: điểm, sao và trạng thái hoàn thành bài.
- `user_vocabulary_preferences`: giao diện, cỡ chữ và ngôn ngữ.
- `vocabulary_quiz_attempts`: lượt kiểm tra.
- `vocabulary_quiz_answers`: đáp án của từng lượt kiểm tra.

Mỗi chủ đề đã công bố phải có **ít nhất 30 từ**. Ba bài học của chủ đề được tổ chức
theo mức 10, 20 và 30+ từ.

## 3. Kiến trúc mã nguồn

Module theo cùng kiến trúc Controller → Service → DAO → Database của `/grammar`:

```text
Browser/JSP
    ↓
VocabularyController / VocabularyAdminController
    ↓
VocabularyService / DefaultVocabularyService
    ↓
VocabularyDao / JdbcVocabularyDao
    ↓
MySQL hoặc H2 dev
```

- Controller nhận request, chọn view và điều hướng.
- Service kiểm tra nghiệp vụ, trạng thái tài khoản và transaction.
- DAO chỉ truy cập dữ liệu bằng SQL có tham số.
- Model biểu diễn thực thể.
- DTO biểu diễn dữ liệu dành cho giao diện và quiz.

Thư mục Java:

```text
src/main/java/com/toeic/nhom11/vocabulary/
├── controller/
├── service/
├── dao/
├── dto/
└── model/
```

Thư mục giao diện:

```text
src/main/webapp/WEB-INF/views/vocabulary/
├── index.jsp
├── detail.jsp
├── lesson.jsp
├── quiz.jsp
├── result.jsp
├── history.jsp
└── admin/
```

## 4. Phân quyền

- Khách: xem lộ trình, chủ đề, flashcard và nội dung bài học công khai.
- Học viên đã đăng nhập: làm quiz, lưu tiến độ, yêu thích, cài đặt hiển thị và xem lịch sử.
- Admin: toàn bộ quyền học viên và quản trị chủ đề, bài học, từ vựng qua
  `/admin/vocabulary`.
- Tất cả POST đều dùng Spring Security CSRF.

## 5. Use case chính

### UC-V01: Mở lộ trình từ vựng

- Actor: khách hoặc học viên.
- Tiền điều kiện: có chủ đề đã công bố.
- Luồng chính:
  1. Người dùng mở `/vocabulary`.
  2. Controller lấy 25 chủ đề và tiến độ theo tài khoản.
  3. Service kiểm tra tài khoản nếu đã đăng nhập.
  4. DAO truy vấn chủ đề, số bài, số từ và tiến độ.
  5. JSP hiển thị lộ trình, số từ, sao và bước học.
- Ngoại lệ: chủ đề chưa có bài được hiển thị ở trạng thái đang chuẩn bị.

### UC-V02: Học một bài từ vựng

- Actor: khách hoặc học viên.
- Luồng chính:
  1. Người dùng chọn chủ đề và bài học.
  2. Service kiểm tra bài đã xuất bản.
  3. Hệ thống mở flashcard, nghĩa, IPA, ví dụ và phát âm.
  4. Học viên đăng nhập đánh dấu từ `MASTERED` và chuyển bài kiểm tra.
- Quy tắc: bài sau khóa cho đến khi bài trước hoàn thành hoặc vượt bài kiểm tra đầu vào.

### UC-V03: Làm bài kiểm tra

- Actor: học viên đã đăng nhập.
- Luồng chính:
  1. Hệ thống tạo quiz và giữ token trong session.
  2. Người dùng nộp đáp án.
  3. Service kiểm tra câu thuộc quiz, tính điểm và lưu attempt/answer.
  4. Bài học đạt từ 70% được đánh dấu hoàn thành.
  5. Hệ thống redirect sang trang kết quả.
- Kiểm tra đầu vào: 30 câu, đạt 25 câu mở khóa toàn bộ bài của chủ đề.

### UC-V04: Quản trị từ vựng

- Actor: Admin.
- Luồng chính:
  1. Admin mở `/admin/vocabulary`.
  2. Xem thống kê, chủ đề, bài học và từ vựng.
  3. Tạo/sửa/xóa nội dung qua form.
  4. Service kiểm tra độ dài, mức độ, thứ tự, số từ mục tiêu.
  5. DAO ghi dữ liệu; lỗi ràng buộc khóa ngoại không làm mất lịch sử.

## 6. Luồng khởi động và request

1. JVM chạy `Nhom11Application`.
2. Spring Boot đọc `application.yaml` và profile đang chọn.
3. Spring tạo bean Controller, Service, DAO, Security và DataSource.
4. Profile `dev` tạo H2; MySQL dùng cấu hình mặc định hoặc file local.
5. Spring SQL initialization chạy schema và seed tương ứng.
6. Tomcat nhận request.
7. Spring Security kiểm tra route.
8. Controller → Service → DAO → Model/DTO → JSP.

## 7. Kiểm thử bắt buộc

- 25 chủ đề đã công bố.
- Mỗi chủ đề có ít nhất 30 từ.
- Mỗi chủ đề có ba bài học.
- Khách xem được nội dung công khai.
- Khách và học viên không thể vào `/admin/vocabulary`.
- Admin truy cập được dashboard và form quản trị.
- Quiz lưu đúng attempt, answer, score, stars.
- Không có API trả dữ liệu tài khoản hoặc mật khẩu trong model/view.
- Build qua Maven và kiểm thử bằng H2; chạy profile `dev` được trên IntelliJ và VS Code.
