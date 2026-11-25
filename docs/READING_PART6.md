# Luyện Reading Part 6

Mở `/reading/part6` hoặc chọn Part 6 trong thanh bên trang Reading. Giao diện gồm 5 cấp độ, màn giới thiệu và màn luyện với bài đọc bên trái, bốn câu hỏi bên phải. Hai cột cuộn độc lập trên desktop; điện thoại xếp bài đọc phía trên câu hỏi.

## Quy tắc làm bài

- Song ngữ mặc định **tắt**. Khi bật, giao diện hiển thị bản dịch từng đoạn và lựa chọn; khi tắt, văn bản trở về bình thường.
- Mỗi lựa chọn được lưu ngay trên server, nhưng **chưa trả đúng/sai, đáp án chuẩn hay lời giải** khi bài đọc chưa đủ 4 câu. Người học có thể đổi đáp án trong giai đoạn này.
- Chọn câu cuối cùng sẽ mở kết quả cả bốn câu và khóa lựa chọn trong bài đọc đó. Đúng màu xanh, lựa chọn sai màu đỏ.
- Lời giải nằm trong `details` mặc định đóng dưới từng câu; chỉ mở khi người học nhấn **Giải thích chi tiết**.
- Mỗi bài đọc được kiểm tra riêng, không chờ các bài khác của cùng cấp độ. Danh sách bài đọc và nút trước/sau hỗ trợ bộ có nhiều bài.
- Tải lại/Thoát vẫn giữ lựa chọn. Bắt đầu lại cùng cấp sẽ tiếp tục lượt chưa kết thúc. Kết thúc chỉ được thực hiện khi trả lời đủ bộ luyện; muốn dừng giữa chừng dùng Thoát, sau đó quay lại tiếp tục.
- Kết quả và lịch sử lưu theo tài khoản, điểm là phần trăm đúng, không phải điểm TOEIC quy đổi.

## Dữ liệu

Học liệu khởi đầu tự biên soạn: **10 bài đọc / 40 câu**, mỗi cấp hai bài, bao gồm email, thông báo, bản ghi nhớ và hợp đồng. Mỗi bài có câu chọn từ/ngữ pháp và câu điền cả câu theo ngữ cảnh. Số lượng trên giao diện lấy từ database, không dùng số liệu của website tham khảo.

- Database mới: `database/n11_toeic.sql` đã gồm Parts 5–7.
- Database hiện có: chạy `database/updates/004_reading_part6.sql` sau schema nhóm. Script thêm nếu thiếu, không ghi đè nội dung hay kết quả. Chạy tuần tự, không chạy đồng thời hai bản import.
- Nguồn học liệu: `scripts/build_reading_part6_seed.py`; chạy Python để sinh lại SQL. Thay đổi nguồn không tự ghi đè câu đã nhập.
- Giữ nguyên schema nhóm: `practice_sets.part_no=6`, marker `[READING_PART6_LEVEL:1]` đến `5` trong `instructions`; `practice_passages.passage_text` chứa JSON `title`, `lines` (en/vi), `glossary` (từ → nghĩa). Câu hỏi tham chiếu `passage_id`; lời giải và dịch lựa chọn lưu JSON trong `practice_questions.explanation`.
- Giữ nguyên nội dung câu/bài đã có lượt làm; schema không lưu bản sao nội dung. Muốn sửa học liệu đã dùng cần tạo câu/bộ mới.

## Các file chính

- `reading/service/Part6Service.java`: riêng tư, lưu lựa chọn, chấm theo nhóm bài đọc, tiếp tục, kết quả.
- `reading/controller/Part6Controller.java`: JSP và API; mọi API luyện tập yêu cầu đăng nhập và CSRF khi ghi.
- `views/reading/part6-index.jsp`, `part6-intro.jsp`, `part6-practice.jsp`: giao diện.
- `static/assets/js/reading-part6.js`: tương tác hai cột, bật/tắt hỗ trợ, giải thích.
- `static/assets/css/reading.css`: phần CSS Part 6 nằm trong nhóm `.part6-*`.

## Kiểm thử

`Part6IntegrationTests` gồm 8 ca: đủ 5 cấp; không lộ đáp án/điểm trước câu cuối; sửa trước khi chấm và khóa sau đó; không thể dùng Kết thúc để lộ lời giải sớm; chấm độc lập khi có nhiều bài đọc; chặn truy cập chéo tài khoản/Part 5/ID giả; MVC/CSRF và yêu cầu đăng nhập.

Bộ kiểm thử học liệu mở rộng nằm trong `ReadingExpansionTests`. Trên môi trường Windows hạn chế attach, dùng Java agent Mockito như hướng dẫn trong `READING_PART5.md`. Không cần thay cấu hình MySQL để chạy test H2.

## Học liệu bổ sung ngày 16/11/2026

Sau các bản 003–005, nhập `database/updates/006_reading_expansion.sql`. Bộ bổ sung thêm 10 câu Part 5, 5 bài / 20 câu Part 6, và 5 nhóm / 17 câu Part 7. Script không ghi đè câu cũ và có thể nhập lại tuần tự. Lượt đang làm giữ nguyên số câu lúc bắt đầu; kết thúc lượt cũ rồi bắt đầu lượt mới để nhận toàn bộ học liệu bổ sung. Nguồn nội dung: `scripts/build_reading_expansion.py`.
