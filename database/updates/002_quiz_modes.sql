-- Bộ câu hỏi Luyện tập và Thi cho 16 bài mẫu.
-- Chạy sau seed.sql hoặc 001_complete_tenses.sql. Chạy lại tuần tự không tạo câu trùng.
-- Tham khảo English Grammar Review (HP Group), tr. 16–24 và các chương về từ loại, điều kiện, bị động, mệnh đề quan hệ.
-- Nội dung, ví dụ và giải thích được biên soạn riêng. Câu hỏi cũ được giữ để xem lại kết quả.

-- Hiện tại đơn (Present Simple)
UPDATE grammar_lessons
SET content_html = CONCAT(REPLACE(content_html, '<section data-n11="lecture">', '<section data-n11="lecture"><h3>Chủ ngữ chính và dấu hiệu tần suất</h3><p>Tìm danh từ trung tâm trước khi chia động từ. Cụm of hoặc cụm giới từ chen giữa không quyết định số của động từ. Sau does, động từ chính trở về nguyên mẫu.</p>'), '<section data-n11="examples"><article data-example-id="21001" data-order="21"><p class="sentence">The list of approved suppliers changes every quarter.</p><p class="translation">Danh sách nhà cung cấp được duyệt thay đổi mỗi quý.</p><p class="note">List là danh từ trung tâm số ít nên dùng changes.</p></article></section>')
WHERE title = 'Hiện tại đơn (Present Simple)' AND content_html LIKE '%<section data-n11="lecture">%' AND content_html NOT LIKE '%data-example-id="21001"%';
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The technician _____ the ventilation system every Monday.', '[PHÂN TÍCH]
[A] «inspects» — Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[B] «has inspecting» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «will inspected» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «inspecting» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.', 1, 101
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=101 AND old.question_text='The technician _____ the ventilation system every Monday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'inspects' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'has inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will inspected' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'inspecting' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=101 AND q.question_text='The technician _____ the ventilation system every Monday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The clerk does not _____ the travel receipts every Monday.', '[PHÂN TÍCH]
[A] «file» — Đúng cấu trúc Present Simple trong câu: chọn file. Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[B] «filing» — Sau does not cần động từ nguyên mẫu file.
[C] «filed» — Sau does not cần động từ nguyên mẫu file.
[D] «files» — Sau does not cần động từ nguyên mẫu file.', 1, 102
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=102 AND old.question_text='The clerk does not _____ the travel receipts every Monday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'file' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'filing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'filed' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'files' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=102 AND q.question_text='The clerk does not _____ the travel receipts every Monday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the analysts review the sales figures every Monday?', '[PHÂN TÍCH]
[A] «Is» — Is không đi trực tiếp với động từ nguyên mẫu để hỏi thói quen; cần do/does.
[B] «Do» — Đúng cấu trúc Present Simple trong câu: chọn Do. Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[C] «Does» — Trợ động từ không hòa hợp với chủ ngữ.
[D] «Have» — Have cần quá khứ phân từ và không tạo hiện tại đơn.', 1, 103
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=103 AND old.question_text='_____ the analysts review the sales figures every Monday?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Do' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Have' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=103 AND q.question_text='_____ the analysts review the sales figures every Monday?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Ms. Chen _____ the project summary every Monday.', '[PHÂN TÍCH]
[A] «writing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «will written» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[C] «has writing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «writes» — Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.', 1, 104
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=104 AND old.question_text='Ms. Chen _____ the project summary every Monday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'writing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will written' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'has writing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'writes' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=104 AND q.question_text='Ms. Chen _____ the project summary every Monday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The contractors _____ the safety equipment every Monday.', '[PHÂN TÍCH]
[A] «testing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «test» — Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[C] «have testing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «will tested» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.', 1, 105
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=105 AND old.question_text='The contractors _____ the safety equipment every Monday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'test' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'have testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'will tested' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=105 AND q.question_text='The contractors _____ the safety equipment every Monday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our staff members do not _____ the returned packages every Monday.', '[PHÂN TÍCH]
[A] «sorting» — Sau do not cần động từ nguyên mẫu sort.
[B] «sorted» — Sau do not cần động từ nguyên mẫu sort.
[C] «sort» — Đúng cấu trúc Present Simple trong câu: chọn sort. Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[D] «to sort» — Sau do not cần động từ nguyên mẫu sort.', 1, 106
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=106 AND old.question_text='Our staff members do not _____ the returned packages every Monday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'sorting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'sorted' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'sort' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to sort' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=106 AND q.question_text='Our staff members do not _____ the returned packages every Monday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the auditors check the payment records every Monday?', '[PHÂN TÍCH]
[A] «Do» — Đúng cấu trúc Present Simple trong câu: chọn Do. Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[B] «Have» — Have cần quá khứ phân từ và không tạo hiện tại đơn.
[C] «Does» — Trợ động từ không hòa hợp với chủ ngữ.
[D] «Is» — Is không đi trực tiếp với động từ nguyên mẫu để hỏi thói quen; cần do/does.', 1, 107
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=107 AND old.question_text='_____ the auditors check the payment records every Monday?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Do' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Have' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=107 AND q.question_text='_____ the auditors check the payment records every Monday?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The designer _____ the product labels every Monday.', '[PHÂN TÍCH]
[A] «has preparing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[B] «prepares» — Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[C] «will prepared» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «preparing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.', 1, 108
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=108 AND old.question_text='The designer _____ the product labels every Monday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'has preparing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'prepares' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will prepared' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'preparing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=108 AND q.question_text='The designer _____ the product labels every Monday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The editor _____ the instruction manual every Monday.', '[PHÂN TÍCH]
[A] «has reading» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[B] «reading» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «reads» — Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[D] «will reads» — Sau will cần động từ nguyên mẫu read, không dùng reads.', 1, 109
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=109 AND old.question_text='The editor _____ the instruction manual every Monday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'has reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'reads' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'will reads' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=109 AND q.question_text='The editor _____ the instruction manual every Monday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The interns do not _____ the application forms every Monday.', '[PHÂN TÍCH]
[A] «scanned» — Sau do not cần động từ nguyên mẫu scan.
[B] «scan» — Đúng cấu trúc Present Simple trong câu: chọn scan. Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[C] «scanning» — Sau do not cần động từ nguyên mẫu scan.
[D] «to scan» — Sau do not cần động từ nguyên mẫu scan.', 1, 110
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=110 AND old.question_text='The interns do not _____ the application forms every Monday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'scanned' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'scan' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'scanning' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to scan' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=110 AND q.question_text='The interns do not _____ the application forms every Monday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the supervisor monitor the production line every Monday?', '[PHÂN TÍCH]
[A] «Does» — Đúng cấu trúc Present Simple trong câu: chọn Does. Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[B] «Do» — Trợ động từ không hòa hợp với chủ ngữ.
[C] «Have» — Have cần quá khứ phân từ và không tạo hiện tại đơn.
[D] «Is» — Is không đi trực tiếp với động từ nguyên mẫu để hỏi thói quen; cần do/does.', 1, 111
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=111 AND old.question_text='_____ the supervisor monitor the production line every Monday?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Does' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Do' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Have' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=111 AND q.question_text='_____ the supervisor monitor the production line every Monday?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The recruiters _____ the candidates every Monday.', '[PHÂN TÍCH]
[A] «interview» — Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[B] «interviewing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «will interviewed» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «have interviewing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 1, 112
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=112 AND old.question_text='The recruiters _____ the candidates every Monday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'interview' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'interviewing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will interviewed' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'have interviewing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=112 AND q.question_text='The recruiters _____ the candidates every Monday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The accountant _____ the shipping costs every Monday.', '[PHÂN TÍCH]
[A] «has calculating» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[B] «calculating» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «will calculated» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «calculates» — Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.', 1, 113
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=113 AND old.question_text='The accountant _____ the shipping costs every Monday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'has calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will calculated' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'calculates' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=113 AND q.question_text='The accountant _____ the shipping costs every Monday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our engineers do not _____ the demonstration unit every Monday.', '[PHÂN TÍCH]
[A] «to build» — Sau do not cần động từ nguyên mẫu build.
[B] «build» — Đúng cấu trúc Present Simple trong câu: chọn build. Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[C] «building» — Sau do not cần động từ nguyên mẫu build.
[D] «built» — Sau do not cần động từ nguyên mẫu build.', 1, 114
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=114 AND old.question_text='Our engineers do not _____ the demonstration unit every Monday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'build' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'building' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'built' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=114 AND q.question_text='Our engineers do not _____ the demonstration unit every Monday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the manager update the delivery schedule every Monday?', '[PHÂN TÍCH]
[A] «Is» — Is không đi trực tiếp với động từ nguyên mẫu để hỏi thói quen; cần do/does.
[B] «Have» — Have cần quá khứ phân từ và không tạo hiện tại đơn.
[C] «Does» — Đúng cấu trúc Present Simple trong câu: chọn Does. Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[D] «Do» — Trợ động từ không hòa hợp với chủ ngữ.', 1, 115
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=115 AND old.question_text='_____ the manager update the delivery schedule every Monday?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Have' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Does' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Do' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=115 AND q.question_text='_____ the manager update the delivery schedule every Monday?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The operators _____ the water temperature every Monday.', '[PHÂN TÍCH]
[A] «measuring» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «have measuring» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «measure» — Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[D] «will measured» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.', 1, 116
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=116 AND old.question_text='The operators _____ the water temperature every Monday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'measuring' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'have measuring' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'measure' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'will measured' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=116 AND q.question_text='The operators _____ the water temperature every Monday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The assistant _____ the training materials every Monday.', '[PHÂN TÍCH]
[A] «has organizing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[B] «will organized» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[C] «organizes» — Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[D] «organizing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.', 1, 117
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=117 AND old.question_text='The assistant _____ the training materials every Monday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'has organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will organized' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'organizes' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'organizing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=117 AND q.question_text='The assistant _____ the training materials every Monday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The consultants do not _____ the suppliers every Monday.', '[PHÂN TÍCH]
[A] «comparing» — Sau do not cần động từ nguyên mẫu compare.
[B] «compare» — Đúng cấu trúc Present Simple trong câu: chọn compare. Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[C] «to compare» — Sau do not cần động từ nguyên mẫu compare.
[D] «compared» — Sau do not cần động từ nguyên mẫu compare.', 1, 118
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=118 AND old.question_text='The consultants do not _____ the suppliers every Monday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'comparing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'compare' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to compare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'compared' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=118 AND q.question_text='The consultants do not _____ the suppliers every Monday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the researcher collect the survey responses every Monday?', '[PHÂN TÍCH]
[A] «Have» — Have cần quá khứ phân từ và không tạo hiện tại đơn.
[B] «Is» — Is không đi trực tiếp với động từ nguyên mẫu để hỏi thói quen; cần do/does.
[C] «Does» — Đúng cấu trúc Present Simple trong câu: chọn Does. Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[D] «Do» — Trợ động từ không hòa hợp với chủ ngữ.', 1, 119
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=119 AND old.question_text='_____ the researcher collect the survey responses every Monday?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Have' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Does' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Do' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=119 AND q.question_text='_____ the researcher collect the survey responses every Monday?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The developers _____ the changes every Monday.', '[PHÂN TÍCH]
[A] «will documented» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «have documenting» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «document» — Lịch lặp lại đều đặn cần hiện tại đơn; đối chiếu số của chủ ngữ.
[D] «documenting» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.', 1, 120
FROM grammar_lessons l WHERE l.title = 'Hiện tại đơn (Present Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=120 AND old.question_text='The developers _____ the changes every Monday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will documented' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'have documenting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'document' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'documenting' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại đơn (Present Simple)' AND q.sort_order=120 AND q.question_text='The developers _____ the changes every Monday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);

-- Hiện tại tiếp diễn (Present Continuous)
UPDATE grammar_lessons
SET content_html = CONCAT(REPLACE(content_html, '<section data-n11="lecture">', '<section data-n11="lecture"><h3>Động từ trạng thái và lịch đã sắp xếp</h3><p>Các động từ know, own hoặc need thường ở dạng đơn khi diễn tả trạng thái. Dạng tiếp diễn cũng có thể nói về cuộc hẹn đã thu xếp.</p>'), '<section data-n11="examples"><article data-example-id="21001" data-order="21"><p class="sentence">We are meeting the distributor at nine tomorrow.</p><p class="translation">Chúng tôi sẽ gặp nhà phân phối lúc chín giờ ngày mai.</p><p class="note">Giờ hẹn cụ thể cho thấy đây là lịch đã thu xếp.</p></article></section>')
WHERE title = 'Hiện tại tiếp diễn (Present Continuous)' AND content_html LIKE '%<section data-n11="lecture">%' AND content_html NOT LIKE '%data-example-id="21001"%';
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The technician _____ the ventilation system right now, so please do not interrupt.', '[PHÂN TÍCH]
[A] «has inspecting» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[B] «inspecting» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «will inspected» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «is inspecting» — Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.', 1, 101
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=101 AND old.question_text='The technician _____ the ventilation system right now, so please do not interrupt.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'has inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will inspected' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'is inspecting' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=101 AND q.question_text='The technician _____ the ventilation system right now, so please do not interrupt.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The clerk is _____ the travel receipts right now, so please do not interrupt.', '[PHÂN TÍCH]
[A] «filing» — Đúng cấu trúc Present Continuous trong câu: chọn filing. Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.
[B] «file» — Dạng file không khớp với trợ động từ is; ở đây cần filing.
[C] «files» — Dạng files không khớp với trợ động từ is; ở đây cần filing.
[D] «filed» — Dạng filed không khớp với trợ động từ is; ở đây cần filing.', 1, 102
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=102 AND old.question_text='The clerk is _____ the travel receipts right now, so please do not interrupt.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'filing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'file' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'files' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'filed' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=102 AND q.question_text='The clerk is _____ the travel receipts right now, so please do not interrupt.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the analysts reviewing the sales figures right now?', '[PHÂN TÍCH]
[A] «Does» — Does phải đi với nguyên mẫu chứ không phải V-ing.
[B] «Is» — Trợ động từ be không hòa hợp số với chủ ngữ.
[C] «Has» — Has không đi trực tiếp với V-ing.
[D] «Are» — Đúng cấu trúc Present Continuous trong câu: chọn Are. Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.', 1, 103
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=103 AND old.question_text='_____ the analysts reviewing the sales figures right now?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Are' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=103 AND q.question_text='_____ the analysts reviewing the sales figures right now?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Ms. Chen is not _____ the project summary right now.', '[PHÂN TÍCH]
[A] «write» — Sau is not ở mẫu Present Continuous, phần còn lại phải là writing.
[B] «wrote» — Sau is not ở mẫu Present Continuous, phần còn lại phải là writing.
[C] «writing» — Đúng cấu trúc Present Continuous trong câu: chọn writing. Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.
[D] «to write» — Sau is not ở mẫu Present Continuous, phần còn lại phải là writing.', 1, 104
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=104 AND old.question_text='Ms. Chen is not _____ the project summary right now.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'write' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'wrote' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'writing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to write' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=104 AND q.question_text='Ms. Chen is not _____ the project summary right now.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The contractors _____ the safety equipment right now, so please do not interrupt.', '[PHÂN TÍCH]
[A] «will tested» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «are testing» — Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.
[C] «testing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[D] «have testing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 1, 105
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=105 AND old.question_text='The contractors _____ the safety equipment right now, so please do not interrupt.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will tested' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'are testing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'have testing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=105 AND q.question_text='The contractors _____ the safety equipment right now, so please do not interrupt.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our staff members are _____ the returned packages right now, so please do not interrupt.', '[PHÂN TÍCH]
[A] «sorted» — Dạng sorted không khớp với trợ động từ are; ở đây cần sorting.
[B] «sort» — Dạng sort không khớp với trợ động từ are; ở đây cần sorting.
[C] «to sort» — Dạng to sort không khớp với trợ động từ are; ở đây cần sorting.
[D] «sorting» — Đúng cấu trúc Present Continuous trong câu: chọn sorting. Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.', 1, 106
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=106 AND old.question_text='Our staff members are _____ the returned packages right now, so please do not interrupt.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'sorted' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'sort' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to sort' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'sorting' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=106 AND q.question_text='Our staff members are _____ the returned packages right now, so please do not interrupt.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the auditors checking the payment records right now?', '[PHÂN TÍCH]
[A] «Has» — Has không đi trực tiếp với V-ing.
[B] «Are» — Đúng cấu trúc Present Continuous trong câu: chọn Are. Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.
[C] «Does» — Does phải đi với nguyên mẫu chứ không phải V-ing.
[D] «Is» — Trợ động từ be không hòa hợp số với chủ ngữ.', 1, 107
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=107 AND old.question_text='_____ the auditors checking the payment records right now?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Are' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=107 AND q.question_text='_____ the auditors checking the payment records right now?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The designer is not _____ the product labels right now.', '[PHÂN TÍCH]
[A] «prepare» — Sau is not ở mẫu Present Continuous, phần còn lại phải là preparing.
[B] «preparing» — Đúng cấu trúc Present Continuous trong câu: chọn preparing. Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.
[C] «to prepare» — Sau is not ở mẫu Present Continuous, phần còn lại phải là preparing.
[D] «prepared» — Sau is not ở mẫu Present Continuous, phần còn lại phải là preparing.', 1, 108
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=108 AND old.question_text='The designer is not _____ the product labels right now.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'prepare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'preparing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to prepare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'prepared' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=108 AND q.question_text='The designer is not _____ the product labels right now.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The editor _____ the instruction manual right now, so please do not interrupt.', '[PHÂN TÍCH]
[A] «will reads» — Sau will cần động từ nguyên mẫu read, không dùng reads.
[B] «reading» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «has reading» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «is reading» — Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.', 1, 109
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=109 AND old.question_text='The editor _____ the instruction manual right now, so please do not interrupt.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will reads' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'has reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'is reading' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=109 AND q.question_text='The editor _____ the instruction manual right now, so please do not interrupt.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The interns are _____ the application forms right now, so please do not interrupt.', '[PHÂN TÍCH]
[A] «scanned» — Dạng scanned không khớp với trợ động từ are; ở đây cần scanning.
[B] «scan» — Dạng scan không khớp với trợ động từ are; ở đây cần scanning.
[C] «scanning» — Đúng cấu trúc Present Continuous trong câu: chọn scanning. Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.
[D] «to scan» — Dạng to scan không khớp với trợ động từ are; ở đây cần scanning.', 1, 110
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=110 AND old.question_text='The interns are _____ the application forms right now, so please do not interrupt.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'scanned' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'scan' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'scanning' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to scan' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=110 AND q.question_text='The interns are _____ the application forms right now, so please do not interrupt.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the supervisor monitoring the production line right now?', '[PHÂN TÍCH]
[A] «Are» — Trợ động từ be không hòa hợp số với chủ ngữ.
[B] «Is» — Đúng cấu trúc Present Continuous trong câu: chọn Is. Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.
[C] «Has» — Has không đi trực tiếp với V-ing.
[D] «Does» — Does phải đi với nguyên mẫu chứ không phải V-ing.', 1, 111
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=111 AND old.question_text='_____ the supervisor monitoring the production line right now?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Are' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Is' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=111 AND q.question_text='_____ the supervisor monitoring the production line right now?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The recruiters are not _____ the candidates right now.', '[PHÂN TÍCH]
[A] «interview» — Sau are not ở mẫu Present Continuous, phần còn lại phải là interviewing.
[B] «interviewing» — Đúng cấu trúc Present Continuous trong câu: chọn interviewing. Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.
[C] «interviewed» — Sau are not ở mẫu Present Continuous, phần còn lại phải là interviewing.
[D] «to interview» — Sau are not ở mẫu Present Continuous, phần còn lại phải là interviewing.', 1, 112
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=112 AND old.question_text='The recruiters are not _____ the candidates right now.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'interview' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'interviewing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'interviewed' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to interview' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=112 AND q.question_text='The recruiters are not _____ the candidates right now.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The accountant _____ the shipping costs right now, so please do not interrupt.', '[PHÂN TÍCH]
[A] «will calculated» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «is calculating» — Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.
[C] «has calculating» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «calculating» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.', 1, 113
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=113 AND old.question_text='The accountant _____ the shipping costs right now, so please do not interrupt.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will calculated' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'is calculating' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'has calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'calculating' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=113 AND q.question_text='The accountant _____ the shipping costs right now, so please do not interrupt.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our engineers are _____ the demonstration unit right now, so please do not interrupt.', '[PHÂN TÍCH]
[A] «building» — Đúng cấu trúc Present Continuous trong câu: chọn building. Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.
[B] «to build» — Dạng to build không khớp với trợ động từ are; ở đây cần building.
[C] «build» — Dạng build không khớp với trợ động từ are; ở đây cần building.
[D] «built» — Dạng built không khớp với trợ động từ are; ở đây cần building.', 1, 114
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=114 AND old.question_text='Our engineers are _____ the demonstration unit right now, so please do not interrupt.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'building' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'built' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=114 AND q.question_text='Our engineers are _____ the demonstration unit right now, so please do not interrupt.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the manager updating the delivery schedule right now?', '[PHÂN TÍCH]
[A] «Has» — Has không đi trực tiếp với V-ing.
[B] «Are» — Trợ động từ be không hòa hợp số với chủ ngữ.
[C] «Does» — Does phải đi với nguyên mẫu chứ không phải V-ing.
[D] «Is» — Đúng cấu trúc Present Continuous trong câu: chọn Is. Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.', 1, 115
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=115 AND old.question_text='_____ the manager updating the delivery schedule right now?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Are' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Is' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=115 AND q.question_text='_____ the manager updating the delivery schedule right now?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The operators are not _____ the water temperature right now.', '[PHÂN TÍCH]
[A] «to measure» — Sau are not ở mẫu Present Continuous, phần còn lại phải là measuring.
[B] «measuring» — Đúng cấu trúc Present Continuous trong câu: chọn measuring. Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.
[C] «measured» — Sau are not ở mẫu Present Continuous, phần còn lại phải là measuring.
[D] «measure» — Sau are not ở mẫu Present Continuous, phần còn lại phải là measuring.', 1, 116
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=116 AND old.question_text='The operators are not _____ the water temperature right now.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to measure' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'measuring' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'measured' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'measure' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=116 AND q.question_text='The operators are not _____ the water temperature right now.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The assistant _____ the training materials right now, so please do not interrupt.', '[PHÂN TÍCH]
[A] «organizing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «has organizing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «is organizing» — Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.
[D] «will organized» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.', 1, 117
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=117 AND old.question_text='The assistant _____ the training materials right now, so please do not interrupt.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'has organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'is organizing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'will organized' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=117 AND q.question_text='The assistant _____ the training materials right now, so please do not interrupt.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The consultants are _____ the suppliers right now, so please do not interrupt.', '[PHÂN TÍCH]
[A] «compare» — Dạng compare không khớp với trợ động từ are; ở đây cần comparing.
[B] «to compare» — Dạng to compare không khớp với trợ động từ are; ở đây cần comparing.
[C] «comparing» — Đúng cấu trúc Present Continuous trong câu: chọn comparing. Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.
[D] «compared» — Dạng compared không khớp với trợ động từ are; ở đây cần comparing.', 1, 118
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=118 AND old.question_text='The consultants are _____ the suppliers right now, so please do not interrupt.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'compare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to compare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'comparing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'compared' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=118 AND q.question_text='The consultants are _____ the suppliers right now, so please do not interrupt.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the researcher collecting the survey responses right now?', '[PHÂN TÍCH]
[A] «Are» — Trợ động từ be không hòa hợp số với chủ ngữ.
[B] «Is» — Đúng cấu trúc Present Continuous trong câu: chọn Is. Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.
[C] «Has» — Has không đi trực tiếp với V-ing.
[D] «Does» — Does phải đi với nguyên mẫu chứ không phải V-ing.', 1, 119
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=119 AND old.question_text='_____ the researcher collecting the survey responses right now?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Are' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Is' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=119 AND q.question_text='_____ the researcher collecting the survey responses right now?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The developers are not _____ the changes right now.', '[PHÂN TÍCH]
[A] «to document» — Sau are not ở mẫu Present Continuous, phần còn lại phải là documenting.
[B] «documenting» — Đúng cấu trúc Present Continuous trong câu: chọn documenting. Right now cho thấy công việc đang diễn ra; dùng am/is/are + V-ing.
[C] «documented» — Sau are not ở mẫu Present Continuous, phần còn lại phải là documenting.
[D] «document» — Sau are not ở mẫu Present Continuous, phần còn lại phải là documenting.', 1, 120
FROM grammar_lessons l WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=120 AND old.question_text='The developers are not _____ the changes right now.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to document' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'documenting' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'documented' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'document' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại tiếp diễn (Present Continuous)' AND q.sort_order=120 AND q.question_text='The developers are not _____ the changes right now.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);

-- Quá khứ đơn (Past Simple)
UPDATE grammar_lessons
SET content_html = CONCAT(REPLACE(content_html, '<section data-n11="lecture">', '<section data-n11="lecture"><h3>Mốc thời gian đã kết thúc</h3><p>Dùng quá khứ đơn với yesterday, last week hoặc in 2024 khi việc đã kết thúc. Trong câu hỏi, did mang dấu hiệu quá khứ nên động từ chính là nguyên mẫu.</p>'), '<section data-n11="examples"><article data-example-id="21001" data-order="21"><p class="sentence">Did the shipment arrive last Friday?</p><p class="translation">Lô hàng có đến thứ Sáu tuần trước không?</p><p class="note">Did + arrive, không dùng arrived sau did.</p></article></section>')
WHERE title = 'Quá khứ đơn (Past Simple)' AND content_html LIKE '%<section data-n11="lecture">%' AND content_html NOT LIKE '%data-example-id="21001"%';
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The technician _____ the ventilation system yesterday morning.', '[PHÂN TÍCH]
[A] «inspected» — Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.
[B] «inspecting» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «will inspected» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «has inspecting» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 1, 101
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=101 AND old.question_text='The technician _____ the ventilation system yesterday morning.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'inspected' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will inspected' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has inspecting' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=101 AND q.question_text='The technician _____ the ventilation system yesterday morning.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The clerk did not _____ the travel receipts yesterday morning.', '[PHÂN TÍCH]
[A] «filed» — Did đã mang dấu hiệu quá khứ, nên động từ chính phải là file.
[B] «file» — Đúng cấu trúc Past Simple trong câu: chọn file. Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.
[C] «files» — Did đã mang dấu hiệu quá khứ, nên động từ chính phải là file.
[D] «filing» — Did đã mang dấu hiệu quá khứ, nên động từ chính phải là file.', 1, 102
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=102 AND old.question_text='The clerk did not _____ the travel receipts yesterday morning.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'filed' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'file' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'files' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'filing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=102 AND q.question_text='The clerk did not _____ the travel receipts yesterday morning.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the analysts review the sales figures yesterday morning?', '[PHÂN TÍCH]
[A] «Will» — Will hướng về tương lai, trái với yesterday.
[B] «Does» — Does tạo hiện tại đơn và không khớp mốc yesterday.
[C] «Was» — Was không đứng trước động từ nguyên mẫu trong mẫu này.
[D] «Did» — Đúng cấu trúc Past Simple trong câu: chọn Did. Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.', 1, 103
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=103 AND old.question_text='_____ the analysts review the sales figures yesterday morning?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Did' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=103 AND q.question_text='_____ the analysts review the sales figures yesterday morning?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Ms. Chen _____ the project summary yesterday morning.', '[PHÂN TÍCH]
[A] «will written» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «has writing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «wrote» — Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.
[D] «writing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.', 1, 104
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=104 AND old.question_text='Ms. Chen _____ the project summary yesterday morning.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will written' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'has writing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'wrote' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'writing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=104 AND q.question_text='Ms. Chen _____ the project summary yesterday morning.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The contractors _____ the safety equipment yesterday morning.', '[PHÂN TÍCH]
[A] «tested» — Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.
[B] «have testing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «will tested» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «testing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.', 1, 105
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=105 AND old.question_text='The contractors _____ the safety equipment yesterday morning.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'tested' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'have testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will tested' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'testing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=105 AND q.question_text='The contractors _____ the safety equipment yesterday morning.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our staff members did not _____ the returned packages yesterday morning.', '[PHÂN TÍCH]
[A] «sorted» — Did đã mang dấu hiệu quá khứ, nên động từ chính phải là sort.
[B] «sort» — Đúng cấu trúc Past Simple trong câu: chọn sort. Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.
[C] «sorting» — Did đã mang dấu hiệu quá khứ, nên động từ chính phải là sort.
[D] «to sort» — Did đã mang dấu hiệu quá khứ, nên động từ chính phải là sort.', 1, 106
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=106 AND old.question_text='Our staff members did not _____ the returned packages yesterday morning.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'sorted' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'sort' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'sorting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to sort' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=106 AND q.question_text='Our staff members did not _____ the returned packages yesterday morning.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the auditors check the payment records yesterday morning?', '[PHÂN TÍCH]
[A] «Did» — Đúng cấu trúc Past Simple trong câu: chọn Did. Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.
[B] «Will» — Will hướng về tương lai, trái với yesterday.
[C] «Was» — Was không đứng trước động từ nguyên mẫu trong mẫu này.
[D] «Does» — Does tạo hiện tại đơn và không khớp mốc yesterday.', 1, 107
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=107 AND old.question_text='_____ the auditors check the payment records yesterday morning?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Did' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=107 AND q.question_text='_____ the auditors check the payment records yesterday morning?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The designer _____ the product labels yesterday morning.', '[PHÂN TÍCH]
[A] «will prepared» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «has preparing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «prepared» — Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.
[D] «preparing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.', 1, 108
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=108 AND old.question_text='The designer _____ the product labels yesterday morning.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will prepared' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'has preparing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'prepared' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'preparing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=108 AND q.question_text='The designer _____ the product labels yesterday morning.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The editor _____ the instruction manual yesterday morning.', '[PHÂN TÍCH]
[A] «will reads» — Sau will cần động từ nguyên mẫu read, không dùng reads.
[B] «has reading» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «reading» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[D] «read» — Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.', 1, 109
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=109 AND old.question_text='The editor _____ the instruction manual yesterday morning.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will reads' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'has reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'read' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=109 AND q.question_text='The editor _____ the instruction manual yesterday morning.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The interns did not _____ the application forms yesterday morning.', '[PHÂN TÍCH]
[A] «scanning» — Did đã mang dấu hiệu quá khứ, nên động từ chính phải là scan.
[B] «scanned» — Did đã mang dấu hiệu quá khứ, nên động từ chính phải là scan.
[C] «to scan» — Did đã mang dấu hiệu quá khứ, nên động từ chính phải là scan.
[D] «scan» — Đúng cấu trúc Past Simple trong câu: chọn scan. Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.', 1, 110
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=110 AND old.question_text='The interns did not _____ the application forms yesterday morning.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'scanning' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'scanned' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to scan' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'scan' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=110 AND q.question_text='The interns did not _____ the application forms yesterday morning.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the supervisor monitor the production line yesterday morning?', '[PHÂN TÍCH]
[A] «Was» — Was không đứng trước động từ nguyên mẫu trong mẫu này.
[B] «Did» — Đúng cấu trúc Past Simple trong câu: chọn Did. Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.
[C] «Will» — Will hướng về tương lai, trái với yesterday.
[D] «Does» — Does tạo hiện tại đơn và không khớp mốc yesterday.', 1, 111
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=111 AND old.question_text='_____ the supervisor monitor the production line yesterday morning?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Did' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=111 AND q.question_text='_____ the supervisor monitor the production line yesterday morning?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The recruiters _____ the candidates yesterday morning.', '[PHÂN TÍCH]
[A] «interviewed» — Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.
[B] «have interviewing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «will interviewed» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «interviewing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.', 1, 112
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=112 AND old.question_text='The recruiters _____ the candidates yesterday morning.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'interviewed' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'have interviewing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will interviewed' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'interviewing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=112 AND q.question_text='The recruiters _____ the candidates yesterday morning.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The accountant _____ the shipping costs yesterday morning.', '[PHÂN TÍCH]
[A] «calculated» — Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.
[B] «has calculating» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «will calculated» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «calculating» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.', 1, 113
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=113 AND old.question_text='The accountant _____ the shipping costs yesterday morning.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'calculated' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'has calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will calculated' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'calculating' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=113 AND q.question_text='The accountant _____ the shipping costs yesterday morning.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our engineers did not _____ the demonstration unit yesterday morning.', '[PHÂN TÍCH]
[A] «building» — Did đã mang dấu hiệu quá khứ, nên động từ chính phải là build.
[B] «build» — Đúng cấu trúc Past Simple trong câu: chọn build. Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.
[C] «to build» — Did đã mang dấu hiệu quá khứ, nên động từ chính phải là build.
[D] «built» — Did đã mang dấu hiệu quá khứ, nên động từ chính phải là build.', 1, 114
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=114 AND old.question_text='Our engineers did not _____ the demonstration unit yesterday morning.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'building' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'build' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'built' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=114 AND q.question_text='Our engineers did not _____ the demonstration unit yesterday morning.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the manager update the delivery schedule yesterday morning?', '[PHÂN TÍCH]
[A] «Did» — Đúng cấu trúc Past Simple trong câu: chọn Did. Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.
[B] «Will» — Will hướng về tương lai, trái với yesterday.
[C] «Does» — Does tạo hiện tại đơn và không khớp mốc yesterday.
[D] «Was» — Was không đứng trước động từ nguyên mẫu trong mẫu này.', 1, 115
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=115 AND old.question_text='_____ the manager update the delivery schedule yesterday morning?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Did' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=115 AND q.question_text='_____ the manager update the delivery schedule yesterday morning?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The operators _____ the water temperature yesterday morning.', '[PHÂN TÍCH]
[A] «will measured» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «measuring» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «have measuring» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «measured» — Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.', 1, 116
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=116 AND old.question_text='The operators _____ the water temperature yesterday morning.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will measured' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'measuring' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'have measuring' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'measured' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=116 AND q.question_text='The operators _____ the water temperature yesterday morning.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The assistant _____ the training materials yesterday morning.', '[PHÂN TÍCH]
[A] «will organized» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «organizing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «organized» — Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.
[D] «has organizing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 1, 117
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=117 AND old.question_text='The assistant _____ the training materials yesterday morning.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will organized' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'organized' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has organizing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=117 AND q.question_text='The assistant _____ the training materials yesterday morning.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The consultants did not _____ the suppliers yesterday morning.', '[PHÂN TÍCH]
[A] «to compare» — Did đã mang dấu hiệu quá khứ, nên động từ chính phải là compare.
[B] «comparing» — Did đã mang dấu hiệu quá khứ, nên động từ chính phải là compare.
[C] «compared» — Did đã mang dấu hiệu quá khứ, nên động từ chính phải là compare.
[D] «compare» — Đúng cấu trúc Past Simple trong câu: chọn compare. Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.', 1, 118
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=118 AND old.question_text='The consultants did not _____ the suppliers yesterday morning.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to compare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'comparing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'compared' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'compare' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=118 AND q.question_text='The consultants did not _____ the suppliers yesterday morning.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the researcher collect the survey responses yesterday morning?', '[PHÂN TÍCH]
[A] «Does» — Does tạo hiện tại đơn và không khớp mốc yesterday.
[B] «Was» — Was không đứng trước động từ nguyên mẫu trong mẫu này.
[C] «Did» — Đúng cấu trúc Past Simple trong câu: chọn Did. Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.
[D] «Will» — Will hướng về tương lai, trái với yesterday.', 1, 119
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=119 AND old.question_text='_____ the researcher collect the survey responses yesterday morning?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Did' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=119 AND q.question_text='_____ the researcher collect the survey responses yesterday morning?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The developers _____ the changes yesterday morning.', '[PHÂN TÍCH]
[A] «documenting» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «documented» — Yesterday morning là mốc quá khứ đã kết thúc; dùng quá khứ đơn.
[C] «will documented» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «have documenting» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 1, 120
FROM grammar_lessons l WHERE l.title = 'Quá khứ đơn (Past Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=120 AND old.question_text='The developers _____ the changes yesterday morning.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'documenting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'documented' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will documented' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'have documenting' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ đơn (Past Simple)' AND q.sort_order=120 AND q.question_text='The developers _____ the changes yesterday morning.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);

-- Hiện tại hoàn thành (Present Perfect)
UPDATE grammar_lessons
SET content_html = CONCAT(REPLACE(content_html, '<section data-n11="lecture">', '<section data-n11="lecture"><h3>Mốc bắt đầu và khoảng thời gian</h3><p>Since đi với mốc bắt đầu, còn for đi với khoảng thời gian. So far hướng sự chú ý đến kết quả tính tới hiện tại.</p>'), '<section data-n11="examples"><article data-example-id="21001" data-order="21"><p class="sentence">We have approved six requests so far this week.</p><p class="translation">Tính đến lúc này trong tuần, chúng tôi đã duyệt sáu yêu cầu.</p><p class="note">Six requests là số kết quả đã đạt, phù hợp với dạng hoàn thành đơn.</p></article></section>')
WHERE title = 'Hiện tại hoàn thành (Present Perfect)' AND content_html LIKE '%<section data-n11="lecture">%' AND content_html NOT LIKE '%data-example-id="21001"%';
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The technician _____ the ventilation system twice so far this month.', '[PHÂN TÍCH]
[A] «will inspected» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «inspecting» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «has inspected» — So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.
[D] «has inspecting» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 2, 101
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=101 AND old.question_text='The technician _____ the ventilation system twice so far this month.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will inspected' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'has inspected' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has inspecting' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=101 AND q.question_text='The technician _____ the ventilation system twice so far this month.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The clerk has _____ the travel receipts twice so far this month.', '[PHÂN TÍCH]
[A] «files» — Dạng files không khớp với trợ động từ has; ở đây cần filed.
[B] «file» — Dạng file không khớp với trợ động từ has; ở đây cần filed.
[C] «filed» — Đúng cấu trúc Present Perfect trong câu: chọn filed. So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.
[D] «filing» — Dạng filing không khớp với trợ động từ has; ở đây cần filed.', 2, 102
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=102 AND old.question_text='The clerk has _____ the travel receipts twice so far this month.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'files' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'file' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'filed' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'filing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=102 AND q.question_text='The clerk has _____ the travel receipts twice so far this month.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the analysts reviewed the sales figures twice so far this month?', '[PHÂN TÍCH]
[A] «Have» — Đúng cấu trúc Present Perfect trong câu: chọn Have. So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.
[B] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.
[C] «Will» — Sau will cần have trước cấu trúc hoàn thành.
[D] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.', 2, 103
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=103 AND old.question_text='_____ the analysts reviewed the sales figures twice so far this month?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Have' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=103 AND q.question_text='_____ the analysts reviewed the sales figures twice so far this month?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Ms. Chen has not _____ the project summary twice so far this month.', '[PHÂN TÍCH]
[A] «wrote» — Sau has not ở mẫu Present Perfect, phần còn lại phải là written.
[B] «writing» — Sau has not ở mẫu Present Perfect, phần còn lại phải là written.
[C] «write» — Sau has not ở mẫu Present Perfect, phần còn lại phải là written.
[D] «written» — Đúng cấu trúc Present Perfect trong câu: chọn written. So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.', 2, 104
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=104 AND old.question_text='Ms. Chen has not _____ the project summary twice so far this month.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'wrote' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'writing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'write' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'written' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=104 AND q.question_text='Ms. Chen has not _____ the project summary twice so far this month.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The contractors _____ the safety equipment twice so far this month.', '[PHÂN TÍCH]
[A] «will tested» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «testing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «have testing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «have tested» — So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.', 2, 105
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=105 AND old.question_text='The contractors _____ the safety equipment twice so far this month.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will tested' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'have testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'have tested' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=105 AND q.question_text='The contractors _____ the safety equipment twice so far this month.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our staff members have _____ the returned packages twice so far this month.', '[PHÂN TÍCH]
[A] «sorted» — Đúng cấu trúc Present Perfect trong câu: chọn sorted. So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.
[B] «sorting» — Dạng sorting không khớp với trợ động từ have; ở đây cần sorted.
[C] «sort» — Dạng sort không khớp với trợ động từ have; ở đây cần sorted.
[D] «to sort» — Dạng to sort không khớp với trợ động từ have; ở đây cần sorted.', 2, 106
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=106 AND old.question_text='Our staff members have _____ the returned packages twice so far this month.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'sorted' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'sorting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'sort' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to sort' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=106 AND q.question_text='Our staff members have _____ the returned packages twice so far this month.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the auditors checked the payment records twice so far this month?', '[PHÂN TÍCH]
[A] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.
[B] «Will» — Sau will cần have trước cấu trúc hoàn thành.
[C] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.
[D] «Have» — Đúng cấu trúc Present Perfect trong câu: chọn Have. So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.', 2, 107
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=107 AND old.question_text='_____ the auditors checked the payment records twice so far this month?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Have' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=107 AND q.question_text='_____ the auditors checked the payment records twice so far this month?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The designer has not _____ the product labels twice so far this month.', '[PHÂN TÍCH]
[A] «preparing» — Sau has not ở mẫu Present Perfect, phần còn lại phải là prepared.
[B] «prepared» — Đúng cấu trúc Present Perfect trong câu: chọn prepared. So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.
[C] «prepare» — Sau has not ở mẫu Present Perfect, phần còn lại phải là prepared.
[D] «to prepare» — Sau has not ở mẫu Present Perfect, phần còn lại phải là prepared.', 2, 108
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=108 AND old.question_text='The designer has not _____ the product labels twice so far this month.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'preparing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'prepared' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'prepare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to prepare' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=108 AND q.question_text='The designer has not _____ the product labels twice so far this month.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The editor _____ the instruction manual twice so far this month.', '[PHÂN TÍCH]
[A] «will reads» — Sau will cần động từ nguyên mẫu read, không dùng reads.
[B] «reading» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «has read» — So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.
[D] «has reading» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 2, 109
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=109 AND old.question_text='The editor _____ the instruction manual twice so far this month.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will reads' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'has read' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has reading' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=109 AND q.question_text='The editor _____ the instruction manual twice so far this month.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The interns have _____ the application forms twice so far this month.', '[PHÂN TÍCH]
[A] «scanned» — Đúng cấu trúc Present Perfect trong câu: chọn scanned. So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.
[B] «to scan» — Dạng to scan không khớp với trợ động từ have; ở đây cần scanned.
[C] «scanning» — Dạng scanning không khớp với trợ động từ have; ở đây cần scanned.
[D] «scan» — Dạng scan không khớp với trợ động từ have; ở đây cần scanned.', 2, 110
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=110 AND old.question_text='The interns have _____ the application forms twice so far this month.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'scanned' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to scan' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'scanning' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'scan' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=110 AND q.question_text='The interns have _____ the application forms twice so far this month.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the supervisor monitored the production line twice so far this month?', '[PHÂN TÍCH]
[A] «Will» — Sau will cần have trước cấu trúc hoàn thành.
[B] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.
[C] «Has» — Đúng cấu trúc Present Perfect trong câu: chọn Has. So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.
[D] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.', 2, 111
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=111 AND old.question_text='_____ the supervisor monitored the production line twice so far this month?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Has' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=111 AND q.question_text='_____ the supervisor monitored the production line twice so far this month?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The recruiters have not _____ the candidates twice so far this month.', '[PHÂN TÍCH]
[A] «interview» — Sau have not ở mẫu Present Perfect, phần còn lại phải là interviewed.
[B] «interviewed» — Đúng cấu trúc Present Perfect trong câu: chọn interviewed. So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.
[C] «to interview» — Sau have not ở mẫu Present Perfect, phần còn lại phải là interviewed.
[D] «interviewing» — Sau have not ở mẫu Present Perfect, phần còn lại phải là interviewed.', 2, 112
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=112 AND old.question_text='The recruiters have not _____ the candidates twice so far this month.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'interview' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'interviewed' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to interview' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'interviewing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=112 AND q.question_text='The recruiters have not _____ the candidates twice so far this month.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The accountant _____ the shipping costs twice so far this month.', '[PHÂN TÍCH]
[A] «calculating» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «will calculated» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[C] «has calculated» — So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.
[D] «has calculating» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 2, 113
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=113 AND old.question_text='The accountant _____ the shipping costs twice so far this month.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will calculated' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'has calculated' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has calculating' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=113 AND q.question_text='The accountant _____ the shipping costs twice so far this month.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our engineers have _____ the demonstration unit twice so far this month.', '[PHÂN TÍCH]
[A] «building» — Dạng building không khớp với trợ động từ have; ở đây cần built.
[B] «built» — Đúng cấu trúc Present Perfect trong câu: chọn built. So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.
[C] «build» — Dạng build không khớp với trợ động từ have; ở đây cần built.
[D] «to build» — Dạng to build không khớp với trợ động từ have; ở đây cần built.', 2, 114
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=114 AND old.question_text='Our engineers have _____ the demonstration unit twice so far this month.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'building' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'built' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to build' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=114 AND q.question_text='Our engineers have _____ the demonstration unit twice so far this month.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the manager updated the delivery schedule twice so far this month?', '[PHÂN TÍCH]
[A] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.
[B] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.
[C] «Has» — Đúng cấu trúc Present Perfect trong câu: chọn Has. So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.
[D] «Will» — Sau will cần have trước cấu trúc hoàn thành.', 2, 115
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=115 AND old.question_text='_____ the manager updated the delivery schedule twice so far this month?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Has' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=115 AND q.question_text='_____ the manager updated the delivery schedule twice so far this month?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The operators have not _____ the water temperature twice so far this month.', '[PHÂN TÍCH]
[A] «to measure» — Sau have not ở mẫu Present Perfect, phần còn lại phải là measured.
[B] «measure» — Sau have not ở mẫu Present Perfect, phần còn lại phải là measured.
[C] «measured» — Đúng cấu trúc Present Perfect trong câu: chọn measured. So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.
[D] «measuring» — Sau have not ở mẫu Present Perfect, phần còn lại phải là measured.', 2, 116
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=116 AND old.question_text='The operators have not _____ the water temperature twice so far this month.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to measure' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'measure' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'measured' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'measuring' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=116 AND q.question_text='The operators have not _____ the water temperature twice so far this month.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The assistant _____ the training materials twice so far this month.', '[PHÂN TÍCH]
[A] «will organized» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «organizing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «has organizing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «has organized» — So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.', 2, 117
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=117 AND old.question_text='The assistant _____ the training materials twice so far this month.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will organized' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'has organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has organized' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=117 AND q.question_text='The assistant _____ the training materials twice so far this month.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The consultants have _____ the suppliers twice so far this month.', '[PHÂN TÍCH]
[A] «to compare» — Dạng to compare không khớp với trợ động từ have; ở đây cần compared.
[B] «compared» — Đúng cấu trúc Present Perfect trong câu: chọn compared. So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.
[C] «compare» — Dạng compare không khớp với trợ động từ have; ở đây cần compared.
[D] «comparing» — Dạng comparing không khớp với trợ động từ have; ở đây cần compared.', 2, 118
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=118 AND old.question_text='The consultants have _____ the suppliers twice so far this month.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to compare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'compared' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'compare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'comparing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=118 AND q.question_text='The consultants have _____ the suppliers twice so far this month.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the researcher collected the survey responses twice so far this month?', '[PHÂN TÍCH]
[A] «Will» — Sau will cần have trước cấu trúc hoàn thành.
[B] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.
[C] «Has» — Đúng cấu trúc Present Perfect trong câu: chọn Has. So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.
[D] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.', 2, 119
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=119 AND old.question_text='_____ the researcher collected the survey responses twice so far this month?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Has' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=119 AND q.question_text='_____ the researcher collected the survey responses twice so far this month?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The developers have not _____ the changes twice so far this month.', '[PHÂN TÍCH]
[A] «to document» — Sau have not ở mẫu Present Perfect, phần còn lại phải là documented.
[B] «document» — Sau have not ở mẫu Present Perfect, phần còn lại phải là documented.
[C] «documenting» — Sau have not ở mẫu Present Perfect, phần còn lại phải là documented.
[D] «documented» — Đúng cấu trúc Present Perfect trong câu: chọn documented. So far nối kết quả với hiện tại; twice đếm số lần đã hoàn tất.', 2, 120
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=120 AND old.question_text='The developers have not _____ the changes twice so far this month.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to document' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'document' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'documenting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'documented' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành (Present Perfect)' AND q.sort_order=120 AND q.question_text='The developers have not _____ the changes twice so far this month.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);

-- Từ loại trong TOEIC (Parts of Speech)
UPDATE grammar_lessons
SET content_html = CONCAT(REPLACE(content_html, '<section data-n11="lecture">', '<section data-n11="lecture"><h3>Vị trí quyết định từ loại</h3><p>Sau từ hạn định có thể cần danh từ hoặc tính từ đứng trước danh từ. Sau động từ nối như seem thường cần tính từ; bổ nghĩa cho hành động thường dùng trạng từ.</p>'), '<section data-n11="examples"><article data-example-id="21001" data-order="21"><p class="sentence">The revised procedure seems practical.</p><p class="translation">Quy trình đã sửa có vẻ thực tế.</p><p class="note">Revised bổ nghĩa procedure, practical làm bổ ngữ sau seems.</p></article></section>')
WHERE title = 'Từ loại trong TOEIC (Parts of Speech)' AND content_html LIKE '%<section data-n11="lecture">%' AND content_html NOT LIKE '%data-example-id="21001"%';
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'We need written _____ from the manager before releasing the funds.', '[PHÂN TÍCH]
[A] «approval» — Sau written cần danh từ chỉ sự chấp thuận: approval.
[B] «approve» — Approve là động từ, không làm tân ngữ danh từ ở vị trí này.
[C] «approvingly» — Approvingly là trạng từ, không phải thứ cần nhận được.
[D] «approved» — Approved là phân từ, thiếu danh từ nếu dùng sau written.', 1, 101
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=101 AND old.question_text='We need written _____ from the manager before releasing the funds.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'approval' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'approve' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'approvingly' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'approved' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=101 AND q.question_text='We need written _____ from the manager before releasing the funds.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Please _____ the revised schedule before noon.', '[PHÂN TÍCH]
[A] «confirming» — Confirming là V-ing, không tạo mệnh lệnh trực tiếp.
[B] «confirm» — Câu mệnh lệnh sau please dùng động từ nguyên mẫu confirm.
[C] «confirmation» — Confirmation là danh từ, không làm động từ mệnh lệnh.
[D] «confirmed» — Confirmed là dạng quá khứ/phân từ, không dùng sau please ở đây.', 1, 102
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=102 AND old.question_text='Please _____ the revised schedule before noon.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'confirming' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'confirm' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'confirmation' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'confirmed' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=102 AND q.question_text='Please _____ the revised schedule before noon.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The final report must be _____ and easy to understand.', '[PHÂN TÍCH]
[A] «accurately» — Accurately là trạng từ, không mô tả chủ ngữ sau be.
[B] «accurateness» — Accurateness là danh từ, không song song với tính từ easy.
[C] «accurate» — Sau be và song song với easy cần tính từ accurate.
[D] «accuracy» — Accuracy là danh từ chỉ độ chính xác; câu cần tính từ.', 1, 103
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=103 AND old.question_text='The final report must be _____ and easy to understand.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'accurately' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'accurateness' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'accurate' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'accuracy' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=103 AND q.question_text='The final report must be _____ and easy to understand.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The assistant answered the customer’s question _____.', '[PHÂN TÍCH]
[A] «polite» — Polite là tính từ; phải dùng trạng từ để bổ nghĩa động từ.
[B] «politeness» — Politeness là danh từ, không bổ nghĩa cách trả lời trực tiếp.
[C] «impolite» — Impolite là tính từ; ở đây cần trạng từ.
[D] «politely» — Politely là trạng từ bổ nghĩa cho cách answered.', 1, 104
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=104 AND old.question_text='The assistant answered the customer’s question _____.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'polite' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'politeness' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'impolite' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'politely' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=104 AND q.question_text='The assistant answered the customer’s question _____.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Regular _____ keeps the equipment in good condition.', '[PHÂN TÍCH]
[A] «maintenance» — Sau regular cần danh từ làm chủ ngữ: maintenance.
[B] «maintain» — Maintain là động từ nguyên mẫu, không theo tính từ regular ở đây.
[C] «maintained» — Maintained là phân từ, thiếu danh từ trung tâm.
[D] «maintainingly» — Maintainingly không phải dạng từ chuẩn cho vị trí này.', 1, 105
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=105 AND old.question_text='Regular _____ keeps the equipment in good condition.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'maintenance' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'maintain' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'maintained' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'maintainingly' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=105 AND q.question_text='Regular _____ keeps the equipment in good condition.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Employees must _____ their passwords every three months.', '[PHÂN TÍCH]
[A] «updates» — Updates có s; động từ sau must không chia theo chủ ngữ.
[B] «update» — Sau must dùng động từ nguyên mẫu update.
[C] «updated» — Updated là quá khứ/phân từ; must không đi trực tiếp với dạng này.
[D] «updating» — Updating là V-ing; cần be nếu tạo tiếp diễn.', 1, 106
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=106 AND old.question_text='Employees must _____ their passwords every three months.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'updates' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'update' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'updated' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'updating' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=106 AND q.question_text='Employees must _____ their passwords every three months.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The instructions are clear and _____.', '[PHÂN TÍCH]
[A] «helpfulness» — Helpfulness là danh từ, không phải tính từ chỉ đặc điểm.
[B] «help» — Help là động từ/danh từ, không dùng như tính từ ở đây.
[C] «helpful» — Helpful là tính từ, song song với clear sau are.
[D] «helpfully» — Helpfully là trạng từ, không song song với tính từ clear.', 1, 107
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=107 AND old.question_text='The instructions are clear and _____.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'helpfulness' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'help' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'helpful' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'helpfully' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=107 AND q.question_text='The instructions are clear and _____.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The new software processes invoices _____.', '[PHÂN TÍCH]
[A] «efficient» — Efficient là tính từ, không trực tiếp bổ nghĩa động từ processes.
[B] «efficiency» — Efficiency là danh từ; không chỉ cách xử lý tại vị trí này.
[C] «efficiencies» — Efficiencies là danh từ số nhiều, không phải trạng từ.
[D] «efficiently» — Efficiently là trạng từ bổ nghĩa processes.', 1, 108
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=108 AND old.question_text='The new software processes invoices _____.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'efficient' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'efficiency' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'efficiencies' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'efficiently' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=108 AND q.question_text='The new software processes invoices _____.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Successful _____ of the policy requires staff training.', '[PHÂN TÍCH]
[A] «implementation» — Sau successful và trước of cần danh từ implementation.
[B] «implement» — Implement là động từ, không theo tính từ successful ở đây.
[C] «implemented» — Implemented là phân từ, thiếu danh từ trung tâm.
[D] «implementable» — Implementable là tính từ, không làm danh từ trung tâm sau successful.', 1, 109
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=109 AND old.question_text='Successful _____ of the policy requires staff training.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'implementation' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'implement' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'implemented' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'implementable' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=109 AND q.question_text='Successful _____ of the policy requires staff training.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'We hope to _____ the contract next week.', '[PHÂN TÍCH]
[A] «finalizes» — Finalizes có s; sau to dùng nguyên mẫu.
[B] «finalize» — Hope to đi với động từ nguyên mẫu finalize.
[C] «finalization» — Finalization là danh từ; to ở đây mở động từ nguyên mẫu.
[D] «finalized» — Finalized là quá khứ/phân từ, không theo to chỉ mục đích.', 1, 110
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=110 AND old.question_text='We hope to _____ the contract next week.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'finalizes' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'finalize' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'finalization' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'finalized' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=110 AND q.question_text='We hope to _____ the contract next week.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'All visitors must wear a _____ badge.', '[PHÂN TÍCH]
[A] «visibility» — Visibility là danh từ trừu tượng, không diễn đạt tính chất nhìn thấy của badge.
[B] «visualize» — Visualize là động từ, không làm tính từ tại đây.
[C] «visible» — Trước danh từ badge cần tính từ visible.
[D] «visibly» — Visibly là trạng từ, không trực tiếp mô tả danh từ badge.', 1, 111
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=111 AND old.question_text='All visitors must wear a _____ badge.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'visibility' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'visualize' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'visible' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'visibly' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=111 AND q.question_text='All visitors must wear a _____ badge.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Please read the safety notice _____.', '[PHÂN TÍCH]
[A] «careful» — Careful là tính từ; để chỉ cách đọc cần carefully.
[B] «carefulness» — Carefulness là danh từ, không bổ nghĩa động từ read theo cách này.
[C] «care» — Care là danh từ/động từ, không phải trạng từ chỉ cách đọc.
[D] «carefully» — Carefully là trạng từ bổ nghĩa read.', 1, 112
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=112 AND old.question_text='Please read the safety notice _____.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'careful' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'carefulness' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'care' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'carefully' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=112 AND q.question_text='Please read the safety notice _____.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Thank you for your _____ during the renovation.', '[PHÂN TÍCH]
[A] «patience» — Your cần danh từ; patience là sự kiên nhẫn phù hợp lời cảm ơn.
[B] «patient» — Patient là tính từ hoặc một bệnh nhân; không chỉ sự kiên nhẫn.
[C] «patiently» — Patiently là trạng từ, không đứng sau tính từ sở hữu your.
[D] «patients» — Patients là các bệnh nhân, không phù hợp nghĩa cảm ơn sự kiên nhẫn.', 1, 113
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=113 AND old.question_text='Thank you for your _____ during the renovation.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'patience' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'patient' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'patiently' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'patients' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=113 AND q.question_text='Thank you for your _____ during the renovation.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The supervisor asked us to _____ the damaged parts.', '[PHÂN TÍCH]
[A] «replaces» — Replaces có s, không phải nguyên mẫu sau to.
[B] «replace» — Asked us to dùng động từ nguyên mẫu replace.
[C] «replacement» — Replacement là danh từ; vị trí này cần hành động.
[D] «replaced» — Replaced là quá khứ/phân từ, không theo to ở đây.', 1, 114
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=114 AND old.question_text='The supervisor asked us to _____ the damaged parts.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'replaces' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'replace' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'replacement' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'replaced' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=114 AND q.question_text='The supervisor asked us to _____ the damaged parts.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The revised budget seems _____.', '[PHÂN TÍCH]
[A] «reasonableness» — Reasonableness là danh từ trừu tượng, không dùng trực tiếp sau seems trong câu này.
[B] «reason» — Reason là danh từ/động từ, không chỉ đặc điểm hợp lý.
[C] «reasonable» — Seem là động từ nối; theo sau là tính từ reasonable.
[D] «reasonably» — Reasonably là trạng từ; không mô tả budget sau seems ở đây.', 1, 115
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=115 AND old.question_text='The revised budget seems _____.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'reasonableness' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'reason' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'reasonable' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'reasonably' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=115 AND q.question_text='The revised budget seems _____.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The guests were _____ welcomed by the staff.', '[PHÂN TÍCH]
[A] «warm» — Warm là tính từ; câu cần trạng từ chỉ cách chào đón.
[B] «warmth» — Warmth là danh từ, không bổ nghĩa welcomed trực tiếp.
[C] «warmer» — Warmer là tính từ so sánh hơn, không dùng để bổ nghĩa động từ ở đây.
[D] «warmly» — Warmly là trạng từ bổ nghĩa welcomed.', 1, 116
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=116 AND old.question_text='The guests were _____ welcomed by the staff.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'warm' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'warmth' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'warmer' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'warmly' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=116 AND q.question_text='The guests were _____ welcomed by the staff.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The training session increased employee _____.', '[PHÂN TÍCH]
[A] «confidence» — Increased cần tân ngữ danh từ; employee confidence là sự tự tin của nhân viên.
[B] «confident» — Confident là tính từ, thiếu danh từ nếu dùng ở đây.
[C] «confidently» — Confidently là trạng từ; không thể làm tân ngữ của increased.
[D] «confide» — Confide là động từ, không phải đối tượng được tăng lên.', 1, 117
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=117 AND old.question_text='The training session increased employee _____.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'confidence' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'confident' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'confidently' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'confide' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=117 AND q.question_text='The training session increased employee _____.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Please _____ your name at the top of the form.', '[PHÂN TÍCH]
[A] «prints» — Prints chia ngôi thứ ba, không dùng trong mệnh lệnh.
[B] «print» — Sau please dùng nguyên mẫu print để yêu cầu ghi tên bằng chữ in.
[C] «printed» — Printed là quá khứ/phân từ, không phải dạng mệnh lệnh.
[D] «printing» — Printing là V-ing, không tạo mệnh lệnh ở đây.', 1, 118
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=118 AND old.question_text='Please _____ your name at the top of the form.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'prints' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'print' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'printed' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'printing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=118 AND q.question_text='Please _____ your name at the top of the form.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The office will remain _____ during the repairs.', '[PHÂN TÍCH]
[A] «closure» — Closure là danh từ, không mô tả trạng thái sau remain ở đây.
[B] «closingly» — Closingly không phải dạng từ chuẩn để diễn tả đóng cửa.
[C] «closed» — Remain là động từ nối; closed diễn tả trạng thái đóng cửa.
[D] «closely» — Closely là trạng từ nghĩa sát sao, không chỉ trạng thái văn phòng.', 1, 119
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=119 AND old.question_text='The office will remain _____ during the repairs.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'closure' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'closingly' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'closed' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'closely' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=119 AND q.question_text='The office will remain _____ during the repairs.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The team completed the inspection _____.', '[PHÂN TÍCH]
[A] «thorough» — Thorough là tính từ, không bổ nghĩa completed trực tiếp.
[B] «thoroughness» — Thoroughness là danh từ, không phải trạng từ chỉ cách thực hiện.
[C] «thoroughgoing» — Thoroughgoing là tính từ, không dùng làm trạng từ ở đây.
[D] «thoroughly» — Thoroughly là trạng từ mô tả cách completed.', 1, 120
FROM grammar_lessons l WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=120 AND old.question_text='The team completed the inspection _____.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'thorough' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'thoroughness' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'thoroughgoing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'thoroughly' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Từ loại trong TOEIC (Parts of Speech)' AND q.sort_order=120 AND q.question_text='The team completed the inspection _____.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);

-- Câu bị động (Passive Voice)
UPDATE grammar_lessons
SET content_html = CONCAT(REPLACE(content_html, '<section data-n11="lecture">', '<section data-n11="lecture"><h3>Giữ thì khi chuyển sang bị động</h3><p>Xác định đối tượng nhận tác động, chọn be theo thì và số của chủ ngữ rồi thêm V3. Tác nhân với by có thể bỏ khi không cần.</p>'), '<section data-n11="examples"><article data-example-id="21001" data-order="21"><p class="sentence">The invoices have been sent to the finance team.</p><p class="translation">Các hóa đơn đã được gửi cho bộ phận tài chính.</p><p class="note">Have been sent là hiện tại hoàn thành bị động.</p></article></section>')
WHERE title = 'Câu bị động (Passive Voice)' AND content_html LIKE '%<section data-n11="lecture">%' AND content_html NOT LIKE '%data-example-id="21001"%';
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The ventilation system is _____ before each audit.', '[PHÂN TÍCH]
[A] «is inspecting» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.
[B] «inspected» — Hiện tại đơn bị động dùng is/are + V3. Chủ ngữ là đối tượng nhận tác động.
[C] «being inspect» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.
[D] «to inspect» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.', 2, 101
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=101 AND old.question_text='The ventilation system is _____ before each audit.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'is inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'inspected' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'being inspect' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to inspect' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=101 AND q.question_text='The ventilation system is _____ before each audit.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The ventilation system was _____ by the evening shift yesterday.', '[PHÂN TÍCH]
[A] «being inspect» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.
[B] «to inspect» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.
[C] «inspected» — Quá khứ đơn bị động dùng was/were + V3. Chủ ngữ là đối tượng nhận tác động.
[D] «is inspecting» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.', 2, 102
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=102 AND old.question_text='The ventilation system was _____ by the evening shift yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'being inspect' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to inspect' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'inspected' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'is inspecting' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=102 AND q.question_text='The ventilation system was _____ by the evening shift yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The ventilation system will _____ by a second employee tomorrow.', '[PHÂN TÍCH]
[A] «be inspected» — Tương lai bị động dùng will + be + V3. Chủ ngữ là đối tượng nhận tác động.
[B] «is inspecting» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.
[C] «being inspect» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.
[D] «to inspect» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.', 2, 103
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=103 AND old.question_text='The ventilation system will _____ by a second employee tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'be inspected' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'is inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'being inspect' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to inspect' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=103 AND q.question_text='The ventilation system will _____ by a second employee tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The ventilation system must _____ before release.', '[PHÂN TÍCH]
[A] «being inspect» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.
[B] «to inspect» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.
[C] «is inspecting» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.
[D] «be inspected» — Sau động từ khuyết thiếu, dạng bị động là be + V3. Chủ ngữ là đối tượng nhận tác động.', 2, 104
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=104 AND old.question_text='The ventilation system must _____ before release.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'being inspect' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to inspect' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'is inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'be inspected' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=104 AND q.question_text='The ventilation system must _____ before release.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The travel receipts are _____ before each audit.', '[PHÂN TÍCH]
[A] «filed» — Hiện tại đơn bị động dùng is/are + V3. Chủ ngữ là đối tượng nhận tác động.
[B] «are filing» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.
[C] «being file» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.
[D] «to file» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.', 2, 105
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=105 AND old.question_text='The travel receipts are _____ before each audit.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'filed' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'are filing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'being file' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to file' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=105 AND q.question_text='The travel receipts are _____ before each audit.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The travel receipts were _____ by the evening shift yesterday.', '[PHÂN TÍCH]
[A] «are filing» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.
[B] «being file» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.
[C] «to file» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.
[D] «filed» — Quá khứ đơn bị động dùng was/were + V3. Chủ ngữ là đối tượng nhận tác động.', 2, 106
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=106 AND old.question_text='The travel receipts were _____ by the evening shift yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'are filing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'being file' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to file' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'filed' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=106 AND q.question_text='The travel receipts were _____ by the evening shift yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The travel receipts will _____ by a second employee tomorrow.', '[PHÂN TÍCH]
[A] «to file» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.
[B] «being file» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.
[C] «are filing» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.
[D] «be filed» — Tương lai bị động dùng will + be + V3. Chủ ngữ là đối tượng nhận tác động.', 2, 107
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=107 AND old.question_text='The travel receipts will _____ by a second employee tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to file' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'being file' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'are filing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'be filed' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=107 AND q.question_text='The travel receipts will _____ by a second employee tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The travel receipts must _____ before release.', '[PHÂN TÍCH]
[A] «are filing» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.
[B] «be filed» — Sau động từ khuyết thiếu, dạng bị động là be + V3. Chủ ngữ là đối tượng nhận tác động.
[C] «being file» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.
[D] «to file» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.', 2, 108
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=108 AND old.question_text='The travel receipts must _____ before release.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'are filing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'be filed' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'being file' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to file' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=108 AND q.question_text='The travel receipts must _____ before release.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The sales figures are _____ before each audit.', '[PHÂN TÍCH]
[A] «to review» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.
[B] «are reviewing» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.
[C] «reviewed» — Hiện tại đơn bị động dùng is/are + V3. Chủ ngữ là đối tượng nhận tác động.
[D] «being review» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.', 2, 109
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=109 AND old.question_text='The sales figures are _____ before each audit.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to review' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'are reviewing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'reviewed' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'being review' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=109 AND q.question_text='The sales figures are _____ before each audit.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The sales figures were _____ by the evening shift yesterday.', '[PHÂN TÍCH]
[A] «reviewed» — Quá khứ đơn bị động dùng was/were + V3. Chủ ngữ là đối tượng nhận tác động.
[B] «being review» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.
[C] «to review» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.
[D] «are reviewing» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.', 2, 110
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=110 AND old.question_text='The sales figures were _____ by the evening shift yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'reviewed' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'being review' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to review' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'are reviewing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=110 AND q.question_text='The sales figures were _____ by the evening shift yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The sales figures will _____ by a second employee tomorrow.', '[PHÂN TÍCH]
[A] «to review» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.
[B] «be reviewed» — Tương lai bị động dùng will + be + V3. Chủ ngữ là đối tượng nhận tác động.
[C] «are reviewing» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.
[D] «being review» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.', 2, 111
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=111 AND old.question_text='The sales figures will _____ by a second employee tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to review' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'be reviewed' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'are reviewing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'being review' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=111 AND q.question_text='The sales figures will _____ by a second employee tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The sales figures must _____ before release.', '[PHÂN TÍCH]
[A] «are reviewing» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.
[B] «being review» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.
[C] «be reviewed» — Sau động từ khuyết thiếu, dạng bị động là be + V3. Chủ ngữ là đối tượng nhận tác động.
[D] «to review» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.', 2, 112
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=112 AND old.question_text='The sales figures must _____ before release.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'are reviewing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'being review' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'be reviewed' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to review' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=112 AND q.question_text='The sales figures must _____ before release.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The project summary is _____ before each audit.', '[PHÂN TÍCH]
[A] «to write» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.
[B] «is writing» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.
[C] «written» — Hiện tại đơn bị động dùng is/are + V3. Chủ ngữ là đối tượng nhận tác động.
[D] «being write» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.', 2, 113
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=113 AND old.question_text='The project summary is _____ before each audit.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to write' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'is writing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'written' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'being write' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=113 AND q.question_text='The project summary is _____ before each audit.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The project summary was _____ by the evening shift yesterday.', '[PHÂN TÍCH]
[A] «to write» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.
[B] «is writing» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.
[C] «written» — Quá khứ đơn bị động dùng was/were + V3. Chủ ngữ là đối tượng nhận tác động.
[D] «being write» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.', 2, 114
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=114 AND old.question_text='The project summary was _____ by the evening shift yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to write' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'is writing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'written' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'being write' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=114 AND q.question_text='The project summary was _____ by the evening shift yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The project summary will _____ by a second employee tomorrow.', '[PHÂN TÍCH]
[A] «being write» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.
[B] «be written» — Tương lai bị động dùng will + be + V3. Chủ ngữ là đối tượng nhận tác động.
[C] «is writing» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.
[D] «to write» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.', 2, 115
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=115 AND old.question_text='The project summary will _____ by a second employee tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'being write' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'be written' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'is writing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to write' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=115 AND q.question_text='The project summary will _____ by a second employee tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The project summary must _____ before release.', '[PHÂN TÍCH]
[A] «is writing» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.
[B] «to write» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.
[C] «being write» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.
[D] «be written» — Sau động từ khuyết thiếu, dạng bị động là be + V3. Chủ ngữ là đối tượng nhận tác động.', 2, 116
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=116 AND old.question_text='The project summary must _____ before release.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'is writing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to write' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'being write' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'be written' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=116 AND q.question_text='The project summary must _____ before release.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The safety equipment is _____ before each audit.', '[PHÂN TÍCH]
[A] «tested» — Hiện tại đơn bị động dùng is/are + V3. Chủ ngữ là đối tượng nhận tác động.
[B] «being test» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.
[C] «to test» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.
[D] «is testing» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.', 2, 117
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=117 AND old.question_text='The safety equipment is _____ before each audit.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'tested' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'being test' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to test' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'is testing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=117 AND q.question_text='The safety equipment is _____ before each audit.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The safety equipment was _____ by the evening shift yesterday.', '[PHÂN TÍCH]
[A] «to test» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.
[B] «tested» — Quá khứ đơn bị động dùng was/were + V3. Chủ ngữ là đối tượng nhận tác động.
[C] «being test» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.
[D] «is testing» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.', 2, 118
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=118 AND old.question_text='The safety equipment was _____ by the evening shift yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to test' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'tested' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'being test' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'is testing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=118 AND q.question_text='The safety equipment was _____ by the evening shift yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The safety equipment will _____ by a second employee tomorrow.', '[PHÂN TÍCH]
[A] «to test» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.
[B] «is testing» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.
[C] «being test» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.
[D] «be tested» — Tương lai bị động dùng will + be + V3. Chủ ngữ là đối tượng nhận tác động.', 2, 119
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=119 AND old.question_text='The safety equipment will _____ by a second employee tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to test' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'is testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'being test' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'be tested' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=119 AND q.question_text='The safety equipment will _____ by a second employee tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The safety equipment must _____ before release.', '[PHÂN TÍCH]
[A] «be tested» — Sau động từ khuyết thiếu, dạng bị động là be + V3. Chủ ngữ là đối tượng nhận tác động.
[B] «being test» — Sau being, dạng bị động cần V3, không phải nguyên mẫu.
[C] «is testing» — Cụm này sai với trợ động từ đứng trước và dùng V-ing chủ động thay cho V3.
[D] «to test» — To + nguyên mẫu không tạo dạng bị động ở vị trí này.', 2, 120
FROM grammar_lessons l WHERE l.title = 'Câu bị động (Passive Voice)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=120 AND old.question_text='The safety equipment must _____ before release.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'be tested' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'being test' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'is testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to test' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu bị động (Passive Voice)' AND q.sort_order=120 AND q.question_text='The safety equipment must _____ before release.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);

-- Câu điều kiện (Conditionals)
UPDATE grammar_lessons
SET content_html = CONCAT(REPLACE(content_html, '<section data-n11="lecture">', '<section data-n11="lecture"><h3>Phân biệt điều kiện có thật và giả định</h3><p>Đọc cả hai mệnh đề. Điều kiện tương lai có thể xảy ra thường dùng if + hiện tại đơn. Giả định quá khứ cần phân biệt had + V3 với would have + V3.</p>'), '<section data-n11="examples"><article data-example-id="21001" data-order="21"><p class="sentence">If we had backed up the folder, we would have recovered the file.</p><p class="translation">Nếu đã sao lưu thư mục thì chúng ta đã khôi phục được tệp.</p><p class="note">Hai vế lần lượt chỉ điều kiện và kết quả trái với quá khứ.</p></article></section>')
WHERE title = 'Câu điều kiện (Conditionals)' AND content_html LIKE '%<section data-n11="lecture">%' AND content_html NOT LIKE '%data-example-id="21001"%';
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'If the technician inspects the ventilation system today, we _____ the client tomorrow.', '[PHÂN TÍCH]
[A] «notifying» — V-ing đứng một mình không làm vị ngữ của mệnh đề chính.
[B] «will notify» — Điều kiện có thể xảy ra: if + hiện tại đơn, mệnh đề chính will + nguyên mẫu.
[C] «would have notified» — Dạng này diễn tả kết quả giả định ở quá khứ, không phù hợp tomorrow.
[D] «had notified» — Quá khứ hoàn thành cần mốc quá khứ, không diễn tả kết quả tương lai ở đây.', 2, 101
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=101 AND old.question_text='If the technician inspects the ventilation system today, we _____ the client tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'notifying' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will notify' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'would have notified' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'had notified' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=101 AND q.question_text='If the technician inspects the ventilation system today, we _____ the client tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'If the technician inspected the ventilation system now, we _____ ready sooner, but that is not possible.', '[PHÂN TÍCH]
[A] «will have been» — Tương lai hoàn thành cần mốc tương lai, không khớp giả định hiện tại.
[B] «had been» — Quá khứ hoàn thành không thể hiện kết quả giả định hiện tại ở đây.
[C] «would being» — Sau would dùng be, không dùng being.
[D] «would be» — Giả định trái tình hình hiện tại: if + quá khứ đơn, would + nguyên mẫu.', 2, 102
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=102 AND old.question_text='If the technician inspected the ventilation system now, we _____ ready sooner, but that is not possible.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will have been' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'had been' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'would being' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'would be' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=102 AND q.question_text='If the technician inspected the ventilation system now, we _____ ready sooner, but that is not possible.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'If the technician had inspected the ventilation system yesterday, we _____ the problem earlier.', '[PHÂN TÍCH]
[A] «will have identified» — Will hướng tới tương lai, không khớp với giả định đã qua.
[B] «have identifying» — Sau have cần V3, không dùng V-ing trong mẫu này.
[C] «would identified» — Would cần nguyên mẫu; kết quả quá khứ cần have + V3.
[D] «would have identified» — If + had + V3 đi với would have + V3 khi giả định kết quả quá khứ.', 2, 103
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=103 AND old.question_text='If the technician had inspected the ventilation system yesterday, we _____ the problem earlier.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will have identified' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'have identifying' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'would identified' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'would have identified' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=103 AND q.question_text='If the technician had inspected the ventilation system yesterday, we _____ the problem earlier.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Unless the technician inspects the system by noon, the release will be delayed. What does “unless” mean here?', '[PHÂN TÍCH]
[A] «if not» — Unless giới thiệu điều kiện ngoại lệ, tương đương if ... not trong câu này.
[B] «even though» — Even though mang nghĩa nhượng bộ mặc dù, không diễn tả điều kiện loại trừ.
[C] «because» — Because nêu nguyên nhân, không đặt điều kiện ngoại lệ.
[D] «as soon as» — As soon as chỉ ngay khi một việc xảy ra, không mang nghĩa phủ định.', 2, 104
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=104 AND old.question_text='Unless the technician inspects the system by noon, the release will be delayed. What does “unless” mean here?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'if not' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'even though' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'because' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'as soon as' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=104 AND q.question_text='Unless the technician inspects the system by noon, the release will be delayed. What does “unless” mean here?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'If the clerk files the travel receipts today, we _____ the client tomorrow.', '[PHÂN TÍCH]
[A] «notifying» — V-ing đứng một mình không làm vị ngữ của mệnh đề chính.
[B] «would have notified» — Dạng này diễn tả kết quả giả định ở quá khứ, không phù hợp tomorrow.
[C] «will notify» — Điều kiện có thể xảy ra: if + hiện tại đơn, mệnh đề chính will + nguyên mẫu.
[D] «had notified» — Quá khứ hoàn thành cần mốc quá khứ, không diễn tả kết quả tương lai ở đây.', 2, 105
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=105 AND old.question_text='If the clerk files the travel receipts today, we _____ the client tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'notifying' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'would have notified' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will notify' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'had notified' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=105 AND q.question_text='If the clerk files the travel receipts today, we _____ the client tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'If the clerk filed the travel receipts now, we _____ ready sooner, but that is not possible.', '[PHÂN TÍCH]
[A] «would be» — Giả định trái tình hình hiện tại: if + quá khứ đơn, would + nguyên mẫu.
[B] «will have been» — Tương lai hoàn thành cần mốc tương lai, không khớp giả định hiện tại.
[C] «would being» — Sau would dùng be, không dùng being.
[D] «had been» — Quá khứ hoàn thành không thể hiện kết quả giả định hiện tại ở đây.', 2, 106
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=106 AND old.question_text='If the clerk filed the travel receipts now, we _____ ready sooner, but that is not possible.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'would be' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will have been' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'would being' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'had been' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=106 AND q.question_text='If the clerk filed the travel receipts now, we _____ ready sooner, but that is not possible.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'If the clerk had filed the travel receipts yesterday, we _____ the problem earlier.', '[PHÂN TÍCH]
[A] «have identifying» — Sau have cần V3, không dùng V-ing trong mẫu này.
[B] «would identified» — Would cần nguyên mẫu; kết quả quá khứ cần have + V3.
[C] «will have identified» — Will hướng tới tương lai, không khớp với giả định đã qua.
[D] «would have identified» — If + had + V3 đi với would have + V3 khi giả định kết quả quá khứ.', 2, 107
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=107 AND old.question_text='If the clerk had filed the travel receipts yesterday, we _____ the problem earlier.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'have identifying' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'would identified' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will have identified' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'would have identified' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=107 AND q.question_text='If the clerk had filed the travel receipts yesterday, we _____ the problem earlier.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Unless the clerk files the receipts by noon, the release will be delayed. What does “unless” mean here?', '[PHÂN TÍCH]
[A] «because» — Because nêu nguyên nhân, không đặt điều kiện ngoại lệ.
[B] «even though» — Even though mang nghĩa nhượng bộ mặc dù, không diễn tả điều kiện loại trừ.
[C] «as soon as» — As soon as chỉ ngay khi một việc xảy ra, không mang nghĩa phủ định.
[D] «if not» — Unless giới thiệu điều kiện ngoại lệ, tương đương if ... not trong câu này.', 2, 108
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=108 AND old.question_text='Unless the clerk files the receipts by noon, the release will be delayed. What does “unless” mean here?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'because' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'even though' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'as soon as' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'if not' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=108 AND q.question_text='Unless the clerk files the receipts by noon, the release will be delayed. What does “unless” mean here?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'If the analysts review the sales figures today, we _____ the client tomorrow.', '[PHÂN TÍCH]
[A] «would have notified» — Dạng này diễn tả kết quả giả định ở quá khứ, không phù hợp tomorrow.
[B] «notifying» — V-ing đứng một mình không làm vị ngữ của mệnh đề chính.
[C] «will notify» — Điều kiện có thể xảy ra: if + hiện tại đơn, mệnh đề chính will + nguyên mẫu.
[D] «had notified» — Quá khứ hoàn thành cần mốc quá khứ, không diễn tả kết quả tương lai ở đây.', 2, 109
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=109 AND old.question_text='If the analysts review the sales figures today, we _____ the client tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'would have notified' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'notifying' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will notify' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'had notified' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=109 AND q.question_text='If the analysts review the sales figures today, we _____ the client tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'If the analysts reviewed the sales figures now, we _____ ready sooner, but that is not possible.', '[PHÂN TÍCH]
[A] «would be» — Giả định trái tình hình hiện tại: if + quá khứ đơn, would + nguyên mẫu.
[B] «will have been» — Tương lai hoàn thành cần mốc tương lai, không khớp giả định hiện tại.
[C] «had been» — Quá khứ hoàn thành không thể hiện kết quả giả định hiện tại ở đây.
[D] «would being» — Sau would dùng be, không dùng being.', 2, 110
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=110 AND old.question_text='If the analysts reviewed the sales figures now, we _____ ready sooner, but that is not possible.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'would be' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will have been' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'had been' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'would being' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=110 AND q.question_text='If the analysts reviewed the sales figures now, we _____ ready sooner, but that is not possible.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'If the analysts had reviewed the sales figures yesterday, we _____ the problem earlier.', '[PHÂN TÍCH]
[A] «would have identified» — If + had + V3 đi với would have + V3 khi giả định kết quả quá khứ.
[B] «will have identified» — Will hướng tới tương lai, không khớp với giả định đã qua.
[C] «would identified» — Would cần nguyên mẫu; kết quả quá khứ cần have + V3.
[D] «have identifying» — Sau have cần V3, không dùng V-ing trong mẫu này.', 2, 111
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=111 AND old.question_text='If the analysts had reviewed the sales figures yesterday, we _____ the problem earlier.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'would have identified' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will have identified' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'would identified' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'have identifying' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=111 AND q.question_text='If the analysts had reviewed the sales figures yesterday, we _____ the problem earlier.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Unless the analysts review the figures by noon, the release will be delayed. What does “unless” mean here?', '[PHÂN TÍCH]
[A] «if not» — Unless giới thiệu điều kiện ngoại lệ, tương đương if ... not trong câu này.
[B] «even though» — Even though mang nghĩa nhượng bộ mặc dù, không diễn tả điều kiện loại trừ.
[C] «because» — Because nêu nguyên nhân, không đặt điều kiện ngoại lệ.
[D] «as soon as» — As soon as chỉ ngay khi một việc xảy ra, không mang nghĩa phủ định.', 2, 112
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=112 AND old.question_text='Unless the analysts review the figures by noon, the release will be delayed. What does “unless” mean here?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'if not' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'even though' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'because' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'as soon as' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=112 AND q.question_text='Unless the analysts review the figures by noon, the release will be delayed. What does “unless” mean here?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'If ms. Chen writes the project summary today, we _____ the client tomorrow.', '[PHÂN TÍCH]
[A] «will notify» — Điều kiện có thể xảy ra: if + hiện tại đơn, mệnh đề chính will + nguyên mẫu.
[B] «would have notified» — Dạng này diễn tả kết quả giả định ở quá khứ, không phù hợp tomorrow.
[C] «had notified» — Quá khứ hoàn thành cần mốc quá khứ, không diễn tả kết quả tương lai ở đây.
[D] «notifying» — V-ing đứng một mình không làm vị ngữ của mệnh đề chính.', 2, 113
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=113 AND old.question_text='If ms. Chen writes the project summary today, we _____ the client tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will notify' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'would have notified' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'had notified' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'notifying' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=113 AND q.question_text='If ms. Chen writes the project summary today, we _____ the client tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'If ms. Chen wrote the project summary now, we _____ ready sooner, but that is not possible.', '[PHÂN TÍCH]
[A] «had been» — Quá khứ hoàn thành không thể hiện kết quả giả định hiện tại ở đây.
[B] «will have been» — Tương lai hoàn thành cần mốc tương lai, không khớp giả định hiện tại.
[C] «would being» — Sau would dùng be, không dùng being.
[D] «would be» — Giả định trái tình hình hiện tại: if + quá khứ đơn, would + nguyên mẫu.', 2, 114
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=114 AND old.question_text='If ms. Chen wrote the project summary now, we _____ ready sooner, but that is not possible.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'had been' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will have been' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'would being' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'would be' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=114 AND q.question_text='If ms. Chen wrote the project summary now, we _____ ready sooner, but that is not possible.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'If ms. Chen had written the project summary yesterday, we _____ the problem earlier.', '[PHÂN TÍCH]
[A] «would identified» — Would cần nguyên mẫu; kết quả quá khứ cần have + V3.
[B] «will have identified» — Will hướng tới tương lai, không khớp với giả định đã qua.
[C] «have identifying» — Sau have cần V3, không dùng V-ing trong mẫu này.
[D] «would have identified» — If + had + V3 đi với would have + V3 khi giả định kết quả quá khứ.', 2, 115
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=115 AND old.question_text='If ms. Chen had written the project summary yesterday, we _____ the problem earlier.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'would identified' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will have identified' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'have identifying' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'would have identified' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=115 AND q.question_text='If ms. Chen had written the project summary yesterday, we _____ the problem earlier.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Unless ms. Chen writes the summary by noon, the release will be delayed. What does “unless” mean here?', '[PHÂN TÍCH]
[A] «as soon as» — As soon as chỉ ngay khi một việc xảy ra, không mang nghĩa phủ định.
[B] «if not» — Unless giới thiệu điều kiện ngoại lệ, tương đương if ... not trong câu này.
[C] «because» — Because nêu nguyên nhân, không đặt điều kiện ngoại lệ.
[D] «even though» — Even though mang nghĩa nhượng bộ mặc dù, không diễn tả điều kiện loại trừ.', 2, 116
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=116 AND old.question_text='Unless ms. Chen writes the summary by noon, the release will be delayed. What does “unless” mean here?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'as soon as' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'if not' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'because' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'even though' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=116 AND q.question_text='Unless ms. Chen writes the summary by noon, the release will be delayed. What does “unless” mean here?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'If the contractors test the safety equipment today, we _____ the client tomorrow.', '[PHÂN TÍCH]
[A] «notifying» — V-ing đứng một mình không làm vị ngữ của mệnh đề chính.
[B] «will notify» — Điều kiện có thể xảy ra: if + hiện tại đơn, mệnh đề chính will + nguyên mẫu.
[C] «had notified» — Quá khứ hoàn thành cần mốc quá khứ, không diễn tả kết quả tương lai ở đây.
[D] «would have notified» — Dạng này diễn tả kết quả giả định ở quá khứ, không phù hợp tomorrow.', 2, 117
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=117 AND old.question_text='If the contractors test the safety equipment today, we _____ the client tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'notifying' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will notify' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'had notified' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'would have notified' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=117 AND q.question_text='If the contractors test the safety equipment today, we _____ the client tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'If the contractors tested the safety equipment now, we _____ ready sooner, but that is not possible.', '[PHÂN TÍCH]
[A] «will have been» — Tương lai hoàn thành cần mốc tương lai, không khớp giả định hiện tại.
[B] «would be» — Giả định trái tình hình hiện tại: if + quá khứ đơn, would + nguyên mẫu.
[C] «would being» — Sau would dùng be, không dùng being.
[D] «had been» — Quá khứ hoàn thành không thể hiện kết quả giả định hiện tại ở đây.', 2, 118
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=118 AND old.question_text='If the contractors tested the safety equipment now, we _____ ready sooner, but that is not possible.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will have been' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'would be' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'would being' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'had been' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=118 AND q.question_text='If the contractors tested the safety equipment now, we _____ ready sooner, but that is not possible.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'If the contractors had tested the safety equipment yesterday, we _____ the problem earlier.', '[PHÂN TÍCH]
[A] «would identified» — Would cần nguyên mẫu; kết quả quá khứ cần have + V3.
[B] «would have identified» — If + had + V3 đi với would have + V3 khi giả định kết quả quá khứ.
[C] «have identifying» — Sau have cần V3, không dùng V-ing trong mẫu này.
[D] «will have identified» — Will hướng tới tương lai, không khớp với giả định đã qua.', 2, 119
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=119 AND old.question_text='If the contractors had tested the safety equipment yesterday, we _____ the problem earlier.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'would identified' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'would have identified' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'have identifying' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'will have identified' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=119 AND q.question_text='If the contractors had tested the safety equipment yesterday, we _____ the problem earlier.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Unless the contractors test the equipment by noon, the release will be delayed. What does “unless” mean here?', '[PHÂN TÍCH]
[A] «because» — Because nêu nguyên nhân, không đặt điều kiện ngoại lệ.
[B] «as soon as» — As soon as chỉ ngay khi một việc xảy ra, không mang nghĩa phủ định.
[C] «if not» — Unless giới thiệu điều kiện ngoại lệ, tương đương if ... not trong câu này.
[D] «even though» — Even though mang nghĩa nhượng bộ mặc dù, không diễn tả điều kiện loại trừ.', 2, 120
FROM grammar_lessons l WHERE l.title = 'Câu điều kiện (Conditionals)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=120 AND old.question_text='Unless the contractors test the equipment by noon, the release will be delayed. What does “unless” mean here?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'because' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'as soon as' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'if not' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'even though' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Câu điều kiện (Conditionals)' AND q.sort_order=120 AND q.question_text='Unless the contractors test the equipment by noon, the release will be delayed. What does “unless” mean here?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);

-- Mệnh đề quan hệ (Relative Clauses)
UPDATE grammar_lessons
SET content_html = CONCAT(REPLACE(content_html, '<section data-n11="lecture">', '<section data-n11="lecture"><h3>Vai trò của dấu phẩy</h3><p>Mệnh đề không xác định được ngăn bằng dấu phẩy và dùng who hoặc which, không dùng that. Whose đứng trước danh từ để biểu thị sở hữu.</p>'), '<section data-n11="examples"><article data-example-id="21001" data-order="21"><p class="sentence">The scanner, which was installed yesterday, works well.</p><p class="translation">Máy quét, được lắp hôm qua, hoạt động tốt.</p><p class="note">Which bổ sung thông tin về máy quét và làm chủ ngữ của was installed.</p></article></section>')
WHERE title = 'Mệnh đề quan hệ (Relative Clauses)' AND content_html LIKE '%<section data-n11="lecture">%' AND content_html NOT LIKE '%data-example-id="21001"%';
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The consultant, _____ joined us last month, will speak at the meeting.', '[PHÂN TÍCH]
[A] «where» — Where chỉ nơi chốn, không làm chủ ngữ thay người.
[B] «that» — Không dùng that trong mệnh đề quan hệ không xác định sau dấu phẩy.
[C] «whose» — Whose chỉ sở hữu và cần danh từ đứng sau.
[D] «who» — Sau dấu phẩy, who làm chủ ngữ cho mệnh đề bổ sung thông tin về người.', 2, 101
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=101 AND old.question_text='The consultant, _____ joined us last month, will speak at the meeting.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'where' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'that' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'whose' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'who' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=101 AND q.question_text='The consultant, _____ joined us last month, will speak at the meeting.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The proposal, _____ was approved yesterday, is ready to share.', '[PHÂN TÍCH]
[A] «which» — Which làm chủ ngữ cho mệnh đề quan hệ không xác định chỉ vật.
[B] «where» — Where chỉ nơi diễn ra sự việc, không thay chủ ngữ chỉ vật.
[C] «who» — Who dùng cho người, còn danh từ đứng trước chỉ vật.
[D] «that» — That không dùng sau dấu phẩy trong mệnh đề quan hệ.', 2, 102
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=102 AND old.question_text='The proposal, _____ was approved yesterday, is ready to share.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'which' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'where' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'who' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'that' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=102 AND q.question_text='The proposal, _____ was approved yesterday, is ready to share.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The branch _____ we hold monthly meetings is being renovated.', '[PHÂN TÍCH]
[A] «whose» — Whose cần danh từ đi sau để diễn đạt sở hữu.
[B] «who» — Who thay người, không chỉ địa điểm trong mệnh đề.
[C] «which» — Dùng which phải có giới từ phù hợp, ví dụ at which.
[D] «where» — Mệnh đề đã có chủ ngữ we và tân ngữ monthly meetings. Where bổ nghĩa địa điểm.', 2, 103
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=103 AND old.question_text='The branch _____ we hold monthly meetings is being renovated.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'whose' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'who' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'which' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'where' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=103 AND q.question_text='The branch _____ we hold monthly meetings is being renovated.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The consultant _____ presentation impressed the board received an award.', '[PHÂN TÍCH]
[A] «whose» — Whose + danh từ biểu thị người sở hữu nội dung gây ấn tượng.
[B] «whom» — Whom chỉ tân ngữ, không biểu thị sở hữu trước danh từ.
[C] «which» — Which chỉ vật và không thay cho từ sở hữu ở đây.
[D] «who» — Who thay chủ ngữ chỉ người, nhưng chủ ngữ của impressed ở đây là danh từ ngay sau chỗ trống.', 2, 104
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=104 AND old.question_text='The consultant _____ presentation impressed the board received an award.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'whose' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'whom' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'which' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'who' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=104 AND q.question_text='The consultant _____ presentation impressed the board received an award.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The engineer, _____ joined us last month, will speak at the meeting.', '[PHÂN TÍCH]
[A] «that» — Không dùng that trong mệnh đề quan hệ không xác định sau dấu phẩy.
[B] «where» — Where chỉ nơi chốn, không làm chủ ngữ thay người.
[C] «who» — Sau dấu phẩy, who làm chủ ngữ cho mệnh đề bổ sung thông tin về người.
[D] «whose» — Whose chỉ sở hữu và cần danh từ đứng sau.', 2, 105
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=105 AND old.question_text='The engineer, _____ joined us last month, will speak at the meeting.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'that' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'where' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'who' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'whose' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=105 AND q.question_text='The engineer, _____ joined us last month, will speak at the meeting.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The prototype, _____ was approved yesterday, is ready to share.', '[PHÂN TÍCH]
[A] «who» — Who dùng cho người, còn danh từ đứng trước chỉ vật.
[B] «that» — That không dùng sau dấu phẩy trong mệnh đề quan hệ.
[C] «which» — Which làm chủ ngữ cho mệnh đề quan hệ không xác định chỉ vật.
[D] «where» — Where chỉ nơi diễn ra sự việc, không thay chủ ngữ chỉ vật.', 2, 106
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=106 AND old.question_text='The prototype, _____ was approved yesterday, is ready to share.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'who' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'that' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'which' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'where' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=106 AND q.question_text='The prototype, _____ was approved yesterday, is ready to share.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The laboratory _____ we hold monthly meetings is being renovated.', '[PHÂN TÍCH]
[A] «who» — Who thay người, không chỉ địa điểm trong mệnh đề.
[B] «where» — Mệnh đề đã có chủ ngữ we và tân ngữ monthly meetings. Where bổ nghĩa địa điểm.
[C] «which» — Dùng which phải có giới từ phù hợp, ví dụ at which.
[D] «whose» — Whose cần danh từ đi sau để diễn đạt sở hữu.', 2, 107
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=107 AND old.question_text='The laboratory _____ we hold monthly meetings is being renovated.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'who' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'where' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'which' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'whose' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=107 AND q.question_text='The laboratory _____ we hold monthly meetings is being renovated.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The engineer _____ design impressed the board received an award.', '[PHÂN TÍCH]
[A] «whose» — Whose + danh từ biểu thị người sở hữu nội dung gây ấn tượng.
[B] «who» — Who thay chủ ngữ chỉ người, nhưng chủ ngữ của impressed ở đây là danh từ ngay sau chỗ trống.
[C] «whom» — Whom chỉ tân ngữ, không biểu thị sở hữu trước danh từ.
[D] «which» — Which chỉ vật và không thay cho từ sở hữu ở đây.', 2, 108
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=108 AND old.question_text='The engineer _____ design impressed the board received an award.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'whose' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'who' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'whom' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'which' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=108 AND q.question_text='The engineer _____ design impressed the board received an award.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The accountant, _____ joined us last month, will speak at the meeting.', '[PHÂN TÍCH]
[A] «where» — Where chỉ nơi chốn, không làm chủ ngữ thay người.
[B] «whose» — Whose chỉ sở hữu và cần danh từ đứng sau.
[C] «that» — Không dùng that trong mệnh đề quan hệ không xác định sau dấu phẩy.
[D] «who» — Sau dấu phẩy, who làm chủ ngữ cho mệnh đề bổ sung thông tin về người.', 2, 109
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=109 AND old.question_text='The accountant, _____ joined us last month, will speak at the meeting.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'where' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'whose' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'that' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'who' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=109 AND q.question_text='The accountant, _____ joined us last month, will speak at the meeting.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The report, _____ was approved yesterday, is ready to share.', '[PHÂN TÍCH]
[A] «that» — That không dùng sau dấu phẩy trong mệnh đề quan hệ.
[B] «who» — Who dùng cho người, còn danh từ đứng trước chỉ vật.
[C] «which» — Which làm chủ ngữ cho mệnh đề quan hệ không xác định chỉ vật.
[D] «where» — Where chỉ nơi diễn ra sự việc, không thay chủ ngữ chỉ vật.', 2, 110
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=110 AND old.question_text='The report, _____ was approved yesterday, is ready to share.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'that' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'who' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'which' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'where' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=110 AND q.question_text='The report, _____ was approved yesterday, is ready to share.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The office _____ we hold monthly meetings is being renovated.', '[PHÂN TÍCH]
[A] «whose» — Whose cần danh từ đi sau để diễn đạt sở hữu.
[B] «who» — Who thay người, không chỉ địa điểm trong mệnh đề.
[C] «which» — Dùng which phải có giới từ phù hợp, ví dụ at which.
[D] «where» — Mệnh đề đã có chủ ngữ we và tân ngữ monthly meetings. Where bổ nghĩa địa điểm.', 2, 111
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=111 AND old.question_text='The office _____ we hold monthly meetings is being renovated.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'whose' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'who' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'which' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'where' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=111 AND q.question_text='The office _____ we hold monthly meetings is being renovated.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The accountant _____ analysis impressed the board received an award.', '[PHÂN TÍCH]
[A] «who» — Who thay chủ ngữ chỉ người, nhưng chủ ngữ của impressed ở đây là danh từ ngay sau chỗ trống.
[B] «which» — Which chỉ vật và không thay cho từ sở hữu ở đây.
[C] «whom» — Whom chỉ tân ngữ, không biểu thị sở hữu trước danh từ.
[D] «whose» — Whose + danh từ biểu thị người sở hữu nội dung gây ấn tượng.', 2, 112
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=112 AND old.question_text='The accountant _____ analysis impressed the board received an award.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'who' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'which' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'whom' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'whose' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=112 AND q.question_text='The accountant _____ analysis impressed the board received an award.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The recruiter, _____ joined us last month, will speak at the meeting.', '[PHÂN TÍCH]
[A] «where» — Where chỉ nơi chốn, không làm chủ ngữ thay người.
[B] «whose» — Whose chỉ sở hữu và cần danh từ đứng sau.
[C] «who» — Sau dấu phẩy, who làm chủ ngữ cho mệnh đề bổ sung thông tin về người.
[D] «that» — Không dùng that trong mệnh đề quan hệ không xác định sau dấu phẩy.', 2, 113
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=113 AND old.question_text='The recruiter, _____ joined us last month, will speak at the meeting.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'where' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'whose' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'who' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'that' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=113 AND q.question_text='The recruiter, _____ joined us last month, will speak at the meeting.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The checklist, _____ was approved yesterday, is ready to share.', '[PHÂN TÍCH]
[A] «where» — Where chỉ nơi diễn ra sự việc, không thay chủ ngữ chỉ vật.
[B] «who» — Who dùng cho người, còn danh từ đứng trước chỉ vật.
[C] «which» — Which làm chủ ngữ cho mệnh đề quan hệ không xác định chỉ vật.
[D] «that» — That không dùng sau dấu phẩy trong mệnh đề quan hệ.', 2, 114
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=114 AND old.question_text='The checklist, _____ was approved yesterday, is ready to share.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'where' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'who' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'which' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'that' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=114 AND q.question_text='The checklist, _____ was approved yesterday, is ready to share.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The training center _____ we hold monthly meetings is being renovated.', '[PHÂN TÍCH]
[A] «whose» — Whose cần danh từ đi sau để diễn đạt sở hữu.
[B] «which» — Dùng which phải có giới từ phù hợp, ví dụ at which.
[C] «who» — Who thay người, không chỉ địa điểm trong mệnh đề.
[D] «where» — Mệnh đề đã có chủ ngữ we và tân ngữ monthly meetings. Where bổ nghĩa địa điểm.', 2, 115
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=115 AND old.question_text='The training center _____ we hold monthly meetings is being renovated.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'whose' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'which' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'who' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'where' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=115 AND q.question_text='The training center _____ we hold monthly meetings is being renovated.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The recruiter _____ schedule impressed the board received an award.', '[PHÂN TÍCH]
[A] «who» — Who thay chủ ngữ chỉ người, nhưng chủ ngữ của impressed ở đây là danh từ ngay sau chỗ trống.
[B] «whose» — Whose + danh từ biểu thị người sở hữu nội dung gây ấn tượng.
[C] «which» — Which chỉ vật và không thay cho từ sở hữu ở đây.
[D] «whom» — Whom chỉ tân ngữ, không biểu thị sở hữu trước danh từ.', 2, 116
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=116 AND old.question_text='The recruiter _____ schedule impressed the board received an award.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'who' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'whose' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'which' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'whom' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=116 AND q.question_text='The recruiter _____ schedule impressed the board received an award.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The designer, _____ joined us last month, will speak at the meeting.', '[PHÂN TÍCH]
[A] «who» — Sau dấu phẩy, who làm chủ ngữ cho mệnh đề bổ sung thông tin về người.
[B] «whose» — Whose chỉ sở hữu và cần danh từ đứng sau.
[C] «where» — Where chỉ nơi chốn, không làm chủ ngữ thay người.
[D] «that» — Không dùng that trong mệnh đề quan hệ không xác định sau dấu phẩy.', 2, 117
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=117 AND old.question_text='The designer, _____ joined us last month, will speak at the meeting.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'who' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'whose' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'where' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'that' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=117 AND q.question_text='The designer, _____ joined us last month, will speak at the meeting.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The catalog, _____ was approved yesterday, is ready to share.', '[PHÂN TÍCH]
[A] «which» — Which làm chủ ngữ cho mệnh đề quan hệ không xác định chỉ vật.
[B] «that» — That không dùng sau dấu phẩy trong mệnh đề quan hệ.
[C] «who» — Who dùng cho người, còn danh từ đứng trước chỉ vật.
[D] «where» — Where chỉ nơi diễn ra sự việc, không thay chủ ngữ chỉ vật.', 2, 118
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=118 AND old.question_text='The catalog, _____ was approved yesterday, is ready to share.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'which' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'that' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'who' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'where' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=118 AND q.question_text='The catalog, _____ was approved yesterday, is ready to share.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The studio _____ we hold monthly meetings is being renovated.', '[PHÂN TÍCH]
[A] «who» — Who thay người, không chỉ địa điểm trong mệnh đề.
[B] «which» — Dùng which phải có giới từ phù hợp, ví dụ at which.
[C] «where» — Mệnh đề đã có chủ ngữ we và tân ngữ monthly meetings. Where bổ nghĩa địa điểm.
[D] «whose» — Whose cần danh từ đi sau để diễn đạt sở hữu.', 2, 119
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=119 AND old.question_text='The studio _____ we hold monthly meetings is being renovated.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'who' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'which' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'where' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'whose' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=119 AND q.question_text='The studio _____ we hold monthly meetings is being renovated.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The designer _____ illustration impressed the board received an award.', '[PHÂN TÍCH]
[A] «whose» — Whose + danh từ biểu thị người sở hữu nội dung gây ấn tượng.
[B] «which» — Which chỉ vật và không thay cho từ sở hữu ở đây.
[C] «who» — Who thay chủ ngữ chỉ người, nhưng chủ ngữ của impressed ở đây là danh từ ngay sau chỗ trống.
[D] «whom» — Whom chỉ tân ngữ, không biểu thị sở hữu trước danh từ.', 2, 120
FROM grammar_lessons l WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=120 AND old.question_text='The designer _____ illustration impressed the board received an award.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'whose' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'which' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'who' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'whom' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Mệnh đề quan hệ (Relative Clauses)' AND q.sort_order=120 AND q.question_text='The designer _____ illustration impressed the board received an award.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);

-- Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)
UPDATE grammar_lessons
SET content_html = CONCAT(REPLACE(content_html, '<section data-n11="lecture">', '<section data-n11="lecture"><h3>Quá trình hay số lượng</h3><p>Hiện tại hoàn thành tiếp diễn nhấn mạnh hoạt động, còn dạng đơn thường phù hợp hơn nếu câu đếm kết quả hoàn thành. Các động từ trạng thái thường dùng dạng đơn.</p>'), '<section data-n11="examples"><article data-example-id="21001" data-order="21"><p class="sentence">The agent has been responding to tickets all afternoon.</p><p class="translation">Nhân viên đã liên tục trả lời yêu cầu hỗ trợ suốt chiều.</p><p class="note">All afternoon cho biết thời lượng làm việc.</p></article></section>')
WHERE title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND content_html LIKE '%<section data-n11="lecture">%' AND content_html NOT LIKE '%data-example-id="21001"%';
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The technician _____ the ventilation system for two hours and is still at it.', '[PHÂN TÍCH]
[A] «has been inspecting» — Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.
[B] «inspecting» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «will inspected» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «has inspecting» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 2, 101
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=101 AND old.question_text='The technician _____ the ventilation system for two hours and is still at it.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'has been inspecting' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will inspected' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has inspecting' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=101 AND q.question_text='The technician _____ the ventilation system for two hours and is still at it.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The clerk has been _____ the travel receipts for two hours and is still at it.', '[PHÂN TÍCH]
[A] «filing» — Đúng cấu trúc Present Perfect Continuous trong câu: chọn filing. Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.
[B] «file» — Dạng file không khớp với trợ động từ has been; ở đây cần filing.
[C] «filed» — Dạng filed không khớp với trợ động từ has been; ở đây cần filing.
[D] «files» — Dạng files không khớp với trợ động từ has been; ở đây cần filing.', 2, 102
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=102 AND old.question_text='The clerk has been _____ the travel receipts for two hours and is still at it.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'filing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'file' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'filed' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'files' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=102 AND q.question_text='The clerk has been _____ the travel receipts for two hours and is still at it.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the analysts been reviewing the sales figures since 9 a.m.?', '[PHÂN TÍCH]
[A] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.
[B] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.
[C] «Will» — Sau will cần have trước cấu trúc hoàn thành.
[D] «Have» — Đúng cấu trúc Present Perfect Continuous trong câu: chọn Have. Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.', 2, 103
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=103 AND old.question_text='_____ the analysts been reviewing the sales figures since 9 a.m.?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Have' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=103 AND q.question_text='_____ the analysts been reviewing the sales figures since 9 a.m.?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Ms. Chen has not _____ the project summary for very long.', '[PHÂN TÍCH]
[A] «been writing» — Đúng cấu trúc Present Perfect Continuous trong câu: chọn been writing. Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.
[B] «write» — Sau has not ở mẫu Present Perfect Continuous, phần còn lại phải là been writing.
[C] «writing» — Sau has not ở mẫu Present Perfect Continuous, phần còn lại phải là been writing.
[D] «wrote» — Sau has not ở mẫu Present Perfect Continuous, phần còn lại phải là been writing.', 2, 104
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=104 AND old.question_text='Ms. Chen has not _____ the project summary for very long.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'been writing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'write' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'writing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'wrote' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=104 AND q.question_text='Ms. Chen has not _____ the project summary for very long.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The contractors _____ the safety equipment for two hours and are still at it.', '[PHÂN TÍCH]
[A] «have been testing» — Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.
[B] «have testing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «testing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[D] «will tested» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.', 2, 105
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=105 AND old.question_text='The contractors _____ the safety equipment for two hours and are still at it.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'have been testing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'have testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'will tested' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=105 AND q.question_text='The contractors _____ the safety equipment for two hours and are still at it.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our staff members have been _____ the returned packages for two hours and are still at it.', '[PHÂN TÍCH]
[A] «to sort» — Dạng to sort không khớp với trợ động từ have been; ở đây cần sorting.
[B] «sorted» — Dạng sorted không khớp với trợ động từ have been; ở đây cần sorting.
[C] «sort» — Dạng sort không khớp với trợ động từ have been; ở đây cần sorting.
[D] «sorting» — Đúng cấu trúc Present Perfect Continuous trong câu: chọn sorting. Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.', 2, 106
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=106 AND old.question_text='Our staff members have been _____ the returned packages for two hours and are still at it.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to sort' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'sorted' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'sort' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'sorting' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=106 AND q.question_text='Our staff members have been _____ the returned packages for two hours and are still at it.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the auditors been checking the payment records since 9 a.m.?', '[PHÂN TÍCH]
[A] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.
[B] «Will» — Sau will cần have trước cấu trúc hoàn thành.
[C] «Have» — Đúng cấu trúc Present Perfect Continuous trong câu: chọn Have. Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.
[D] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.', 2, 107
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=107 AND old.question_text='_____ the auditors been checking the payment records since 9 a.m.?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Have' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=107 AND q.question_text='_____ the auditors been checking the payment records since 9 a.m.?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The designer has not _____ the product labels for very long.', '[PHÂN TÍCH]
[A] «prepared» — Sau has not ở mẫu Present Perfect Continuous, phần còn lại phải là been preparing.
[B] «preparing» — Sau has not ở mẫu Present Perfect Continuous, phần còn lại phải là been preparing.
[C] «prepare» — Sau has not ở mẫu Present Perfect Continuous, phần còn lại phải là been preparing.
[D] «been preparing» — Đúng cấu trúc Present Perfect Continuous trong câu: chọn been preparing. Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.', 2, 108
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=108 AND old.question_text='The designer has not _____ the product labels for very long.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'prepared' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'preparing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'prepare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'been preparing' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=108 AND q.question_text='The designer has not _____ the product labels for very long.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The editor _____ the instruction manual for two hours and is still at it.', '[PHÂN TÍCH]
[A] «has been reading» — Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.
[B] «has reading» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «will reads» — Sau will cần động từ nguyên mẫu read, không dùng reads.
[D] «reading» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.', 2, 109
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=109 AND old.question_text='The editor _____ the instruction manual for two hours and is still at it.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'has been reading' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'has reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will reads' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'reading' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=109 AND q.question_text='The editor _____ the instruction manual for two hours and is still at it.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The interns have been _____ the application forms for two hours and are still at it.', '[PHÂN TÍCH]
[A] «scan» — Dạng scan không khớp với trợ động từ have been; ở đây cần scanning.
[B] «scanning» — Đúng cấu trúc Present Perfect Continuous trong câu: chọn scanning. Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.
[C] «scanned» — Dạng scanned không khớp với trợ động từ have been; ở đây cần scanning.
[D] «to scan» — Dạng to scan không khớp với trợ động từ have been; ở đây cần scanning.', 2, 110
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=110 AND old.question_text='The interns have been _____ the application forms for two hours and are still at it.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'scan' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'scanning' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'scanned' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to scan' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=110 AND q.question_text='The interns have been _____ the application forms for two hours and are still at it.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the supervisor been monitoring the production line since 9 a.m.?', '[PHÂN TÍCH]
[A] «Has» — Đúng cấu trúc Present Perfect Continuous trong câu: chọn Has. Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.
[B] «Will» — Sau will cần have trước cấu trúc hoàn thành.
[C] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.
[D] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.', 2, 111
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=111 AND old.question_text='_____ the supervisor been monitoring the production line since 9 a.m.?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Has' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=111 AND q.question_text='_____ the supervisor been monitoring the production line since 9 a.m.?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The recruiters have not _____ the candidates for very long.', '[PHÂN TÍCH]
[A] «interviewing» — Sau have not ở mẫu Present Perfect Continuous, phần còn lại phải là been interviewing.
[B] «interview» — Sau have not ở mẫu Present Perfect Continuous, phần còn lại phải là been interviewing.
[C] «been interviewing» — Đúng cấu trúc Present Perfect Continuous trong câu: chọn been interviewing. Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.
[D] «interviewed» — Sau have not ở mẫu Present Perfect Continuous, phần còn lại phải là been interviewing.', 2, 112
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=112 AND old.question_text='The recruiters have not _____ the candidates for very long.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'interviewing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'interview' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'been interviewing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'interviewed' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=112 AND q.question_text='The recruiters have not _____ the candidates for very long.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The accountant _____ the shipping costs for two hours and is still at it.', '[PHÂN TÍCH]
[A] «will calculated» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «calculating» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «has calculating» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «has been calculating» — Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.', 2, 113
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=113 AND old.question_text='The accountant _____ the shipping costs for two hours and is still at it.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will calculated' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'has calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has been calculating' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=113 AND q.question_text='The accountant _____ the shipping costs for two hours and is still at it.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our engineers have been _____ the demonstration unit for two hours and are still at it.', '[PHÂN TÍCH]
[A] «built» — Dạng built không khớp với trợ động từ have been; ở đây cần building.
[B] «to build» — Dạng to build không khớp với trợ động từ have been; ở đây cần building.
[C] «build» — Dạng build không khớp với trợ động từ have been; ở đây cần building.
[D] «building» — Đúng cấu trúc Present Perfect Continuous trong câu: chọn building. Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.', 2, 114
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=114 AND old.question_text='Our engineers have been _____ the demonstration unit for two hours and are still at it.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'built' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'building' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=114 AND q.question_text='Our engineers have been _____ the demonstration unit for two hours and are still at it.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the manager been updating the delivery schedule since 9 a.m.?', '[PHÂN TÍCH]
[A] «Has» — Đúng cấu trúc Present Perfect Continuous trong câu: chọn Has. Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.
[B] «Will» — Sau will cần have trước cấu trúc hoàn thành.
[C] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.
[D] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.', 2, 115
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=115 AND old.question_text='_____ the manager been updating the delivery schedule since 9 a.m.?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Has' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=115 AND q.question_text='_____ the manager been updating the delivery schedule since 9 a.m.?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The operators have not _____ the water temperature for very long.', '[PHÂN TÍCH]
[A] «measuring» — Sau have not ở mẫu Present Perfect Continuous, phần còn lại phải là been measuring.
[B] «been measuring» — Đúng cấu trúc Present Perfect Continuous trong câu: chọn been measuring. Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.
[C] «measured» — Sau have not ở mẫu Present Perfect Continuous, phần còn lại phải là been measuring.
[D] «measure» — Sau have not ở mẫu Present Perfect Continuous, phần còn lại phải là been measuring.', 2, 116
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=116 AND old.question_text='The operators have not _____ the water temperature for very long.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'measuring' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'been measuring' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'measured' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'measure' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=116 AND q.question_text='The operators have not _____ the water temperature for very long.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The assistant _____ the training materials for two hours and is still at it.', '[PHÂN TÍCH]
[A] «organizing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «will organized» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[C] «has organizing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «has been organizing» — Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.', 2, 117
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=117 AND old.question_text='The assistant _____ the training materials for two hours and is still at it.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will organized' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'has organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has been organizing' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=117 AND q.question_text='The assistant _____ the training materials for two hours and is still at it.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The consultants have been _____ the suppliers for two hours and are still at it.', '[PHÂN TÍCH]
[A] «compare» — Dạng compare không khớp với trợ động từ have been; ở đây cần comparing.
[B] «comparing» — Đúng cấu trúc Present Perfect Continuous trong câu: chọn comparing. Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.
[C] «compared» — Dạng compared không khớp với trợ động từ have been; ở đây cần comparing.
[D] «to compare» — Dạng to compare không khớp với trợ động từ have been; ở đây cần comparing.', 2, 118
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=118 AND old.question_text='The consultants have been _____ the suppliers for two hours and are still at it.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'compare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'comparing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'compared' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to compare' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=118 AND q.question_text='The consultants have been _____ the suppliers for two hours and are still at it.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the researcher been collecting the survey responses since 9 a.m.?', '[PHÂN TÍCH]
[A] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.
[B] «Has» — Đúng cấu trúc Present Perfect Continuous trong câu: chọn Has. Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.
[C] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.
[D] «Will» — Sau will cần have trước cấu trúc hoàn thành.', 2, 119
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=119 AND old.question_text='_____ the researcher been collecting the survey responses since 9 a.m.?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Has' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=119 AND q.question_text='_____ the researcher been collecting the survey responses since 9 a.m.?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The developers have not _____ the changes for very long.', '[PHÂN TÍCH]
[A] «documenting» — Sau have not ở mẫu Present Perfect Continuous, phần còn lại phải là been documenting.
[B] «been documenting» — Đúng cấu trúc Present Perfect Continuous trong câu: chọn been documenting. Công việc kéo dài hai giờ và vẫn tiếp diễn; dùng have/has been + V-ing.
[C] «document» — Sau have not ở mẫu Present Perfect Continuous, phần còn lại phải là been documenting.
[D] «documented» — Sau have not ở mẫu Present Perfect Continuous, phần còn lại phải là been documenting.', 2, 120
FROM grammar_lessons l WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=120 AND old.question_text='The developers have not _____ the changes for very long.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'documenting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'been documenting' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'document' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'documented' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)' AND q.sort_order=120 AND q.question_text='The developers have not _____ the changes for very long.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);

-- Quá khứ tiếp diễn (Past Continuous)
UPDATE grammar_lessons
SET content_html = CONCAT(REPLACE(content_html, '<section data-n11="lecture">', '<section data-n11="lecture"><h3>Hành động làm nền</h3><p>While thường đưa vào một hành động đang diễn ra. Với việc xảy ra chen ngang, dùng quá khứ đơn cho sự kiện và quá khứ tiếp diễn cho phần nền.</p>'), '<section data-n11="examples"><article data-example-id="21001" data-order="21"><p class="sentence">I was printing the badge when the visitor arrived.</p><p class="translation">Tôi đang in thẻ thì khách đến.</p><p class="note">Was printing làm nền, arrived là sự kiện.</p></article></section>')
WHERE title = 'Quá khứ tiếp diễn (Past Continuous)' AND content_html LIKE '%<section data-n11="lecture">%' AND content_html NOT LIKE '%data-example-id="21001"%';
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The technician _____ the ventilation system when the fire alarm rang.', '[PHÂN TÍCH]
[A] «inspecting» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «will inspected» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[C] «has inspecting» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «was inspecting» — Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.', 1, 101
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=101 AND old.question_text='The technician _____ the ventilation system when the fire alarm rang.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will inspected' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'has inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'was inspecting' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=101 AND q.question_text='The technician _____ the ventilation system when the fire alarm rang.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The clerk was _____ the travel receipts when the fire alarm rang.', '[PHÂN TÍCH]
[A] «file» — Dạng file không khớp với trợ động từ was; ở đây cần filing.
[B] «files» — Dạng files không khớp với trợ động từ was; ở đây cần filing.
[C] «filing» — Đúng cấu trúc Past Continuous trong câu: chọn filing. Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.
[D] «filed» — Dạng filed không khớp với trợ động từ was; ở đây cần filing.', 1, 102
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=102 AND old.question_text='The clerk was _____ the travel receipts when the fire alarm rang.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'file' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'files' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'filing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'filed' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=102 AND q.question_text='The clerk was _____ the travel receipts when the fire alarm rang.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the analysts reviewing the sales figures when the fire alarm rang?', '[PHÂN TÍCH]
[A] «Were» — Đúng cấu trúc Past Continuous trong câu: chọn Were. Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.
[B] «Was» — Trợ động từ be không hòa hợp số với chủ ngữ.
[C] «Does» — Does phải đi với nguyên mẫu chứ không phải V-ing.
[D] «Has» — Has không đi trực tiếp với V-ing.', 1, 103
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=103 AND old.question_text='_____ the analysts reviewing the sales figures when the fire alarm rang?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Were' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=103 AND q.question_text='_____ the analysts reviewing the sales figures when the fire alarm rang?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Ms. Chen was not _____ the project summary when the fire alarm rang.', '[PHÂN TÍCH]
[A] «write» — Sau was not ở mẫu Past Continuous, phần còn lại phải là writing.
[B] «wrote» — Sau was not ở mẫu Past Continuous, phần còn lại phải là writing.
[C] «writing» — Đúng cấu trúc Past Continuous trong câu: chọn writing. Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.
[D] «to write» — Sau was not ở mẫu Past Continuous, phần còn lại phải là writing.', 1, 104
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=104 AND old.question_text='Ms. Chen was not _____ the project summary when the fire alarm rang.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'write' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'wrote' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'writing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to write' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=104 AND q.question_text='Ms. Chen was not _____ the project summary when the fire alarm rang.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The contractors _____ the safety equipment when the fire alarm rang.', '[PHÂN TÍCH]
[A] «were testing» — Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.
[B] «will tested» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[C] «testing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[D] «have testing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 1, 105
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=105 AND old.question_text='The contractors _____ the safety equipment when the fire alarm rang.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'were testing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will tested' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'have testing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=105 AND q.question_text='The contractors _____ the safety equipment when the fire alarm rang.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our staff members were _____ the returned packages when the fire alarm rang.', '[PHÂN TÍCH]
[A] «sort» — Dạng sort không khớp với trợ động từ were; ở đây cần sorting.
[B] «to sort» — Dạng to sort không khớp với trợ động từ were; ở đây cần sorting.
[C] «sorting» — Đúng cấu trúc Past Continuous trong câu: chọn sorting. Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.
[D] «sorted» — Dạng sorted không khớp với trợ động từ were; ở đây cần sorting.', 1, 106
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=106 AND old.question_text='Our staff members were _____ the returned packages when the fire alarm rang.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'sort' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to sort' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'sorting' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'sorted' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=106 AND q.question_text='Our staff members were _____ the returned packages when the fire alarm rang.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the auditors checking the payment records when the fire alarm rang?', '[PHÂN TÍCH]
[A] «Was» — Trợ động từ be không hòa hợp số với chủ ngữ.
[B] «Has» — Has không đi trực tiếp với V-ing.
[C] «Does» — Does phải đi với nguyên mẫu chứ không phải V-ing.
[D] «Were» — Đúng cấu trúc Past Continuous trong câu: chọn Were. Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.', 1, 107
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=107 AND old.question_text='_____ the auditors checking the payment records when the fire alarm rang?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Were' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=107 AND q.question_text='_____ the auditors checking the payment records when the fire alarm rang?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The designer was not _____ the product labels when the fire alarm rang.', '[PHÂN TÍCH]
[A] «prepared» — Sau was not ở mẫu Past Continuous, phần còn lại phải là preparing.
[B] «preparing» — Đúng cấu trúc Past Continuous trong câu: chọn preparing. Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.
[C] «prepare» — Sau was not ở mẫu Past Continuous, phần còn lại phải là preparing.
[D] «to prepare» — Sau was not ở mẫu Past Continuous, phần còn lại phải là preparing.', 1, 108
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=108 AND old.question_text='The designer was not _____ the product labels when the fire alarm rang.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'prepared' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'preparing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'prepare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to prepare' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=108 AND q.question_text='The designer was not _____ the product labels when the fire alarm rang.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The editor _____ the instruction manual when the fire alarm rang.', '[PHÂN TÍCH]
[A] «will reads» — Sau will cần động từ nguyên mẫu read, không dùng reads.
[B] «has reading» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «was reading» — Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.
[D] «reading» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.', 1, 109
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=109 AND old.question_text='The editor _____ the instruction manual when the fire alarm rang.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will reads' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'has reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'was reading' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'reading' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=109 AND q.question_text='The editor _____ the instruction manual when the fire alarm rang.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The interns were _____ the application forms when the fire alarm rang.', '[PHÂN TÍCH]
[A] «to scan» — Dạng to scan không khớp với trợ động từ were; ở đây cần scanning.
[B] «scanning» — Đúng cấu trúc Past Continuous trong câu: chọn scanning. Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.
[C] «scanned» — Dạng scanned không khớp với trợ động từ were; ở đây cần scanning.
[D] «scan» — Dạng scan không khớp với trợ động từ were; ở đây cần scanning.', 1, 110
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=110 AND old.question_text='The interns were _____ the application forms when the fire alarm rang.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to scan' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'scanning' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'scanned' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'scan' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=110 AND q.question_text='The interns were _____ the application forms when the fire alarm rang.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the supervisor monitoring the production line when the fire alarm rang?', '[PHÂN TÍCH]
[A] «Has» — Has không đi trực tiếp với V-ing.
[B] «Was» — Đúng cấu trúc Past Continuous trong câu: chọn Was. Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.
[C] «Were» — Trợ động từ be không hòa hợp số với chủ ngữ.
[D] «Does» — Does phải đi với nguyên mẫu chứ không phải V-ing.', 1, 111
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=111 AND old.question_text='_____ the supervisor monitoring the production line when the fire alarm rang?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Was' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Were' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=111 AND q.question_text='_____ the supervisor monitoring the production line when the fire alarm rang?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The recruiters were not _____ the candidates when the fire alarm rang.', '[PHÂN TÍCH]
[A] «interview» — Sau were not ở mẫu Past Continuous, phần còn lại phải là interviewing.
[B] «to interview» — Sau were not ở mẫu Past Continuous, phần còn lại phải là interviewing.
[C] «interviewing» — Đúng cấu trúc Past Continuous trong câu: chọn interviewing. Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.
[D] «interviewed» — Sau were not ở mẫu Past Continuous, phần còn lại phải là interviewing.', 1, 112
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=112 AND old.question_text='The recruiters were not _____ the candidates when the fire alarm rang.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'interview' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to interview' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'interviewing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'interviewed' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=112 AND q.question_text='The recruiters were not _____ the candidates when the fire alarm rang.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The accountant _____ the shipping costs when the fire alarm rang.', '[PHÂN TÍCH]
[A] «will calculated» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «was calculating» — Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.
[C] «calculating» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[D] «has calculating» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 1, 113
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=113 AND old.question_text='The accountant _____ the shipping costs when the fire alarm rang.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will calculated' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'was calculating' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has calculating' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=113 AND q.question_text='The accountant _____ the shipping costs when the fire alarm rang.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our engineers were _____ the demonstration unit when the fire alarm rang.', '[PHÂN TÍCH]
[A] «built» — Dạng built không khớp với trợ động từ were; ở đây cần building.
[B] «build» — Dạng build không khớp với trợ động từ were; ở đây cần building.
[C] «to build» — Dạng to build không khớp với trợ động từ were; ở đây cần building.
[D] «building» — Đúng cấu trúc Past Continuous trong câu: chọn building. Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.', 1, 114
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=114 AND old.question_text='Our engineers were _____ the demonstration unit when the fire alarm rang.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'built' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'building' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=114 AND q.question_text='Our engineers were _____ the demonstration unit when the fire alarm rang.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the manager updating the delivery schedule when the fire alarm rang?', '[PHÂN TÍCH]
[A] «Has» — Has không đi trực tiếp với V-ing.
[B] «Does» — Does phải đi với nguyên mẫu chứ không phải V-ing.
[C] «Were» — Trợ động từ be không hòa hợp số với chủ ngữ.
[D] «Was» — Đúng cấu trúc Past Continuous trong câu: chọn Was. Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.', 1, 115
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=115 AND old.question_text='_____ the manager updating the delivery schedule when the fire alarm rang?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Were' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Was' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=115 AND q.question_text='_____ the manager updating the delivery schedule when the fire alarm rang?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The operators were not _____ the water temperature when the fire alarm rang.', '[PHÂN TÍCH]
[A] «measuring» — Đúng cấu trúc Past Continuous trong câu: chọn measuring. Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.
[B] «measure» — Sau were not ở mẫu Past Continuous, phần còn lại phải là measuring.
[C] «to measure» — Sau were not ở mẫu Past Continuous, phần còn lại phải là measuring.
[D] «measured» — Sau were not ở mẫu Past Continuous, phần còn lại phải là measuring.', 1, 116
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=116 AND old.question_text='The operators were not _____ the water temperature when the fire alarm rang.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'measuring' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'measure' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to measure' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'measured' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=116 AND q.question_text='The operators were not _____ the water temperature when the fire alarm rang.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The assistant _____ the training materials when the fire alarm rang.', '[PHÂN TÍCH]
[A] «was organizing» — Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.
[B] «organizing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «will organized» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «has organizing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 1, 117
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=117 AND old.question_text='The assistant _____ the training materials when the fire alarm rang.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'was organizing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will organized' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has organizing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=117 AND q.question_text='The assistant _____ the training materials when the fire alarm rang.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The consultants were _____ the suppliers when the fire alarm rang.', '[PHÂN TÍCH]
[A] «comparing» — Đúng cấu trúc Past Continuous trong câu: chọn comparing. Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.
[B] «compare» — Dạng compare không khớp với trợ động từ were; ở đây cần comparing.
[C] «compared» — Dạng compared không khớp với trợ động từ were; ở đây cần comparing.
[D] «to compare» — Dạng to compare không khớp với trợ động từ were; ở đây cần comparing.', 1, 118
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=118 AND old.question_text='The consultants were _____ the suppliers when the fire alarm rang.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'comparing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'compare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'compared' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to compare' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=118 AND q.question_text='The consultants were _____ the suppliers when the fire alarm rang.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the researcher collecting the survey responses when the fire alarm rang?', '[PHÂN TÍCH]
[A] «Does» — Does phải đi với nguyên mẫu chứ không phải V-ing.
[B] «Has» — Has không đi trực tiếp với V-ing.
[C] «Were» — Trợ động từ be không hòa hợp số với chủ ngữ.
[D] «Was» — Đúng cấu trúc Past Continuous trong câu: chọn Was. Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.', 1, 119
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=119 AND old.question_text='_____ the researcher collecting the survey responses when the fire alarm rang?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Does' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Were' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Was' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=119 AND q.question_text='_____ the researcher collecting the survey responses when the fire alarm rang?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The developers were not _____ the changes when the fire alarm rang.', '[PHÂN TÍCH]
[A] «documented» — Sau were not ở mẫu Past Continuous, phần còn lại phải là documenting.
[B] «document» — Sau were not ở mẫu Past Continuous, phần còn lại phải là documenting.
[C] «to document» — Sau were not ở mẫu Past Continuous, phần còn lại phải là documenting.
[D] «documenting» — Đúng cấu trúc Past Continuous trong câu: chọn documenting. Hành động đang diễn ra thì chuông báo cháy reo; dùng was/were + V-ing làm nền.', 1, 120
FROM grammar_lessons l WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=120 AND old.question_text='The developers were not _____ the changes when the fire alarm rang.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'documented' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'document' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to document' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'documenting' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ tiếp diễn (Past Continuous)' AND q.sort_order=120 AND q.question_text='The developers were not _____ the changes when the fire alarm rang.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);

-- Quá khứ hoàn thành (Past Perfect)
UPDATE grammar_lessons
SET content_html = CONCAT(REPLACE(content_html, '<section data-n11="lecture">', '<section data-n11="lecture"><h3>Xác định mốc trước và sau</h3><p>By the time đưa vào mốc tham chiếu. Nếu mốc đó nằm trong quá khứ, had + V3 làm rõ việc đã hoàn thành trước đó.</p>'), '<section data-n11="examples"><article data-example-id="21001" data-order="21"><p class="sentence">By the time we called, the supplier had shipped the order.</p><p class="translation">Khi chúng tôi gọi, nhà cung cấp đã gửi hàng đi.</p><p class="note">Việc gửi hàng hoàn tất trước cuộc gọi.</p></article></section>')
WHERE title = 'Quá khứ hoàn thành (Past Perfect)' AND content_html LIKE '%<section data-n11="lecture">%' AND content_html NOT LIKE '%data-example-id="21001"%';
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The technician _____ the ventilation system before the office closed yesterday.', '[PHÂN TÍCH]
[A] «had inspected» — Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.
[B] «has inspecting» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «inspecting» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[D] «will inspected» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.', 2, 101
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=101 AND old.question_text='The technician _____ the ventilation system before the office closed yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'had inspected' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'has inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'will inspected' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=101 AND q.question_text='The technician _____ the ventilation system before the office closed yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The clerk had _____ the travel receipts before the office closed yesterday.', '[PHÂN TÍCH]
[A] «filing» — Dạng filing không khớp với trợ động từ had; ở đây cần filed.
[B] «file» — Dạng file không khớp với trợ động từ had; ở đây cần filed.
[C] «filed» — Đúng cấu trúc Past Perfect trong câu: chọn filed. Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.
[D] «files» — Dạng files không khớp với trợ động từ had; ở đây cần filed.', 2, 102
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=102 AND old.question_text='The clerk had _____ the travel receipts before the office closed yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'filing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'file' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'filed' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'files' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=102 AND q.question_text='The clerk had _____ the travel receipts before the office closed yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the analysts reviewed the sales figures before the office closed yesterday?', '[PHÂN TÍCH]
[A] «Had» — Đúng cấu trúc Past Perfect trong câu: chọn Had. Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.
[B] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.
[C] «Will» — Sau will cần have trước cấu trúc hoàn thành.
[D] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.', 2, 103
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=103 AND old.question_text='_____ the analysts reviewed the sales figures before the office closed yesterday?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Had' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=103 AND q.question_text='_____ the analysts reviewed the sales figures before the office closed yesterday?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Ms. Chen had not _____ the project summary before the office closed yesterday.', '[PHÂN TÍCH]
[A] «written» — Đúng cấu trúc Past Perfect trong câu: chọn written. Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.
[B] «writing» — Sau had not ở mẫu Past Perfect, phần còn lại phải là written.
[C] «write» — Sau had not ở mẫu Past Perfect, phần còn lại phải là written.
[D] «wrote» — Sau had not ở mẫu Past Perfect, phần còn lại phải là written.', 2, 104
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=104 AND old.question_text='Ms. Chen had not _____ the project summary before the office closed yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'written' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'writing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'write' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'wrote' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=104 AND q.question_text='Ms. Chen had not _____ the project summary before the office closed yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The contractors _____ the safety equipment before the office closed yesterday.', '[PHÂN TÍCH]
[A] «will tested» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «testing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «have testing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «had tested» — Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.', 2, 105
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=105 AND old.question_text='The contractors _____ the safety equipment before the office closed yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will tested' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'have testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'had tested' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=105 AND q.question_text='The contractors _____ the safety equipment before the office closed yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our staff members had _____ the returned packages before the office closed yesterday.', '[PHÂN TÍCH]
[A] «sorted» — Đúng cấu trúc Past Perfect trong câu: chọn sorted. Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.
[B] «sorting» — Dạng sorting không khớp với trợ động từ had; ở đây cần sorted.
[C] «sort» — Dạng sort không khớp với trợ động từ had; ở đây cần sorted.
[D] «to sort» — Dạng to sort không khớp với trợ động từ had; ở đây cần sorted.', 2, 106
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=106 AND old.question_text='Our staff members had _____ the returned packages before the office closed yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'sorted' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'sorting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'sort' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to sort' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=106 AND q.question_text='Our staff members had _____ the returned packages before the office closed yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the auditors checked the payment records before the office closed yesterday?', '[PHÂN TÍCH]
[A] «Had» — Đúng cấu trúc Past Perfect trong câu: chọn Had. Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.
[B] «Will» — Sau will cần have trước cấu trúc hoàn thành.
[C] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.
[D] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.', 2, 107
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=107 AND old.question_text='_____ the auditors checked the payment records before the office closed yesterday?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Had' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=107 AND q.question_text='_____ the auditors checked the payment records before the office closed yesterday?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The designer had not _____ the product labels before the office closed yesterday.', '[PHÂN TÍCH]
[A] «prepared» — Đúng cấu trúc Past Perfect trong câu: chọn prepared. Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.
[B] «to prepare» — Sau had not ở mẫu Past Perfect, phần còn lại phải là prepared.
[C] «preparing» — Sau had not ở mẫu Past Perfect, phần còn lại phải là prepared.
[D] «prepare» — Sau had not ở mẫu Past Perfect, phần còn lại phải là prepared.', 2, 108
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=108 AND old.question_text='The designer had not _____ the product labels before the office closed yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'prepared' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to prepare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'preparing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'prepare' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=108 AND q.question_text='The designer had not _____ the product labels before the office closed yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The editor _____ the instruction manual before the office closed yesterday.', '[PHÂN TÍCH]
[A] «will reads» — Sau will cần động từ nguyên mẫu read, không dùng reads.
[B] «reading» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «had read» — Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.
[D] «has reading» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 2, 109
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=109 AND old.question_text='The editor _____ the instruction manual before the office closed yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will reads' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'had read' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has reading' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=109 AND q.question_text='The editor _____ the instruction manual before the office closed yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The interns had _____ the application forms before the office closed yesterday.', '[PHÂN TÍCH]
[A] «scan» — Dạng scan không khớp với trợ động từ had; ở đây cần scanned.
[B] «scanning» — Dạng scanning không khớp với trợ động từ had; ở đây cần scanned.
[C] «scanned» — Đúng cấu trúc Past Perfect trong câu: chọn scanned. Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.
[D] «to scan» — Dạng to scan không khớp với trợ động từ had; ở đây cần scanned.', 2, 110
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=110 AND old.question_text='The interns had _____ the application forms before the office closed yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'scan' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'scanning' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'scanned' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to scan' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=110 AND q.question_text='The interns had _____ the application forms before the office closed yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the supervisor monitored the production line before the office closed yesterday?', '[PHÂN TÍCH]
[A] «Will» — Sau will cần have trước cấu trúc hoàn thành.
[B] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.
[C] «Had» — Đúng cấu trúc Past Perfect trong câu: chọn Had. Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.
[D] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.', 2, 111
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=111 AND old.question_text='_____ the supervisor monitored the production line before the office closed yesterday?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Had' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=111 AND q.question_text='_____ the supervisor monitored the production line before the office closed yesterday?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The recruiters had not _____ the candidates before the office closed yesterday.', '[PHÂN TÍCH]
[A] «to interview» — Sau had not ở mẫu Past Perfect, phần còn lại phải là interviewed.
[B] «interview» — Sau had not ở mẫu Past Perfect, phần còn lại phải là interviewed.
[C] «interviewed» — Đúng cấu trúc Past Perfect trong câu: chọn interviewed. Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.
[D] «interviewing» — Sau had not ở mẫu Past Perfect, phần còn lại phải là interviewed.', 2, 112
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=112 AND old.question_text='The recruiters had not _____ the candidates before the office closed yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to interview' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'interview' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'interviewed' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'interviewing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=112 AND q.question_text='The recruiters had not _____ the candidates before the office closed yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The accountant _____ the shipping costs before the office closed yesterday.', '[PHÂN TÍCH]
[A] «calculating» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «will calculated» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[C] «has calculating» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «had calculated» — Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.', 2, 113
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=113 AND old.question_text='The accountant _____ the shipping costs before the office closed yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will calculated' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'has calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'had calculated' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=113 AND q.question_text='The accountant _____ the shipping costs before the office closed yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our engineers had _____ the demonstration unit before the office closed yesterday.', '[PHÂN TÍCH]
[A] «built» — Đúng cấu trúc Past Perfect trong câu: chọn built. Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.
[B] «to build» — Dạng to build không khớp với trợ động từ had; ở đây cần built.
[C] «build» — Dạng build không khớp với trợ động từ had; ở đây cần built.
[D] «building» — Dạng building không khớp với trợ động từ had; ở đây cần built.', 2, 114
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=114 AND old.question_text='Our engineers had _____ the demonstration unit before the office closed yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'built' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'building' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=114 AND q.question_text='Our engineers had _____ the demonstration unit before the office closed yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the manager updated the delivery schedule before the office closed yesterday?', '[PHÂN TÍCH]
[A] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.
[B] «Had» — Đúng cấu trúc Past Perfect trong câu: chọn Had. Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.
[C] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.
[D] «Will» — Sau will cần have trước cấu trúc hoàn thành.', 2, 115
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=115 AND old.question_text='_____ the manager updated the delivery schedule before the office closed yesterday?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Had' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=115 AND q.question_text='_____ the manager updated the delivery schedule before the office closed yesterday?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The operators had not _____ the water temperature before the office closed yesterday.', '[PHÂN TÍCH]
[A] «measuring» — Sau had not ở mẫu Past Perfect, phần còn lại phải là measured.
[B] «measured» — Đúng cấu trúc Past Perfect trong câu: chọn measured. Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.
[C] «measure» — Sau had not ở mẫu Past Perfect, phần còn lại phải là measured.
[D] «to measure» — Sau had not ở mẫu Past Perfect, phần còn lại phải là measured.', 2, 116
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=116 AND old.question_text='The operators had not _____ the water temperature before the office closed yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'measuring' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'measured' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'measure' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to measure' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=116 AND q.question_text='The operators had not _____ the water temperature before the office closed yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The assistant _____ the training materials before the office closed yesterday.', '[PHÂN TÍCH]
[A] «organizing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «had organized» — Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.
[C] «will organized» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «has organizing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 2, 117
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=117 AND old.question_text='The assistant _____ the training materials before the office closed yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'had organized' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will organized' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has organizing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=117 AND q.question_text='The assistant _____ the training materials before the office closed yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The consultants had _____ the suppliers before the office closed yesterday.', '[PHÂN TÍCH]
[A] «to compare» — Dạng to compare không khớp với trợ động từ had; ở đây cần compared.
[B] «compared» — Đúng cấu trúc Past Perfect trong câu: chọn compared. Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.
[C] «comparing» — Dạng comparing không khớp với trợ động từ had; ở đây cần compared.
[D] «compare» — Dạng compare không khớp với trợ động từ had; ở đây cần compared.', 2, 118
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=118 AND old.question_text='The consultants had _____ the suppliers before the office closed yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to compare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'compared' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'comparing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'compare' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=118 AND q.question_text='The consultants had _____ the suppliers before the office closed yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the researcher collected the survey responses before the office closed yesterday?', '[PHÂN TÍCH]
[A] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.
[B] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.
[C] «Will» — Sau will cần have trước cấu trúc hoàn thành.
[D] «Had» — Đúng cấu trúc Past Perfect trong câu: chọn Had. Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.', 2, 119
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=119 AND old.question_text='_____ the researcher collected the survey responses before the office closed yesterday?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Had' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=119 AND q.question_text='_____ the researcher collected the survey responses before the office closed yesterday?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The developers had not _____ the changes before the office closed yesterday.', '[PHÂN TÍCH]
[A] «documenting» — Sau had not ở mẫu Past Perfect, phần còn lại phải là documented.
[B] «to document» — Sau had not ở mẫu Past Perfect, phần còn lại phải là documented.
[C] «document» — Sau had not ở mẫu Past Perfect, phần còn lại phải là documented.
[D] «documented» — Đúng cấu trúc Past Perfect trong câu: chọn documented. Việc này hoàn tất trước mốc văn phòng đóng cửa trong quá khứ; dùng had + V3 để làm rõ thứ tự.', 2, 120
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=120 AND old.question_text='The developers had not _____ the changes before the office closed yesterday.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'documenting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to document' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'document' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'documented' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành (Past Perfect)' AND q.sort_order=120 AND q.question_text='The developers had not _____ the changes before the office closed yesterday.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);

-- Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)
UPDATE grammar_lessons
SET content_html = CONCAT(REPLACE(content_html, '<section data-n11="lecture">', '<section data-n11="lecture"><h3>Thời lượng trước mốc quá khứ</h3><p>Dùng had been + V-ing khi muốn cho biết quá trình kéo dài bao lâu hoặc giải thích một trạng thái ở quá khứ.</p>'), '<section data-n11="examples"><article data-example-id="21001" data-order="21"><p class="sentence">The fans were warm because they had been running all day.</p><p class="translation">Các quạt nóng vì đã chạy suốt ngày.</p><p class="note">Quá trình chạy giải thích trạng thái warm.</p></article></section>')
WHERE title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND content_html LIKE '%<section data-n11="lecture">%' AND content_html NOT LIKE '%data-example-id="21001"%';
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The technician _____ the ventilation system for an hour before the power went out.', '[PHÂN TÍCH]
[A] «will inspected» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «has inspecting» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «had been inspecting» — Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.
[D] «inspecting» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.', 2, 101
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=101 AND old.question_text='The technician _____ the ventilation system for an hour before the power went out.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will inspected' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'has inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'had been inspecting' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'inspecting' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=101 AND q.question_text='The technician _____ the ventilation system for an hour before the power went out.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The clerk had been _____ the travel receipts for an hour before the power went out.', '[PHÂN TÍCH]
[A] «filing» — Đúng cấu trúc Past Perfect Continuous trong câu: chọn filing. Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.
[B] «filed» — Dạng filed không khớp với trợ động từ had been; ở đây cần filing.
[C] «file» — Dạng file không khớp với trợ động từ had been; ở đây cần filing.
[D] «files» — Dạng files không khớp với trợ động từ had been; ở đây cần filing.', 2, 102
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=102 AND old.question_text='The clerk had been _____ the travel receipts for an hour before the power went out.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'filing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'filed' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'file' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'files' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=102 AND q.question_text='The clerk had been _____ the travel receipts for an hour before the power went out.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the analysts been reviewing the sales figures for an hour before the power went out?', '[PHÂN TÍCH]
[A] «Will» — Sau will cần have trước cấu trúc hoàn thành.
[B] «Had» — Đúng cấu trúc Past Perfect Continuous trong câu: chọn Had. Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.
[C] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.
[D] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.', 2, 103
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=103 AND old.question_text='_____ the analysts been reviewing the sales figures for an hour before the power went out?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Had' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=103 AND q.question_text='_____ the analysts been reviewing the sales figures for an hour before the power went out?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Ms. Chen had not _____ the project summary for an hour before the power went out.', '[PHÂN TÍCH]
[A] «been writing» — Đúng cấu trúc Past Perfect Continuous trong câu: chọn been writing. Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.
[B] «write» — Sau had not ở mẫu Past Perfect Continuous, phần còn lại phải là been writing.
[C] «wrote» — Sau had not ở mẫu Past Perfect Continuous, phần còn lại phải là been writing.
[D] «writing» — Sau had not ở mẫu Past Perfect Continuous, phần còn lại phải là been writing.', 2, 104
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=104 AND old.question_text='Ms. Chen had not _____ the project summary for an hour before the power went out.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'been writing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'write' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'wrote' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'writing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=104 AND q.question_text='Ms. Chen had not _____ the project summary for an hour before the power went out.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The contractors _____ the safety equipment for an hour before the power went out.', '[PHÂN TÍCH]
[A] «had been testing» — Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.
[B] «testing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «will tested» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «have testing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 2, 105
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=105 AND old.question_text='The contractors _____ the safety equipment for an hour before the power went out.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'had been testing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will tested' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'have testing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=105 AND q.question_text='The contractors _____ the safety equipment for an hour before the power went out.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our staff members had been _____ the returned packages for an hour before the power went out.', '[PHÂN TÍCH]
[A] «sorting» — Đúng cấu trúc Past Perfect Continuous trong câu: chọn sorting. Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.
[B] «to sort» — Dạng to sort không khớp với trợ động từ had been; ở đây cần sorting.
[C] «sort» — Dạng sort không khớp với trợ động từ had been; ở đây cần sorting.
[D] «sorted» — Dạng sorted không khớp với trợ động từ had been; ở đây cần sorting.', 2, 106
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=106 AND old.question_text='Our staff members had been _____ the returned packages for an hour before the power went out.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'sorting' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to sort' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'sort' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'sorted' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=106 AND q.question_text='Our staff members had been _____ the returned packages for an hour before the power went out.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the auditors been checking the payment records for an hour before the power went out?', '[PHÂN TÍCH]
[A] «Will» — Sau will cần have trước cấu trúc hoàn thành.
[B] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.
[C] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.
[D] «Had» — Đúng cấu trúc Past Perfect Continuous trong câu: chọn Had. Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.', 2, 107
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=107 AND old.question_text='_____ the auditors been checking the payment records for an hour before the power went out?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Had' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=107 AND q.question_text='_____ the auditors been checking the payment records for an hour before the power went out?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The designer had not _____ the product labels for an hour before the power went out.', '[PHÂN TÍCH]
[A] «prepared» — Sau had not ở mẫu Past Perfect Continuous, phần còn lại phải là been preparing.
[B] «prepare» — Sau had not ở mẫu Past Perfect Continuous, phần còn lại phải là been preparing.
[C] «preparing» — Sau had not ở mẫu Past Perfect Continuous, phần còn lại phải là been preparing.
[D] «been preparing» — Đúng cấu trúc Past Perfect Continuous trong câu: chọn been preparing. Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.', 2, 108
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=108 AND old.question_text='The designer had not _____ the product labels for an hour before the power went out.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'prepared' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'prepare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'preparing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'been preparing' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=108 AND q.question_text='The designer had not _____ the product labels for an hour before the power went out.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The editor _____ the instruction manual for an hour before the power went out.', '[PHÂN TÍCH]
[A] «has reading» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[B] «will reads» — Sau will cần động từ nguyên mẫu read, không dùng reads.
[C] «reading» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[D] «had been reading» — Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.', 2, 109
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=109 AND old.question_text='The editor _____ the instruction manual for an hour before the power went out.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'has reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will reads' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'had been reading' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=109 AND q.question_text='The editor _____ the instruction manual for an hour before the power went out.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The interns had been _____ the application forms for an hour before the power went out.', '[PHÂN TÍCH]
[A] «to scan» — Dạng to scan không khớp với trợ động từ had been; ở đây cần scanning.
[B] «scan» — Dạng scan không khớp với trợ động từ had been; ở đây cần scanning.
[C] «scanned» — Dạng scanned không khớp với trợ động từ had been; ở đây cần scanning.
[D] «scanning» — Đúng cấu trúc Past Perfect Continuous trong câu: chọn scanning. Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.', 2, 110
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=110 AND old.question_text='The interns had been _____ the application forms for an hour before the power went out.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to scan' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'scan' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'scanned' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'scanning' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=110 AND q.question_text='The interns had been _____ the application forms for an hour before the power went out.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the supervisor been monitoring the production line for an hour before the power went out?', '[PHÂN TÍCH]
[A] «Had» — Đúng cấu trúc Past Perfect Continuous trong câu: chọn Had. Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.
[B] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.
[C] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.
[D] «Will» — Sau will cần have trước cấu trúc hoàn thành.', 2, 111
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=111 AND old.question_text='_____ the supervisor been monitoring the production line for an hour before the power went out?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Had' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=111 AND q.question_text='_____ the supervisor been monitoring the production line for an hour before the power went out?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The recruiters had not _____ the candidates for an hour before the power went out.', '[PHÂN TÍCH]
[A] «been interviewing» — Đúng cấu trúc Past Perfect Continuous trong câu: chọn been interviewing. Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.
[B] «interviewing» — Sau had not ở mẫu Past Perfect Continuous, phần còn lại phải là been interviewing.
[C] «interview» — Sau had not ở mẫu Past Perfect Continuous, phần còn lại phải là been interviewing.
[D] «interviewed» — Sau had not ở mẫu Past Perfect Continuous, phần còn lại phải là been interviewing.', 2, 112
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=112 AND old.question_text='The recruiters had not _____ the candidates for an hour before the power went out.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'been interviewing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'interviewing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'interview' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'interviewed' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=112 AND q.question_text='The recruiters had not _____ the candidates for an hour before the power went out.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The accountant _____ the shipping costs for an hour before the power went out.', '[PHÂN TÍCH]
[A] «calculating» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «had been calculating» — Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.
[C] «will calculated» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «has calculating» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 2, 113
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=113 AND old.question_text='The accountant _____ the shipping costs for an hour before the power went out.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'had been calculating' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will calculated' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has calculating' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=113 AND q.question_text='The accountant _____ the shipping costs for an hour before the power went out.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our engineers had been _____ the demonstration unit for an hour before the power went out.', '[PHÂN TÍCH]
[A] «build» — Dạng build không khớp với trợ động từ had been; ở đây cần building.
[B] «building» — Đúng cấu trúc Past Perfect Continuous trong câu: chọn building. Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.
[C] «to build» — Dạng to build không khớp với trợ động từ had been; ở đây cần building.
[D] «built» — Dạng built không khớp với trợ động từ had been; ở đây cần building.', 2, 114
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=114 AND old.question_text='Our engineers had been _____ the demonstration unit for an hour before the power went out.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'building' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'built' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=114 AND q.question_text='Our engineers had been _____ the demonstration unit for an hour before the power went out.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the manager been updating the delivery schedule for an hour before the power went out?', '[PHÂN TÍCH]
[A] «Had» — Đúng cấu trúc Past Perfect Continuous trong câu: chọn Had. Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.
[B] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.
[C] «Will» — Sau will cần have trước cấu trúc hoàn thành.
[D] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.', 2, 115
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=115 AND old.question_text='_____ the manager been updating the delivery schedule for an hour before the power went out?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Had' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=115 AND q.question_text='_____ the manager been updating the delivery schedule for an hour before the power went out?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The operators had not _____ the water temperature for an hour before the power went out.', '[PHÂN TÍCH]
[A] «measure» — Sau had not ở mẫu Past Perfect Continuous, phần còn lại phải là been measuring.
[B] «measured» — Sau had not ở mẫu Past Perfect Continuous, phần còn lại phải là been measuring.
[C] «measuring» — Sau had not ở mẫu Past Perfect Continuous, phần còn lại phải là been measuring.
[D] «been measuring» — Đúng cấu trúc Past Perfect Continuous trong câu: chọn been measuring. Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.', 2, 116
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=116 AND old.question_text='The operators had not _____ the water temperature for an hour before the power went out.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'measure' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'measured' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'measuring' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'been measuring' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=116 AND q.question_text='The operators had not _____ the water temperature for an hour before the power went out.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The assistant _____ the training materials for an hour before the power went out.', '[PHÂN TÍCH]
[A] «organizing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «has organizing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «will organized» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «had been organizing» — Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.', 2, 117
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=117 AND old.question_text='The assistant _____ the training materials for an hour before the power went out.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'has organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will organized' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'had been organizing' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=117 AND q.question_text='The assistant _____ the training materials for an hour before the power went out.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The consultants had been _____ the suppliers for an hour before the power went out.', '[PHÂN TÍCH]
[A] «to compare» — Dạng to compare không khớp với trợ động từ had been; ở đây cần comparing.
[B] «compared» — Dạng compared không khớp với trợ động từ had been; ở đây cần comparing.
[C] «comparing» — Đúng cấu trúc Past Perfect Continuous trong câu: chọn comparing. Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.
[D] «compare» — Dạng compare không khớp với trợ động từ had been; ở đây cần comparing.', 2, 118
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=118 AND old.question_text='The consultants had been _____ the suppliers for an hour before the power went out.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to compare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'compared' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'comparing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'compare' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=118 AND q.question_text='The consultants had been _____ the suppliers for an hour before the power went out.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the researcher been collecting the survey responses for an hour before the power went out?', '[PHÂN TÍCH]
[A] «Will» — Sau will cần have trước cấu trúc hoàn thành.
[B] «Did» — Sau did phải là nguyên mẫu, không dùng dạng động từ đang có trong câu.
[C] «Had» — Đúng cấu trúc Past Perfect Continuous trong câu: chọn Had. Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.
[D] «Is» — Is không tạo cấu trúc hoàn thành trong câu hỏi này.', 2, 119
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=119 AND old.question_text='_____ the researcher been collecting the survey responses for an hour before the power went out?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Had' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Is' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=119 AND q.question_text='_____ the researcher been collecting the survey responses for an hour before the power went out?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The developers had not _____ the changes for an hour before the power went out.', '[PHÂN TÍCH]
[A] «been documenting» — Đúng cấu trúc Past Perfect Continuous trong câu: chọn been documenting. Khoảng thời gian một giờ kéo dài đến mốc mất điện trong quá khứ; dùng had been + V-ing.
[B] «document» — Sau had not ở mẫu Past Perfect Continuous, phần còn lại phải là been documenting.
[C] «documenting» — Sau had not ở mẫu Past Perfect Continuous, phần còn lại phải là been documenting.
[D] «documented» — Sau had not ở mẫu Past Perfect Continuous, phần còn lại phải là been documenting.', 2, 120
FROM grammar_lessons l WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=120 AND old.question_text='The developers had not _____ the changes for an hour before the power went out.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'been documenting' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'document' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'documenting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'documented' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)' AND q.sort_order=120 AND q.question_text='The developers had not _____ the changes for an hour before the power went out.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);

-- Tương lai đơn (Future Simple)
UPDATE grammar_lessons
SET content_html = CONCAT(REPLACE(content_html, '<section data-n11="lecture">', '<section data-n11="lecture"><h3>Will và kế hoạch đã định</h3><p>Will thường dùng để hứa, đề nghị hoặc quyết định lúc nói. Nếu câu nói về kế hoạch có trước, be going to hoặc hiện tại tiếp diễn có thể tự nhiên hơn.</p>'), '<section data-n11="examples"><article data-example-id="21001" data-order="21"><p class="sentence">I will forward the receipt when I receive it.</p><p class="translation">Tôi sẽ chuyển tiếp biên lai khi nhận được.</p><p class="note">Mệnh đề thời gian sau when dùng receive.</p></article></section>')
WHERE title = 'Tương lai đơn (Future Simple)' AND content_html LIKE '%<section data-n11="lecture">%' AND content_html NOT LIKE '%data-example-id="21001"%';
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The technician _____ the ventilation system tomorrow, I promise.', '[PHÂN TÍCH]
[A] «will inspect» — Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[B] «will inspected» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[C] «inspecting» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[D] «has inspecting» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 1, 101
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=101 AND old.question_text='The technician _____ the ventilation system tomorrow, I promise.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will inspect' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will inspected' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has inspecting' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=101 AND q.question_text='The technician _____ the ventilation system tomorrow, I promise.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The clerk will _____ the travel receipts tomorrow, I promise.', '[PHÂN TÍCH]
[A] «filed» — Dạng filed không khớp với trợ động từ will; ở đây cần file.
[B] «files» — Dạng files không khớp với trợ động từ will; ở đây cần file.
[C] «file» — Đúng cấu trúc Future Simple trong câu: chọn file. Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[D] «filing» — Dạng filing không khớp với trợ động từ will; ở đây cần file.', 1, 102
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=102 AND old.question_text='The clerk will _____ the travel receipts tomorrow, I promise.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'filed' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'files' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'file' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'filing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=102 AND q.question_text='The clerk will _____ the travel receipts tomorrow, I promise.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the analysts review the sales figures tomorrow?', '[PHÂN TÍCH]
[A] «Will» — Đúng cấu trúc Future Simple trong câu: chọn Will. Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[B] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.
[C] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.
[D] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.', 1, 103
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=103 AND old.question_text='_____ the analysts review the sales figures tomorrow?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=103 AND q.question_text='_____ the analysts review the sales figures tomorrow?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Ms. Chen will not _____ the project summary tomorrow.', '[PHÂN TÍCH]
[A] «writing» — Sau will not ở mẫu Future Simple, phần còn lại phải là write.
[B] «write» — Đúng cấu trúc Future Simple trong câu: chọn write. Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[C] «wrote» — Sau will not ở mẫu Future Simple, phần còn lại phải là write.
[D] «to write» — Sau will not ở mẫu Future Simple, phần còn lại phải là write.', 1, 104
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=104 AND old.question_text='Ms. Chen will not _____ the project summary tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'writing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'write' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'wrote' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to write' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=104 AND q.question_text='Ms. Chen will not _____ the project summary tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The contractors _____ the safety equipment tomorrow, I promise.', '[PHÂN TÍCH]
[A] «will test» — Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[B] «will tested» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[C] «have testing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «testing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.', 1, 105
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=105 AND old.question_text='The contractors _____ the safety equipment tomorrow, I promise.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will test' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will tested' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'have testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'testing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=105 AND q.question_text='The contractors _____ the safety equipment tomorrow, I promise.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our staff members will _____ the returned packages tomorrow, I promise.', '[PHÂN TÍCH]
[A] «sorted» — Dạng sorted không khớp với trợ động từ will; ở đây cần sort.
[B] «sort» — Đúng cấu trúc Future Simple trong câu: chọn sort. Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[C] «sorting» — Dạng sorting không khớp với trợ động từ will; ở đây cần sort.
[D] «to sort» — Dạng to sort không khớp với trợ động từ will; ở đây cần sort.', 1, 106
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=106 AND old.question_text='Our staff members will _____ the returned packages tomorrow, I promise.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'sorted' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'sort' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'sorting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to sort' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=106 AND q.question_text='Our staff members will _____ the returned packages tomorrow, I promise.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the auditors check the payment records tomorrow?', '[PHÂN TÍCH]
[A] «Will» — Đúng cấu trúc Future Simple trong câu: chọn Will. Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[B] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.
[C] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.
[D] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.', 1, 107
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=107 AND old.question_text='_____ the auditors check the payment records tomorrow?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=107 AND q.question_text='_____ the auditors check the payment records tomorrow?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The designer will not _____ the product labels tomorrow.', '[PHÂN TÍCH]
[A] «prepared» — Sau will not ở mẫu Future Simple, phần còn lại phải là prepare.
[B] «prepare» — Đúng cấu trúc Future Simple trong câu: chọn prepare. Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[C] «preparing» — Sau will not ở mẫu Future Simple, phần còn lại phải là prepare.
[D] «to prepare» — Sau will not ở mẫu Future Simple, phần còn lại phải là prepare.', 1, 108
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=108 AND old.question_text='The designer will not _____ the product labels tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'prepared' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'prepare' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'preparing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to prepare' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=108 AND q.question_text='The designer will not _____ the product labels tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The editor _____ the instruction manual tomorrow, I promise.', '[PHÂN TÍCH]
[A] «will read» — Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[B] «has reading» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «reading» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[D] «was read» — Was/were không đứng trực tiếp trước động từ nguyên mẫu để tạo thì.', 1, 109
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=109 AND old.question_text='The editor _____ the instruction manual tomorrow, I promise.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will read' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'has reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'was read' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=109 AND q.question_text='The editor _____ the instruction manual tomorrow, I promise.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The interns will _____ the application forms tomorrow, I promise.', '[PHÂN TÍCH]
[A] «scan» — Đúng cấu trúc Future Simple trong câu: chọn scan. Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[B] «to scan» — Dạng to scan không khớp với trợ động từ will; ở đây cần scan.
[C] «scanning» — Dạng scanning không khớp với trợ động từ will; ở đây cần scan.
[D] «scanned» — Dạng scanned không khớp với trợ động từ will; ở đây cần scan.', 1, 110
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=110 AND old.question_text='The interns will _____ the application forms tomorrow, I promise.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'scan' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to scan' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'scanning' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'scanned' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=110 AND q.question_text='The interns will _____ the application forms tomorrow, I promise.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the supervisor monitor the production line tomorrow?', '[PHÂN TÍCH]
[A] «Will» — Đúng cấu trúc Future Simple trong câu: chọn Will. Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[B] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.
[C] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.
[D] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.', 1, 111
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=111 AND old.question_text='_____ the supervisor monitor the production line tomorrow?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=111 AND q.question_text='_____ the supervisor monitor the production line tomorrow?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The recruiters will not _____ the candidates tomorrow.', '[PHÂN TÍCH]
[A] «interviewed» — Sau will not ở mẫu Future Simple, phần còn lại phải là interview.
[B] «to interview» — Sau will not ở mẫu Future Simple, phần còn lại phải là interview.
[C] «interview» — Đúng cấu trúc Future Simple trong câu: chọn interview. Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[D] «interviewing» — Sau will not ở mẫu Future Simple, phần còn lại phải là interview.', 1, 112
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=112 AND old.question_text='The recruiters will not _____ the candidates tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'interviewed' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to interview' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'interview' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'interviewing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=112 AND q.question_text='The recruiters will not _____ the candidates tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The accountant _____ the shipping costs tomorrow, I promise.', '[PHÂN TÍCH]
[A] «will calculated» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «calculating» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[C] «will calculate» — Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[D] «has calculating» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 1, 113
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=113 AND old.question_text='The accountant _____ the shipping costs tomorrow, I promise.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will calculated' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will calculate' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has calculating' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=113 AND q.question_text='The accountant _____ the shipping costs tomorrow, I promise.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our engineers will _____ the demonstration unit tomorrow, I promise.', '[PHÂN TÍCH]
[A] «building» — Dạng building không khớp với trợ động từ will; ở đây cần build.
[B] «built» — Dạng built không khớp với trợ động từ will; ở đây cần build.
[C] «build» — Đúng cấu trúc Future Simple trong câu: chọn build. Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[D] «to build» — Dạng to build không khớp với trợ động từ will; ở đây cần build.', 1, 114
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=114 AND old.question_text='Our engineers will _____ the demonstration unit tomorrow, I promise.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'building' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'built' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'build' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to build' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=114 AND q.question_text='Our engineers will _____ the demonstration unit tomorrow, I promise.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the manager update the delivery schedule tomorrow?', '[PHÂN TÍCH]
[A] «Will» — Đúng cấu trúc Future Simple trong câu: chọn Will. Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[B] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.
[C] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.
[D] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.', 1, 115
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=115 AND old.question_text='_____ the manager update the delivery schedule tomorrow?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=115 AND q.question_text='_____ the manager update the delivery schedule tomorrow?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The operators will not _____ the water temperature tomorrow.', '[PHÂN TÍCH]
[A] «to measure» — Sau will not ở mẫu Future Simple, phần còn lại phải là measure.
[B] «measuring» — Sau will not ở mẫu Future Simple, phần còn lại phải là measure.
[C] «measure» — Đúng cấu trúc Future Simple trong câu: chọn measure. Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[D] «measured» — Sau will not ở mẫu Future Simple, phần còn lại phải là measure.', 1, 116
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=116 AND old.question_text='The operators will not _____ the water temperature tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to measure' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'measuring' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'measure' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'measured' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=116 AND q.question_text='The operators will not _____ the water temperature tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The assistant _____ the training materials tomorrow, I promise.', '[PHÂN TÍCH]
[A] «has organizing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[B] «will organize» — Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[C] «organizing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[D] «will organized» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.', 1, 117
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=117 AND old.question_text='The assistant _____ the training materials tomorrow, I promise.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'has organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will organize' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'will organized' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=117 AND q.question_text='The assistant _____ the training materials tomorrow, I promise.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The consultants will _____ the suppliers tomorrow, I promise.', '[PHÂN TÍCH]
[A] «compare» — Đúng cấu trúc Future Simple trong câu: chọn compare. Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[B] «to compare» — Dạng to compare không khớp với trợ động từ will; ở đây cần compare.
[C] «compared» — Dạng compared không khớp với trợ động từ will; ở đây cần compare.
[D] «comparing» — Dạng comparing không khớp với trợ động từ will; ở đây cần compare.', 1, 118
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=118 AND old.question_text='The consultants will _____ the suppliers tomorrow, I promise.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'compare' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to compare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'compared' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'comparing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=118 AND q.question_text='The consultants will _____ the suppliers tomorrow, I promise.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the researcher collect the survey responses tomorrow?', '[PHÂN TÍCH]
[A] «Will» — Đúng cấu trúc Future Simple trong câu: chọn Will. Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[B] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.
[C] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.
[D] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.', 1, 119
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=119 AND old.question_text='_____ the researcher collect the survey responses tomorrow?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=119 AND q.question_text='_____ the researcher collect the survey responses tomorrow?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The developers will not _____ the changes tomorrow.', '[PHÂN TÍCH]
[A] «to document» — Sau will not ở mẫu Future Simple, phần còn lại phải là document.
[B] «documenting» — Sau will not ở mẫu Future Simple, phần còn lại phải là document.
[C] «document» — Đúng cấu trúc Future Simple trong câu: chọn document. Lời hứa về ngày mai dùng will + động từ nguyên mẫu.
[D] «documented» — Sau will not ở mẫu Future Simple, phần còn lại phải là document.', 1, 120
FROM grammar_lessons l WHERE l.title = 'Tương lai đơn (Future Simple)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=120 AND old.question_text='The developers will not _____ the changes tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to document' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'documenting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'document' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'documented' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai đơn (Future Simple)' AND q.sort_order=120 AND q.question_text='The developers will not _____ the changes tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);

-- Tương lai tiếp diễn (Future Continuous)
UPDATE grammar_lessons
SET content_html = CONCAT(REPLACE(content_html, '<section data-n11="lecture">', '<section data-n11="lecture"><h3>Việc đang diễn ra ở mốc tương lai</h3><p>At this time tomorrow giúp hình dung thời điểm công việc đang tiếp diễn. Dạng này cũng hữu ích khi hỏi lịch mà không tạo cảm giác thúc ép.</p>'), '<section data-n11="examples"><article data-example-id="21001" data-order="21"><p class="sentence">Will you be using the projector at three?</p><p class="translation">Bạn có dùng máy chiếu lúc ba giờ không?</p><p class="note">Câu hỏi dùng will + chủ ngữ + be + V-ing.</p></article></section>')
WHERE title = 'Tương lai tiếp diễn (Future Continuous)' AND content_html LIKE '%<section data-n11="lecture">%' AND content_html NOT LIKE '%data-example-id="21001"%';
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The technician _____ the ventilation system at this time tomorrow, so please come later.', '[PHÂN TÍCH]
[A] «inspecting» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «will inspected» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[C] «will be inspecting» — Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.
[D] «has inspecting» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 2, 101
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=101 AND old.question_text='The technician _____ the ventilation system at this time tomorrow, so please come later.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will inspected' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will be inspecting' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has inspecting' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=101 AND q.question_text='The technician _____ the ventilation system at this time tomorrow, so please come later.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The clerk will be _____ the travel receipts at this time tomorrow, so please come later.', '[PHÂN TÍCH]
[A] «file» — Dạng file không khớp với trợ động từ will be; ở đây cần filing.
[B] «filed» — Dạng filed không khớp với trợ động từ will be; ở đây cần filing.
[C] «files» — Dạng files không khớp với trợ động từ will be; ở đây cần filing.
[D] «filing» — Đúng cấu trúc Future Continuous trong câu: chọn filing. Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.', 2, 102
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=102 AND old.question_text='The clerk will be _____ the travel receipts at this time tomorrow, so please come later.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'file' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'filed' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'files' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'filing' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=102 AND q.question_text='The clerk will be _____ the travel receipts at this time tomorrow, so please come later.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the analysts be reviewing the sales figures at this time tomorrow?', '[PHÂN TÍCH]
[A] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.
[B] «Will» — Đúng cấu trúc Future Continuous trong câu: chọn Will. Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.
[C] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.
[D] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.', 2, 103
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=103 AND old.question_text='_____ the analysts be reviewing the sales figures at this time tomorrow?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=103 AND q.question_text='_____ the analysts be reviewing the sales figures at this time tomorrow?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Ms. Chen will not _____ the project summary at this time tomorrow.', '[PHÂN TÍCH]
[A] «to write» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.
[B] «to wrote» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.
[C] «writing» — Sau will not ở mẫu Future Continuous, phần còn lại phải là be writing.
[D] «be writing» — Đúng cấu trúc Future Continuous trong câu: chọn be writing. Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.', 2, 104
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=104 AND old.question_text='Ms. Chen will not _____ the project summary at this time tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to write' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to wrote' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'writing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'be writing' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=104 AND q.question_text='Ms. Chen will not _____ the project summary at this time tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The contractors _____ the safety equipment at this time tomorrow, so please come later.', '[PHÂN TÍCH]
[A] «testing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «will tested» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[C] «will be testing» — Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.
[D] «have testing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 2, 105
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=105 AND old.question_text='The contractors _____ the safety equipment at this time tomorrow, so please come later.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will tested' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will be testing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'have testing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=105 AND q.question_text='The contractors _____ the safety equipment at this time tomorrow, so please come later.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our staff members will be _____ the returned packages at this time tomorrow, so please come later.', '[PHÂN TÍCH]
[A] «sorting» — Đúng cấu trúc Future Continuous trong câu: chọn sorting. Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.
[B] «to sort» — Dạng to sort không khớp với trợ động từ will be; ở đây cần sorting.
[C] «sorted» — Dạng sorted không khớp với trợ động từ will be; ở đây cần sorting.
[D] «sort» — Dạng sort không khớp với trợ động từ will be; ở đây cần sorting.', 2, 106
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=106 AND old.question_text='Our staff members will be _____ the returned packages at this time tomorrow, so please come later.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'sorting' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to sort' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'sorted' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'sort' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=106 AND q.question_text='Our staff members will be _____ the returned packages at this time tomorrow, so please come later.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the auditors be checking the payment records at this time tomorrow?', '[PHÂN TÍCH]
[A] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.
[B] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.
[C] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.
[D] «Will» — Đúng cấu trúc Future Continuous trong câu: chọn Will. Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.', 2, 107
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=107 AND old.question_text='_____ the auditors be checking the payment records at this time tomorrow?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=107 AND q.question_text='_____ the auditors be checking the payment records at this time tomorrow?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The designer will not _____ the product labels at this time tomorrow.', '[PHÂN TÍCH]
[A] «prepared» — Sau will not ở mẫu Future Continuous, phần còn lại phải là be preparing.
[B] «be preparing» — Đúng cấu trúc Future Continuous trong câu: chọn be preparing. Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.
[C] «to prepare» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.
[D] «preparing» — Sau will not ở mẫu Future Continuous, phần còn lại phải là be preparing.', 2, 108
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=108 AND old.question_text='The designer will not _____ the product labels at this time tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'prepared' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'be preparing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to prepare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'preparing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=108 AND q.question_text='The designer will not _____ the product labels at this time tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The editor _____ the instruction manual at this time tomorrow, so please come later.', '[PHÂN TÍCH]
[A] «reading» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «has reading» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «will reads» — Sau will cần động từ nguyên mẫu read, không dùng reads.
[D] «will be reading» — Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.', 2, 109
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=109 AND old.question_text='The editor _____ the instruction manual at this time tomorrow, so please come later.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'has reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will reads' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'will be reading' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=109 AND q.question_text='The editor _____ the instruction manual at this time tomorrow, so please come later.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The interns will be _____ the application forms at this time tomorrow, so please come later.', '[PHÂN TÍCH]
[A] «scanning» — Đúng cấu trúc Future Continuous trong câu: chọn scanning. Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.
[B] «to scan» — Dạng to scan không khớp với trợ động từ will be; ở đây cần scanning.
[C] «scan» — Dạng scan không khớp với trợ động từ will be; ở đây cần scanning.
[D] «scanned» — Dạng scanned không khớp với trợ động từ will be; ở đây cần scanning.', 2, 110
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=110 AND old.question_text='The interns will be _____ the application forms at this time tomorrow, so please come later.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'scanning' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to scan' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'scan' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'scanned' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=110 AND q.question_text='The interns will be _____ the application forms at this time tomorrow, so please come later.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the supervisor be monitoring the production line at this time tomorrow?', '[PHÂN TÍCH]
[A] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.
[B] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.
[C] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.
[D] «Will» — Đúng cấu trúc Future Continuous trong câu: chọn Will. Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.', 2, 111
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=111 AND old.question_text='_____ the supervisor be monitoring the production line at this time tomorrow?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=111 AND q.question_text='_____ the supervisor be monitoring the production line at this time tomorrow?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The recruiters will not _____ the candidates at this time tomorrow.', '[PHÂN TÍCH]
[A] «interviewed» — Sau will not ở mẫu Future Continuous, phần còn lại phải là be interviewing.
[B] «to interview» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.
[C] «be interviewing» — Đúng cấu trúc Future Continuous trong câu: chọn be interviewing. Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.
[D] «interviewing» — Sau will not ở mẫu Future Continuous, phần còn lại phải là be interviewing.', 2, 112
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=112 AND old.question_text='The recruiters will not _____ the candidates at this time tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'interviewed' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to interview' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'be interviewing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'interviewing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=112 AND q.question_text='The recruiters will not _____ the candidates at this time tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The accountant _____ the shipping costs at this time tomorrow, so please come later.', '[PHÂN TÍCH]
[A] «will calculated» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «will be calculating» — Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.
[C] «calculating» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[D] «has calculating» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 2, 113
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=113 AND old.question_text='The accountant _____ the shipping costs at this time tomorrow, so please come later.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will calculated' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will be calculating' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has calculating' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=113 AND q.question_text='The accountant _____ the shipping costs at this time tomorrow, so please come later.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our engineers will be _____ the demonstration unit at this time tomorrow, so please come later.', '[PHÂN TÍCH]
[A] «to build» — Dạng to build không khớp với trợ động từ will be; ở đây cần building.
[B] «building» — Đúng cấu trúc Future Continuous trong câu: chọn building. Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.
[C] «built» — Dạng built không khớp với trợ động từ will be; ở đây cần building.
[D] «build» — Dạng build không khớp với trợ động từ will be; ở đây cần building.', 2, 114
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=114 AND old.question_text='Our engineers will be _____ the demonstration unit at this time tomorrow, so please come later.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'building' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'built' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'build' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=114 AND q.question_text='Our engineers will be _____ the demonstration unit at this time tomorrow, so please come later.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the manager be updating the delivery schedule at this time tomorrow?', '[PHÂN TÍCH]
[A] «Will» — Đúng cấu trúc Future Continuous trong câu: chọn Will. Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.
[B] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.
[C] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.
[D] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.', 2, 115
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=115 AND old.question_text='_____ the manager be updating the delivery schedule at this time tomorrow?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=115 AND q.question_text='_____ the manager be updating the delivery schedule at this time tomorrow?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The operators will not _____ the water temperature at this time tomorrow.', '[PHÂN TÍCH]
[A] «measuring» — Sau will not ở mẫu Future Continuous, phần còn lại phải là be measuring.
[B] «to measure» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.
[C] «measured» — Sau will not ở mẫu Future Continuous, phần còn lại phải là be measuring.
[D] «be measuring» — Đúng cấu trúc Future Continuous trong câu: chọn be measuring. Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.', 2, 116
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=116 AND old.question_text='The operators will not _____ the water temperature at this time tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'measuring' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to measure' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'measured' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'be measuring' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=116 AND q.question_text='The operators will not _____ the water temperature at this time tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The assistant _____ the training materials at this time tomorrow, so please come later.', '[PHÂN TÍCH]
[A] «organizing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «will be organizing» — Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.
[C] «has organizing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «will organized» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.', 2, 117
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=117 AND old.question_text='The assistant _____ the training materials at this time tomorrow, so please come later.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will be organizing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'has organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'will organized' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=117 AND q.question_text='The assistant _____ the training materials at this time tomorrow, so please come later.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The consultants will be _____ the suppliers at this time tomorrow, so please come later.', '[PHÂN TÍCH]
[A] «to compare» — Dạng to compare không khớp với trợ động từ will be; ở đây cần comparing.
[B] «compared» — Dạng compared không khớp với trợ động từ will be; ở đây cần comparing.
[C] «compare» — Dạng compare không khớp với trợ động từ will be; ở đây cần comparing.
[D] «comparing» — Đúng cấu trúc Future Continuous trong câu: chọn comparing. Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.', 2, 118
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=118 AND old.question_text='The consultants will be _____ the suppliers at this time tomorrow, so please come later.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to compare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'compared' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'compare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'comparing' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=118 AND q.question_text='The consultants will be _____ the suppliers at this time tomorrow, so please come later.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the researcher be collecting the survey responses at this time tomorrow?', '[PHÂN TÍCH]
[A] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.
[B] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.
[C] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.
[D] «Will» — Đúng cấu trúc Future Continuous trong câu: chọn Will. Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.', 2, 119
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=119 AND old.question_text='_____ the researcher be collecting the survey responses at this time tomorrow?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=119 AND q.question_text='_____ the researcher be collecting the survey responses at this time tomorrow?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The developers will not _____ the changes at this time tomorrow.', '[PHÂN TÍCH]
[A] «documented» — Sau will not ở mẫu Future Continuous, phần còn lại phải là be documenting.
[B] «be documenting» — Đúng cấu trúc Future Continuous trong câu: chọn be documenting. Hành động sẽ đang diễn ra tại mốc giờ này ngày mai; dùng will be + V-ing.
[C] «to document» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.
[D] «documenting» — Sau will not ở mẫu Future Continuous, phần còn lại phải là be documenting.', 2, 120
FROM grammar_lessons l WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=120 AND old.question_text='The developers will not _____ the changes at this time tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'documented' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'be documenting' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to document' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'documenting' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai tiếp diễn (Future Continuous)' AND q.sort_order=120 AND q.question_text='The developers will not _____ the changes at this time tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);

-- Tương lai hoàn thành (Future Perfect)
UPDATE grammar_lessons
SET content_html = CONCAT(REPLACE(content_html, '<section data-n11="lecture">', '<section data-n11="lecture"><h3>Hoàn tất chậm nhất vào hạn</h3><p>Phân biệt by (chậm nhất vào) với until (tiếp tục đến). Future perfect nhìn lại từ một mốc tương lai và nhấn mạnh kết quả đã xong.</p>'), '<section data-n11="examples"><article data-example-id="21001" data-order="21"><p class="sentence">By Friday, we will have packed all fifty orders.</p><p class="translation">Chậm nhất thứ Sáu, chúng tôi sẽ đóng gói xong cả năm mươi đơn.</p><p class="note">All fifty orders cho biết kết quả có thể đếm được.</p></article></section>')
WHERE title = 'Tương lai hoàn thành (Future Perfect)' AND content_html LIKE '%<section data-n11="lecture">%' AND content_html NOT LIKE '%data-example-id="21001"%';
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The technician _____ the ventilation system by noon tomorrow, when the report is due.', '[PHÂN TÍCH]
[A] «will inspected» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «will have inspected» — Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[C] «has inspecting» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «inspecting» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.', 2, 101
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=101 AND old.question_text='The technician _____ the ventilation system by noon tomorrow, when the report is due.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will inspected' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will have inspected' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'has inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'inspecting' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=101 AND q.question_text='The technician _____ the ventilation system by noon tomorrow, when the report is due.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The clerk will have _____ the travel receipts by noon tomorrow, when the report is due.', '[PHÂN TÍCH]
[A] «filed» — Đúng cấu trúc Future Perfect trong câu: chọn filed. Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[B] «filing» — Dạng filing không khớp với trợ động từ will have; ở đây cần filed.
[C] «files» — Dạng files không khớp với trợ động từ will have; ở đây cần filed.
[D] «file» — Dạng file không khớp với trợ động từ will have; ở đây cần filed.', 2, 102
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=102 AND old.question_text='The clerk will have _____ the travel receipts by noon tomorrow, when the report is due.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'filed' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'filing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'files' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'file' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=102 AND q.question_text='The clerk will have _____ the travel receipts by noon tomorrow, when the report is due.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the analysts have reviewed the sales figures by noon tomorrow, when the report is due?', '[PHÂN TÍCH]
[A] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.
[B] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.
[C] «Will» — Đúng cấu trúc Future Perfect trong câu: chọn Will. Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[D] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.', 2, 103
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=103 AND old.question_text='_____ the analysts have reviewed the sales figures by noon tomorrow, when the report is due?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=103 AND q.question_text='_____ the analysts have reviewed the sales figures by noon tomorrow, when the report is due?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Ms. Chen will not _____ the project summary by noon tomorrow, when the report is due.', '[PHÂN TÍCH]
[A] «to write» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.
[B] «have written» — Đúng cấu trúc Future Perfect trong câu: chọn have written. Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[C] «to wrote» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.
[D] «writing» — Sau will not ở mẫu Future Perfect, phần còn lại phải là have written.', 2, 104
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=104 AND old.question_text='Ms. Chen will not _____ the project summary by noon tomorrow, when the report is due.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to write' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'have written' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to wrote' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'writing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=104 AND q.question_text='Ms. Chen will not _____ the project summary by noon tomorrow, when the report is due.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The contractors _____ the safety equipment by noon tomorrow, when the report is due.', '[PHÂN TÍCH]
[A] «testing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «have testing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «will tested» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «will have tested» — Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.', 2, 105
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=105 AND old.question_text='The contractors _____ the safety equipment by noon tomorrow, when the report is due.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'have testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will tested' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'will have tested' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=105 AND q.question_text='The contractors _____ the safety equipment by noon tomorrow, when the report is due.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our staff members will have _____ the returned packages by noon tomorrow, when the report is due.', '[PHÂN TÍCH]
[A] «sorting» — Dạng sorting không khớp với trợ động từ will have; ở đây cần sorted.
[B] «sorted» — Đúng cấu trúc Future Perfect trong câu: chọn sorted. Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[C] «to sort» — Dạng to sort không khớp với trợ động từ will have; ở đây cần sorted.
[D] «sort» — Dạng sort không khớp với trợ động từ will have; ở đây cần sorted.', 2, 106
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=106 AND old.question_text='Our staff members will have _____ the returned packages by noon tomorrow, when the report is due.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'sorting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'sorted' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to sort' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'sort' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=106 AND q.question_text='Our staff members will have _____ the returned packages by noon tomorrow, when the report is due.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the auditors have checked the payment records by noon tomorrow, when the report is due?', '[PHÂN TÍCH]
[A] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.
[B] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.
[C] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.
[D] «Will» — Đúng cấu trúc Future Perfect trong câu: chọn Will. Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.', 2, 107
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=107 AND old.question_text='_____ the auditors have checked the payment records by noon tomorrow, when the report is due?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=107 AND q.question_text='_____ the auditors have checked the payment records by noon tomorrow, when the report is due?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The designer will not _____ the product labels by noon tomorrow, when the report is due.', '[PHÂN TÍCH]
[A] «to prepare» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.
[B] «have prepared» — Đúng cấu trúc Future Perfect trong câu: chọn have prepared. Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[C] «preparing» — Sau will not ở mẫu Future Perfect, phần còn lại phải là have prepared.
[D] «prepared» — Sau will not ở mẫu Future Perfect, phần còn lại phải là have prepared.', 2, 108
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=108 AND old.question_text='The designer will not _____ the product labels by noon tomorrow, when the report is due.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to prepare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'have prepared' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'preparing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'prepared' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=108 AND q.question_text='The designer will not _____ the product labels by noon tomorrow, when the report is due.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The editor _____ the instruction manual by noon tomorrow, when the report is due.', '[PHÂN TÍCH]
[A] «reading» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «will have read» — Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[C] «has reading» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «will reads» — Sau will cần động từ nguyên mẫu read, không dùng reads.', 2, 109
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=109 AND old.question_text='The editor _____ the instruction manual by noon tomorrow, when the report is due.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will have read' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'has reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'will reads' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=109 AND q.question_text='The editor _____ the instruction manual by noon tomorrow, when the report is due.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The interns will have _____ the application forms by noon tomorrow, when the report is due.', '[PHÂN TÍCH]
[A] «scanned» — Đúng cấu trúc Future Perfect trong câu: chọn scanned. Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[B] «scanning» — Dạng scanning không khớp với trợ động từ will have; ở đây cần scanned.
[C] «scan» — Dạng scan không khớp với trợ động từ will have; ở đây cần scanned.
[D] «to scan» — Dạng to scan không khớp với trợ động từ will have; ở đây cần scanned.', 2, 110
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=110 AND old.question_text='The interns will have _____ the application forms by noon tomorrow, when the report is due.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'scanned' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'scanning' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'scan' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to scan' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=110 AND q.question_text='The interns will have _____ the application forms by noon tomorrow, when the report is due.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the supervisor have monitored the production line by noon tomorrow, when the report is due?', '[PHÂN TÍCH]
[A] «Will» — Đúng cấu trúc Future Perfect trong câu: chọn Will. Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[B] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.
[C] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.
[D] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.', 2, 111
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=111 AND old.question_text='_____ the supervisor have monitored the production line by noon tomorrow, when the report is due?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=111 AND q.question_text='_____ the supervisor have monitored the production line by noon tomorrow, when the report is due?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The recruiters will not _____ the candidates by noon tomorrow, when the report is due.', '[PHÂN TÍCH]
[A] «to interview» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.
[B] «have interviewed» — Đúng cấu trúc Future Perfect trong câu: chọn have interviewed. Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[C] «interviewed» — Sau will not ở mẫu Future Perfect, phần còn lại phải là have interviewed.
[D] «interviewing» — Sau will not ở mẫu Future Perfect, phần còn lại phải là have interviewed.', 2, 112
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=112 AND old.question_text='The recruiters will not _____ the candidates by noon tomorrow, when the report is due.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to interview' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'have interviewed' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'interviewed' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'interviewing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=112 AND q.question_text='The recruiters will not _____ the candidates by noon tomorrow, when the report is due.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The accountant _____ the shipping costs by noon tomorrow, when the report is due.', '[PHÂN TÍCH]
[A] «calculating» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «has calculating» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «will have calculated» — Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[D] «will calculated» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.', 2, 113
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=113 AND old.question_text='The accountant _____ the shipping costs by noon tomorrow, when the report is due.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'has calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will have calculated' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'will calculated' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=113 AND q.question_text='The accountant _____ the shipping costs by noon tomorrow, when the report is due.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our engineers will have _____ the demonstration unit by noon tomorrow, when the report is due.', '[PHÂN TÍCH]
[A] «building» — Dạng building không khớp với trợ động từ will have; ở đây cần built.
[B] «build» — Dạng build không khớp với trợ động từ will have; ở đây cần built.
[C] «to build» — Dạng to build không khớp với trợ động từ will have; ở đây cần built.
[D] «built» — Đúng cấu trúc Future Perfect trong câu: chọn built. Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.', 2, 114
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=114 AND old.question_text='Our engineers will have _____ the demonstration unit by noon tomorrow, when the report is due.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'building' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'built' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=114 AND q.question_text='Our engineers will have _____ the demonstration unit by noon tomorrow, when the report is due.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the manager have updated the delivery schedule by noon tomorrow, when the report is due?', '[PHÂN TÍCH]
[A] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.
[B] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.
[C] «Will» — Đúng cấu trúc Future Perfect trong câu: chọn Will. Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[D] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.', 2, 115
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=115 AND old.question_text='_____ the manager have updated the delivery schedule by noon tomorrow, when the report is due?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=115 AND q.question_text='_____ the manager have updated the delivery schedule by noon tomorrow, when the report is due?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The operators will not _____ the water temperature by noon tomorrow, when the report is due.', '[PHÂN TÍCH]
[A] «measuring» — Sau will not ở mẫu Future Perfect, phần còn lại phải là have measured.
[B] «measured» — Sau will not ở mẫu Future Perfect, phần còn lại phải là have measured.
[C] «have measured» — Đúng cấu trúc Future Perfect trong câu: chọn have measured. Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[D] «to measure» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.', 2, 116
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=116 AND old.question_text='The operators will not _____ the water temperature by noon tomorrow, when the report is due.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'measuring' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'measured' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'have measured' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to measure' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=116 AND q.question_text='The operators will not _____ the water temperature by noon tomorrow, when the report is due.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The assistant _____ the training materials by noon tomorrow, when the report is due.', '[PHÂN TÍCH]
[A] «will organized» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «will have organized» — Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[C] «organizing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[D] «has organizing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 2, 117
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=117 AND old.question_text='The assistant _____ the training materials by noon tomorrow, when the report is due.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will organized' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will have organized' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has organizing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=117 AND q.question_text='The assistant _____ the training materials by noon tomorrow, when the report is due.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The consultants will have _____ the suppliers by noon tomorrow, when the report is due.', '[PHÂN TÍCH]
[A] «compared» — Đúng cấu trúc Future Perfect trong câu: chọn compared. Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[B] «comparing» — Dạng comparing không khớp với trợ động từ will have; ở đây cần compared.
[C] «to compare» — Dạng to compare không khớp với trợ động từ will have; ở đây cần compared.
[D] «compare» — Dạng compare không khớp với trợ động từ will have; ở đây cần compared.', 2, 118
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=118 AND old.question_text='The consultants will have _____ the suppliers by noon tomorrow, when the report is due.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'compared' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'comparing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to compare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'compare' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=118 AND q.question_text='The consultants will have _____ the suppliers by noon tomorrow, when the report is due.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the researcher have collected the survey responses by noon tomorrow, when the report is due?', '[PHÂN TÍCH]
[A] «Will» — Đúng cấu trúc Future Perfect trong câu: chọn Will. Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[B] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.
[C] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.
[D] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.', 2, 119
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=119 AND old.question_text='_____ the researcher have collected the survey responses by noon tomorrow, when the report is due?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=119 AND q.question_text='_____ the researcher have collected the survey responses by noon tomorrow, when the report is due?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The developers will not _____ the changes by noon tomorrow, when the report is due.', '[PHÂN TÍCH]
[A] «to document» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.
[B] «documented» — Sau will not ở mẫu Future Perfect, phần còn lại phải là have documented.
[C] «have documented» — Đúng cấu trúc Future Perfect trong câu: chọn have documented. Nhấn mạnh kết quả hoàn thành chậm nhất vào trưa mai; dùng will have + V3.
[D] «documenting» — Sau will not ở mẫu Future Perfect, phần còn lại phải là have documented.', 2, 120
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành (Future Perfect)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=120 AND old.question_text='The developers will not _____ the changes by noon tomorrow, when the report is due.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to document' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'documented' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'have documented' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'documenting' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành (Future Perfect)' AND q.sort_order=120 AND q.question_text='The developers will not _____ the changes by noon tomorrow, when the report is due.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);

-- Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)
UPDATE grammar_lessons
SET content_html = CONCAT(REPLACE(content_html, '<section data-n11="lecture">', '<section data-n11="lecture"><h3>Đo thời lượng tới tương lai</h3><p>By đặt mốc, for chỉ thời lượng đến mốc đó. Dùng will have been + V-ing cho hoạt động kéo dài, còn will have + V3 nếu trọng tâm là kết quả.</p>'), '<section data-n11="examples"><article data-example-id="21001" data-order="21"><p class="sentence">By six, the crew will have been testing the line for four hours.</p><p class="translation">Đến sáu giờ, đội sẽ thử dây chuyền được bốn tiếng.</p><p class="note">For four hours là trọng tâm của câu.</p></article></section>')
WHERE title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND content_html LIKE '%<section data-n11="lecture">%' AND content_html NOT LIKE '%data-example-id="21001"%';
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The technician _____ the ventilation system for three hours by noon tomorrow.', '[PHÂN TÍCH]
[A] «will have been inspecting» — Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.
[B] «will inspected» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[C] «inspecting» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[D] «has inspecting» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 2, 101
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=101 AND old.question_text='The technician _____ the ventilation system for three hours by noon tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will have been inspecting' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will inspected' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'inspecting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has inspecting' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=101 AND q.question_text='The technician _____ the ventilation system for three hours by noon tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The clerk will have been _____ the travel receipts for three hours by noon tomorrow.', '[PHÂN TÍCH]
[A] «filing» — Đúng cấu trúc Future Perfect Continuous trong câu: chọn filing. Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.
[B] «filed» — Dạng filed không khớp với trợ động từ will have been; ở đây cần filing.
[C] «file» — Dạng file không khớp với trợ động từ will have been; ở đây cần filing.
[D] «files» — Dạng files không khớp với trợ động từ will have been; ở đây cần filing.', 2, 102
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=102 AND old.question_text='The clerk will have been _____ the travel receipts for three hours by noon tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'filing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'filed' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'file' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'files' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=102 AND q.question_text='The clerk will have been _____ the travel receipts for three hours by noon tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the analysts have been reviewing the sales figures for three hours by noon tomorrow?', '[PHÂN TÍCH]
[A] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.
[B] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.
[C] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.
[D] «Will» — Đúng cấu trúc Future Perfect Continuous trong câu: chọn Will. Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.', 2, 103
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=103 AND old.question_text='_____ the analysts have been reviewing the sales figures for three hours by noon tomorrow?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=103 AND q.question_text='_____ the analysts have been reviewing the sales figures for three hours by noon tomorrow?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Ms. Chen will not _____ the project summary for three hours by noon tomorrow.', '[PHÂN TÍCH]
[A] «writing» — Sau will not ở mẫu Future Perfect Continuous, phần còn lại phải là have been writing.
[B] «to wrote» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.
[C] «to write» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.
[D] «have been writing» — Đúng cấu trúc Future Perfect Continuous trong câu: chọn have been writing. Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.', 2, 104
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=104 AND old.question_text='Ms. Chen will not _____ the project summary for three hours by noon tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'writing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to wrote' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to write' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'have been writing' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=104 AND q.question_text='Ms. Chen will not _____ the project summary for three hours by noon tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The contractors _____ the safety equipment for three hours by noon tomorrow.', '[PHÂN TÍCH]
[A] «will tested» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[B] «have testing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[C] «will have been testing» — Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.
[D] «testing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.', 2, 105
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=105 AND old.question_text='The contractors _____ the safety equipment for three hours by noon tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'will tested' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'have testing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will have been testing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'testing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=105 AND q.question_text='The contractors _____ the safety equipment for three hours by noon tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our staff members will have been _____ the returned packages for three hours by noon tomorrow.', '[PHÂN TÍCH]
[A] «sort» — Dạng sort không khớp với trợ động từ will have been; ở đây cần sorting.
[B] «sorted» — Dạng sorted không khớp với trợ động từ will have been; ở đây cần sorting.
[C] «sorting» — Đúng cấu trúc Future Perfect Continuous trong câu: chọn sorting. Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.
[D] «to sort» — Dạng to sort không khớp với trợ động từ will have been; ở đây cần sorting.', 2, 106
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=106 AND old.question_text='Our staff members will have been _____ the returned packages for three hours by noon tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'sort' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'sorted' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'sorting' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to sort' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=106 AND q.question_text='Our staff members will have been _____ the returned packages for three hours by noon tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the auditors have been checking the payment records for three hours by noon tomorrow?', '[PHÂN TÍCH]
[A] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.
[B] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.
[C] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.
[D] «Will» — Đúng cấu trúc Future Perfect Continuous trong câu: chọn Will. Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.', 2, 107
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=107 AND old.question_text='_____ the auditors have been checking the payment records for three hours by noon tomorrow?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=107 AND q.question_text='_____ the auditors have been checking the payment records for three hours by noon tomorrow?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The designer will not _____ the product labels for three hours by noon tomorrow.', '[PHÂN TÍCH]
[A] «have been preparing» — Đúng cấu trúc Future Perfect Continuous trong câu: chọn have been preparing. Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.
[B] «preparing» — Sau will not ở mẫu Future Perfect Continuous, phần còn lại phải là have been preparing.
[C] «prepared» — Sau will not ở mẫu Future Perfect Continuous, phần còn lại phải là have been preparing.
[D] «to prepare» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.', 2, 108
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=108 AND old.question_text='The designer will not _____ the product labels for three hours by noon tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'have been preparing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'preparing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'prepared' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to prepare' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=108 AND q.question_text='The designer will not _____ the product labels for three hours by noon tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The editor _____ the instruction manual for three hours by noon tomorrow.', '[PHÂN TÍCH]
[A] «reading» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «will have been reading» — Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.
[C] «will reads» — Sau will cần động từ nguyên mẫu read, không dùng reads.
[D] «has reading» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 2, 109
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=109 AND old.question_text='The editor _____ the instruction manual for three hours by noon tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'reading' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will have been reading' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will reads' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has reading' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=109 AND q.question_text='The editor _____ the instruction manual for three hours by noon tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The interns will have been _____ the application forms for three hours by noon tomorrow.', '[PHÂN TÍCH]
[A] «scanning» — Đúng cấu trúc Future Perfect Continuous trong câu: chọn scanning. Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.
[B] «scan» — Dạng scan không khớp với trợ động từ will have been; ở đây cần scanning.
[C] «to scan» — Dạng to scan không khớp với trợ động từ will have been; ở đây cần scanning.
[D] «scanned» — Dạng scanned không khớp với trợ động từ will have been; ở đây cần scanning.', 2, 110
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=110 AND old.question_text='The interns will have been _____ the application forms for three hours by noon tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'scanning' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'scan' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'to scan' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'scanned' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=110 AND q.question_text='The interns will have been _____ the application forms for three hours by noon tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the supervisor have been monitoring the production line for three hours by noon tomorrow?', '[PHÂN TÍCH]
[A] «Will» — Đúng cấu trúc Future Perfect Continuous trong câu: chọn Will. Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.
[B] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.
[C] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.
[D] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.', 2, 111
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=111 AND old.question_text='_____ the supervisor have been monitoring the production line for three hours by noon tomorrow?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=111 AND q.question_text='_____ the supervisor have been monitoring the production line for three hours by noon tomorrow?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The recruiters will not _____ the candidates for three hours by noon tomorrow.', '[PHÂN TÍCH]
[A] «interviewed» — Sau will not ở mẫu Future Perfect Continuous, phần còn lại phải là have been interviewing.
[B] «have been interviewing» — Đúng cấu trúc Future Perfect Continuous trong câu: chọn have been interviewing. Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.
[C] «interviewing» — Sau will not ở mẫu Future Perfect Continuous, phần còn lại phải là have been interviewing.
[D] «to interview» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.', 2, 112
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=112 AND old.question_text='The recruiters will not _____ the candidates for three hours by noon tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'interviewed' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'have been interviewing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'interviewing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'to interview' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=112 AND q.question_text='The recruiters will not _____ the candidates for three hours by noon tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The accountant _____ the shipping costs for three hours by noon tomorrow.', '[PHÂN TÍCH]
[A] «calculating» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «will have been calculating» — Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.
[C] «has calculating» — Have/has đi với V3, hoặc cần thêm been trước V-ing.
[D] «will calculated» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.', 2, 113
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=113 AND old.question_text='The accountant _____ the shipping costs for three hours by noon tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will have been calculating' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'has calculating' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'will calculated' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=113 AND q.question_text='The accountant _____ the shipping costs for three hours by noon tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'Our engineers will have been _____ the demonstration unit for three hours by noon tomorrow.', '[PHÂN TÍCH]
[A] «to build» — Dạng to build không khớp với trợ động từ will have been; ở đây cần building.
[B] «built» — Dạng built không khớp với trợ động từ will have been; ở đây cần building.
[C] «building» — Đúng cấu trúc Future Perfect Continuous trong câu: chọn building. Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.
[D] «build» — Dạng build không khớp với trợ động từ will have been; ở đây cần building.', 2, 114
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=114 AND old.question_text='Our engineers will have been _____ the demonstration unit for three hours by noon tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to build' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'built' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'building' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'build' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=114 AND q.question_text='Our engineers will have been _____ the demonstration unit for three hours by noon tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the manager have been updating the delivery schedule for three hours by noon tomorrow?', '[PHÂN TÍCH]
[A] «Will» — Đúng cấu trúc Future Perfect Continuous trong câu: chọn Will. Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.
[B] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.
[C] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.
[D] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.', 2, 115
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=115 AND old.question_text='_____ the manager have been updating the delivery schedule for three hours by noon tomorrow?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=115 AND q.question_text='_____ the manager have been updating the delivery schedule for three hours by noon tomorrow?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The operators will not _____ the water temperature for three hours by noon tomorrow.', '[PHÂN TÍCH]
[A] «measuring» — Sau will not ở mẫu Future Perfect Continuous, phần còn lại phải là have been measuring.
[B] «to measure» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.
[C] «have been measuring» — Đúng cấu trúc Future Perfect Continuous trong câu: chọn have been measuring. Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.
[D] «measured» — Sau will not ở mẫu Future Perfect Continuous, phần còn lại phải là have been measuring.', 2, 116
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=116 AND old.question_text='The operators will not _____ the water temperature for three hours by noon tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'measuring' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'to measure' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'have been measuring' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'measured' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=116 AND q.question_text='The operators will not _____ the water temperature for three hours by noon tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The assistant _____ the training materials for three hours by noon tomorrow.', '[PHÂN TÍCH]
[A] «organizing» — V-ing đứng một mình không làm vị ngữ hữu hạn cho chủ ngữ này.
[B] «will have been organizing» — Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.
[C] «will organized» — Sau will phải là động từ nguyên mẫu, không dùng V3 trong cấu trúc này.
[D] «has organizing» — Have/has đi với V3, hoặc cần thêm been trước V-ing.', 2, 117
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=117 AND old.question_text='The assistant _____ the training materials for three hours by noon tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'organizing' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'will have been organizing' AS opt_text, 1 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'will organized' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'has organizing' AS opt_text, 0 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=117 AND q.question_text='The assistant _____ the training materials for three hours by noon tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The consultants will have been _____ the suppliers for three hours by noon tomorrow.', '[PHÂN TÍCH]
[A] «to compare» — Dạng to compare không khớp với trợ động từ will have been; ở đây cần comparing.
[B] «compared» — Dạng compared không khớp với trợ động từ will have been; ở đây cần comparing.
[C] «compare» — Dạng compare không khớp với trợ động từ will have been; ở đây cần comparing.
[D] «comparing» — Đúng cấu trúc Future Perfect Continuous trong câu: chọn comparing. Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.', 2, 118
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=118 AND old.question_text='The consultants will have been _____ the suppliers for three hours by noon tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to compare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'compared' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'compare' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'comparing' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=118 AND q.question_text='The consultants will have been _____ the suppliers for three hours by noon tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, '_____ the researcher have been collecting the survey responses for three hours by noon tomorrow?', '[PHÂN TÍCH]
[A] «Has» — Has không phù hợp với mốc tương lai và cấu trúc động từ đang có.
[B] «Did» — Did hỏi về quá khứ, trái với mốc tương lai.
[C] «Was» — Was là dạng quá khứ của be, không dùng để hỏi về mốc tương lai ở đây.
[D] «Will» — Đúng cấu trúc Future Perfect Continuous trong câu: chọn Will. Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.', 2, 119
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=119 AND old.question_text='_____ the researcher have been collecting the survey responses for three hours by noon tomorrow?');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'Has' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'Did' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'Was' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'Will' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=119 AND q.question_text='_____ the researcher have been collecting the survey responses for three hours by noon tomorrow?'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
INSERT INTO grammar_questions(lesson_id, question_text, explanation, difficulty, sort_order)
SELECT l.id, 'The developers will not _____ the changes for three hours by noon tomorrow.', '[PHÂN TÍCH]
[A] «to document» — Sau will not không dùng to + động từ. Câu này luyện cấu trúc của bài học.
[B] «documented» — Sau will not ở mẫu Future Perfect Continuous, phần còn lại phải là have been documenting.
[C] «documenting» — Sau will not ở mẫu Future Perfect Continuous, phần còn lại phải là have been documenting.
[D] «have been documenting» — Đúng cấu trúc Future Perfect Continuous trong câu: chọn have been documenting. Nhấn mạnh thời lượng tính đến trưa mai; dùng will have been + V-ing.', 2, 120
FROM grammar_lessons l WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)'
AND NOT EXISTS (SELECT 1 FROM grammar_questions old WHERE old.lesson_id=l.id AND old.sort_order=120 AND old.question_text='The developers will not _____ the changes for three hours by noon tomorrow.');
INSERT INTO grammar_options(question_id, option_label, option_text, is_correct)
SELECT q.id, choices.opt_label, choices.opt_text, choices.opt_correct
FROM grammar_questions q JOIN grammar_lessons l ON l.id=q.lesson_id
CROSS JOIN (
SELECT 'A' AS opt_label, 'to document' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'B' AS opt_label, 'documented' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'C' AS opt_label, 'documenting' AS opt_text, 0 AS opt_correct
UNION ALL SELECT 'D' AS opt_label, 'have been documenting' AS opt_text, 1 AS opt_correct
) choices
WHERE l.title = 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)' AND q.sort_order=120 AND q.question_text='The developers will not _____ the changes for three hours by noon tomorrow.'
AND NOT EXISTS (SELECT 1 FROM grammar_options old WHERE old.question_id=q.id AND old.option_label=choices.opt_label);
