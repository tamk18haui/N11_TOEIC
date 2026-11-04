# Tích hợp với CSDL nhóm

Nguồn chuẩn: `CSDL.docx` do nhóm cung cấp ngày 03/11/2026. SQL có 31 bảng và 53 khóa ngoại. Module sử dụng `users` và đúng 6 bảng `grammar_*` trong tài liệu.

| Dữ liệu | Vị trí lưu |
| --- | --- |
| Chủ điểm | grammar_topics |
| Tên, mức độ, nội dung bài học | grammar_lessons |
| Bài giảng, mô tả ngắn, ví dụ | grammar_lessons.content_html |
| Câu hỏi và lời giải | grammar_questions |
| Bốn phương án và đáp án đúng | grammar_options |
| Tổng kết lượt làm | grammar_attempts |
| Đáp án đã chọn/đúng sai | grammar_attempt_answers |

## Quy ước HTML trong content_html

Không có migration bổ sung cột/bảng. Module lưu HTML đọc được với các vùng có tên:

```html
<p data-n11="summary">Mô tả ngắn trên thẻ bài học</p>
<section data-n11="lecture">
  <h2>Cách dùng</h2><p>Nội dung lý thuyết...</p>
</section>
<section data-n11="examples">
  <h2>Ví dụ thực tế</h2>
  <article data-example-id="1" data-order="1">
    <p class="sentence">We work here.</p>
    <p class="translation">Chúng tôi làm việc ở đây.</p>
    <p class="note">Hiện tại đơn.</p>
  </article>
</section>
```

`LessonContentCodec` tách dữ liệu này cho các tab JSP. `Example` và `Lesson.summary` chỉ là đối tượng/thuộc tính Java, **không phải bảng/cột trong CSDL**. ID ví dụ chỉ có phạm vi trong một bài học. CRUD ví dụ là cập nhật có khóa dòng trên `grammar_lessons.content_html`.

HTML cũ không theo quy ước vẫn hiện đầy đủ trong tab Bài giảng; mô tả được rút từ văn bản và tab Ví dụ chưa có dữ liệu. Khi nhập hoặc sửa nội dung qua công cụ khác, giữ các thuộc tính `data-n11` và `data-example-id` nếu muốn giữ cách chia tab. Service lọc bài giảng bằng Jsoup; câu ví dụ, mô tả và các văn bản khác được escape khi xuất JSP.

## Toàn vẹn và lịch sử

Schema nhóm dùng `ON DELETE RESTRICT`. DAO chủ động xóa options trước questions rồi lessons trong cùng transaction và chỉ khi chưa có lượt làm. Nếu một phân hệ khác (ví dụ lộ trình) còn tham chiếu bài học, MySQL chặn xóa và transaction rollback.

Schema không có cột snapshot. Trang kết quả JOIN câu hỏi, phương án và bài học. Vì vậy service khóa tên bài, nội dung câu hỏi, đáp án và lời giải sau khi đã có lượt làm; không đổi bộ câu hỏi đang dùng để chấm lịch sử. Muốn sửa bộ câu hỏi, tạo bài mới và bỏ công bố bài cũ. Quy tắc này cần được giữ nếu thành viên khác thao tác trực tiếp lên các bảng.

Các lượt làm chỉ lấy theo `user_id` của tài khoản xác thực; không nhận user_id từ form. Kiểm tra option thuộc question, question thuộc lesson trước khi ghi. Không dùng điểm phần trăm bài tập làm điểm TOEIC quy đổi.

## Điểm cần phối hợp khi ghép mã nguồn

1. Giữ một mapping `/grammar`; mapping mẫu đã được gỡ khỏi `UiPageController`.
2. Module phụ thuộc `Principal.getName()` là email trong `users`; `GrammarDao.userId(email)` chuyển sang ID. Nếu nhóm dùng session thay cho Spring Security, thay lớp lấy danh tính tập trung tại controller, giữ service/DAO.
3. `SecurityConfig`, trang đăng nhập và header là phần tích hợp dùng chung. Khi thành viên phụ trách tài khoản hoàn thiện, hợp nhất vào một cấu hình security và một form login; không tạo hai filter chain hoặc mapping đăng nhập trùng nhau.
4. Seed có ID cố định và tài khoản demo. Không import seed vào CSDL nhóm đã có dữ liệu. Quản trị có thể tạo học liệu với ID tự tăng, `created_by` hiện cho phép NULL theo schema nhóm.
5. Không chạy SQL cũ của bản thử trước trên CSDL chung. `CREATE TABLE IF NOT EXISTS` không sửa kiểu BIGINT, khóa ngoại hoặc loại bỏ cột cũ; dùng schema đúng trong một database mới hoặc migration do nhóm thống nhất.

Trên máy phát triển, bản trước nằm ở `n11_toeic`; bản đang dùng theo nhóm là `n11_toeic_team`. Cấu hình riêng này nằm trong `application-local.yaml`, không được commit.
