# Reading Part 5

Nếu cơ sở dữ liệu đã nhập bản Reading cũ, chạy lại `database/updates/003_reading_part5.sql` để ẩn nhóm từ riêng của Part 5 khỏi danh mục Từ vựng. Các từ và tiến độ học đã lưu vẫn dùng được trong Reading.

Chức năng nằm tại `/reading`, sử dụng Spring Boot/JSP/JDBC và đúng các bảng sẵn có của CSDL nhóm. Không đổi schema hoặc thêm bảng. Part 6 và 7 có liên kết luyện tập riêng trong thanh bên.

## Học liệu và cài đặt

- 40 câu biên soạn cho dự án, chia 5 cấp độ, mỗi cấp 8 câu; 37 từ vựng kèm IPA, nghĩa và ví dụ song ngữ. Ảnh người dùng cung cấp là tham chiếu bố cục và thao tác. Không tuyên bố câu hỏi lấy từ ETS hoặc độ khó được thống kê từ học viên.
- Database mới: import `database/n11_toeic.sql` như README.
- Database đã có schema nhóm: chọn đúng database, chạy `database/updates/003_reading_part5.sql`. Script thêm nội dung còn thiếu, không ghi đè dữ liệu và có thể chạy lại tuần tự. Không chạy đồng thời từ hai kết nối.
- Máy phát triển hiện tại đã nhập script vào `n11_toeic_team`.
- Đăng nhập bằng tài khoản hiện có hoặc tài khoản demo trong README để xem các cấp độ và luyện tập. Khi học viên mở liên kết đến một cấp độ, hệ thống đưa học viên về cấp đó sau khi đăng nhập.
- Số câu và tiến độ trên thẻ được truy vấn thực tế. Nếu chưa nhập học liệu, thẻ hiện 0 câu và nút bị vô hiệu hóa.

## Luồng học

1. Chọn cấp độ → màn giới thiệu → Bắt đầu / Tiếp tục.
2. Server mở lượt luyện; nếu tài khoản đã có lượt chưa kết thúc ở cấp này thì tiếp tục lượt đó.
3. Chọn một trong A–D: server kiểm tra và lưu ngay; đáp án đúng màu xanh, lựa chọn sai màu đỏ. Không đổi được đáp án sau khi xem lời giải. Gửi lại cùng đáp án không cộng thêm lượt.
4. Chuyển câu bằng nút trước/sau hoặc bảng câu hỏi. Câu bỏ qua vẫn có thể trả lời trước khi kết thúc.
5. Nút Song ngữ bật/tắt bản dịch; Bút nhớ đánh dấu các từ thuộc học liệu xuất hiện trong câu.
6. Phần Từ vựng nên học hiển thị nghĩa và ví dụ; có thể nghe phát âm và ẩn/hiện chi tiết.
7. Ghi chú tự lưu trên trình duyệt theo tài khoản/câu hỏi, tối đa 5.000 ký tự. Cài đặt gồm cỡ chữ và tự mở giải thích. Ghi chú, cài đặt, vị trí câu không đồng bộ sang thiết bị khác; đáp án và tiến độ có lưu server.
8. Thoát giữ lượt luyện đang làm. Kết thúc mở hộp xác nhận có số câu bỏ trống; sau xác nhận, lưu kết quả và mở toàn bộ lời giải. Điểm = số đúng / tổng câu × 100; câu bỏ trống tính chưa đúng. Đây là phần trăm luyện tập, không quy đổi điểm TOEIC.
9. Trang Reading hiện 20 lượt đã kết thúc gần nhất; mở lại để xem đáp án. Kết thúc một lượt rồi chọn cấp độ lần nữa sẽ tạo lượt mới.

## Quy ước CSDL

| Bảng/cột | Cách dùng |
| --- | --- |
| `practice_sets` | `skill=READING`, `part_no=5`, `is_published=1`. Cột `instructions` bắt đầu bằng `[READING_PART5_LEVEL:1]` đến `[READING_PART5_LEVEL:5]`. Mỗi cấp dùng một bộ chuẩn; nếu có nhiều bộ trùng marker, bộ có ID nhỏ nhất được chọn. |
| `practice_sets.difficulty` | Giữ enum nhóm: cấp 1–2 dùng EASY, cấp 3 MEDIUM, cấp 4–5 HARD. Marker phân biệt 5 cấp hiển thị. |
| `practice_questions.explanation` | JSON gồm `translation`, `options_vi` (A–D), `explanation`, `words` (danh sách từ); tùy chọn `analysis` (phân tích A–D). Nội dung dạng văn bản cũ vẫn đọc được như lời giải chung. |
| `practice_options` | Bốn nhãn A–D, chính xác một phương án đúng; kiểm tra trước khi tạo lượt luyện. |
| `practice_attempts` | Lưu người học, bộ luyện, tổng câu, thời điểm bắt đầu/kết thúc, điểm. `submitted_at IS NULL` là đang làm. |
| `practice_attempt_answers` | Tạo bản ghi cho toàn bộ câu lúc bắt đầu, `selected_option_id=NULL` là chưa trả lời. Giữ nguyên tập câu nếu nhập thêm câu mới giữa lượt. |
| `vocabulary_topics` / `vocabulary_terms` | Chủ điểm `N11 Reading Part 5`, từ được liên kết với câu qua `words` trong JSON. |

Tiến độ “Đã luyện” đếm số câu khác nhau đã trả lời trong mọi lượt của người dùng, kể cả lượt đang làm; làm lại không tăng quá tổng số câu. Dùng khóa người dùng khi tạo lượt và khóa lượt khi chấm/kết thúc để xử lý yêu cầu đồng thời. Mỗi thao tác ghi dùng transaction, truy vấn tham số; kiểm tra chủ sở hữu cho mọi lượt, có CSRF. API không trả đáp án đúng/lời giải của câu chưa làm trước khi kết thúc.

Không sửa/xóa nội dung câu đã có lượt làm: schema nhóm không lưu bản sao nội dung. Bộ nhập ban đầu chỉ thêm; khi cần sửa nội dung đã dùng, tạo bộ/câu mới theo quy trình quản trị của nhóm. Chức năng quản trị Reading không nằm trong đợt triển khai này.

## Chỉnh sửa mã nguồn

| Mục đích | File |
| --- | --- |
| Bố cục 5 cấp độ | `src/main/webapp/WEB-INF/views/reading/index.jsp` |
| Màn bắt đầu | `src/main/webapp/WEB-INF/views/reading/intro.jsp` |
| Khung luyện tập | `src/main/webapp/WEB-INF/views/reading/practice.jsp` |
| Màu sắc, desktop/mobile | `src/main/resources/static/assets/css/reading.css` |
| Tương tác câu hỏi, công cụ học, dialog | `src/main/resources/static/assets/js/reading-practice.js` |
| Đường dẫn JSP/API | `src/main/java/com/toeic/nhom11/reading/controller/ReadingController.java` |
| Chấm bài, kiểm tra quyền, tiến độ | `src/main/java/com/toeic/nhom11/reading/service/ReadingService.java` |
| JDBC | `src/main/java/com/toeic/nhom11/reading/dao/ReadingDao.java` |
| Nguồn học liệu và sinh SQL | `scripts/build_reading_seed.py` |

Chạy `python scripts/build_reading_seed.py` để sinh lại `003_reading_part5.sql` và phần Reading trong `n11_toeic.sql`. Không cần Python khi chạy ứng dụng. Sửa script không tự cập nhật các câu đã có trong database.

## Kiểm thử

`mvn test`: H2 độc lập, không ghi MySQL. `ReadingIntegrationTests` kiểm tra đủ 5 cấp, chấm/lưu, tiếp tục, cố định danh sách câu, câu trống, gửi lặp, ID giả, riêng tư, CSRF, bộ nháp, cấu hình câu sai và đăng nhập quay lại cấp đã chọn.

Trong môi trường Windows hạn chế quyền attach, Mockito mặc định có thể treo khi tự gắn Java agent. Phiên kiểm chứng này truyền agent có sẵn qua `-DargLine=-javaagent:<đường-dẫn-mockito-core-5.23.0.jar>`; không cần thay cấu hình ứng dụng. Chạy `mvn -DskipTests package` để đóng gói WAR sau khi kiểm thử thành công.

Kiểm tra trực tiếp: mở `/reading` → cấp 1 → chọn sai câu 1, đúng câu 2 → bật/tắt Song ngữ → ghi chú → tải lại → kết thúc khi còn câu trống → xác nhận điểm 1/6 = 16,67% → quay lại xem tiến độ 2/6 và lịch sử. Kiểm tra responsive ở desktop và điện thoại, dùng Tab/Enter để thao tác các nút, Escape để đóng dialog.

## Học liệu bổ sung ngày 16/11/2026

Sau các bản 003–005, nhập `database/updates/006_reading_expansion.sql`. Bộ bổ sung thêm 10 câu Part 5, 5 bài / 20 câu Part 6, và 5 nhóm / 17 câu Part 7. Script không ghi đè câu cũ và có thể nhập lại tuần tự. Lượt đang làm giữ nguyên số câu lúc bắt đầu; kết thúc lượt cũ rồi bắt đầu lượt mới để nhận toàn bộ học liệu bổ sung. Nguồn nội dung: `scripts/build_reading_expansion.py`.
