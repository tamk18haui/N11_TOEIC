# Luyện Reading Part 7

Trang `/reading/part7` có 5 cấp độ, số bài/câu và tiến độ lấy từ dữ liệu thực. Đăng nhập → chọn cấp độ → bắt đầu hoặc tiếp tục lượt đang làm.

- Bài đọc đơn, đôi và ba văn bản hiển thị bên trái, câu hỏi bên phải; màn hình nhỏ xếp thành một cột.
- Song ngữ mặc định tắt; khi bật, giao diện hiển thị bản dịch của văn bản và câu hỏi.
- Có thể thay đổi lựa chọn đến khi chọn đủ câu trong nhóm. Máy chủ chỉ trả đáp án, điểm, dẫn chứng và phân tích A–D sau khi cả nhóm hoàn tất. Lời giải chỉ mở khi nhấn **Giải thích chi tiết**.
- Thoát giữ lại tiến độ. Kết thúc yêu cầu làm đủ câu; kết quả và lựa chọn được lưu theo tài khoản. API kiểm tra quyền sở hữu, CSRF và lựa chọn thuộc đúng câu hỏi.

## Dữ liệu

Chạy `database/updates/005_reading_part7.sql` sau các bản cập nhật Reading 003 và 004 trên database hiện có. Cài mới dùng `database/n11_toeic.sql`. Script bổ sung có thể chạy lại; không xóa lượt làm và không ghi đè học liệu cũ.

Bộ khởi đầu tự biên soạn gồm 10 nhóm, 18 văn bản, 34 câu, phân bổ 4/6/6/8/10 câu theo cấp độ. Số lượng không giả lập theo ảnh tham khảo. Chưa có giao diện quản trị Reading; chỉnh nguồn `scripts/build_reading_part7_seed.py` hoặc nhập dữ liệu theo cấu trúc tương ứng.

Mỗi `practice_passages.passage_text` chứa JSON `{title, documents:[{title,title_vi,lines:[{en,vi}]}], glossary:{word:meaning}}`. Một hàng passage là một nhóm tài liệu dùng chung câu hỏi. Mỗi nhóm có 2–5 câu. `practice_questions.explanation` chứa JSON `{translation,options_vi,explanation,evidence,analysis}`; `analysis` có bốn khóa A–D. Không đưa đáp án/lời giải vào JSON văn bản vì phần đó được trả trước khi chấm.

Bộ luyện được nhận diện bằng `part_no=7` và marker `[READING_PART7_LEVEL:n]`. Tiếp tục dùng schema practice hiện có, không thêm bảng. `python scripts/build_reading_part7_seed.py` sinh lại SQL 005 và phần tương ứng trong file cài mới.

## Kiểm tra

`Part7IntegrationTests` kiểm tra cả 5 cấp, số văn bản/câu khác nhau, ẩn kết quả trước khi đủ câu, thay đổi đáp án trước chấm, khóa sau chấm, nhóm độc lập, lưu/tiếp tục, quyền sở hữu, tách Part 5, route và CSRF. Chạy `mvn test`.

## Học liệu bổ sung ngày 16/11/2026

Sau các bản 003–005, nhập `database/updates/006_reading_expansion.sql`. Bộ bổ sung thêm 10 câu Part 5, 5 bài / 20 câu Part 6, và 5 nhóm / 17 câu Part 7. Script không ghi đè câu cũ và có thể nhập lại tuần tự. Lượt đang làm giữ nguyên số câu lúc bắt đầu; kết thúc lượt cũ rồi bắt đầu lượt mới để nhận toàn bộ học liệu bổ sung. Nguồn nội dung: `scripts/build_reading_expansion.py`.
