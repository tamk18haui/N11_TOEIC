-- Chạy trong schema N11 TOEIC đã có dữ liệu. Có thể chạy lại tuần tự.
-- Chỉ thêm bài chưa tồn tại theo tên trong chủ điểm Các thì.
SET NAMES utf8mb4;
START TRANSACTION;
SET @tense_topic = (SELECT id FROM grammar_topics WHERE title = 'Các thì' LIMIT 1);

-- Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)
INSERT INTO grammar_lessons(topic_id, title, content_html, level, sort_order, is_published)
SELECT @tense_topic, 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)', '<p data-n11="summary">Hoạt động kéo dài tới hiện tại hoặc vừa dừng và còn dấu hiệu.</p><section data-n11="lecture"><h3>Cách dùng</h3><p>Đặt trọng tâm vào quá trình. Khi nhấn mạnh số việc đã hoàn tất, thường dùng hiện tại hoàn thành đơn.</p><h3>Công thức</h3><ul><li>Khẳng định: <strong>S + have/has been + V-ing</strong></li><li>Phủ định: <strong>S + have/has + not + been V-ing</strong></li><li>Câu hỏi: <strong>Have/Has + S + been + V-ing?</strong></li></ul><h3>Nhận biết trong TOEIC</h3><p>for + khoảng thời gian, since + mốc bắt đầu, all morning. Đọc cả câu để xác định hoạt động có nối với hiện tại.</p><p><em>S: chủ ngữ. V3: quá khứ phân từ.</em></p></section><section data-n11="examples"><article data-example-id="1" data-order="1"><p class="sentence">The support team has been answering calls since 8 a.m.</p><p class="translation">Nhóm hỗ trợ đã liên tục trả lời điện thoại từ 8 giờ sáng.</p><p class="note">Since giới thiệu thời điểm bắt đầu.</p></article><article data-example-id="2" data-order="2"><p class="sentence">I have been checking invoices all morning.</p><p class="translation">Tôi đã kiểm tra hóa đơn suốt buổi sáng.</p><p class="note">Trọng tâm là quá trình kiểm tra.</p></article><article data-example-id="3" data-order="3"><p class="sentence">Have you been waiting long?</p><p class="translation">Bạn đã đợi lâu chưa?</p><p class="note">Đưa have lên trước chủ ngữ để hỏi.</p></article></section>', 'INTERMEDIATE', 9, 1
WHERE @tense_topic IS NOT NULL AND NOT EXISTS (SELECT 1 FROM grammar_lessons WHERE topic_id = @tense_topic AND title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)');
SET @new_lesson = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'The technician _____ the printer since 9 a.m. and is still working on it.', 'Since và is still working cho thấy hoạt động kéo dài đến hiện tại.', 2, 1 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'repaired', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'will repair', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'has been repairing', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'had repaired', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'We have been _____ customer feedback all week.', 'Sau have been trong dạng tiếp diễn dùng V-ing.', 2, 2 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'collect', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'collected', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'collects', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'collecting', 1 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'How long _____ Ms. Lee been managing this branch?', 'Ms. Lee là chủ ngữ số ít, dùng has.', 2, 3 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'has', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'have', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'was', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'did', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'The interns have been working remotely _____ Monday.', 'Monday là mốc bắt đầu, dùng since.', 2, 4 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'for', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'since', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'during', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'until', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'The analysts have been comparing prices _____ three hours.', 'Three hours là khoảng thời gian, dùng for.', 2, 5 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'since', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'at', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'for', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'by', 0 WHERE @new_question IS NOT NULL;

-- Quá khứ tiếp diễn (Past Continuous)
INSERT INTO grammar_lessons(topic_id, title, content_html, level, sort_order, is_published)
SELECT @tense_topic, 'Quá khứ tiếp diễn (Past Continuous)', '<p data-n11="summary">Hoạt động đang diễn ra tại một thời điểm trong quá khứ.</p><section data-n11="lecture"><h3>Cách dùng</h3><p>Dùng cho hành động làm nền, hành động bị chen ngang hoặc hai hoạt động đang diễn ra song song.</p><h3>Công thức</h3><ul><li>Khẳng định: <strong>S + was/were + V-ing</strong></li><li>Phủ định: <strong>S + was/were + not + V-ing</strong></li><li>Câu hỏi: <strong>Was/Were + S + V-ing?</strong></li></ul><h3>Nhận biết trong TOEIC</h3><p>At 3 p.m. yesterday, while, when. Hành động đang diễn ra thường dùng tiếp diễn, sự kiện chen ngang thường dùng quá khứ đơn.</p><p><em>S: chủ ngữ. V3: quá khứ phân từ.</em></p></section><section data-n11="examples"><article data-example-id="1" data-order="1"><p class="sentence">At 3 p.m., we were testing the new checkout system.</p><p class="translation">Lúc 3 giờ chiều, chúng tôi đang thử hệ thống thanh toán mới.</p><p class="note">Were testing cho biết công việc đang diễn ra lúc đó.</p></article><article data-example-id="2" data-order="2"><p class="sentence">I was taking notes when the projector stopped working.</p><p class="translation">Tôi đang ghi chép thì máy chiếu ngừng hoạt động.</p><p class="note">Stopped là sự kiện chen ngang.</p></article><article data-example-id="3" data-order="3"><p class="sentence">While Leo was packing the orders, Ana was printing the labels.</p><p class="translation">Trong khi Leo đóng gói đơn hàng, Ana đang in nhãn.</p><p class="note">Hai hành động làm nền diễn ra song song.</p></article></section>', 'BASIC', 10, 1
WHERE @tense_topic IS NOT NULL AND NOT EXISTS (SELECT 1 FROM grammar_lessons WHERE topic_id = @tense_topic AND title = 'Quá khứ tiếp diễn (Past Continuous)');
SET @new_lesson = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'At the moment the alarm rang, the cleaners _____ the lobby.', 'The alarm rang đặt mốc quá khứ, cleaners số nhiều dùng were.', 1, 1 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'are mopping', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'will mop', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'have mopped', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'were mopping', 1 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'While I was _____ the spreadsheet, the computer restarted.', 'Was + V-ing mô tả thao tác đang thực hiện.', 1, 2 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'editing', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'edit', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'edited', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'edits', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, '_____ you speaking to a client when I called?', 'Câu hỏi quá khứ tiếp diễn với you bắt đầu bằng were.', 1, 3 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'Are', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'Were', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'Have', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'Did', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'At noon yesterday, Nora _____ the interview room.', 'Nora số ít, dùng was preparing tại mốc quá khứ.', 1, 4 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'is preparing', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'has prepared', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'was preparing', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'will prepare', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'The lights went out while the staff _____ the new equipment.', 'Were testing diễn tả hành động làm nền.', 1, 5 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'test', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'are testing', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'will test', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'were testing', 1 WHERE @new_question IS NOT NULL;

-- Quá khứ hoàn thành (Past Perfect)
INSERT INTO grammar_lessons(topic_id, title, content_html, level, sort_order, is_published)
SELECT @tense_topic, 'Quá khứ hoàn thành (Past Perfect)', '<p data-n11="summary">Một hành động đã xảy ra trước một mốc hoặc sự kiện khác trong quá khứ.</p><section data-n11="lecture"><h3>Cách dùng</h3><p>Xác định hai mốc rồi đặt hành động xảy ra trước vào quá khứ hoàn thành khi cần làm rõ thứ tự. Nếu thứ tự đã rõ, quá khứ đơn cũng có thể phù hợp.</p><h3>Công thức</h3><ul><li>Khẳng định: <strong>S + had + V3</strong></li><li>Phủ định: <strong>S + had + not + V3</strong></li><li>Câu hỏi: <strong>Had + S + V3?</strong></li></ul><h3>Nhận biết trong TOEIC</h3><p>By the time + mệnh đề quá khứ, before, already. Không dùng chỉ vì câu kể chuyện quá khứ.</p><p><em>S: chủ ngữ. V3: quá khứ phân từ.</em></p></section><section data-n11="examples"><article data-example-id="1" data-order="1"><p class="sentence">By the time the auditor arrived, we had printed all the receipts.</p><p class="translation">Khi kiểm toán viên đến, chúng tôi đã in hết biên lai.</p><p class="note">Việc in hoàn tất trước lúc kiểm toán viên đến.</p></article><article data-example-id="2" data-order="2"><p class="sentence">The courier had left before I reached the lobby.</p><p class="translation">Nhân viên giao hàng đã đi trước khi tôi xuống sảnh.</p><p class="note">Had left đặt việc rời đi ở mốc sớm hơn.</p></article><article data-example-id="3" data-order="3"><p class="sentence">Had the technician backed up the files before the update?</p><p class="translation">Kỹ thuật viên đã sao lưu tệp trước khi cập nhật chưa?</p><p class="note">Câu hỏi dùng had trước chủ ngữ và backed up ở V3.</p></article></section>', 'INTERMEDIATE', 11, 1
WHERE @tense_topic IS NOT NULL AND NOT EXISTS (SELECT 1 FROM grammar_lessons WHERE topic_id = @tense_topic AND title = 'Quá khứ hoàn thành (Past Perfect)');
SET @new_lesson = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'By the time the guests arrived, the caterer _____ the tables.', 'Bàn đã được chuẩn bị trước một mốc quá khứ.', 2, 1 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'had set', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'will set', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'has set', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'is setting', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'The manager had already _____ the request when I called.', 'Sau had dùng quá khứ phân từ approved.', 2, 2 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'approve', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'approved', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'approving', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'approves', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, '_____ the team finished the review before the vote took place?', 'Vote took place là mốc quá khứ, câu hỏi cần Had.', 2, 3 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'Has', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'Will', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'Had', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'Was', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'When we checked at 6 p.m. yesterday, the supplier _____ all ten boxes.', 'Việc giao đã hoàn tất trước lúc kiểm tra.', 2, 4 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'will deliver', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'has delivered', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'delivers', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'had delivered', 1 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'The clerk could not print the form because she _____ the file.', 'Xóa tệp xảy ra trước lúc không thể in.', 2, 5 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'had deleted', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'will delete', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'deletes', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'has deleted', 0 WHERE @new_question IS NOT NULL;

-- Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)
INSERT INTO grammar_lessons(topic_id, title, content_html, level, sort_order, is_published)
SELECT @tense_topic, 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)', '<p data-n11="summary">Hoạt động kéo dài đến hoặc ngay trước một mốc trong quá khứ.</p><section data-n11="lecture"><h3>Cách dùng</h3><p>Nhấn mạnh thời lượng hoặc nguyên nhân của trạng thái lúc đó. Dùng quá khứ hoàn thành đơn khi điểm chính là kết quả đã xong.</p><h3>Công thức</h3><ul><li>Khẳng định: <strong>S + had been + V-ing</strong></li><li>Phủ định: <strong>S + had + not + been V-ing</strong></li><li>Câu hỏi: <strong>Had + S + been + V-ing?</strong></li></ul><h3>Nhận biết trong TOEIC</h3><p>For two hours before, since dawn, by the time + quá khứ. Chọn theo ý nghĩa, vì for cũng xuất hiện ở các thì khác.</p><p><em>S: chủ ngữ. V3: quá khứ phân từ.</em></p></section><section data-n11="examples"><article data-example-id="1" data-order="1"><p class="sentence">We had been negotiating for weeks before the contract was signed.</p><p class="translation">Chúng tôi đã đàm phán nhiều tuần trước khi hợp đồng được ký.</p><p class="note">Nhấn mạnh thời gian đàm phán trước lúc ký.</p></article><article data-example-id="2" data-order="2"><p class="sentence">Her shoes were wet because she had been working outside.</p><p class="translation">Giày cô ấy ướt vì trước đó cô đã làm việc ngoài trời.</p><p class="note">Hoạt động giải thích tình trạng trong quá khứ.</p></article><article data-example-id="3" data-order="3"><p class="sentence">Had the machine been running all night before it stopped?</p><p class="translation">Máy đã chạy suốt đêm trước khi dừng phải không?</p><p class="note">Had + chủ ngữ + been + V-ing.</p></article></section>', 'ADVANCED', 12, 1
WHERE @tense_topic IS NOT NULL AND NOT EXISTS (SELECT 1 FROM grammar_lessons WHERE topic_id = @tense_topic AND title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)');
SET @new_lesson = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'The engineers _____ on the fault for hours before they found the cause.', 'Thời lượng kéo dài đến mốc found trong quá khứ.', 3, 1 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'have been working', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'had been working', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'are working', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'will be working', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'The floor was muddy because the crew had been _____ equipment through the entrance.', 'Sau had been trong cấu trúc tiếp diễn dùng V-ing.', 3, 2 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'move', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'moved', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'moving', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'moves', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'How long _____ the staff been waiting before the door opened?', 'Door opened là mốc quá khứ, dùng had trước chủ ngữ.', 3, 3 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'have', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'did', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'were', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'had', 1 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'Before the network came back, the operator had been trying to reconnect _____ 20 minutes.', '20 minutes là khoảng thời gian.', 3, 4 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'for', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'since', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'at', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'by', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'When the supervisor arrived, the workers were tired because they _____ heavy boxes all morning.', 'Việc khuân vác trước đó giải thích trạng thái were tired.', 3, 5 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'will carry', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'had been carrying', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'have been carrying', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'are carrying', 0 WHERE @new_question IS NOT NULL;

-- Tương lai đơn (Future Simple)
INSERT INTO grammar_lessons(topic_id, title, content_html, level, sort_order, is_published)
SELECT @tense_topic, 'Tương lai đơn (Future Simple)', '<p data-n11="summary">Dự đoán, lời hứa, lời đề nghị và quyết định đưa ra lúc nói.</p><section data-n11="lecture"><h3>Cách dùng</h3><p>Dùng will cho dự đoán hoặc quyết định tức thời. Với kế hoạch đã định trước, be going to hoặc hiện tại tiếp diễn có thể phù hợp hơn.</p><h3>Công thức</h3><ul><li>Khẳng định: <strong>S + will + V nguyên mẫu</strong></li><li>Phủ định: <strong>S + will + not + V nguyên mẫu</strong></li><li>Câu hỏi: <strong>Will + S + V nguyên mẫu?</strong></li></ul><h3>Nhận biết trong TOEIC</h3><p>Tomorrow, next week, I think, I promise. Trong mệnh đề thời gian chỉ tương lai sau when, thường dùng hiện tại đơn.</p><p><em>S: chủ ngữ. V3: quá khứ phân từ.</em></p></section><section data-n11="examples"><article data-example-id="1" data-order="1"><p class="sentence">I will send the confirmation this afternoon.</p><p class="translation">Tôi sẽ gửi xác nhận chiều nay.</p><p class="note">Will biểu thị lời hứa.</p></article><article data-example-id="2" data-order="2"><p class="sentence">I think the store will be busy tomorrow.</p><p class="translation">Tôi nghĩ cửa hàng sẽ đông khách ngày mai.</p><p class="note">Will biểu thị dự đoán.</p></article><article data-example-id="3" data-order="3"><p class="sentence">Will you call me when the parcel arrives?</p><p class="translation">Bạn sẽ gọi cho tôi khi bưu kiện đến chứ?</p><p class="note">Mệnh đề when dùng arrives.</p></article></section>', 'BASIC', 13, 1
WHERE @tense_topic IS NOT NULL AND NOT EXISTS (SELECT 1 FROM grammar_lessons WHERE topic_id = @tense_topic AND title = 'Tương lai đơn (Future Simple)');
SET @new_lesson = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'I promise I _____ the updated contract by noon tomorrow.', 'Lời hứa về tương lai dùng will + động từ nguyên mẫu.', 1, 1 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'emailed', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'have emailed', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'will email', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'had emailed', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'The courier will _____ the package tomorrow morning.', 'Sau will dùng động từ nguyên mẫu.', 1, 2 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'delivers', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'delivered', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'delivering', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'deliver', 1 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'We will let you know when the replacement part _____.', 'Mệnh đề chỉ thời gian sau when dùng hiện tại đơn.', 1, 3 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'arrives', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'will arrive', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'had arrived', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'arriving', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, '_____ you send me a copy of the receipt?', 'Will + chủ ngữ + động từ là cách đặt câu hỏi hoặc lời đề nghị.', 1, 4 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'Has', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'Will', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'Was', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'Had', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'The branch will not _____ on Sunday.', 'Sau will not vẫn dùng động từ nguyên mẫu.', 1, 5 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'opens', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'opened', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'open', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'opening', 0 WHERE @new_question IS NOT NULL;

-- Tương lai tiếp diễn (Future Continuous)
INSERT INTO grammar_lessons(topic_id, title, content_html, level, sort_order, is_published)
SELECT @tense_topic, 'Tương lai tiếp diễn (Future Continuous)', '<p data-n11="summary">Hoạt động đang diễn ra tại một mốc cụ thể trong tương lai.</p><section data-n11="lecture"><h3>Cách dùng</h3><p>Đặt người nghe vào một thời điểm trong tương lai và mô tả công việc đang diễn ra lúc đó. Có thể dùng dạng hỏi để hỏi lịch một cách lịch sự.</p><h3>Công thức</h3><ul><li>Khẳng định: <strong>S + will be + V-ing</strong></li><li>Phủ định: <strong>S + will + not + be V-ing</strong></li><li>Câu hỏi: <strong>Will + S + be + V-ing?</strong></li></ul><h3>Nhận biết trong TOEIC</h3><p>At this time tomorrow, at 10 a.m. next Monday. Nếu nhấn mạnh đã hoàn tất trước một hạn, xem tương lai hoàn thành.</p><p><em>S: chủ ngữ. V3: quá khứ phân từ.</em></p></section><section data-n11="examples"><article data-example-id="1" data-order="1"><p class="sentence">At this time tomorrow, I will be flying to the trade fair.</p><p class="translation">Giờ này ngày mai, tôi sẽ đang bay đến hội chợ.</p><p class="note">Chuyến bay đang diễn ra tại mốc ngày mai.</p></article><article data-example-id="2" data-order="2"><p class="sentence">We will be interviewing candidates when you arrive.</p><p class="translation">Khi bạn đến, chúng tôi sẽ đang phỏng vấn ứng viên.</p><p class="note">Cuộc phỏng vấn đang diễn ra khi bạn tới.</p></article><article data-example-id="3" data-order="3"><p class="sentence">Will you be using the conference room at noon?</p><p class="translation">Bạn có dùng phòng họp vào buổi trưa không?</p><p class="note">Câu hỏi về lịch sử dụng phòng.</p></article></section>', 'INTERMEDIATE', 14, 1
WHERE @tense_topic IS NOT NULL AND NOT EXISTS (SELECT 1 FROM grammar_lessons WHERE topic_id = @tense_topic AND title = 'Tương lai tiếp diễn (Future Continuous)');
SET @new_lesson = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'At 10 a.m. tomorrow, the design team _____ the prototype to a client.', 'Tại mốc tương lai, buổi trình diễn đang diễn ra.', 2, 1 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'demonstrated', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'had demonstrated', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'has demonstrated', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'will be demonstrating', 1 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'We will be _____ the service desk during the event.', 'Will be + V-ing diễn tả việc trực quầy đang diễn ra.', 2, 2 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'staffing', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'staff', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'staffed', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'staffs', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'At this time next week, I _____ at the Osaka branch.', 'At this time next week đặt mốc tương lai.', 2, 3 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'worked', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'will be working', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'have worked', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'had worked', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'Will you _____ the company car at 2 p.m. tomorrow?', 'Cấu trúc câu hỏi là will + chủ ngữ + be + V-ing.', 2, 4 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'using', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'been using', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'be using', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'are using', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'When the visitors arrive tomorrow, Marta _____ the orientation session.', 'Buổi hướng dẫn sẽ đang diễn ra khi khách đến.', 2, 5 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'led', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'has led', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'had led', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'will be leading', 1 WHERE @new_question IS NOT NULL;

-- Tương lai hoàn thành (Future Perfect)
INSERT INTO grammar_lessons(topic_id, title, content_html, level, sort_order, is_published)
SELECT @tense_topic, 'Tương lai hoàn thành (Future Perfect)', '<p data-n11="summary">Việc sẽ hoàn tất trước hoặc chậm nhất tại một mốc tương lai.</p><section data-n11="lecture"><h3>Cách dùng</h3><p>So sánh một hạn tương lai với kết quả dự kiến. Dạng này thường đi với số lượng hoàn tất hoặc công việc có điểm kết thúc.</p><h3>Công thức</h3><ul><li>Khẳng định: <strong>S + will have + V3</strong></li><li>Phủ định: <strong>S + will + not + have V3</strong></li><li>Câu hỏi: <strong>Will + S + have + V3?</strong></li></ul><h3>Nhận biết trong TOEIC</h3><p>By Friday, by the end of next month, by the time + hiện tại đơn. By là hạn hoàn thành; until chỉ sự kéo dài tới mốc.</p><p><em>S: chủ ngữ. V3: quá khứ phân từ.</em></p></section><section data-n11="examples"><article data-example-id="1" data-order="1"><p class="sentence">By Friday, we will have processed all 200 applications.</p><p class="translation">Chậm nhất thứ Sáu, chúng tôi sẽ xử lý xong cả 200 đơn.</p><p class="note">All 200 applications nhấn mạnh kết quả hoàn tất.</p></article><article data-example-id="2" data-order="2"><p class="sentence">The team will have packed every order by the time the truck arrives.</p><p class="translation">Nhóm sẽ đóng gói xong mọi đơn trước lúc xe tải đến.</p><p class="note">Mệnh đề thời gian dùng arrives.</p></article><article data-example-id="3" data-order="3"><p class="sentence">Will you have finished the draft by Tuesday?</p><p class="translation">Bạn sẽ hoàn thành bản nháp chậm nhất thứ Ba chứ?</p><p class="note">Will đứng trước chủ ngữ, sau đó là have + V3.</p></article></section>', 'ADVANCED', 15, 1
WHERE @tense_topic IS NOT NULL AND NOT EXISTS (SELECT 1 FROM grammar_lessons WHERE topic_id = @tense_topic AND title = 'Tương lai hoàn thành (Future Perfect)');
SET @new_lesson = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'By noon tomorrow, the crew _____ all six signs.', 'All six signs là kết quả phải đạt trước hạn tương lai.', 3, 1 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'will have installed', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'had installed', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'installs', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'have installed', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'The office will have _____ the invoices by the end of next week.', 'Sau will have cần V3; V3 của send là sent.', 3, 2 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'send', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'sent', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'sending', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'sends', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, '_____ the engineer have finished the inspection by Monday?', 'Câu hỏi dùng will + chủ ngữ + have + V3.', 3, 3 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'Has', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'Did', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'Will', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'Was', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'We will have archived the records by the time the new system _____.', 'Mệnh đề thời gian dùng hiện tại đơn.', 3, 4 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'will launch', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'launched', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'had launched', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'launches', 1 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'The accountants will have closed the books _____ the end of next week at the latest.', 'By đi với hạn chót; at the latest làm rõ nghĩa này.', 3, 5 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'by', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'since', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'for', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'during', 0 WHERE @new_question IS NOT NULL;

-- Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)
INSERT INTO grammar_lessons(topic_id, title, content_html, level, sort_order, is_published)
SELECT @tense_topic, 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)', '<p data-n11="summary">Nhấn mạnh thời lượng của hoạt động tính đến một mốc tương lai.</p><section data-n11="lecture"><h3>Cách dùng</h3><p>Dùng với hoạt động có thể kéo dài như working, running hoặc waiting. Nếu cần nói số lượng đã hoàn thành, dùng tương lai hoàn thành đơn.</p><h3>Công thức</h3><ul><li>Khẳng định: <strong>S + will have been + V-ing</strong></li><li>Phủ định: <strong>S + will + not + have been V-ing</strong></li><li>Câu hỏi: <strong>Will + S + have + been + V-ing?</strong></li></ul><h3>Nhận biết trong TOEIC</h3><p>By next July, for six months by then, by the time + hiện tại đơn. Câu cần cả mốc tương lai lẫn ý kéo dài.</p><p><em>S: chủ ngữ. V3: quá khứ phân từ.</em></p></section><section data-n11="examples"><article data-example-id="1" data-order="1"><p class="sentence">By October, we will have been operating this branch for a year.</p><p class="translation">Đến tháng Mười, chúng tôi sẽ vận hành chi nhánh này được một năm.</p><p class="note">A year đo thời lượng tính đến tháng Mười.</p></article><article data-example-id="2" data-order="2"><p class="sentence">By 5 p.m., the generator will have been running for 12 hours.</p><p class="translation">Đến 5 giờ chiều, máy phát điện sẽ chạy được 12 giờ.</p><p class="note">Trọng tâm là thời gian vận hành.</p></article><article data-example-id="3" data-order="3"><p class="sentence">How long will you have been working here by December?</p><p class="translation">Đến tháng Mười Hai, bạn sẽ làm ở đây được bao lâu?</p><p class="note">How long hỏi thời lượng đến mốc tương lai.</p></article></section>', 'ADVANCED', 16, 1
WHERE @tense_topic IS NOT NULL AND NOT EXISTS (SELECT 1 FROM grammar_lessons WHERE topic_id = @tense_topic AND title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)');
SET @new_lesson = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'By next June, the team _____ this system for exactly two years.', 'By next June và for exactly two years xác định thời lượng tính đến mốc tương lai.', 3, 1 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'had been using', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'will have been using', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'has been using', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'is using', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'The researchers will have been _____ data for six months by August.', 'Sau will have been trong cấu trúc tiếp diễn dùng V-ing.', 3, 2 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'collect', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'collected', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'collecting', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'collects', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'By next April, she will have been working here _____ five years.', 'Five years là khoảng thời gian, dùng for.', 3, 3 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'since', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'at', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'by', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'for', 1 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'By the time the truck arrives tomorrow, the crew _____ for an hour.', 'Thời lượng chờ tính tới mốc truck arrives tomorrow.', 3, 4 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'will have been waiting', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'have been waiting', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'had been waiting', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'are waiting', 0 WHERE @new_question IS NOT NULL;
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT @new_lesson, 'How long _____ the machine have been running by the next inspection?', 'Đặt will trước chủ ngữ để hỏi thời lượng ở một mốc tương lai.', 3, 5 WHERE @new_lesson IS NOT NULL;
SET @new_question = IF(ROW_COUNT() = 1, LAST_INSERT_ID(), NULL);
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT @new_question, 'A', 'has', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'B', 'will', 1 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'C', 'did', 0 WHERE @new_question IS NOT NULL
UNION ALL SELECT @new_question, 'D', 'was', 0 WHERE @new_question IS NOT NULL;

COMMIT;
