# Kiểm thử chức năng Ngữ pháp

## Tự động

`mvn test` chạy bộ test service/JDBC, MVC/security và quy ước HTML. H2 chỉ dùng cho test; schema test mô phỏng các bảng phụ thuộc từ CSDL nhóm. Kiểm thử MySQL thật dùng `n11_toeic_team`, tắt khởi tạo SQL và rollback từng test nghiệp vụ.

| Ca kiểm thử | Kết quả mong đợi |
| --- | --- |
| Nộp đúng 5/5 | 100%, có 1 lượt làm và 5 chi tiết |
| Nộp đúng 1/5, còn lại trống | 20%, lưu tất cả câu |
| Bỏ trống toàn bộ | 0%, selected_option_id NULL |
| Gửi option của câu khác | Từ chối, không thêm lượt làm |
| Gửi câu hỏi thuộc bài khác | Từ chối |
| Đọc lịch sử của tài khoản khác | 404 |
| CRUD chủ điểm, bài, ví dụ, câu hỏi | Đọc lại khớp dữ liệu; xóa theo thứ tự FK |
| Công bố thiếu ví dụ/câu hỏi | Không cho công bố |
| Câu hỏi có nhiều đáp án đúng | Không cho lưu |
| Sửa/xóa câu hỏi sau khi có lượt làm | Không cho phép |
| Chèn script/onClick vào bài giảng | Bị loại bỏ |
| Tìm kiếm chứa chuỗi SQL injection | Không làm thay đổi câu truy vấn |
| Khách vào quản trị | Chuyển đăng nhập |
| Học viên vào quản trị | 403 |
| POST thiếu CSRF | 403 |
| Admin vào dashboard | 200 |
| HTML cũ không có vùng đánh dấu | Vẫn đọc được bài giảng |
| Ví dụ có tiếng Việt và ký tự <, &, > | Lưu/đọc đúng, không thành thẻ HTML |

Để chạy cùng bộ test trên MySQL thử bằng PowerShell, cấu hình biến `DB_PASSWORD` trong phiên làm việc và chạy:

```powershell
mvn test '-Dspring.datasource.url=jdbc:mysql://localhost:3306/n11_toeic_team' '-Dspring.datasource.username=root' '-Dspring.datasource.password=${DB_PASSWORD}' '-Dspring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver' '-Dspring.sql.init.mode=never'
```

Không dùng database sản xuất để chạy test. Báo cáo JUnit nằm ở `target/surefire-reports/`.

## Demo trực tiếp trong 5 phút

1. Mở `/`, chọn Ngữ pháp. Tìm `Present Simple`, lọc mức Cơ bản; mở bài Hiện tại đơn.
2. Mở Bài giảng rồi Ví dụ. Cho thấy nội dung tiếng Việt, cấu trúc và câu minh họa lấy từ MySQL.
3. Đăng nhập `student@n11.local`, chọn bài tập. Chọn câu 1 B, câu 2 C, câu 3 D, câu 4 B, bỏ câu 5. Nộp: phải đúng 3/5, 60%, câu 4 sai, câu 5 bỏ trống.
4. Mở Lịch sử học, chọn xem lại kết quả. F5 trang kết quả không tạo thêm lượt làm do POST/Redirect/GET.
5. Đăng nhập admin, vào `/admin/grammar`. Giới thiệu số liệu truy vấn thật và bài nháp; demo thêm/sửa bài. Dùng bài mới để demo CRUD câu hỏi vì bài đã có lượt làm được khóa.
6. Chạy `mvn test`, giải thích một test chấm điểm và một test từ chối đáp án không thuộc câu hỏi.

Truy vấn chứng minh lưu MySQL:

```sql
SELECT id, user_id, lesson_id, correct_count, total_questions, score_percent, submitted_at
FROM grammar_attempts ORDER BY id DESC LIMIT 5;
SELECT attempt_id, question_id, selected_option_id, is_correct
FROM grammar_attempt_answers ORDER BY id DESC LIMIT 5;
```

Kiểm tra responsive: ở chiều rộng điện thoại, menu thu gọn, thẻ bài học xếp một cột, đáp án xếp một cột; ở desktop, danh sách bài học có ba cột. Kiểm tra bằng bàn phím: Tab tới từng lựa chọn, Space chọn radio, Enter nộp form.
