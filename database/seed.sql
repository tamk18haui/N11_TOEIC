-- Original teaching examples for the N11 classroom demonstration.
-- Demo accounts only. Password: N11@Demo2026. Change/remove before public deployment.
INSERT INTO users(id,email,password_hash,role,status) VALUES(1,'admin@n11.local','$2a$10$ft5LjJR1ntQf4p2XoAmZS.sD5n8EjRMzCfkEvVUU67I9V2aMvl6y2','ADMIN','ACTIVE');
INSERT INTO users(id,email,password_hash,role,status) VALUES(2,'student@n11.local','$2a$10$ft5LjJR1ntQf4p2XoAmZS.sD5n8EjRMzCfkEvVUU67I9V2aMvl6y2','STUDENT','ACTIVE');
INSERT INTO grammar_topics(id,title,description,sort_order,is_published) VALUES(1,'Các thì','Kiến thức các thì trong TOEIC.',1,1);
INSERT INTO grammar_topics(id,title,description,sort_order,is_published) VALUES(2,'Từ loại','Kiến thức từ loại trong TOEIC.',2,1);
INSERT INTO grammar_topics(id,title,description,sort_order,is_published) VALUES(3,'Cấu trúc câu','Kiến thức cấu trúc câu trong TOEIC.',3,1);
INSERT INTO grammar_topics(id,title,description,sort_order,is_published) VALUES(4,'Mệnh đề','Kiến thức mệnh đề trong TOEIC.',4,1);
INSERT INTO grammar_lessons(id,topic_id,title,content_html,level,sort_order,is_published,created_by) VALUES(1,1,'Hiện tại đơn (Present Simple)','<p data-n11="summary">Diễn tả thói quen, sự thật và lịch trình. Nắm cách chia động từ và nhận biết chủ ngữ số ít.</p><section data-n11="lecture"><h2>1. Cách dùng</h2><p>Dùng hiện tại đơn cho hành động thường xuyên, sự thật, trạng thái ổn định và lịch trình cố định. Với động từ thường, chủ ngữ he/she/it hoặc danh từ số ít đi với V-s/es.</p><h2>2. Cấu trúc cần nhớ</h2><table><thead><tr><th>Dạng câu / vị trí</th><th>Cấu trúc</th></tr></thead><tbody><tr><td>Khẳng định</td><td>S + V(s/es).</td></tr><tr><td>Phủ định</td><td>S + do/does not + V nguyên mẫu.</td></tr><tr><td>Nghi vấn</td><td>Do/Does + S + V nguyên mẫu?</td></tr><tr><td>Động từ be</td><td>I am; he/she/it is; you/we/they are.</td></tr></tbody></table><h2>3. Dấu hiệu và cách nhận biết</h2><p>Often, usually, always, sometimes, every day/week. Thêm -es cho động từ kết thúc bằng s, sh, ch, x, o; đổi phụ âm + y thành -ies.</p><h2>4. Áp dụng trong TOEIC</h2><blockquote>Sau does hoặc does not, động từ chính trở về nguyên mẫu: She does not work, không dùng does not works.</blockquote><p>Đọc toàn bộ câu, xác định chủ ngữ và mốc thời gian trước khi so sánh các phương án. Hãy chuyển sang phần Ví dụ để xem cách dùng trong bối cảnh công việc.</p></section><section data-n11="examples"><h2>Ví dụ thực tế</h2><article data-example-id="1" data-order="1"><p class="sentence">Our office opens at eight every weekday.</p><p class="translation">Văn phòng chúng tôi mở cửa lúc tám giờ mỗi ngày trong tuần.</p><p class="note">Our office là số ít; opens diễn tả lịch trình.</p></article><article data-example-id="2" data-order="2"><p class="sentence">The engineers do not work on Sundays.</p><p class="translation">Các kỹ sư không làm việc vào Chủ nhật.</p><p class="note">Chủ ngữ số nhiều dùng do not + work.</p></article><article data-example-id="3" data-order="3"><p class="sentence">Does your manager approve travel requests?</p><p class="translation">Quản lý của bạn có duyệt các đề nghị công tác không?</p><p class="note">Does đứng trước chủ ngữ; approve giữ nguyên mẫu.</p></article></section>','BASIC',1,1,1);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(1,1,'The receptionist _____ visitors every morning.','Every morning chỉ thói quen; receptionist là số ít nên dùng greets.',1,1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(1,1,'A','greet',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(2,1,'B','greets',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(3,1,'C','greeting',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(4,1,'D','greeted',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(2,1,'Our employees _____ safety training every year.','Employees là số nhiều nên dùng attend.',1,2);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(5,2,'A','attends',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(6,2,'B','attending',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(7,2,'C','attend',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(8,2,'D','has attended',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(3,1,'The store does not _____ on public holidays.','Sau does not dùng động từ nguyên mẫu open.',1,3);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(9,3,'A','opens',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(10,3,'B','opened',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(11,3,'C','opening',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(12,3,'D','open',1);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(4,1,'_____ the bus leave at six every day?','The bus là số ít; câu hỏi hiện tại đơn dùng Does + S + V.',1,4);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(13,4,'A','Does',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(14,4,'B','Do',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(15,4,'C','Is',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(16,4,'D','Has',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(5,1,'The meeting rooms _____ on the second floor.','Meeting rooms là số nhiều nên dùng are.',1,5);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(17,5,'A','is',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(18,5,'B','be',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(19,5,'C','are',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(20,5,'D','am',0);
INSERT INTO grammar_lessons(id,topic_id,title,content_html,level,sort_order,is_published,created_by) VALUES(2,1,'Hiện tại tiếp diễn (Present Continuous)','<p data-n11="summary">Mô tả việc đang diễn ra và tình huống tạm thời với cấu trúc be + V-ing.</p><section data-n11="lecture"><h2>1. Cách dùng</h2><p>Dùng cho hành động đang diễn ra lúc nói, hoạt động tạm thời trong giai đoạn hiện tại hoặc kế hoạch tương lai đã sắp xếp. Phân biệt với hiện tại đơn mô tả thói quen.</p><h2>2. Cấu trúc cần nhớ</h2><table><thead><tr><th>Dạng câu / vị trí</th><th>Cấu trúc</th></tr></thead><tbody><tr><td>Khẳng định</td><td>S + am/is/are + V-ing.</td></tr><tr><td>Phủ định</td><td>S + am/is/are not + V-ing.</td></tr><tr><td>Nghi vấn</td><td>Am/Is/Are + S + V-ing?</td></tr></tbody></table><h2>3. Dấu hiệu và cách nhận biết</h2><p>Now, right now, at the moment, currently. Bỏ e câm trước -ing (write → writing); một số động từ ngắn gấp đôi phụ âm cuối (run → running).</p><h2>4. Áp dụng trong TOEIC</h2><blockquote>Động từ chỉ trạng thái như know, own thường không dùng dạng tiếp diễn trong nghĩa thông thường. Chọn is/are dựa trên chủ ngữ.</blockquote><p>Đọc toàn bộ câu, xác định chủ ngữ và mốc thời gian trước khi so sánh các phương án. Hãy chuyển sang phần Ví dụ để xem cách dùng trong bối cảnh công việc.</p></section><section data-n11="examples"><h2>Ví dụ thực tế</h2><article data-example-id="4" data-order="1"><p class="sentence">The technician is installing new software now.</p><p class="translation">Kỹ thuật viên đang cài phần mềm mới.</p><p class="note">Is + installing diễn tả việc đang diễn ra.</p></article><article data-example-id="5" data-order="2"><p class="sentence">We are working from home this week.</p><p class="translation">Chúng tôi đang làm việc tại nhà tuần này.</p><p class="note">This week là tình huống tạm thời.</p></article><article data-example-id="6" data-order="3"><p class="sentence">They are meeting the supplier tomorrow.</p><p class="translation">Họ sẽ gặp nhà cung cấp vào ngày mai.</p><p class="note">Tiếp diễn diễn tả cuộc hẹn đã sắp xếp.</p></article></section>','BASIC',2,1,1);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(6,2,'The director _____ a client at the moment.','At the moment và chủ ngữ số ít phù hợp is meeting.',1,1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(21,6,'A','meets',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(22,6,'B','is meeting',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(23,6,'C','met',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(24,6,'D','has met',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(7,2,'Our designers are _____ a new logo.','Sau are cần V-ing: creating.',1,2);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(25,7,'A','create',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(26,7,'B','creates',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(27,7,'C','created',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(28,7,'D','creating',1);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(8,2,'The employees _____ attending a workshop now.','Employees số nhiều dùng are.',1,3);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(29,8,'A','is',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(30,8,'B','am',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(31,8,'C','are',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(32,8,'D','be',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(9,2,'Please wait. I _____ the figures right now.','Right now chỉ hành động đang diễn ra: am checking.',1,4);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(33,9,'A','am checking',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(34,9,'B','check',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(35,9,'C','checked',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(36,9,'D','checks',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(10,2,'The printer is not _____ properly today.','Cấu trúc phủ định tiếp diễn: is not working.',1,5);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(37,10,'A','work',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(38,10,'B','works',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(39,10,'C','working',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(40,10,'D','worked',0);
INSERT INTO grammar_lessons(id,topic_id,title,content_html,level,sort_order,is_published,created_by) VALUES(3,1,'Quá khứ đơn (Past Simple)','<p data-n11="summary">Kể về công việc đã kết thúc trong quá khứ; phân biệt V2/ed và did + V.</p><section data-n11="lecture"><h2>1. Cách dùng</h2><p>Dùng cho hành động đã kết thúc tại một thời điểm trong quá khứ hoặc chuỗi sự kiện nối tiếp. Động từ có quy tắc thêm -ed; động từ bất quy tắc cần học dạng V2.</p><h2>2. Cấu trúc cần nhớ</h2><table><thead><tr><th>Dạng câu / vị trí</th><th>Cấu trúc</th></tr></thead><tbody><tr><td>Khẳng định</td><td>S + V2/ed.</td></tr><tr><td>Phủ định</td><td>S + did not + V nguyên mẫu.</td></tr><tr><td>Nghi vấn</td><td>Did + S + V nguyên mẫu?</td></tr><tr><td>Động từ be</td><td>I/he/she/it was; you/we/they were.</td></tr></tbody></table><h2>3. Dấu hiệu và cách nhận biết</h2><p>Yesterday, last week/month/year, two days ago, in 2020. Những mốc quá khứ đã kết thúc thường đi với quá khứ đơn.</p><h2>4. Áp dụng trong TOEIC</h2><blockquote>Sau did hoặc did not không chia quá khứ động từ chính. Với be, dùng was/were mà không dùng did.</blockquote><p>Đọc toàn bộ câu, xác định chủ ngữ và mốc thời gian trước khi so sánh các phương án. Hãy chuyển sang phần Ví dụ để xem cách dùng trong bối cảnh công việc.</p></section><section data-n11="examples"><h2>Ví dụ thực tế</h2><article data-example-id="7" data-order="1"><p class="sentence">The team finished the audit yesterday.</p><p class="translation">Nhóm đã hoàn tất kiểm toán hôm qua.</p><p class="note">Yesterday là mốc quá khứ xác định.</p></article><article data-example-id="8" data-order="2"><p class="sentence">We did not receive the parcel last week.</p><p class="translation">Chúng tôi không nhận được bưu kiện tuần trước.</p><p class="note">Did not + receive nguyên mẫu.</p></article><article data-example-id="9" data-order="3"><p class="sentence">The conference was successful.</p><p class="translation">Hội nghị đã thành công.</p><p class="note">Conference số ít đi với was.</p></article></section>','BASIC',3,1,1);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(11,3,'The company _____ a new branch last year.','Last year đã kết thúc, dùng opened.',1,1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(41,11,'A','opens',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(42,11,'B','opened',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(43,11,'C','opening',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(44,11,'D','has opened',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(12,3,'Did you _____ the report yesterday?','Sau Did dùng send nguyên mẫu.',1,2);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(45,12,'A','sent',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(46,12,'B','sends',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(47,12,'C','send',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(48,12,'D','sending',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(13,3,'The guests _____ late for the event last night.','Guests số nhiều và last night: were.',1,3);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(49,13,'A','are',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(50,13,'B','is',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(51,13,'C','was',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(52,13,'D','were',1);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(14,3,'She did not _____ the invitation.','Did not + receive.',1,4);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(53,14,'A','receive',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(54,14,'B','received',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(55,14,'C','receives',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(56,14,'D','receiving',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(15,3,'We _____ to Singapore two weeks ago.','Two weeks ago dùng quá khứ đơn; go có V2 là went.',1,5);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(57,15,'A','go',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(58,15,'B','gone',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(59,15,'C','went',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(60,15,'D','going',0);
INSERT INTO grammar_lessons(id,topic_id,title,content_html,level,sort_order,is_published,created_by) VALUES(4,1,'Hiện tại hoàn thành (Present Perfect)','<p data-n11="summary">Kết nối quá khứ với hiện tại qua trải nghiệm, kết quả và thời gian kéo dài.</p><section data-n11="lecture"><h2>1. Cách dùng</h2><p>Dùng để nói về trải nghiệm không nêu thời gian quá khứ cụ thể, hành động có kết quả ở hiện tại hoặc việc bắt đầu trước đây và còn tiếp tục. Cấu trúc have/has + V3/ed.</p><h2>2. Cấu trúc cần nhớ</h2><table><thead><tr><th>Dạng câu / vị trí</th><th>Cấu trúc</th></tr></thead><tbody><tr><td>Khẳng định</td><td>S + have/has + V3/ed.</td></tr><tr><td>Phủ định</td><td>S + have/has not + V3/ed.</td></tr><tr><td>Nghi vấn</td><td>Have/Has + S + V3/ed?</td></tr></tbody></table><h2>3. Dấu hiệu và cách nhận biết</h2><p>Already, just, yet, ever, never, so far, since + mốc thời gian, for + khoảng thời gian. Không dùng với yesterday/last year khi chúng chỉ thời điểm đã kết thúc.</p><h2>4. Áp dụng trong TOEIC</h2><blockquote>Phân biệt since 2022 và for three years. Has dùng với chủ ngữ ngôi thứ ba số ít; have dùng với I/you/we/they.</blockquote><p>Đọc toàn bộ câu, xác định chủ ngữ và mốc thời gian trước khi so sánh các phương án. Hãy chuyển sang phần Ví dụ để xem cách dùng trong bối cảnh công việc.</p></section><section data-n11="examples"><h2>Ví dụ thực tế</h2><article data-example-id="10" data-order="1"><p class="sentence">We have already sent the quotation.</p><p class="translation">Chúng tôi đã gửi báo giá rồi.</p><p class="note">Already nhấn mạnh kết quả đã hoàn thành.</p></article><article data-example-id="11" data-order="2"><p class="sentence">She has worked here since 2022.</p><p class="translation">Cô ấy làm việc ở đây từ năm 2022 đến nay.</p><p class="note">Since đi với mốc bắt đầu.</p></article><article data-example-id="12" data-order="3"><p class="sentence">Have you ever attended an online conference?</p><p class="translation">Bạn đã từng tham dự hội nghị trực tuyến chưa?</p><p class="note">Ever hỏi về trải nghiệm.</p></article></section>','INTERMEDIATE',4,1,1);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(16,4,'The manager _____ already approved the budget.','Manager số ít nên dùng has + approved.',2,1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(61,16,'A','have',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(62,16,'B','has',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(63,16,'C','is',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(64,16,'D','does',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(17,4,'We have worked together _____ five years.','Five years là khoảng thời gian, dùng for.',2,2);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(65,17,'A','since',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(66,17,'B','at',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(67,17,'C','for',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(68,17,'D','by',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(18,4,'She has been in this department _____ 2021.','2021 là mốc thời gian nên dùng since.',2,3);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(69,18,'A','for',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(70,18,'B','during',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(71,18,'C','on',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(72,18,'D','since',1);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(19,4,'They have not _____ the invoice yet.','Have not cần V3; paid là V3 của pay.',2,4);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(73,19,'A','paid',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(74,19,'B','pay',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(75,19,'C','paying',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(76,19,'D','pays',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(20,4,'_____ you ever visited our factory?','Câu hỏi trải nghiệm: Have you ever + V3?',2,5);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(77,20,'A','Did',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(78,20,'B','Are',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(79,20,'C','Have',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(80,20,'D','Does',0);
INSERT INTO grammar_lessons(id,topic_id,title,content_html,level,sort_order,is_published,created_by) VALUES(5,2,'Từ loại trong TOEIC (Parts of Speech)','<p data-n11="summary">Nhận biết danh từ, động từ, tính từ và trạng từ qua vị trí trong câu.</p><section data-n11="lecture"><h2>1. Cách dùng</h2><p>Danh từ gọi tên người/vật/khái niệm; động từ diễn tả hành động hoặc trạng thái; tính từ bổ nghĩa danh từ; trạng từ thường bổ nghĩa động từ, tính từ hoặc trạng từ khác.</p><h2>2. Cấu trúc cần nhớ</h2><table><thead><tr><th>Dạng câu / vị trí</th><th>Cấu trúc</th></tr></thead><tbody><tr><td>Sau mạo từ và tính từ</td><td>a/an/the + (adjective) + noun</td></tr><tr><td>Trước danh từ</td><td>adjective + noun</td></tr><tr><td>Bổ nghĩa động từ</td><td>verb + adverb hoặc adverb + verb</td></tr><tr><td>Sau be/seem/become</td><td>Thường dùng adjective khi mô tả tính chất của chủ ngữ.</td></tr></tbody></table><h2>3. Dấu hiệu và cách nhận biết</h2><p>Danh từ thường có hậu tố -tion, -ment, -ness; tính từ -ive, -ful, -able; trạng từ thường -ly. Hậu tố chỉ là gợi ý, phải kiểm tra cấu trúc và nghĩa.</p><h2>4. Áp dụng trong TOEIC</h2><blockquote>Không phải mọi từ -ly đều là trạng từ: friendly là tính từ. Xác định vị trí trống trước khi dịch các đáp án cùng gốc từ.</blockquote><p>Đọc toàn bộ câu, xác định chủ ngữ và mốc thời gian trước khi so sánh các phương án. Hãy chuyển sang phần Ví dụ để xem cách dùng trong bối cảnh công việc.</p></section><section data-n11="examples"><h2>Ví dụ thực tế</h2><article data-example-id="13" data-order="1"><p class="sentence">The new assistant is very efficient.</p><p class="translation">Trợ lý mới làm việc rất hiệu quả.</p><p class="note">Sau is và very cần tính từ efficient.</p></article><article data-example-id="14" data-order="2"><p class="sentence">Please read the instructions carefully.</p><p class="translation">Vui lòng đọc hướng dẫn cẩn thận.</p><p class="note">Carefully bổ nghĩa read.</p></article><article data-example-id="15" data-order="3"><p class="sentence">Customer satisfaction is our priority.</p><p class="translation">Sự hài lòng của khách hàng là ưu tiên của chúng tôi.</p><p class="note">Satisfaction là danh từ làm chủ ngữ.</p></article></section>','BASIC',5,1,1);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(21,5,'The team completed the task _____.','Chỗ trống bổ nghĩa completed nên cần trạng từ successfully.',1,1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(81,21,'A','successful',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(82,21,'B','success',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(83,21,'C','successfully',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(84,21,'D','succeed',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(22,5,'We need a detailed _____ of the costs.','Sau a detailed cần danh từ analysis.',1,2);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(85,22,'A','analyze',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(86,22,'B','analysis',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(87,22,'C','analytical',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(88,22,'D','analytically',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(23,5,'The new system is highly _____.','Sau is highly cần tính từ reliable.',1,3);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(89,23,'A','reliably',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(90,23,'B','rely',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(91,23,'C','reliability',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(92,23,'D','reliable',1);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(24,5,'Please _____ your attendance by Friday.','Câu mệnh lệnh dùng động từ nguyên mẫu confirm.',1,4);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(93,24,'A','confirm',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(94,24,'B','confirmation',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(95,24,'C','confirmed',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(96,24,'D','confirming',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(25,5,'The staff gave us a _____ welcome.','Trước danh từ welcome cần tính từ friendly.',1,5);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(97,25,'A','friend',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(98,25,'B','friendship',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(99,25,'C','friendly',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(100,25,'D','friends',0);
INSERT INTO grammar_lessons(id,topic_id,title,content_html,level,sort_order,is_published,created_by) VALUES(6,3,'Câu bị động (Passive Voice)','<p data-n11="summary">Chuyển trọng tâm sang đối tượng nhận hành động bằng be + V3/ed.</p><section data-n11="lecture"><h2>1. Cách dùng</h2><p>Câu bị động nhấn mạnh người hoặc vật chịu tác động. Động từ be mang thì và hòa hợp với chủ ngữ; động từ chính ở dạng quá khứ phân từ V3/ed. Có thể thêm by + tác nhân khi cần.</p><h2>2. Cấu trúc cần nhớ</h2><table><thead><tr><th>Dạng câu / vị trí</th><th>Cấu trúc</th></tr></thead><tbody><tr><td>Hiện tại đơn</td><td>S + am/is/are + V3/ed.</td></tr><tr><td>Quá khứ đơn</td><td>S + was/were + V3/ed.</td></tr><tr><td>Tương lai đơn</td><td>S + will be + V3/ed.</td></tr><tr><td>Động từ khuyết thiếu</td><td>S + can/must/should + be + V3/ed.</td></tr></tbody></table><h2>3. Dấu hiệu và cách nhận biết</h2><p>Xác định chủ ngữ tự thực hiện hay nhận hành động. Documents are reviewed: tài liệu được kiểm tra; staff review documents: nhân viên kiểm tra tài liệu.</p><h2>4. Áp dụng trong TOEIC</h2><blockquote>Không chọn bị động chỉ vì thấy by. Kết hợp nghĩa của chủ ngữ, tính chuyển tác của động từ và dấu hiệu thời gian.</blockquote><p>Đọc toàn bộ câu, xác định chủ ngữ và mốc thời gian trước khi so sánh các phương án. Hãy chuyển sang phần Ví dụ để xem cách dùng trong bối cảnh công việc.</p></section><section data-n11="examples"><h2>Ví dụ thực tế</h2><article data-example-id="16" data-order="1"><p class="sentence">All applications are reviewed by the HR team.</p><p class="translation">Tất cả hồ sơ được nhóm nhân sự xem xét.</p><p class="note">Applications nhận hành động; are reviewed.</p></article><article data-example-id="17" data-order="2"><p class="sentence">The contract was signed yesterday.</p><p class="translation">Hợp đồng đã được ký hôm qua.</p><p class="note">Quá khứ đơn bị động: was signed.</p></article><article data-example-id="18" data-order="3"><p class="sentence">Safety helmets must be worn on site.</p><p class="translation">Phải đội mũ bảo hộ tại công trường.</p><p class="note">Must be + V3: worn.</p></article></section>','INTERMEDIATE',6,1,1);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(26,6,'The invoices _____ every Friday.','Invoices nhận hành động xử lý định kỳ: are processed.',2,1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(101,26,'A','process',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(102,26,'B','are processed',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(103,26,'C','processed',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(104,26,'D','processing',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(27,6,'The package was _____ this morning.','Was + V3 delivered tạo bị động.',2,2);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(105,27,'A','deliver',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(106,27,'B','delivers',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(107,27,'C','delivering',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(108,27,'D','delivered',1);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(28,6,'The new policy will _____ next month.','Tương lai bị động: will be introduced.',2,3);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(109,28,'A','introduce',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(110,28,'B','introduced',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(111,28,'C','be introduced',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(112,28,'D','introducing',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(29,6,'Visitors must _____ at reception.','Must + be + V3.',2,4);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(113,29,'A','be registered',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(114,29,'B','registering',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(115,29,'C','registered',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(116,29,'D','been registered',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(30,6,'The rooms _____ cleaned yesterday.','Rooms số nhiều và yesterday: were cleaned.',2,5);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(117,30,'A','are',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(118,30,'B','is',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(119,30,'C','were',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(120,30,'D','was',0);
INSERT INTO grammar_lessons(id,topic_id,title,content_html,level,sort_order,is_published,created_by) VALUES(7,3,'Câu điều kiện (Conditionals)','<p data-n11="summary">Phân biệt điều kiện có thật và giả định qua cấu trúc của hai mệnh đề.</p><section data-n11="lecture"><h2>1. Cách dùng</h2><p>Câu điều kiện gồm mệnh đề if và mệnh đề kết quả. Loại 0 nói quy luật; loại 1 nói khả năng tương lai; loại 2 nói giả định trái hiện tại hoặc khó xảy ra; loại 3 giả định trái quá khứ.</p><h2>2. Cấu trúc cần nhớ</h2><table><thead><tr><th>Dạng câu / vị trí</th><th>Cấu trúc</th></tr></thead><tbody><tr><td>Loại 0</td><td>If + hiện tại đơn, hiện tại đơn.</td></tr><tr><td>Loại 1</td><td>If + hiện tại đơn, will + V.</td></tr><tr><td>Loại 2</td><td>If + quá khứ đơn, would + V.</td></tr><tr><td>Loại 3</td><td>If + had + V3, would have + V3.</td></tr></tbody></table><h2>3. Dấu hiệu và cách nhận biết</h2><p>Unless có nghĩa if not. Khi mệnh đề if đứng đầu câu, thường dùng dấu phẩy trước mệnh đề kết quả. Trong giả định loại 2, were có thể dùng với mọi chủ ngữ.</p><h2>4. Áp dụng trong TOEIC</h2><blockquote>Trong mẫu điều kiện loại 1 thông thường, không dùng will trong mệnh đề if. Đọc cả hai vế để chọn cấu trúc phù hợp.</blockquote><p>Đọc toàn bộ câu, xác định chủ ngữ và mốc thời gian trước khi so sánh các phương án. Hãy chuyển sang phần Ví dụ để xem cách dùng trong bối cảnh công việc.</p></section><section data-n11="examples"><h2>Ví dụ thực tế</h2><article data-example-id="19" data-order="1"><p class="sentence">If you order today, we will ship tomorrow.</p><p class="translation">Nếu bạn đặt hôm nay, chúng tôi sẽ giao ngày mai.</p><p class="note">Khả năng thực tế tương lai: loại 1.</p></article><article data-example-id="20" data-order="2"><p class="sentence">If I were the manager, I would change the schedule.</p><p class="translation">Nếu tôi là quản lý, tôi sẽ đổi lịch.</p><p class="note">Giả định hiện tại: loại 2.</p></article><article data-example-id="21" data-order="3"><p class="sentence">If we had left earlier, we would have arrived on time.</p><p class="translation">Nếu đã rời đi sớm hơn, chúng tôi đã đến đúng giờ.</p><p class="note">Giả định trái quá khứ: loại 3.</p></article></section>','INTERMEDIATE',7,1,1);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(31,7,'If it rains tomorrow, we _____ the event indoors.','Loại 1: if hiện tại đơn, will + V.',2,1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(121,31,'A','held',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(122,31,'B','will hold',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(123,31,'C','had held',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(124,31,'D','holding',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(32,7,'If I _____ more time, I would attend the course.','Would attend gợi ý loại 2, dùng had.',2,2);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(125,32,'A','have',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(126,32,'B','will have',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(127,32,'C','had',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(128,32,'D','having',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(33,7,'If she had called, we _____ her at the station.','Loại 3 cần would have + V3.',2,3);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(129,33,'A','meet',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(130,33,'B','will meet',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(131,33,'C','would meet',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(132,33,'D','would have met',1);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(34,7,'Unless you _____ now, you will miss the bus.','Unless + hiện tại đơn trong điều kiện tương lai.',2,4);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(133,34,'A','leave',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(134,34,'B','left',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(135,34,'C','will leave',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(136,34,'D','leaving',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(35,7,'If I _____ you, I would check the figures again.','Mẫu giả định If I were you.',2,5);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(137,35,'A','am',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(138,35,'B','was being',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(139,35,'C','were',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(140,35,'D','be',0);
INSERT INTO grammar_lessons(id,topic_id,title,content_html,level,sort_order,is_published,created_by) VALUES(8,4,'Mệnh đề quan hệ (Relative Clauses)','<p data-n11="summary">Dùng who, which, that, whose và where để bổ sung thông tin rõ ràng cho danh từ.</p><section data-n11="lecture"><h2>1. Cách dùng</h2><p>Mệnh đề quan hệ bổ nghĩa danh từ đứng trước. Mệnh đề xác định cung cấp thông tin cần thiết; mệnh đề không xác định thêm thông tin và được ngăn bằng dấu phẩy.</p><h2>2. Cấu trúc cần nhớ</h2><table><thead><tr><th>Dạng câu / vị trí</th><th>Cấu trúc</th></tr></thead><tbody><tr><td>Người</td><td>who/that + động từ (chủ ngữ)</td></tr><tr><td>Vật</td><td>which/that + mệnh đề</td></tr><tr><td>Sở hữu</td><td>whose + danh từ</td></tr><tr><td>Nơi chốn</td><td>where + chủ ngữ + động từ</td></tr></tbody></table><h2>3. Dấu hiệu và cách nhận biết</h2><p>Who chỉ người; which chỉ vật; whose thể hiện sở hữu. That dùng trong mệnh đề xác định, không dùng sau dấu phẩy ở mệnh đề không xác định.</p><h2>4. Áp dụng trong TOEIC</h2><blockquote>Xem chỗ trống thiếu chủ ngữ, tân ngữ hay trạng ngữ. The office where we work khác the office which was renovated: câu sau thiếu chủ ngữ.</blockquote><p>Đọc toàn bộ câu, xác định chủ ngữ và mốc thời gian trước khi so sánh các phương án. Hãy chuyển sang phần Ví dụ để xem cách dùng trong bối cảnh công việc.</p></section><section data-n11="examples"><h2>Ví dụ thực tế</h2><article data-example-id="22" data-order="1"><p class="sentence">The consultant who joined today has ten years of experience.</p><p class="translation">Chuyên gia vừa gia nhập hôm nay có mười năm kinh nghiệm.</p><p class="note">Who làm chủ ngữ cho joined.</p></article><article data-example-id="23" data-order="2"><p class="sentence">This is the office where we hold interviews.</p><p class="translation">Đây là văn phòng nơi chúng tôi tổ chức phỏng vấn.</p><p class="note">Where chỉ địa điểm; mệnh đề đã có we làm chủ ngữ.</p></article><article data-example-id="24" data-order="3"><p class="sentence">The employee whose proposal won will receive a bonus.</p><p class="translation">Nhân viên có đề xuất thắng cuộc sẽ nhận thưởng.</p><p class="note">Whose + proposal thể hiện sở hữu.</p></article></section>','ADVANCED',8,1,1);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(36,8,'The employee _____ handles payroll is on leave.','Employee là người; who làm chủ ngữ handles.',3,1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(141,36,'A','which',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(142,36,'B','who',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(143,36,'C','where',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(144,36,'D','whose',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(37,8,'The software, _____ was updated yesterday, works well.','Mệnh đề không xác định chỉ vật dùng which.',3,2);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(145,37,'A','that',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(146,37,'B','who',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(147,37,'C','which',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(148,37,'D','where',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(38,8,'We hired a designer _____ portfolio was impressive.','Whose + portfolio thể hiện sở hữu.',3,3);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(149,38,'A','who',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(150,38,'B','which',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(151,38,'C','where',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(152,38,'D','whose',1);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(39,8,'This is the hotel _____ the delegates are staying.','Mệnh đề đã có the delegates làm chủ ngữ; where chỉ nơi ở.',3,4);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(153,39,'A','where',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(154,39,'B','which',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(155,39,'C','who',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(156,39,'D','whose',0);
INSERT INTO grammar_questions(id,lesson_id,question_text,explanation,difficulty,sort_order) VALUES(40,8,'The machine _____ stopped working needs repair.','Machine là vật và thiếu chủ ngữ cho stopped: that.',3,5);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(157,40,'A','who',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(158,40,'B','where',0);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(159,40,'C','that',1);
INSERT INTO grammar_options(id,question_id,option_label,option_text,is_correct) VALUES(160,40,'D','whose',0);

-- Vocabulary topics and sample data for testing
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(1,'Work and Careers','Từ vựng IELTS về công việc, nghề nghiệp và môi trường văn phòng.','BASIC',1,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(2,'Travel and Transport','Từ vựng IELTS về du lịch, phương tiện và giao thông.','BASIC',2,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(3,'Shopping and Consumerism','Từ vựng IELTS về mua sắm, tiêu dùng và dịch vụ.','BASIC',3,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(4,'Education','Từ vựng về trường học, học tập và giáo dục suốt đời.','BASIC',4,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(5,'Environment','Từ vựng về môi trường, bảo tồn và biến đổi khí hậu.','BASIC',5,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(6,'Health and Well-being','Từ vựng về sức khỏe, lối sống và chăm sóc y tế.','BASIC',6,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(7,'Technology','Từ vựng về công nghệ, internet và đổi mới.','BASIC',7,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(8,'Society','Từ vựng về cộng đồng, dân số và các vấn đề xã hội.','INTERMEDIATE',8,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(9,'Culture and Traditions','Từ vựng về văn hóa, bản sắc và truyền thống.','INTERMEDIATE',9,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(10,'Media and Communication','Từ vựng về truyền thông, báo chí và giao tiếp.','INTERMEDIATE',10,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(11,'Food and Agriculture','Từ vựng về thực phẩm, dinh dưỡng và nông nghiệp.','BASIC',11,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(12,'Government and Public Services','Từ vựng về chính phủ, chính sách và dịch vụ công.','ADVANCED',12,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(13,'Economy and Finance','Từ vựng về kinh tế, tài chính và thương mại.','INTERMEDIATE',13,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(14,'Science and Research','Từ vựng về khoa học, nghiên cứu và phát minh.','ADVANCED',14,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(15,'Crime and Law','Từ vựng về luật pháp, an ninh và hệ thống tư pháp.','ADVANCED',15,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(16,'Globalization','Từ vựng về hội nhập, thương mại và hợp tác quốc tế.','ADVANCED',16,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(17,'Urbanization and Housing','Từ vựng về đô thị hóa, nhà ở và quy hoạch thành phố.','INTERMEDIATE',17,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(18,'Family and Relationships','Từ vựng về gia đình, các thế hệ và quan hệ xã hội.','BASIC',18,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(19,'Sports and Recreation','Từ vựng về thể thao, giải trí và hoạt động ngoài trời.','BASIC',19,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(20,'Tourism','Từ vựng về du lịch, di sản và dịch vụ lưu trú.','INTERMEDIATE',20,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(21,'Energy and Natural Resources','Từ vựng về năng lượng, tài nguyên và phát triển bền vững.','ADVANCED',21,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(22,'Animals and Wildlife','Từ vựng về động vật, đa dạng sinh học và bảo tồn.','INTERMEDIATE',22,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(23,'Art and Architecture','Từ vựng về nghệ thuật, thiết kế và kiến trúc.','INTERMEDIATE',23,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(24,'Language and Linguistics','Từ vựng về ngôn ngữ, giao tiếp và học ngoại ngữ.','ADVANCED',24,1,1);
INSERT INTO vocabulary_topics(id,title,description,level,sort_order,is_published,created_by) VALUES(25,'Climate Change','Từ vựng về khí hậu, phát thải và giải pháp ứng phó.','ADVANCED',25,1,1);

-- Sample vocabulary terms for Business & Office topic
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(1,1,'appointment','/əˈpɔɪntmənt/','cuộc hẹn','an arrangement to meet someone at a particular time','I have an appointment with the regional manager at ten.','Tôi có cuộc hẹn với quản lý khu vực lúc mười giờ.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(2,1,'agenda','/əˈdʒendə/','chương trình nghị sự','a list of items to be discussed at a meeting','The agenda was sent to all participants yesterday.','Chương trình nghị sự đã được gửi cho tất cả người tham dự hôm qua.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(3,1,'deadline','/ˈdedlaɪn/','hạn chót','the latest time by which something must be completed','Please submit the expense report before the deadline.','Vui lòng nộp báo cáo chi phí trước hạn chót.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(4,1,'department','/dɪˈpɑːrtmənt/','phòng ban','a section of an organization responsible for a particular activity','The accounting department moved to the third floor.','Phòng kế toán đã chuyển lên tầng ba.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(5,1,'colleague','/ˈkɑːliːɡ/','đồng nghiệp','a person with whom one works','A colleague will cover the reception desk this afternoon.','Một đồng nghiệp sẽ trực quầy lễ tân chiều nay.',NULL);

-- Sample vocabulary terms for Travel & Transport topic
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(6,2,'airline','/ˈerlaɪn/','hãng hàng không','a company that provides air transport for passengers or cargo','The airline added a direct flight to Osaka.','Hãng hàng không đã bổ sung chuyến bay thẳng đến Osaka.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(7,2,'flight','/flaɪt/','chuyến bay','a journey made by aircraft','Our flight departs from Gate 12 at 8:30.','Chuyến bay của chúng tôi khởi hành từ Cổng 12 lúc 8 giờ 30.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(8,2,'airport','/ˈerpɔːrt/','sân bay','a place where aircraft take off and land','Please arrive at the airport two hours before departure.','Vui lòng đến sân bay hai giờ trước giờ khởi hành.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(9,2,'passport','/ˈpæspɔːrt/','hộ chiếu','an official document used to identify a traveler internationally','Keep your passport in a secure place during the trip.','Hãy cất hộ chiếu ở nơi an toàn trong suốt chuyến đi.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(10,2,'ticket','/ˈtɪkɪt/','vé','a document that gives the holder permission to travel or enter an event','You can collect your train ticket at the station kiosk.','Bạn có thể nhận vé tàu tại quầy tự động trong nhà ga.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(16,2,'departure','/dɪˈpɑːrtʃər/','sự khởi hành','the act of leaving a place','Passengers should arrive at the terminal before departure.','Hành khách nên đến nhà ga trước giờ khởi hành.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(17,2,'arrival','/əˈraɪvəl/','sự đến nơi','the act of reaching a destination','The arrival of the train was delayed by fifteen minutes.','Chuyến tàu đến nơi muộn mười lăm phút.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(18,2,'destination','/ˌdestɪˈneɪʃən/','điểm đến','the place to which someone or something is going','Our final destination is a small town near the coast.','Điểm đến cuối cùng của chúng tôi là một thị trấn nhỏ gần bờ biển.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(19,2,'itinerary','/aɪˈtɪnəreri/','lịch trình chuyến đi','a plan of a journey, including the route and places visited','The travel agent emailed us a detailed itinerary.','Đại lý du lịch đã gửi cho chúng tôi lịch trình chi tiết.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(20,2,'accommodation','/əˌkɑːməˈdeɪʃən/','chỗ ở','a place where travelers can stay','We booked affordable accommodation close to the station.','Chúng tôi đã đặt chỗ ở giá hợp lý gần nhà ga.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(21,2,'reservation','/ˌrezərˈveɪʃən/','sự đặt chỗ','an arrangement to have a seat, room, or service kept for someone','Please confirm your hotel reservation before you travel.','Vui lòng xác nhận đặt phòng khách sạn trước khi đi.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(22,2,'boarding pass','/ˈbɔːrdɪŋ pæs/','thẻ lên máy bay','a document that allows a passenger to board an aircraft','Keep your boarding pass ready at the departure gate.','Hãy chuẩn bị sẵn thẻ lên máy bay tại cửa khởi hành.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(23,2,'luggage','/ˈlʌɡɪdʒ/','hành lý','bags and cases carried by a traveler','Her luggage was placed in the overhead compartment.','Hành lý của cô ấy được đặt vào ngăn chứa phía trên.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(24,2,'baggage allowance','/ˈbæɡɪdʒ əˌlaʊəns/','lượng hành lý được phép mang','the amount of luggage a passenger may carry without an extra charge','Check the baggage allowance before packing your suitcase.','Hãy kiểm tra lượng hành lý được phép mang trước khi đóng vali.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(25,2,'layover','/ˈleɪˌoʊvər/','thời gian quá cảnh','a period of waiting between connecting parts of a journey','We have a two-hour layover in Singapore.','Chúng tôi quá cảnh hai giờ ở Singapore.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(26,2,'transfer','/ˈtrænsfər/','sự chuyển tuyến','a change from one vehicle or route to another','The ticket includes a transfer to the airport bus.','Vé bao gồm một lượt chuyển sang xe buýt sân bay.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(27,2,'commute','/kəˈmjuːt/','đi lại thường xuyên','to travel regularly between home and work or school','She commutes to work by train every weekday.','Cô ấy đi tàu đến nơi làm việc mỗi ngày trong tuần.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(28,2,'subway','/ˈsʌbweɪ/','tàu điện ngầm','an underground urban railway system','The subway is the fastest way to cross the city center.','Tàu điện ngầm là cách nhanh nhất để đi qua trung tâm thành phố.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(29,2,'platform','/ˈplætfɔːrm/','sân ga','the raised area beside a railway track where passengers wait','The express train will depart from platform four.','Tàu tốc hành sẽ khởi hành từ sân ga số bốn.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(30,2,'fare','/fer/','giá vé','the money paid for a journey on public transport','You can pay the bus fare with a contactless card.','Bạn có thể trả tiền vé xe buýt bằng thẻ không tiếp xúc.',NULL);

-- Sample vocabulary terms for Shopping & Sales topic
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(11,3,'price','/praɪs/','giá','the amount of money required to buy something','The store reduced the price of selected appliances.','Cửa hàng đã giảm giá một số thiết bị gia dụng.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(12,3,'cashier','/kæˈʃɪr/','thu ngân','a person who receives payments in a store','The cashier issued a receipt for the purchase.','Thu ngân đã xuất biên lai cho giao dịch mua hàng.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(13,3,'delivery','/dɪˈlɪvəri/','việc giao hàng','the act of bringing goods to a customer','Free delivery is available for orders over fifty dollars.','Miễn phí giao hàng cho đơn đặt hàng trên năm mươi đô la.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(14,3,'sale','/seɪl/','đợt giảm giá','an occasion when goods are sold at reduced prices','The store will hold a clearance sale this weekend.','Cửa hàng sẽ tổ chức đợt giảm giá thanh lý vào cuối tuần này.',NULL);
INSERT INTO vocabulary_terms(id,topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id) VALUES(15,3,'vendor','/ˈvendər/','nhà cung cấp','a person or company that sells goods or services','The vendor delivered the supplies to the warehouse.','Nhà cung cấp đã giao vật tư đến kho.',NULL);

INSERT INTO vocabulary_lessons(topic_id,title,description,sort_order,target_word_count,is_published,created_by)
SELECT t.id, CONCAT(t.title, ' — Nền tảng'), 'Học nhóm từ vựng cốt lõi và ví dụ theo chủ đề.', 1, 10, 1, 1
FROM vocabulary_topics t WHERE t.is_published=1
AND NOT EXISTS (SELECT 1 FROM vocabulary_lessons l WHERE l.topic_id=t.id AND l.sort_order=1);
INSERT INTO vocabulary_lessons(topic_id,title,description,sort_order,target_word_count,is_published,created_by)
SELECT t.id, CONCAT(t.title, ' — Mở rộng'), 'Mở rộng vốn từ và luyện tập theo ngữ cảnh.', 2, 20, 1, 1
FROM vocabulary_topics t WHERE t.is_published=1
AND NOT EXISTS (SELECT 1 FROM vocabulary_lessons l WHERE l.topic_id=t.id AND l.sort_order=2);
INSERT INTO vocabulary_lessons(topic_id,title,description,sort_order,target_word_count,is_published,created_by)
SELECT t.id, CONCAT(t.title, ' — Nâng cao'), 'Ôn tập chuyên sâu với bộ từ vựng nâng cao.', 3, 36, 1, 1
FROM vocabulary_topics t WHERE t.is_published=1
AND NOT EXISTS (SELECT 1 FROM vocabulary_lessons l WHERE l.topic_id=t.id AND l.sort_order=3);
UPDATE vocabulary_lessons
SET target_word_count=20
WHERE topic_id=(SELECT id FROM vocabulary_topics WHERE title='Travel and Transport');

INSERT INTO vocabulary_lesson_terms(lesson_id,term_id,sort_order)
SELECT l.id, t.id, ROW_NUMBER() OVER (PARTITION BY l.id ORDER BY t.id)
FROM vocabulary_lessons l
JOIN vocabulary_terms t ON t.topic_id=l.topic_id
WHERE NOT EXISTS (SELECT 1 FROM vocabulary_lesson_terms lt
                  WHERE lt.lesson_id=l.id AND lt.term_id=t.id);
-- Bổ sung đủ 12 thì (bài 9–16). Nội dung và câu hỏi biên soạn cho TOEIC.
INSERT INTO grammar_lessons(id, topic_id, title, content_html, level, sort_order, is_published) VALUES (9, 1, 'Hiện tại hoàn thành tiếp diễn (Present Perfect Continuous)', '<p data-n11="summary">Hoạt động kéo dài tới hiện tại hoặc vừa dừng và còn dấu hiệu.</p><section data-n11="lecture"><h3>Cách dùng</h3><p>Đặt trọng tâm vào quá trình. Khi nhấn mạnh số việc đã hoàn tất, thường dùng hiện tại hoàn thành đơn.</p><h3>Công thức</h3><ul><li>Khẳng định: <strong>S + have/has been + V-ing</strong></li><li>Phủ định: <strong>S + have/has + not + been V-ing</strong></li><li>Câu hỏi: <strong>Have/Has + S + been + V-ing?</strong></li></ul><h3>Nhận biết trong TOEIC</h3><p>for + khoảng thời gian, since + mốc bắt đầu, all morning. Đọc cả câu để xác định hoạt động có nối với hiện tại.</p><p><em>S: chủ ngữ. V3: quá khứ phân từ.</em></p></section><section data-n11="examples"><article data-example-id="1" data-order="1"><p class="sentence">The support team has been answering calls since 8 a.m.</p><p class="translation">Nhóm hỗ trợ đã liên tục trả lời điện thoại từ 8 giờ sáng.</p><p class="note">Since giới thiệu thời điểm bắt đầu.</p></article><article data-example-id="2" data-order="2"><p class="sentence">I have been checking invoices all morning.</p><p class="translation">Tôi đã kiểm tra hóa đơn suốt buổi sáng.</p><p class="note">Trọng tâm là quá trình kiểm tra.</p></article><article data-example-id="3" data-order="3"><p class="sentence">Have you been waiting long?</p><p class="translation">Bạn đã đợi lâu chưa?</p><p class="note">Đưa have lên trước chủ ngữ để hỏi.</p></article></section>', 'INTERMEDIATE', 9, 1);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (41, 9, 'The technician _____ the printer since 9 a.m. and is still working on it.', 'Since và is still working cho thấy hoạt động kéo dài đến hiện tại.', 2, 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (161, 41, 'A', 'repaired', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (162, 41, 'B', 'will repair', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (163, 41, 'C', 'has been repairing', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (164, 41, 'D', 'had repaired', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (42, 9, 'We have been _____ customer feedback all week.', 'Sau have been trong dạng tiếp diễn dùng V-ing.', 2, 2);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (165, 42, 'A', 'collect', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (166, 42, 'B', 'collected', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (167, 42, 'C', 'collects', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (168, 42, 'D', 'collecting', 1);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (43, 9, 'How long _____ Ms. Lee been managing this branch?', 'Ms. Lee là chủ ngữ số ít, dùng has.', 2, 3);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (169, 43, 'A', 'has', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (170, 43, 'B', 'have', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (171, 43, 'C', 'was', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (172, 43, 'D', 'did', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (44, 9, 'The interns have been working remotely _____ Monday.', 'Monday là mốc bắt đầu, dùng since.', 2, 4);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (173, 44, 'A', 'for', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (174, 44, 'B', 'since', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (175, 44, 'C', 'during', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (176, 44, 'D', 'until', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (45, 9, 'The analysts have been comparing prices _____ three hours.', 'Three hours là khoảng thời gian, dùng for.', 2, 5);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (177, 45, 'A', 'since', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (178, 45, 'B', 'at', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (179, 45, 'C', 'for', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (180, 45, 'D', 'by', 0);
INSERT INTO grammar_lessons(id, topic_id, title, content_html, level, sort_order, is_published) VALUES (10, 1, 'Quá khứ tiếp diễn (Past Continuous)', '<p data-n11="summary">Hoạt động đang diễn ra tại một thời điểm trong quá khứ.</p><section data-n11="lecture"><h3>Cách dùng</h3><p>Dùng cho hành động làm nền, hành động bị chen ngang hoặc hai hoạt động đang diễn ra song song.</p><h3>Công thức</h3><ul><li>Khẳng định: <strong>S + was/were + V-ing</strong></li><li>Phủ định: <strong>S + was/were + not + V-ing</strong></li><li>Câu hỏi: <strong>Was/Were + S + V-ing?</strong></li></ul><h3>Nhận biết trong TOEIC</h3><p>At 3 p.m. yesterday, while, when. Hành động đang diễn ra thường dùng tiếp diễn, sự kiện chen ngang thường dùng quá khứ đơn.</p><p><em>S: chủ ngữ. V3: quá khứ phân từ.</em></p></section><section data-n11="examples"><article data-example-id="1" data-order="1"><p class="sentence">At 3 p.m., we were testing the new checkout system.</p><p class="translation">Lúc 3 giờ chiều, chúng tôi đang thử hệ thống thanh toán mới.</p><p class="note">Were testing cho biết công việc đang diễn ra lúc đó.</p></article><article data-example-id="2" data-order="2"><p class="sentence">I was taking notes when the projector stopped working.</p><p class="translation">Tôi đang ghi chép thì máy chiếu ngừng hoạt động.</p><p class="note">Stopped là sự kiện chen ngang.</p></article><article data-example-id="3" data-order="3"><p class="sentence">While Leo was packing the orders, Ana was printing the labels.</p><p class="translation">Trong khi Leo đóng gói đơn hàng, Ana đang in nhãn.</p><p class="note">Hai hành động làm nền diễn ra song song.</p></article></section>', 'BASIC', 10, 1);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (46, 10, 'At the moment the alarm rang, the cleaners _____ the lobby.', 'The alarm rang đặt mốc quá khứ, cleaners số nhiều dùng were.', 1, 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (181, 46, 'A', 'are mopping', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (182, 46, 'B', 'will mop', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (183, 46, 'C', 'have mopped', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (184, 46, 'D', 'were mopping', 1);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (47, 10, 'While I was _____ the spreadsheet, the computer restarted.', 'Was + V-ing mô tả thao tác đang thực hiện.', 1, 2);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (185, 47, 'A', 'editing', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (186, 47, 'B', 'edit', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (187, 47, 'C', 'edited', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (188, 47, 'D', 'edits', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (48, 10, '_____ you speaking to a client when I called?', 'Câu hỏi quá khứ tiếp diễn với you bắt đầu bằng were.', 1, 3);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (189, 48, 'A', 'Are', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (190, 48, 'B', 'Were', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (191, 48, 'C', 'Have', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (192, 48, 'D', 'Did', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (49, 10, 'At noon yesterday, Nora _____ the interview room.', 'Nora số ít, dùng was preparing tại mốc quá khứ.', 1, 4);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (193, 49, 'A', 'is preparing', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (194, 49, 'B', 'has prepared', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (195, 49, 'C', 'was preparing', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (196, 49, 'D', 'will prepare', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (50, 10, 'The lights went out while the staff _____ the new equipment.', 'Were testing diễn tả hành động làm nền.', 1, 5);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (197, 50, 'A', 'test', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (198, 50, 'B', 'are testing', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (199, 50, 'C', 'will test', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (200, 50, 'D', 'were testing', 1);
INSERT INTO grammar_lessons(id, topic_id, title, content_html, level, sort_order, is_published) VALUES (11, 1, 'Quá khứ hoàn thành (Past Perfect)', '<p data-n11="summary">Một hành động đã xảy ra trước một mốc hoặc sự kiện khác trong quá khứ.</p><section data-n11="lecture"><h3>Cách dùng</h3><p>Xác định hai mốc rồi đặt hành động xảy ra trước vào quá khứ hoàn thành khi cần làm rõ thứ tự. Nếu thứ tự đã rõ, quá khứ đơn cũng có thể phù hợp.</p><h3>Công thức</h3><ul><li>Khẳng định: <strong>S + had + V3</strong></li><li>Phủ định: <strong>S + had + not + V3</strong></li><li>Câu hỏi: <strong>Had + S + V3?</strong></li></ul><h3>Nhận biết trong TOEIC</h3><p>By the time + mệnh đề quá khứ, before, already. Không dùng chỉ vì câu kể chuyện quá khứ.</p><p><em>S: chủ ngữ. V3: quá khứ phân từ.</em></p></section><section data-n11="examples"><article data-example-id="1" data-order="1"><p class="sentence">By the time the auditor arrived, we had printed all the receipts.</p><p class="translation">Khi kiểm toán viên đến, chúng tôi đã in hết biên lai.</p><p class="note">Việc in hoàn tất trước lúc kiểm toán viên đến.</p></article><article data-example-id="2" data-order="2"><p class="sentence">The courier had left before I reached the lobby.</p><p class="translation">Nhân viên giao hàng đã đi trước khi tôi xuống sảnh.</p><p class="note">Had left đặt việc rời đi ở mốc sớm hơn.</p></article><article data-example-id="3" data-order="3"><p class="sentence">Had the technician backed up the files before the update?</p><p class="translation">Kỹ thuật viên đã sao lưu tệp trước khi cập nhật chưa?</p><p class="note">Câu hỏi dùng had trước chủ ngữ và backed up ở V3.</p></article></section>', 'INTERMEDIATE', 11, 1);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (51, 11, 'By the time the guests arrived, the caterer _____ the tables.', 'Bàn đã được chuẩn bị trước một mốc quá khứ.', 2, 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (201, 51, 'A', 'had set', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (202, 51, 'B', 'will set', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (203, 51, 'C', 'has set', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (204, 51, 'D', 'is setting', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (52, 11, 'The manager had already _____ the request when I called.', 'Sau had dùng quá khứ phân từ approved.', 2, 2);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (205, 52, 'A', 'approve', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (206, 52, 'B', 'approved', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (207, 52, 'C', 'approving', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (208, 52, 'D', 'approves', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (53, 11, '_____ the team finished the review before the vote took place?', 'Vote took place là mốc quá khứ, câu hỏi cần Had.', 2, 3);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (209, 53, 'A', 'Has', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (210, 53, 'B', 'Will', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (211, 53, 'C', 'Had', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (212, 53, 'D', 'Was', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (54, 11, 'When we checked at 6 p.m. yesterday, the supplier _____ all ten boxes.', 'Việc giao đã hoàn tất trước lúc kiểm tra.', 2, 4);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (213, 54, 'A', 'will deliver', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (214, 54, 'B', 'has delivered', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (215, 54, 'C', 'delivers', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (216, 54, 'D', 'had delivered', 1);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (55, 11, 'The clerk could not print the form because she _____ the file.', 'Xóa tệp xảy ra trước lúc không thể in.', 2, 5);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (217, 55, 'A', 'had deleted', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (218, 55, 'B', 'will delete', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (219, 55, 'C', 'deletes', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (220, 55, 'D', 'has deleted', 0);
INSERT INTO grammar_lessons(id, topic_id, title, content_html, level, sort_order, is_published) VALUES (12, 1, 'Quá khứ hoàn thành tiếp diễn (Past Perfect Continuous)', '<p data-n11="summary">Hoạt động kéo dài đến hoặc ngay trước một mốc trong quá khứ.</p><section data-n11="lecture"><h3>Cách dùng</h3><p>Nhấn mạnh thời lượng hoặc nguyên nhân của trạng thái lúc đó. Dùng quá khứ hoàn thành đơn khi điểm chính là kết quả đã xong.</p><h3>Công thức</h3><ul><li>Khẳng định: <strong>S + had been + V-ing</strong></li><li>Phủ định: <strong>S + had + not + been V-ing</strong></li><li>Câu hỏi: <strong>Had + S + been + V-ing?</strong></li></ul><h3>Nhận biết trong TOEIC</h3><p>For two hours before, since dawn, by the time + quá khứ. Chọn theo ý nghĩa, vì for cũng xuất hiện ở các thì khác.</p><p><em>S: chủ ngữ. V3: quá khứ phân từ.</em></p></section><section data-n11="examples"><article data-example-id="1" data-order="1"><p class="sentence">We had been negotiating for weeks before the contract was signed.</p><p class="translation">Chúng tôi đã đàm phán nhiều tuần trước khi hợp đồng được ký.</p><p class="note">Nhấn mạnh thời gian đàm phán trước lúc ký.</p></article><article data-example-id="2" data-order="2"><p class="sentence">Her shoes were wet because she had been working outside.</p><p class="translation">Giày cô ấy ướt vì trước đó cô đã làm việc ngoài trời.</p><p class="note">Hoạt động giải thích tình trạng trong quá khứ.</p></article><article data-example-id="3" data-order="3"><p class="sentence">Had the machine been running all night before it stopped?</p><p class="translation">Máy đã chạy suốt đêm trước khi dừng phải không?</p><p class="note">Had + chủ ngữ + been + V-ing.</p></article></section>', 'ADVANCED', 12, 1);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (56, 12, 'The engineers _____ on the fault for hours before they found the cause.', 'Thời lượng kéo dài đến mốc found trong quá khứ.', 3, 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (221, 56, 'A', 'have been working', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (222, 56, 'B', 'had been working', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (223, 56, 'C', 'are working', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (224, 56, 'D', 'will be working', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (57, 12, 'The floor was muddy because the crew had been _____ equipment through the entrance.', 'Sau had been trong cấu trúc tiếp diễn dùng V-ing.', 3, 2);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (225, 57, 'A', 'move', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (226, 57, 'B', 'moved', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (227, 57, 'C', 'moving', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (228, 57, 'D', 'moves', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (58, 12, 'How long _____ the staff been waiting before the door opened?', 'Door opened là mốc quá khứ, dùng had trước chủ ngữ.', 3, 3);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (229, 58, 'A', 'have', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (230, 58, 'B', 'did', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (231, 58, 'C', 'were', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (232, 58, 'D', 'had', 1);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (59, 12, 'Before the network came back, the operator had been trying to reconnect _____ 20 minutes.', '20 minutes là khoảng thời gian.', 3, 4);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (233, 59, 'A', 'for', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (234, 59, 'B', 'since', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (235, 59, 'C', 'at', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (236, 59, 'D', 'by', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (60, 12, 'When the supervisor arrived, the workers were tired because they _____ heavy boxes all morning.', 'Việc khuân vác trước đó giải thích trạng thái were tired.', 3, 5);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (237, 60, 'A', 'will carry', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (238, 60, 'B', 'had been carrying', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (239, 60, 'C', 'have been carrying', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (240, 60, 'D', 'are carrying', 0);
INSERT INTO grammar_lessons(id, topic_id, title, content_html, level, sort_order, is_published) VALUES (13, 1, 'Tương lai đơn (Future Simple)', '<p data-n11="summary">Dự đoán, lời hứa, lời đề nghị và quyết định đưa ra lúc nói.</p><section data-n11="lecture"><h3>Cách dùng</h3><p>Dùng will cho dự đoán hoặc quyết định tức thời. Với kế hoạch đã định trước, be going to hoặc hiện tại tiếp diễn có thể phù hợp hơn.</p><h3>Công thức</h3><ul><li>Khẳng định: <strong>S + will + V nguyên mẫu</strong></li><li>Phủ định: <strong>S + will + not + V nguyên mẫu</strong></li><li>Câu hỏi: <strong>Will + S + V nguyên mẫu?</strong></li></ul><h3>Nhận biết trong TOEIC</h3><p>Tomorrow, next week, I think, I promise. Trong mệnh đề thời gian chỉ tương lai sau when, thường dùng hiện tại đơn.</p><p><em>S: chủ ngữ. V3: quá khứ phân từ.</em></p></section><section data-n11="examples"><article data-example-id="1" data-order="1"><p class="sentence">I will send the confirmation this afternoon.</p><p class="translation">Tôi sẽ gửi xác nhận chiều nay.</p><p class="note">Will biểu thị lời hứa.</p></article><article data-example-id="2" data-order="2"><p class="sentence">I think the store will be busy tomorrow.</p><p class="translation">Tôi nghĩ cửa hàng sẽ đông khách ngày mai.</p><p class="note">Will biểu thị dự đoán.</p></article><article data-example-id="3" data-order="3"><p class="sentence">Will you call me when the parcel arrives?</p><p class="translation">Bạn sẽ gọi cho tôi khi bưu kiện đến chứ?</p><p class="note">Mệnh đề when dùng arrives.</p></article></section>', 'BASIC', 13, 1);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (61, 13, 'I promise I _____ the updated contract by noon tomorrow.', 'Lời hứa về tương lai dùng will + động từ nguyên mẫu.', 1, 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (241, 61, 'A', 'emailed', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (242, 61, 'B', 'have emailed', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (243, 61, 'C', 'will email', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (244, 61, 'D', 'had emailed', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (62, 13, 'The courier will _____ the package tomorrow morning.', 'Sau will dùng động từ nguyên mẫu.', 1, 2);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (245, 62, 'A', 'delivers', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (246, 62, 'B', 'delivered', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (247, 62, 'C', 'delivering', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (248, 62, 'D', 'deliver', 1);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (63, 13, 'We will let you know when the replacement part _____.', 'Mệnh đề chỉ thời gian sau when dùng hiện tại đơn.', 1, 3);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (249, 63, 'A', 'arrives', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (250, 63, 'B', 'will arrive', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (251, 63, 'C', 'had arrived', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (252, 63, 'D', 'arriving', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (64, 13, '_____ you send me a copy of the receipt?', 'Will + chủ ngữ + động từ là cách đặt câu hỏi hoặc lời đề nghị.', 1, 4);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (253, 64, 'A', 'Has', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (254, 64, 'B', 'Will', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (255, 64, 'C', 'Was', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (256, 64, 'D', 'Had', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (65, 13, 'The branch will not _____ on Sunday.', 'Sau will not vẫn dùng động từ nguyên mẫu.', 1, 5);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (257, 65, 'A', 'opens', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (258, 65, 'B', 'opened', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (259, 65, 'C', 'open', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (260, 65, 'D', 'opening', 0);
INSERT INTO grammar_lessons(id, topic_id, title, content_html, level, sort_order, is_published) VALUES (14, 1, 'Tương lai tiếp diễn (Future Continuous)', '<p data-n11="summary">Hoạt động đang diễn ra tại một mốc cụ thể trong tương lai.</p><section data-n11="lecture"><h3>Cách dùng</h3><p>Đặt người nghe vào một thời điểm trong tương lai và mô tả công việc đang diễn ra lúc đó. Có thể dùng dạng hỏi để hỏi lịch một cách lịch sự.</p><h3>Công thức</h3><ul><li>Khẳng định: <strong>S + will be + V-ing</strong></li><li>Phủ định: <strong>S + will + not + be V-ing</strong></li><li>Câu hỏi: <strong>Will + S + be + V-ing?</strong></li></ul><h3>Nhận biết trong TOEIC</h3><p>At this time tomorrow, at 10 a.m. next Monday. Nếu nhấn mạnh đã hoàn tất trước một hạn, xem tương lai hoàn thành.</p><p><em>S: chủ ngữ. V3: quá khứ phân từ.</em></p></section><section data-n11="examples"><article data-example-id="1" data-order="1"><p class="sentence">At this time tomorrow, I will be flying to the trade fair.</p><p class="translation">Giờ này ngày mai, tôi sẽ đang bay đến hội chợ.</p><p class="note">Chuyến bay đang diễn ra tại mốc ngày mai.</p></article><article data-example-id="2" data-order="2"><p class="sentence">We will be interviewing candidates when you arrive.</p><p class="translation">Khi bạn đến, chúng tôi sẽ đang phỏng vấn ứng viên.</p><p class="note">Cuộc phỏng vấn đang diễn ra khi bạn tới.</p></article><article data-example-id="3" data-order="3"><p class="sentence">Will you be using the conference room at noon?</p><p class="translation">Bạn có dùng phòng họp vào buổi trưa không?</p><p class="note">Câu hỏi về lịch sử dụng phòng.</p></article></section>', 'INTERMEDIATE', 14, 1);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (66, 14, 'At 10 a.m. tomorrow, the design team _____ the prototype to a client.', 'Tại mốc tương lai, buổi trình diễn đang diễn ra.', 2, 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (261, 66, 'A', 'demonstrated', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (262, 66, 'B', 'had demonstrated', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (263, 66, 'C', 'has demonstrated', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (264, 66, 'D', 'will be demonstrating', 1);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (67, 14, 'We will be _____ the service desk during the event.', 'Will be + V-ing diễn tả việc trực quầy đang diễn ra.', 2, 2);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (265, 67, 'A', 'staffing', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (266, 67, 'B', 'staff', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (267, 67, 'C', 'staffed', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (268, 67, 'D', 'staffs', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (68, 14, 'At this time next week, I _____ at the Osaka branch.', 'At this time next week đặt mốc tương lai.', 2, 3);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (269, 68, 'A', 'worked', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (270, 68, 'B', 'will be working', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (271, 68, 'C', 'have worked', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (272, 68, 'D', 'had worked', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (69, 14, 'Will you _____ the company car at 2 p.m. tomorrow?', 'Cấu trúc câu hỏi là will + chủ ngữ + be + V-ing.', 2, 4);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (273, 69, 'A', 'using', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (274, 69, 'B', 'been using', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (275, 69, 'C', 'be using', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (276, 69, 'D', 'are using', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (70, 14, 'When the visitors arrive tomorrow, Marta _____ the orientation session.', 'Buổi hướng dẫn sẽ đang diễn ra khi khách đến.', 2, 5);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (277, 70, 'A', 'led', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (278, 70, 'B', 'has led', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (279, 70, 'C', 'had led', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (280, 70, 'D', 'will be leading', 1);
INSERT INTO grammar_lessons(id, topic_id, title, content_html, level, sort_order, is_published) VALUES (15, 1, 'Tương lai hoàn thành (Future Perfect)', '<p data-n11="summary">Việc sẽ hoàn tất trước hoặc chậm nhất tại một mốc tương lai.</p><section data-n11="lecture"><h3>Cách dùng</h3><p>So sánh một hạn tương lai với kết quả dự kiến. Dạng này thường đi với số lượng hoàn tất hoặc công việc có điểm kết thúc.</p><h3>Công thức</h3><ul><li>Khẳng định: <strong>S + will have + V3</strong></li><li>Phủ định: <strong>S + will + not + have V3</strong></li><li>Câu hỏi: <strong>Will + S + have + V3?</strong></li></ul><h3>Nhận biết trong TOEIC</h3><p>By Friday, by the end of next month, by the time + hiện tại đơn. By là hạn hoàn thành; until chỉ sự kéo dài tới mốc.</p><p><em>S: chủ ngữ. V3: quá khứ phân từ.</em></p></section><section data-n11="examples"><article data-example-id="1" data-order="1"><p class="sentence">By Friday, we will have processed all 200 applications.</p><p class="translation">Chậm nhất thứ Sáu, chúng tôi sẽ xử lý xong cả 200 đơn.</p><p class="note">All 200 applications nhấn mạnh kết quả hoàn tất.</p></article><article data-example-id="2" data-order="2"><p class="sentence">The team will have packed every order by the time the truck arrives.</p><p class="translation">Nhóm sẽ đóng gói xong mọi đơn trước lúc xe tải đến.</p><p class="note">Mệnh đề thời gian dùng arrives.</p></article><article data-example-id="3" data-order="3"><p class="sentence">Will you have finished the draft by Tuesday?</p><p class="translation">Bạn sẽ hoàn thành bản nháp chậm nhất thứ Ba chứ?</p><p class="note">Will đứng trước chủ ngữ, sau đó là have + V3.</p></article></section>', 'ADVANCED', 15, 1);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (71, 15, 'By noon tomorrow, the crew _____ all six signs.', 'All six signs là kết quả phải đạt trước hạn tương lai.', 3, 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (281, 71, 'A', 'will have installed', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (282, 71, 'B', 'had installed', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (283, 71, 'C', 'installs', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (284, 71, 'D', 'have installed', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (72, 15, 'The office will have _____ the invoices by the end of next week.', 'Sau will have cần V3; V3 của send là sent.', 3, 2);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (285, 72, 'A', 'send', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (286, 72, 'B', 'sent', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (287, 72, 'C', 'sending', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (288, 72, 'D', 'sends', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (73, 15, '_____ the engineer have finished the inspection by Monday?', 'Câu hỏi dùng will + chủ ngữ + have + V3.', 3, 3);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (289, 73, 'A', 'Has', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (290, 73, 'B', 'Did', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (291, 73, 'C', 'Will', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (292, 73, 'D', 'Was', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (74, 15, 'We will have archived the records by the time the new system _____.', 'Mệnh đề thời gian dùng hiện tại đơn.', 3, 4);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (293, 74, 'A', 'will launch', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (294, 74, 'B', 'launched', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (295, 74, 'C', 'had launched', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (296, 74, 'D', 'launches', 1);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (75, 15, 'The accountants will have closed the books _____ the end of next week at the latest.', 'By đi với hạn chót; at the latest làm rõ nghĩa này.', 3, 5);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (297, 75, 'A', 'by', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (298, 75, 'B', 'since', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (299, 75, 'C', 'for', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (300, 75, 'D', 'during', 0);
INSERT INTO grammar_lessons(id, topic_id, title, content_html, level, sort_order, is_published) VALUES (16, 1, 'Tương lai hoàn thành tiếp diễn (Future Perfect Continuous)', '<p data-n11="summary">Nhấn mạnh thời lượng của hoạt động tính đến một mốc tương lai.</p><section data-n11="lecture"><h3>Cách dùng</h3><p>Dùng với hoạt động có thể kéo dài như working, running hoặc waiting. Nếu cần nói số lượng đã hoàn thành, dùng tương lai hoàn thành đơn.</p><h3>Công thức</h3><ul><li>Khẳng định: <strong>S + will have been + V-ing</strong></li><li>Phủ định: <strong>S + will + not + have been V-ing</strong></li><li>Câu hỏi: <strong>Will + S + have + been + V-ing?</strong></li></ul><h3>Nhận biết trong TOEIC</h3><p>By next July, for six months by then, by the time + hiện tại đơn. Câu cần cả mốc tương lai lẫn ý kéo dài.</p><p><em>S: chủ ngữ. V3: quá khứ phân từ.</em></p></section><section data-n11="examples"><article data-example-id="1" data-order="1"><p class="sentence">By October, we will have been operating this branch for a year.</p><p class="translation">Đến tháng Mười, chúng tôi sẽ vận hành chi nhánh này được một năm.</p><p class="note">A year đo thời lượng tính đến tháng Mười.</p></article><article data-example-id="2" data-order="2"><p class="sentence">By 5 p.m., the generator will have been running for 12 hours.</p><p class="translation">Đến 5 giờ chiều, máy phát điện sẽ chạy được 12 giờ.</p><p class="note">Trọng tâm là thời gian vận hành.</p></article><article data-example-id="3" data-order="3"><p class="sentence">How long will you have been working here by December?</p><p class="translation">Đến tháng Mười Hai, bạn sẽ làm ở đây được bao lâu?</p><p class="note">How long hỏi thời lượng đến mốc tương lai.</p></article></section>', 'ADVANCED', 16, 1);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (76, 16, 'By next June, the team _____ this system for exactly two years.', 'By next June và for exactly two years xác định thời lượng tính đến mốc tương lai.', 3, 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (301, 76, 'A', 'had been using', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (302, 76, 'B', 'will have been using', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (303, 76, 'C', 'has been using', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (304, 76, 'D', 'is using', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (77, 16, 'The researchers will have been _____ data for six months by August.', 'Sau will have been trong cấu trúc tiếp diễn dùng V-ing.', 3, 2);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (305, 77, 'A', 'collect', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (306, 77, 'B', 'collected', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (307, 77, 'C', 'collecting', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (308, 77, 'D', 'collects', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (78, 16, 'By next April, she will have been working here _____ five years.', 'Five years là khoảng thời gian, dùng for.', 3, 3);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (309, 78, 'A', 'since', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (310, 78, 'B', 'at', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (311, 78, 'C', 'by', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (312, 78, 'D', 'for', 1);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (79, 16, 'By the time the truck arrives tomorrow, the crew _____ for an hour.', 'Thời lượng chờ tính tới mốc truck arrives tomorrow.', 3, 4);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (313, 79, 'A', 'will have been waiting', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (314, 79, 'B', 'have been waiting', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (315, 79, 'C', 'had been waiting', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (316, 79, 'D', 'are waiting', 0);
INSERT INTO grammar_questions(id, lesson_id, question_text, explanation, difficulty, sort_order) VALUES (80, 16, 'How long _____ the machine have been running by the next inspection?', 'Đặt will trước chủ ngữ để hỏi thời lượng ở một mốc tương lai.', 3, 5);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (317, 80, 'A', 'has', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (318, 80, 'B', 'will', 1);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (319, 80, 'C', 'did', 0);
INSERT INTO grammar_options(id, question_id, option_label, option_text, is_correct) VALUES (320, 80, 'D', 'was', 0);

-- Vocabulary minimum-thirty migration. Re-runnable for MySQL 8 and H2.

INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'applicant' AS word, 'á»©ng viĂªn' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how applicant relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a applicant vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'career' AS word, 'sá»± nghiá»‡p' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how career relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a career vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'deadline' AS word, 'háº¡n chĂ³t' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how deadline relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a deadline vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'employee' AS word, 'nhĂ¢n viĂªn' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how employee relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a employee vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'employer' AS word, 'nhĂ  tuyá»ƒn dá»¥ng' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how employer relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a employer vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'manager' AS word, 'ngÆ°á»i quáº£n lĂ½' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how manager relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a manager vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'promotion' AS word, 'sá»± thÄƒng tiáº¿n' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how promotion relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a promotion vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'salary' AS word, 'lÆ°Æ¡ng' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how salary relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a salary vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'shift' AS word, 'ca lĂ m viá»‡c' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how shift relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a shift vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'vacancy' AS word, 'vá»‹ trĂ­ tuyá»ƒn dá»¥ng' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how vacancy relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a vacancy vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'recruitment' AS word, 'tuyá»ƒn dá»¥ng' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how recruitment relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a recruitment vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'qualification' AS word, 'trĂ¬nh Ä‘á»™' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how qualification relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a qualification vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'experience' AS word, 'kinh nghiá»‡m' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how experience relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a experience vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'interview' AS word, 'phá»ng váº¥n' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how interview relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a interview vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'contract' AS word, 'há»£p Ä‘á»“ng' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how contract relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a contract vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'supervisor' AS word, 'ngÆ°á»i giĂ¡m sĂ¡t' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how supervisor relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a supervisor vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'colleague' AS word, 'Ä‘á»“ng nghiá»‡p' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how colleague relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a colleague vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'workload' AS word, 'khá»‘i lÆ°á»£ng cĂ´ng viá»‡c' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how workload relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a workload vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'overtime' AS word, 'giá» lĂ m thĂªm' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how overtime relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a overtime vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'resignation' AS word, 'Ä‘Æ¡n tá»« chá»©c' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how resignation relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a resignation vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'performance' AS word, 'hiá»‡u suáº¥t' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how performance relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a performance vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'responsibility' AS word, 'trĂ¡ch nhiá»‡m' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how responsibility relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a responsibility vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'training' AS word, 'Ä‘Ă o táº¡o' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how training relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a training vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'internship' AS word, 'thá»±c táº­p' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how internship relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a internship vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'payroll' AS word, 'báº£ng lÆ°Æ¡ng' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how payroll relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a payroll vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'workplace' AS word, 'nÆ¡i lĂ m viá»‡c' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how workplace relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a workplace vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'personnel' AS word, 'nhĂ¢n sá»±' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how personnel relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a personnel vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'conference' AS word, 'há»™i nghá»‹' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how conference relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a conference vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'procedure' AS word, 'quy trĂ¬nh' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how procedure relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a procedure vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
  UNION ALL
  SELECT 'appointment' AS word, 'cuá»™c háº¹n' AS meaning_vi, 'A vocabulary term used in Work and Careers topics.' AS definition_en, 'The report explains how appointment relates to work and careers.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a appointment vá»›i chá»§ Ä‘á» Work and Careers.' AS example_vi
) terms
WHERE topic.id=1
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'airline' AS word, 'hĂ£ng hĂ ng khĂ´ng' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how airline relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a airline vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'flight' AS word, 'chuyáº¿n bay' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how flight relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a flight vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'airport' AS word, 'sĂ¢n bay' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how airport relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a airport vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'passport' AS word, 'há»™ chiáº¿u' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how passport relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a passport vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'ticket' AS word, 'vĂ©' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how ticket relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ticket vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'departure' AS word, 'sá»± khá»Ÿi hĂ nh' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how departure relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a departure vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'arrival' AS word, 'sá»± Ä‘áº¿n nÆ¡i' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how arrival relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a arrival vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'destination' AS word, 'Ä‘iá»ƒm Ä‘áº¿n' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how destination relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a destination vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'itinerary' AS word, 'lá»‹ch trĂ¬nh chuyáº¿n Ä‘i' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how itinerary relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a itinerary vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'accommodation' AS word, 'chá»— á»Ÿ' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how accommodation relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a accommodation vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'reservation' AS word, 'Ä‘áº·t chá»—' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how reservation relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a reservation vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'boarding pass' AS word, 'tháº» lĂªn mĂ¡y bay' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how boarding pass relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a boarding pass vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'luggage' AS word, 'hĂ nh lĂ½' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how luggage relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a luggage vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'baggage allowance' AS word, 'háº¡n má»©c hĂ nh lĂ½' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how baggage allowance relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a baggage allowance vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'layover' AS word, 'quĂ¡ cáº£nh' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how layover relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a layover vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'transfer' AS word, 'chuyá»ƒn tuyáº¿n' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how transfer relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a transfer vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'commute' AS word, 'Ä‘i láº¡i háº±ng ngĂ y' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how commute relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a commute vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'subway' AS word, 'tĂ u Ä‘iá»‡n ngáº§m' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how subway relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a subway vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'platform' AS word, 'sĂ¢n ga' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how platform relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a platform vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'fare' AS word, 'giĂ¡ vĂ©' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how fare relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fare vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'terminal' AS word, 'nhĂ  ga' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how terminal relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a terminal vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'route' AS word, 'tuyáº¿n Ä‘Æ°á»ng' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how route relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a route vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'vehicle' AS word, 'phÆ°Æ¡ng tiá»‡n' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how vehicle relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a vehicle vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'traffic' AS word, 'giao thĂ´ng' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how traffic relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a traffic vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'congestion' AS word, 'Ă¹n táº¯c' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how congestion relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a congestion vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'pedestrian' AS word, 'ngÆ°á»i Ä‘i bá»™' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how pedestrian relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a pedestrian vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'ferry' AS word, 'phĂ' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how ferry relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ferry vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'schedule' AS word, 'lá»‹ch trĂ¬nh' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how schedule relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a schedule vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'delay' AS word, 'sá»± trá»… chuyáº¿n' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how delay relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a delay vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
  UNION ALL
  SELECT 'tourist' AS word, 'khĂ¡ch du lá»‹ch' AS meaning_vi, 'A vocabulary term used in Travel and Transport topics.' AS definition_en, 'The report explains how tourist relates to travel and transport.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tourist vá»›i chá»§ Ä‘á» Travel and Transport.' AS example_vi
) terms
WHERE topic.id=2
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'customer' AS word, 'khĂ¡ch hĂ ng' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how customer relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a customer vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'purchase' AS word, 'mua hĂ ng' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how purchase relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a purchase vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'price' AS word, 'giĂ¡' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how price relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a price vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'receipt' AS word, 'biĂªn lai' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how receipt relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a receipt vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'refund' AS word, 'hoĂ n tiá»n' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how refund relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a refund vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'discount' AS word, 'chiáº¿t kháº¥u' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how discount relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a discount vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'cashier' AS word, 'thu ngĂ¢n' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how cashier relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cashier vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'delivery' AS word, 'giao hĂ ng' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how delivery relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a delivery vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'sale' AS word, 'Ä‘á»£t giáº£m giĂ¡' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how sale relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sale vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'vendor' AS word, 'nhĂ  cung cáº¥p' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how vendor relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a vendor vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'retailer' AS word, 'nhĂ  bĂ¡n láº»' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how retailer relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a retailer vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'wholesale' AS word, 'bĂ¡n buĂ´n' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how wholesale relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a wholesale vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'product' AS word, 'sáº£n pháº©m' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how product relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a product vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'warranty' AS word, 'báº£o hĂ nh' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how warranty relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a warranty vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'guarantee' AS word, 'sá»± Ä‘áº£m báº£o' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how guarantee relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a guarantee vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'invoice' AS word, 'hĂ³a Ä‘Æ¡n' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how invoice relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a invoice vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'payment' AS word, 'thanh toĂ¡n' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how payment relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a payment vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'checkout' AS word, 'quáº§y thanh toĂ¡n' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how checkout relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a checkout vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'basket' AS word, 'giá» hĂ ng' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how basket relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a basket vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'complaint' AS word, 'khiáº¿u náº¡i' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how complaint relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a complaint vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'consumer' AS word, 'ngÆ°á»i tiĂªu dĂ¹ng' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how consumer relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a consumer vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'demand' AS word, 'nhu cáº§u' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how demand relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a demand vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'supply' AS word, 'nguá»“n cung' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how supply relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a supply vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'budget' AS word, 'ngĂ¢n sĂ¡ch' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how budget relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a budget vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'expenditure' AS word, 'chi tiĂªu' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how expenditure relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a expenditure vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'bargain' AS word, 'mĂ³n há»i' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how bargain relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a bargain vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'brand' AS word, 'thÆ°Æ¡ng hiá»‡u' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how brand relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a brand vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'quality' AS word, 'cháº¥t lÆ°á»£ng' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how quality relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a quality vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'availability' AS word, 'sá»± sáºµn cĂ³' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how availability relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a availability vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
  UNION ALL
  SELECT 'subscription' AS word, 'gĂ³i Ä‘Äƒng kĂ½' AS meaning_vi, 'A vocabulary term used in Shopping and Consumerism topics.' AS definition_en, 'The report explains how subscription relates to shopping and consumerism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a subscription vá»›i chá»§ Ä‘á» Shopping and Consumerism.' AS example_vi
) terms
WHERE topic.id=3
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'curriculum' AS word, 'chÆ°Æ¡ng trĂ¬nh há»c' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how curriculum relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a curriculum vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'syllabus' AS word, 'Ä‘á» cÆ°Æ¡ng' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how syllabus relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a syllabus vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'tuition' AS word, 'há»c phĂ­' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how tuition relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tuition vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'scholarship' AS word, 'há»c bá»•ng' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how scholarship relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a scholarship vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'assignment' AS word, 'bĂ i táº­p' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how assignment relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a assignment vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'lecture' AS word, 'bĂ i giáº£ng' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how lecture relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a lecture vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'seminar' AS word, 'há»™i tháº£o' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how seminar relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a seminar vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'assessment' AS word, 'Ä‘Ă¡nh giĂ¡' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how assessment relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a assessment vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'graduate' AS word, 'tá»‘t nghiá»‡p' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how graduate relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a graduate vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'undergraduate' AS word, 'sinh viĂªn Ä‘áº¡i há»c' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how undergraduate relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a undergraduate vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'postgraduate' AS word, 'sau Ä‘áº¡i há»c' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how postgraduate relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a postgraduate vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'discipline' AS word, 'mĂ´n há»c' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how discipline relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a discipline vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'literacy' AS word, 'trĂ¬nh Ä‘á»™ Ä‘á»c viáº¿t' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how literacy relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a literacy vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'qualification' AS word, 'báº±ng cáº¥p' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how qualification relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a qualification vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'academic' AS word, 'há»c thuáº­t' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how academic relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a academic vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'campus' AS word, 'khuĂ´n viĂªn' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how campus relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a campus vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'faculty' AS word, 'giáº£ng viĂªn' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how faculty relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a faculty vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'enrollment' AS word, 'ghi danh' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how enrollment relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a enrollment vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'attendance' AS word, 'chuyĂªn cáº§n' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how attendance relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a attendance vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'revision' AS word, 'Ă´n táº­p' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how revision relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a revision vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'research' AS word, 'nghiĂªn cá»©u' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how research relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a research vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'laboratory' AS word, 'phĂ²ng thĂ­ nghiá»‡m' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how laboratory relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a laboratory vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'classroom' AS word, 'lá»›p há»c' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how classroom relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a classroom vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'teacher' AS word, 'giĂ¡o viĂªn' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how teacher relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a teacher vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'pupil' AS word, 'há»c sinh' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how pupil relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a pupil vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'examination' AS word, 'ká»³ thi' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how examination relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a examination vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'certificate' AS word, 'chá»©ng chá»‰' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how certificate relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a certificate vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'knowledge' AS word, 'kiáº¿n thá»©c' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how knowledge relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a knowledge vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'skill' AS word, 'ká»¹ nÄƒng' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how skill relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a skill vá»›i chá»§ Ä‘á» Education.' AS example_vi
  UNION ALL
  SELECT 'distance learning' AS word, 'há»c tá»« xa' AS meaning_vi, 'A vocabulary term used in Education topics.' AS definition_en, 'The report explains how distance learning relates to education.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a distance learning vá»›i chá»§ Ä‘á» Education.' AS example_vi
) terms
WHERE topic.id=4
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'environment' AS word, 'mĂ´i trÆ°á»ng' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how environment relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a environment vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'pollution' AS word, 'Ă´ nhiá»…m' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how pollution relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a pollution vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'conservation' AS word, 'báº£o tá»“n' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how conservation relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a conservation vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'biodiversity' AS word, 'Ä‘a dáº¡ng sinh há»c' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how biodiversity relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a biodiversity vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'ecosystem' AS word, 'há»‡ sinh thĂ¡i' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how ecosystem relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ecosystem vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'habitat' AS word, 'mĂ´i trÆ°á»ng sá»‘ng' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how habitat relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a habitat vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'renewable' AS word, 'tĂ¡i táº¡o Ä‘Æ°á»£c' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how renewable relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a renewable vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'recycle' AS word, 'tĂ¡i cháº¿' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how recycle relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a recycle vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'waste' AS word, 'cháº¥t tháº£i' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how waste relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a waste vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'emission' AS word, 'khĂ­ tháº£i' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how emission relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a emission vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'carbon footprint' AS word, 'dáº¥u chĂ¢n carbon' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how carbon footprint relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a carbon footprint vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'deforestation' AS word, 'phĂ¡ rá»«ng' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how deforestation relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a deforestation vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'sustainability' AS word, 'tĂ­nh bá»n vá»¯ng' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how sustainability relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sustainability vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'contamination' AS word, 'nhiá»…m báº©n' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how contamination relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a contamination vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'preservation' AS word, 'gĂ¬n giá»¯' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how preservation relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a preservation vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'climate' AS word, 'khĂ­ háº­u' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how climate relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a climate vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'atmosphere' AS word, 'khĂ­ quyá»ƒn' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how atmosphere relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a atmosphere vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'wildlife' AS word, 'Ä‘á»™ng váº­t hoang dĂ£' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how wildlife relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a wildlife vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'soil erosion' AS word, 'xĂ³i mĂ²n Ä‘áº¥t' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how soil erosion relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a soil erosion vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'sustainable' AS word, 'bá»n vá»¯ng' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how sustainable relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sustainable vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'greenhouse gas' AS word, 'khĂ­ nhĂ  kĂ­nh' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how greenhouse gas relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a greenhouse gas vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'fossil fuel' AS word, 'nhiĂªn liá»‡u hĂ³a tháº¡ch' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how fossil fuel relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fossil fuel vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'organic' AS word, 'há»¯u cÆ¡' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how organic relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a organic vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'dumping' AS word, 'xáº£ tháº£i' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how dumping relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a dumping vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'landfill' AS word, 'bĂ£i chĂ´n láº¥p' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how landfill relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a landfill vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'resource' AS word, 'tĂ i nguyĂªn' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how resource relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a resource vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'drought' AS word, 'háº¡n hĂ¡n' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how drought relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a drought vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'flooding' AS word, 'lá»¥t' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how flooding relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a flooding vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'ozone layer' AS word, 'táº§ng ozone' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how ozone layer relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ozone layer vá»›i chá»§ Ä‘á» Environment.' AS example_vi
  UNION ALL
  SELECT 'extinction' AS word, 'tuyá»‡t chá»§ng' AS meaning_vi, 'A vocabulary term used in Environment topics.' AS definition_en, 'The report explains how extinction relates to environment.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a extinction vá»›i chá»§ Ä‘á» Environment.' AS example_vi
) terms
WHERE topic.id=5
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'healthcare' AS word, 'chÄƒm sĂ³c sá»©c khá»e' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how healthcare relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a healthcare vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'well-being' AS word, 'sá»©c khá»e tinh tháº§n vĂ  thá»ƒ cháº¥t' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how well-being relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a well-being vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'nutrition' AS word, 'dinh dÆ°á»¡ng' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how nutrition relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a nutrition vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'exercise' AS word, 'táº­p thá»ƒ dá»¥c' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how exercise relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a exercise vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'fitness' AS word, 'thá»ƒ lá»±c' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how fitness relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fitness vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'disease' AS word, 'bá»‡nh' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how disease relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a disease vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'infection' AS word, 'nhiá»…m trĂ¹ng' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how infection relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a infection vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'treatment' AS word, 'Ä‘iá»u trá»‹' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how treatment relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a treatment vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'prescription' AS word, 'Ä‘Æ¡n thuá»‘c' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how prescription relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a prescription vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'diagnosis' AS word, 'cháº©n Ä‘oĂ¡n' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how diagnosis relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a diagnosis vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'prevention' AS word, 'phĂ²ng ngá»«a' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how prevention relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a prevention vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'immunity' AS word, 'miá»…n dá»‹ch' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how immunity relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a immunity vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'vaccination' AS word, 'tiĂªm chá»§ng' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how vaccination relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a vaccination vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'symptom' AS word, 'triá»‡u chá»©ng' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how symptom relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a symptom vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'therapy' AS word, 'trá»‹ liá»‡u' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how therapy relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a therapy vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'recovery' AS word, 'há»“i phá»¥c' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how recovery relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a recovery vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'patient' AS word, 'bá»‡nh nhĂ¢n' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how patient relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a patient vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'physician' AS word, 'bĂ¡c sÄ©' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how physician relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a physician vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'nurse' AS word, 'y tĂ¡' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how nurse relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a nurse vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'hospital' AS word, 'bá»‡nh viá»‡n' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how hospital relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hospital vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'clinic' AS word, 'phĂ²ng khĂ¡m' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how clinic relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a clinic vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'medicine' AS word, 'thuá»‘c' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how medicine relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a medicine vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'mental health' AS word, 'sá»©c khá»e tĂ¢m tháº§n' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how mental health relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mental health vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'stress' AS word, 'cÄƒng tháº³ng' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how stress relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a stress vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'anxiety' AS word, 'lo Ă¢u' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how anxiety relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a anxiety vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'insomnia' AS word, 'máº¥t ngá»§' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how insomnia relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a insomnia vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'diet' AS word, 'cháº¿ Ä‘á»™ Äƒn' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how diet relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a diet vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'hygiene' AS word, 'vá»‡ sinh' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how hygiene relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hygiene vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'allergy' AS word, 'dá»‹ á»©ng' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how allergy relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a allergy vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
  UNION ALL
  SELECT 'balance' AS word, 'sá»± cĂ¢n báº±ng' AS meaning_vi, 'A vocabulary term used in Health and Well-being topics.' AS definition_en, 'The report explains how balance relates to health and well-being.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a balance vá»›i chá»§ Ä‘á» Health and Well-being.' AS example_vi
) terms
WHERE topic.id=6
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'innovation' AS word, 'Ä‘á»•i má»›i' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how innovation relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a innovation vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'device' AS word, 'thiáº¿t bá»‹' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how device relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a device vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'software' AS word, 'pháº§n má»m' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how software relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a software vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'hardware' AS word, 'pháº§n cá»©ng' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how hardware relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hardware vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'database' AS word, 'cÆ¡ sá»Ÿ dá»¯ liá»‡u' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how database relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a database vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'network' AS word, 'máº¡ng' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how network relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a network vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'artificial intelligence' AS word, 'trĂ­ tuá»‡ nhĂ¢n táº¡o' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how artificial intelligence relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a artificial intelligence vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'automation' AS word, 'tá»± Ä‘á»™ng hĂ³a' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how automation relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a automation vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'algorithm' AS word, 'thuáº­t toĂ¡n' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how algorithm relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a algorithm vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'cybersecurity' AS word, 'an ninh máº¡ng' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how cybersecurity relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cybersecurity vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'cloud computing' AS word, 'Ä‘iá»‡n toĂ¡n Ä‘Ă¡m mĂ¢y' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how cloud computing relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cloud computing vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'application' AS word, 'á»©ng dá»¥ng' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how application relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a application vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'interface' AS word, 'giao diá»‡n' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how interface relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a interface vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'update' AS word, 'cáº­p nháº­t' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how update relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a update vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'digital' AS word, 'ká»¹ thuáº­t sá»‘' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how digital relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a digital vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'connection' AS word, 'káº¿t ná»‘i' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how connection relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a connection vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'server' AS word, 'mĂ¡y chá»§' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how server relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a server vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'bandwidth' AS word, 'bÄƒng thĂ´ng' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how bandwidth relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a bandwidth vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'encryption' AS word, 'mĂ£ hĂ³a' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how encryption relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a encryption vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'privacy' AS word, 'quyá»n riĂªng tÆ°' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how privacy relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a privacy vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'malware' AS word, 'pháº§n má»m Ä‘á»™c háº¡i' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how malware relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a malware vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'backup' AS word, 'sao lÆ°u' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how backup relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a backup vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'device compatibility' AS word, 'tĂ­nh tÆ°Æ¡ng thĂ­ch thiáº¿t bá»‹' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how device compatibility relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a device compatibility vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'smartphone' AS word, 'Ä‘iá»‡n thoáº¡i thĂ´ng minh' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how smartphone relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a smartphone vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'robotics' AS word, 'ngĂ nh robot' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how robotics relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a robotics vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'data' AS word, 'dá»¯ liá»‡u' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how data relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a data vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'virtual reality' AS word, 'thá»±c táº¿ áº£o' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how virtual reality relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a virtual reality vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'streaming' AS word, 'truyá»n phĂ¡t' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how streaming relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a streaming vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'browser' AS word, 'trĂ¬nh duyá»‡t' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how browser relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a browser vá»›i chá»§ Ä‘á» Technology.' AS example_vi
  UNION ALL
  SELECT 'wireless' AS word, 'khĂ´ng dĂ¢y' AS meaning_vi, 'A vocabulary term used in Technology topics.' AS definition_en, 'The report explains how wireless relates to technology.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a wireless vá»›i chá»§ Ä‘á» Technology.' AS example_vi
) terms
WHERE topic.id=7
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'community' AS word, 'cá»™ng Ä‘á»“ng' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how community relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a community vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'population' AS word, 'dĂ¢n sá»‘' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how population relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a population vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'citizen' AS word, 'cĂ´ng dĂ¢n' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how citizen relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a citizen vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'immigration' AS word, 'nháº­p cÆ°' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how immigration relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a immigration vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'inequality' AS word, 'báº¥t bĂ¬nh Ä‘áº³ng' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how inequality relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a inequality vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'poverty' AS word, 'nghĂ¨o Ä‘Ă³i' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how poverty relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a poverty vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'welfare' AS word, 'phĂºc lá»£i' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how welfare relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a welfare vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'diversity' AS word, 'sá»± Ä‘a dáº¡ng' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how diversity relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a diversity vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'social issue' AS word, 'váº¥n Ä‘á» xĂ£ há»™i' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how social issue relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a social issue vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'democracy' AS word, 'dĂ¢n chá»§' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how democracy relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a democracy vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'participation' AS word, 'sá»± tham gia' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how participation relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a participation vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'volunteer' AS word, 'tĂ¬nh nguyá»‡n viĂªn' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how volunteer relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a volunteer vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'charity' AS word, 'tá»« thiá»‡n' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how charity relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a charity vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'discrimination' AS word, 'phĂ¢n biá»‡t Ä‘á»‘i xá»­' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how discrimination relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a discrimination vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'inclusion' AS word, 'sá»± hĂ²a nháº­p' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how inclusion relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a inclusion vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'equality' AS word, 'bĂ¬nh Ä‘áº³ng' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how equality relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a equality vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'generation' AS word, 'tháº¿ há»‡' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how generation relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a generation vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'minority' AS word, 'thiá»ƒu sá»‘' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how minority relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a minority vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'majority' AS word, 'Ä‘a sá»‘' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how majority relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a majority vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'public opinion' AS word, 'dÆ° luáº­n' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how public opinion relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a public opinion vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'social network' AS word, 'máº¡ng xĂ£ há»™i' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how social network relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a social network vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'tradition' AS word, 'truyá»n thá»‘ng' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how tradition relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tradition vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'identity' AS word, 'báº£n sáº¯c' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how identity relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a identity vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'mobility' AS word, 'sá»± dá»‹ch chuyá»ƒn' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how mobility relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mobility vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'census' AS word, 'Ä‘iá»u tra dĂ¢n sá»‘' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how census relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a census vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'urban society' AS word, 'xĂ£ há»™i Ä‘Ă´ thá»‹' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how urban society relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a urban society vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'neighborhood' AS word, 'khu phá»‘' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how neighborhood relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a neighborhood vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'cooperation' AS word, 'há»£p tĂ¡c' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how cooperation relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cooperation vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'security' AS word, 'an ninh' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how security relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a security vá»›i chá»§ Ä‘á» Society.' AS example_vi
  UNION ALL
  SELECT 'solidarity' AS word, 'Ä‘oĂ n káº¿t' AS meaning_vi, 'A vocabulary term used in Society topics.' AS definition_en, 'The report explains how solidarity relates to society.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a solidarity vá»›i chá»§ Ä‘á» Society.' AS example_vi
) terms
WHERE topic.id=8
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'culture' AS word, 'vÄƒn hĂ³a' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how culture relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a culture vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'tradition' AS word, 'truyá»n thá»‘ng' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how tradition relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tradition vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'heritage' AS word, 'di sáº£n' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how heritage relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a heritage vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'custom' AS word, 'phong tá»¥c' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how custom relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a custom vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'ceremony' AS word, 'nghi lá»…' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how ceremony relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ceremony vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'festival' AS word, 'lá»… há»™i' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how festival relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a festival vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'ritual' AS word, 'nghi thá»©c' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how ritual relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ritual vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'folklore' AS word, 'vÄƒn hĂ³a dĂ¢n gian' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how folklore relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a folklore vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'craft' AS word, 'thá»§ cĂ´ng' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how craft relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a craft vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'artifacts' AS word, 'hiá»‡n váº­t' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how artifacts relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a artifacts vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'identity' AS word, 'báº£n sáº¯c' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how identity relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a identity vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'ancestor' AS word, 'tá»• tiĂªn' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how ancestor relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ancestor vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'ceremonial' AS word, 'mang tĂ­nh nghi lá»…' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how ceremonial relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ceremonial vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'ethnic' AS word, 'thuá»™c dĂ¢n tá»™c' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how ethnic relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ethnic vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'cultural exchange' AS word, 'trao Ä‘á»•i vÄƒn hĂ³a' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how cultural exchange relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cultural exchange vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'belief' AS word, 'niá»m tin' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how belief relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a belief vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'value' AS word, 'giĂ¡ trá»‹' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how value relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a value vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'celebration' AS word, 'lá»… ká»· niá»‡m' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how celebration relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a celebration vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'costume' AS word, 'trang phá»¥c' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how costume relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a costume vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'cuisine' AS word, 'áº©m thá»±c' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how cuisine relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cuisine vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'handicraft' AS word, 'Ä‘á»“ thá»§ cĂ´ng' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how handicraft relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a handicraft vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'legend' AS word, 'truyá»n thuyáº¿t' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how legend relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a legend vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'monument' AS word, 'Ä‘Ă i tÆ°á»Ÿng niá»‡m' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how monument relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a monument vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'museum' AS word, 'báº£o tĂ ng' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how museum relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a museum vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'language' AS word, 'ngĂ´n ngá»¯' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how language relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a language vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'performance' AS word, 'biá»ƒu diá»…n' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how performance relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a performance vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'music' AS word, 'Ă¢m nháº¡c' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how music relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a music vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'dance' AS word, 'Ä‘iá»‡u mĂºa' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how dance relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a dance vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'hospitality' AS word, 'lĂ²ng hiáº¿u khĂ¡ch' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how hospitality relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hospitality vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
  UNION ALL
  SELECT 'preservation' AS word, 'báº£o tá»“n' AS meaning_vi, 'A vocabulary term used in Culture and Traditions topics.' AS definition_en, 'The report explains how preservation relates to culture and traditions.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a preservation vá»›i chá»§ Ä‘á» Culture and Traditions.' AS example_vi
) terms
WHERE topic.id=9
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'media' AS word, 'truyá»n thĂ´ng' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how media relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a media vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'journalism' AS word, 'bĂ¡o chĂ­' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how journalism relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a journalism vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'broadcast' AS word, 'phĂ¡t sĂ³ng' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how broadcast relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a broadcast vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'publication' AS word, 'áº¥n pháº©m' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how publication relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a publication vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'headline' AS word, 'tiĂªu Ä‘á»' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how headline relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a headline vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'audience' AS word, 'khĂ¡n giáº£' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how audience relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a audience vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'interview' AS word, 'phá»ng váº¥n' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how interview relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a interview vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'reporter' AS word, 'phĂ³ng viĂªn' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how reporter relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a reporter vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'editor' AS word, 'biĂªn táº­p viĂªn' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how editor relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a editor vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'advertisement' AS word, 'quáº£ng cĂ¡o' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how advertisement relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a advertisement vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'press release' AS word, 'thĂ´ng cĂ¡o bĂ¡o chĂ­' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how press release relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a press release vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'communication' AS word, 'giao tiáº¿p' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how communication relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a communication vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'message' AS word, 'thĂ´ng Ä‘iá»‡p' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how message relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a message vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'feedback' AS word, 'pháº£n há»“i' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how feedback relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a feedback vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'debate' AS word, 'tranh luáº­n' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how debate relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a debate vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'podcast' AS word, 'chÆ°Æ¡ng trĂ¬nh Ă¢m thanh' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how podcast relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a podcast vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'newsletter' AS word, 'báº£n tin' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how newsletter relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a newsletter vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'censorship' AS word, 'kiá»ƒm duyá»‡t' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how censorship relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a censorship vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'misinformation' AS word, 'thĂ´ng tin sai' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how misinformation relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a misinformation vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'credibility' AS word, 'Ä‘á»™ tin cáº­y' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how credibility relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a credibility vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'coverage' AS word, 'Ä‘Æ°a tin' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how coverage relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a coverage vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'subscriber' AS word, 'ngÆ°á»i Ä‘Äƒng kĂ½' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how subscriber relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a subscriber vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'influence' AS word, 'áº£nh hÆ°á»Ÿng' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how influence relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a influence vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'platform' AS word, 'ná»n táº£ng' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how platform relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a platform vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'social media' AS word, 'máº¡ng xĂ£ há»™i' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how social media relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a social media vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'content' AS word, 'ná»™i dung' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how content relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a content vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'channel' AS word, 'kĂªnh' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how channel relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a channel vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'broadcasting' AS word, 'phĂ¡t thanh truyá»n hĂ¬nh' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how broadcasting relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a broadcasting vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'caption' AS word, 'phá»¥ Ä‘á»' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how caption relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a caption vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
  UNION ALL
  SELECT 'correspondent' AS word, 'phĂ³ng viĂªn thÆ°á»ng trĂº' AS meaning_vi, 'A vocabulary term used in Media and Communication topics.' AS definition_en, 'The report explains how correspondent relates to media and communication.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a correspondent vá»›i chá»§ Ä‘á» Media and Communication.' AS example_vi
) terms
WHERE topic.id=10
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'agriculture' AS word, 'nĂ´ng nghiá»‡p' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how agriculture relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a agriculture vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'nutrition' AS word, 'dinh dÆ°á»¡ng' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how nutrition relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a nutrition vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'crop' AS word, 'hoa mĂ u' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how crop relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a crop vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'harvest' AS word, 'thu hoáº¡ch' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how harvest relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a harvest vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'fertilizer' AS word, 'phĂ¢n bĂ³n' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how fertilizer relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fertilizer vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'irrigation' AS word, 'tÆ°á»›i tiĂªu' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how irrigation relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a irrigation vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'livestock' AS word, 'gia sĂºc' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how livestock relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a livestock vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'organic' AS word, 'há»¯u cÆ¡' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how organic relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a organic vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'ingredient' AS word, 'nguyĂªn liá»‡u' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how ingredient relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ingredient vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'recipe' AS word, 'cĂ´ng thá»©c' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how recipe relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a recipe vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'cuisine' AS word, 'áº©m thá»±c' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how cuisine relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cuisine vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'protein' AS word, 'cháº¥t Ä‘áº¡m' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how protein relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a protein vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'carbohydrate' AS word, 'tinh bá»™t' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how carbohydrate relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a carbohydrate vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'vitamin' AS word, 'vitamin' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how vitamin relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a vitamin vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'mineral' AS word, 'khoĂ¡ng cháº¥t' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how mineral relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mineral vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'portion' AS word, 'kháº©u pháº§n' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how portion relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a portion vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'beverage' AS word, 'Ä‘á»“ uá»‘ng' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how beverage relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a beverage vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'food chain' AS word, 'chuá»—i thá»©c Äƒn' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how food chain relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a food chain vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'farming' AS word, 'canh tĂ¡c' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how farming relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a farming vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'dairy' AS word, 'sáº£n pháº©m sá»¯a' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how dairy relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a dairy vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'grain' AS word, 'ngÅ© cá»‘c' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how grain relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a grain vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'livelihood' AS word, 'sinh káº¿' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how livelihood relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a livelihood vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'preservative' AS word, 'cháº¥t báº£o quáº£n' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how preservative relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a preservative vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'processed food' AS word, 'thá»±c pháº©m cháº¿ biáº¿n' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how processed food relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a processed food vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'food safety' AS word, 'an toĂ n thá»±c pháº©m' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how food safety relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a food safety vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'seasoning' AS word, 'gia vá»‹' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how seasoning relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a seasoning vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'supply chain' AS word, 'chuá»—i cung á»©ng' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how supply chain relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a supply chain vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'cultivation' AS word, 'gieo trá»“ng' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how cultivation relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cultivation vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'yield' AS word, 'nÄƒng suáº¥t' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how yield relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a yield vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
  UNION ALL
  SELECT 'hunger' AS word, 'náº¡n Ä‘Ă³i' AS meaning_vi, 'A vocabulary term used in Food and Agriculture topics.' AS definition_en, 'The report explains how hunger relates to food and agriculture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hunger vá»›i chá»§ Ä‘á» Food and Agriculture.' AS example_vi
) terms
WHERE topic.id=11
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'government' AS word, 'chĂ­nh phá»§' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how government relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a government vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'policy' AS word, 'chĂ­nh sĂ¡ch' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how policy relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a policy vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'public service' AS word, 'dá»‹ch vá»¥ cĂ´ng' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how public service relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a public service vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'legislation' AS word, 'phĂ¡p cháº¿' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how legislation relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a legislation vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'regulation' AS word, 'quy Ä‘á»‹nh' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how regulation relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a regulation vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'authority' AS word, 'cÆ¡ quan cĂ³ tháº©m quyá»n' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how authority relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a authority vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'administration' AS word, 'chĂ­nh quyá»n' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how administration relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a administration vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'municipality' AS word, 'Ä‘Ă´ thá»‹' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how municipality relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a municipality vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'budget' AS word, 'ngĂ¢n sĂ¡ch' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how budget relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a budget vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'taxpayer' AS word, 'ngÆ°á»i ná»™p thuáº¿' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how taxpayer relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a taxpayer vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'election' AS word, 'báº§u cá»­' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how election relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a election vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'candidate' AS word, 'á»©ng viĂªn' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how candidate relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a candidate vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'parliament' AS word, 'nghá»‹ viá»‡n' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how parliament relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a parliament vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'ministry' AS word, 'bá»™' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how ministry relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ministry vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'council' AS word, 'há»™i Ä‘á»“ng' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how council relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a council vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'infrastructure' AS word, 'háº¡ táº§ng' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how infrastructure relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a infrastructure vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'civil servant' AS word, 'cĂ´ng chá»©c' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how civil servant relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a civil servant vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'public transport' AS word, 'giao thĂ´ng cĂ´ng cá»™ng' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how public transport relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a public transport vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'healthcare system' AS word, 'há»‡ thá»‘ng y táº¿' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how healthcare system relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a healthcare system vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'social security' AS word, 'an sinh xĂ£ há»™i' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how social security relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a social security vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'transparency' AS word, 'minh báº¡ch' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how transparency relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a transparency vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'accountability' AS word, 'trĂ¡ch nhiá»‡m giáº£i trĂ¬nh' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how accountability relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a accountability vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'permit' AS word, 'giáº¥y phĂ©p' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how permit relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a permit vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'registration' AS word, 'Ä‘Äƒng kĂ½' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how registration relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a registration vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'citizenship' AS word, 'quá»‘c tá»‹ch' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how citizenship relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a citizenship vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'public sector' AS word, 'khu vá»±c cĂ´ng' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how public sector relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a public sector vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'governance' AS word, 'quáº£n trá»‹' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how governance relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a governance vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'census' AS word, 'Ä‘iá»u tra dĂ¢n sá»‘' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how census relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a census vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'subsidy' AS word, 'trá»£ cáº¥p' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how subsidy relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a subsidy vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
  UNION ALL
  SELECT 'law enforcement' AS word, 'thá»±c thi phĂ¡p luáº­t' AS meaning_vi, 'A vocabulary term used in Government and Public Services topics.' AS definition_en, 'The report explains how law enforcement relates to government and public services.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a law enforcement vá»›i chá»§ Ä‘á» Government and Public Services.' AS example_vi
) terms
WHERE topic.id=12
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'economy' AS word, 'ná»n kinh táº¿' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how economy relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a economy vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'finance' AS word, 'tĂ i chĂ­nh' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how finance relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a finance vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'investment' AS word, 'Ä‘áº§u tÆ°' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how investment relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a investment vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'inflation' AS word, 'láº¡m phĂ¡t' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how inflation relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a inflation vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'interest rate' AS word, 'lĂ£i suáº¥t' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how interest rate relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a interest rate vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'currency' AS word, 'tiá»n tá»‡' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how currency relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a currency vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'exchange rate' AS word, 'tá»· giĂ¡' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how exchange rate relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a exchange rate vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'revenue' AS word, 'doanh thu' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how revenue relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a revenue vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'profit' AS word, 'lá»£i nhuáº­n' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how profit relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a profit vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'debt' AS word, 'ná»£' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how debt relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a debt vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'loan' AS word, 'khoáº£n vay' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how loan relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a loan vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'credit' AS word, 'tĂ­n dá»¥ng' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how credit relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a credit vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'bankruptcy' AS word, 'phĂ¡ sáº£n' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how bankruptcy relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a bankruptcy vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'recession' AS word, 'suy thoĂ¡i' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how recession relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a recession vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'growth' AS word, 'tÄƒng trÆ°á»Ÿng' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how growth relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a growth vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'market' AS word, 'thá»‹ trÆ°á»ng' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how market relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a market vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'stock' AS word, 'cá»• phiáº¿u' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how stock relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a stock vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'shareholder' AS word, 'cá»• Ä‘Ă´ng' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how shareholder relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a shareholder vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'budget' AS word, 'ngĂ¢n sĂ¡ch' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how budget relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a budget vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'tax' AS word, 'thuáº¿' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how tax relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tax vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'trade' AS word, 'thÆ°Æ¡ng máº¡i' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how trade relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a trade vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'export' AS word, 'xuáº¥t kháº©u' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how export relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a export vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'import' AS word, 'nháº­p kháº©u' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how import relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a import vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'subsidy' AS word, 'trá»£ cáº¥p' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how subsidy relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a subsidy vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'wealth' AS word, 'sá»± giĂ u cĂ³' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how wealth relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a wealth vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'income' AS word, 'thu nháº­p' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how income relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a income vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'expenditure' AS word, 'chi tiĂªu' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how expenditure relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a expenditure vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'saving' AS word, 'tiá»n tiáº¿t kiá»‡m' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how saving relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a saving vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'capital' AS word, 'vá»‘n' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how capital relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a capital vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
  UNION ALL
  SELECT 'forecast' AS word, 'dá»± bĂ¡o' AS meaning_vi, 'A vocabulary term used in Economy and Finance topics.' AS definition_en, 'The report explains how forecast relates to economy and finance.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a forecast vá»›i chá»§ Ä‘á» Economy and Finance.' AS example_vi
) terms
WHERE topic.id=13
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'science' AS word, 'khoa há»c' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how science relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a science vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'research' AS word, 'nghiĂªn cá»©u' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how research relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a research vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'experiment' AS word, 'thĂ­ nghiá»‡m' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how experiment relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a experiment vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'hypothesis' AS word, 'giáº£ thuyáº¿t' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how hypothesis relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hypothesis vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'methodology' AS word, 'phÆ°Æ¡ng phĂ¡p luáº­n' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how methodology relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a methodology vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'analysis' AS word, 'phĂ¢n tĂ­ch' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how analysis relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a analysis vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'evidence' AS word, 'báº±ng chá»©ng' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how evidence relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a evidence vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'observation' AS word, 'quan sĂ¡t' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how observation relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a observation vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'theory' AS word, 'lĂ½ thuyáº¿t' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how theory relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a theory vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'laboratory' AS word, 'phĂ²ng thĂ­ nghiá»‡m' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how laboratory relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a laboratory vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'data' AS word, 'dá»¯ liá»‡u' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how data relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a data vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'sample' AS word, 'máº«u' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how sample relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sample vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'variable' AS word, 'biáº¿n sá»‘' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how variable relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a variable vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'discovery' AS word, 'phĂ¡t hiá»‡n' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how discovery relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a discovery vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'innovation' AS word, 'Ä‘á»•i má»›i' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how innovation relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a innovation vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'scientist' AS word, 'nhĂ  khoa há»c' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how scientist relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a scientist vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'peer review' AS word, 'Ä‘Ă¡nh giĂ¡ Ä‘á»“ng cáº¥p' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how peer review relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a peer review vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'publication' AS word, 'cĂ´ng bá»‘' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how publication relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a publication vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'finding' AS word, 'káº¿t quáº£ nghiĂªn cá»©u' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how finding relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a finding vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'accuracy' AS word, 'Ä‘á»™ chĂ­nh xĂ¡c' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how accuracy relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a accuracy vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'reliability' AS word, 'Ä‘á»™ tin cáº­y' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how reliability relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a reliability vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'measurement' AS word, 'Ä‘o lÆ°á»ng' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how measurement relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a measurement vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'trial' AS word, 'thá»­ nghiá»‡m' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how trial relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a trial vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'conclusion' AS word, 'káº¿t luáº­n' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how conclusion relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a conclusion vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'researcher' AS word, 'nhĂ  nghiĂªn cá»©u' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how researcher relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a researcher vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'procedure' AS word, 'quy trĂ¬nh' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how procedure relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a procedure vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'comparison' AS word, 'so sĂ¡nh' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how comparison relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a comparison vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'statistics' AS word, 'thá»‘ng kĂª' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how statistics relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a statistics vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'equipment' AS word, 'thiáº¿t bá»‹' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how equipment relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a equipment vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
  UNION ALL
  SELECT 'breakthrough' AS word, 'bÆ°á»›c Ä‘á»™t phĂ¡' AS meaning_vi, 'A vocabulary term used in Science and Research topics.' AS definition_en, 'The report explains how breakthrough relates to science and research.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a breakthrough vá»›i chá»§ Ä‘á» Science and Research.' AS example_vi
) terms
WHERE topic.id=14
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'crime' AS word, 'tá»™i pháº¡m' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how crime relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a crime vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'law' AS word, 'phĂ¡p luáº­t' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how law relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a law vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'offence' AS word, 'hĂ nh vi pháº¡m phĂ¡p' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how offence relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a offence vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'defendant' AS word, 'bá»‹ cĂ¡o' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how defendant relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a defendant vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'prosecution' AS word, 'bĂªn cĂ´ng tá»‘' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how prosecution relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a prosecution vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'verdict' AS word, 'phĂ¡n quyáº¿t' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how verdict relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a verdict vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'sentence' AS word, 'báº£n Ă¡n' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how sentence relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sentence vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'trial' AS word, 'phiĂªn tĂ²a' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how trial relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a trial vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'jury' AS word, 'bá»“i tháº©m Ä‘oĂ n' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how jury relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a jury vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'witness' AS word, 'nhĂ¢n chá»©ng' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how witness relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a witness vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'evidence' AS word, 'báº±ng chá»©ng' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how evidence relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a evidence vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'suspect' AS word, 'nghi pháº¡m' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how suspect relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a suspect vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'investigation' AS word, 'Ä‘iá»u tra' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how investigation relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a investigation vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'arrest' AS word, 'báº¯t giá»¯' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how arrest relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a arrest vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'custody' AS word, 'giam giá»¯' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how custody relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a custody vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'fine' AS word, 'tiá»n pháº¡t' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how fine relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fine vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'penalty' AS word, 'hĂ¬nh pháº¡t' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how penalty relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a penalty vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'appeal' AS word, 'khĂ¡ng cĂ¡o' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how appeal relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a appeal vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'legislation' AS word, 'phĂ¡p cháº¿' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how legislation relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a legislation vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'contract' AS word, 'há»£p Ä‘á»“ng' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how contract relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a contract vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'fraud' AS word, 'gian láº­n' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how fraud relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fraud vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'theft' AS word, 'trá»™m cáº¯p' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how theft relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a theft vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'vandalism' AS word, 'phĂ¡ hoáº¡i' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how vandalism relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a vandalism vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'victim' AS word, 'náº¡n nhĂ¢n' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how victim relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a victim vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'lawyer' AS word, 'luáº­t sÆ°' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how lawyer relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a lawyer vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'judge' AS word, 'tháº©m phĂ¡n' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how judge relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a judge vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'court' AS word, 'tĂ²a Ă¡n' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how court relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a court vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'security' AS word, 'an ninh' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how security relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a security vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'illegal' AS word, 'báº¥t há»£p phĂ¡p' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how illegal relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a illegal vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
  UNION ALL
  SELECT 'deterrent' AS word, 'biá»‡n phĂ¡p rÄƒn Ä‘e' AS meaning_vi, 'A vocabulary term used in Crime and Law topics.' AS definition_en, 'The report explains how deterrent relates to crime and law.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a deterrent vá»›i chá»§ Ä‘á» Crime and Law.' AS example_vi
) terms
WHERE topic.id=15
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'globalization' AS word, 'toĂ n cáº§u hĂ³a' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how globalization relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a globalization vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'integration' AS word, 'há»™i nháº­p' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how integration relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a integration vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'interdependence' AS word, 'phá»¥ thuá»™c láº«n nhau' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how interdependence relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a interdependence vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'multinational' AS word, 'Ä‘a quá»‘c gia' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how multinational relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a multinational vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'international trade' AS word, 'thÆ°Æ¡ng máº¡i quá»‘c táº¿' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how international trade relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a international trade vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'outsourcing' AS word, 'thuĂª ngoĂ i' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how outsourcing relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a outsourcing vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'migration' AS word, 'di cÆ°' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how migration relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a migration vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'cooperation' AS word, 'há»£p tĂ¡c' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how cooperation relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cooperation vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'diplomacy' AS word, 'ngoáº¡i giao' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how diplomacy relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a diplomacy vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'diversity' AS word, 'Ä‘a dáº¡ng' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how diversity relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a diversity vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'treaty' AS word, 'hiá»‡p Æ°á»›c' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how treaty relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a treaty vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'alliance' AS word, 'liĂªn minh' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how alliance relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a alliance vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'economic union' AS word, 'liĂªn minh kinh táº¿' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how economic union relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a economic union vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'supply chain' AS word, 'chuá»—i cung á»©ng' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how supply chain relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a supply chain vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'cultural exchange' AS word, 'trao Ä‘á»•i vÄƒn hĂ³a' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how cultural exchange relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cultural exchange vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'standardization' AS word, 'tiĂªu chuáº©n hĂ³a' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how standardization relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a standardization vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'competition' AS word, 'cáº¡nh tranh' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how competition relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a competition vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'connectivity' AS word, 'káº¿t ná»‘i' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how connectivity relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a connectivity vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'import' AS word, 'nháº­p kháº©u' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how import relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a import vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'export' AS word, 'xuáº¥t kháº©u' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how export relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a export vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'investment' AS word, 'Ä‘áº§u tÆ°' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how investment relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a investment vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'global market' AS word, 'thá»‹ trÆ°á»ng toĂ n cáº§u' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how global market relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a global market vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'outsourced work' AS word, 'cĂ´ng viá»‡c thuĂª ngoĂ i' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how outsourced work relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a outsourced work vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'expansion' AS word, 'má»Ÿ rá»™ng' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how expansion relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a expansion vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'border' AS word, 'biĂªn giá»›i' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how border relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a border vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'tariff' AS word, 'thuáº¿ quan' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how tariff relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tariff vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'localization' AS word, 'báº£n Ä‘á»‹a hĂ³a' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how localization relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a localization vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'mobility' AS word, 'kháº£ nÄƒng dá»‹ch chuyá»ƒn' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how mobility relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mobility vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'remittance' AS word, 'kiá»u há»‘i' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how remittance relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a remittance vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
  UNION ALL
  SELECT 'inequality' AS word, 'báº¥t bĂ¬nh Ä‘áº³ng' AS meaning_vi, 'A vocabulary term used in Globalization topics.' AS definition_en, 'The report explains how inequality relates to globalization.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a inequality vá»›i chá»§ Ä‘á» Globalization.' AS example_vi
) terms
WHERE topic.id=16
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'urbanization' AS word, 'Ä‘Ă´ thá»‹ hĂ³a' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how urbanization relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a urbanization vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'housing' AS word, 'nhĂ  á»Ÿ' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how housing relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a housing vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'city planning' AS word, 'quy hoáº¡ch thĂ nh phá»‘' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how city planning relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a city planning vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'infrastructure' AS word, 'háº¡ táº§ng' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how infrastructure relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a infrastructure vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'residential' AS word, 'khu dĂ¢n cÆ°' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how residential relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a residential vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'accommodation' AS word, 'chá»— á»Ÿ' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how accommodation relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a accommodation vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'mortgage' AS word, 'khoáº£n tháº¿ cháº¥p' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how mortgage relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mortgage vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'tenant' AS word, 'ngÆ°á»i thuĂª nhĂ' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how tenant relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tenant vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'landlord' AS word, 'chá»§ nhĂ' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how landlord relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a landlord vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'rent' AS word, 'tiá»n thuĂª' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how rent relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a rent vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'suburb' AS word, 'ngoáº¡i Ă´' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how suburb relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a suburb vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'city center' AS word, 'trung tĂ¢m thĂ nh phá»‘' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how city center relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a city center vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'commute' AS word, 'Ä‘i láº¡i hĂ ng ngĂ y' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how commute relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a commute vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'population density' AS word, 'máº­t Ä‘á»™ dĂ¢n sá»‘' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how population density relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a population density vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'congestion' AS word, 'Ă¹n táº¯c' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how congestion relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a congestion vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'public transport' AS word, 'giao thĂ´ng cĂ´ng cá»™ng' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how public transport relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a public transport vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'skyscraper' AS word, 'nhĂ  chá»c trá»i' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how skyscraper relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a skyscraper vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'renovation' AS word, 'cáº£i táº¡o' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how renovation relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a renovation vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'zoning' AS word, 'phĂ¢n khu' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how zoning relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a zoning vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'affordable housing' AS word, 'nhĂ  á»Ÿ giĂ¡ pháº£i chÄƒng' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how affordable housing relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a affordable housing vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'construction' AS word, 'xĂ¢y dá»±ng' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how construction relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a construction vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'property' AS word, 'báº¥t Ä‘á»™ng sáº£n' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how property relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a property vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'neighborhood' AS word, 'khu phá»‘' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how neighborhood relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a neighborhood vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'amenity' AS word, 'tiá»‡n Ă­ch' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how amenity relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a amenity vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'slum' AS word, 'khu á»• chuá»™t' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how slum relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a slum vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'urban sprawl' AS word, 'Ä‘Ă´ thá»‹ lan rá»™ng' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how urban sprawl relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a urban sprawl vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'sustainable city' AS word, 'thĂ nh phá»‘ bá»n vá»¯ng' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how sustainable city relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sustainable city vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'green space' AS word, 'khĂ´ng gian xanh' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how green space relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a green space vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'utilities' AS word, 'tiá»‡n Ă­ch cĂ´ng cá»™ng' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how utilities relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a utilities vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
  UNION ALL
  SELECT 'development' AS word, 'phĂ¡t triá»ƒn' AS meaning_vi, 'A vocabulary term used in Urbanization and Housing topics.' AS definition_en, 'The report explains how development relates to urbanization and housing.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a development vá»›i chá»§ Ä‘á» Urbanization and Housing.' AS example_vi
) terms
WHERE topic.id=17
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'family' AS word, 'gia Ä‘Ă¬nh' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how family relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a family vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'relationship' AS word, 'má»‘i quan há»‡' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how relationship relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a relationship vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'generation' AS word, 'tháº¿ há»‡' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how generation relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a generation vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'relative' AS word, 'há» hĂ ng' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how relative relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a relative vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'household' AS word, 'há»™ gia Ä‘Ă¬nh' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how household relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a household vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'sibling' AS word, 'anh chá»‹ em' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how sibling relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sibling vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'parenting' AS word, 'nuĂ´i dáº¡y con' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how parenting relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a parenting vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'upbringing' AS word, 'cĂ¡ch nuĂ´i dÆ°á»¡ng' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how upbringing relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a upbringing vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'bond' AS word, 'má»‘i gáº¯n bĂ³' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how bond relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a bond vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'responsibility' AS word, 'trĂ¡ch nhiá»‡m' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how responsibility relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a responsibility vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'support' AS word, 'sá»± há»— trá»£' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how support relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a support vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'conflict' AS word, 'xung Ä‘á»™t' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how conflict relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a conflict vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'compromise' AS word, 'thá»a hiá»‡p' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how compromise relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a compromise vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'communication' AS word, 'giao tiáº¿p' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how communication relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a communication vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'marriage' AS word, 'hĂ´n nhĂ¢n' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how marriage relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a marriage vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'divorce' AS word, 'ly hĂ´n' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how divorce relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a divorce vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'adoption' AS word, 'nháº­n nuĂ´i' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how adoption relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a adoption vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'single parent' AS word, 'cha máº¹ Ä‘Æ¡n thĂ¢n' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how single parent relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a single parent vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'elderly' AS word, 'ngÆ°á»i cao tuá»•i' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how elderly relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a elderly vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'childcare' AS word, 'chÄƒm sĂ³c tráº»' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how childcare relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a childcare vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'inheritance' AS word, 'thá»«a káº¿' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how inheritance relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a inheritance vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'cooperation' AS word, 'há»£p tĂ¡c' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how cooperation relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cooperation vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'loyalty' AS word, 'sá»± trung thĂ nh' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how loyalty relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a loyalty vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'trust' AS word, 'niá»m tin' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how trust relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a trust vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'friendship' AS word, 'tĂ¬nh báº¡n' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how friendship relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a friendship vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'partner' AS word, 'báº¡n Ä‘á»i' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how partner relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a partner vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'engagement' AS word, 'Ä‘Ă­nh hĂ´n' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how engagement relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a engagement vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'commitment' AS word, 'cam káº¿t' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how commitment relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a commitment vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'dependence' AS word, 'sá»± phá»¥ thuá»™c' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how dependence relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a dependence vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
  UNION ALL
  SELECT 'reconciliation' AS word, 'hĂ²a giáº£i' AS meaning_vi, 'A vocabulary term used in Family and Relationships topics.' AS definition_en, 'The report explains how reconciliation relates to family and relationships.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a reconciliation vá»›i chá»§ Ä‘á» Family and Relationships.' AS example_vi
) terms
WHERE topic.id=18
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'sports' AS word, 'thá»ƒ thao' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how sports relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sports vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'recreation' AS word, 'giáº£i trĂ­' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how recreation relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a recreation vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'competition' AS word, 'cuá»™c thi Ä‘áº¥u' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how competition relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a competition vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'tournament' AS word, 'giáº£i Ä‘áº¥u' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how tournament relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tournament vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'athlete' AS word, 'váº­n Ä‘á»™ng viĂªn' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how athlete relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a athlete vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'coach' AS word, 'huáº¥n luyá»‡n viĂªn' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how coach relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a coach vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'training' AS word, 'táº­p luyá»‡n' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how training relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a training vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'fitness' AS word, 'thá»ƒ lá»±c' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how fitness relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fitness vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'stamina' AS word, 'sá»©c bá»n' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how stamina relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a stamina vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'strength' AS word, 'sá»©c máº¡nh' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how strength relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a strength vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'teamwork' AS word, 'lĂ m viá»‡c nhĂ³m' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how teamwork relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a teamwork vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'opponent' AS word, 'Ä‘á»‘i thá»§' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how opponent relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a opponent vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'referee' AS word, 'trá»ng tĂ i' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how referee relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a referee vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'score' AS word, 'Ä‘iá»ƒm sá»‘' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how score relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a score vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'victory' AS word, 'chiáº¿n tháº¯ng' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how victory relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a victory vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'defeat' AS word, 'tháº¥t báº¡i' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how defeat relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a defeat vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'league' AS word, 'giáº£i Ä‘áº¥u' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how league relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a league vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'facility' AS word, 'cÆ¡ sá»Ÿ thá»ƒ thao' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how facility relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a facility vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'equipment' AS word, 'dá»¥ng cá»¥' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how equipment relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a equipment vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'outdoor activity' AS word, 'hoáº¡t Ä‘á»™ng ngoĂ i trá»i' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how outdoor activity relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a outdoor activity vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'hobby' AS word, 'sá»Ÿ thĂ­ch' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how hobby relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hobby vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'leisure' AS word, 'thá»i gian ráº£nh' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how leisure relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a leisure vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'recovery' AS word, 'phá»¥c há»“i' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how recovery relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a recovery vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'warm-up' AS word, 'khá»Ÿi Ä‘á»™ng' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how warm-up relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a warm-up vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'injury' AS word, 'cháº¥n thÆ°Æ¡ng' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how injury relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a injury vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'stamina training' AS word, 'luyá»‡n sá»©c bá»n' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how stamina training relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a stamina training vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'spectator' AS word, 'khĂ¡n giáº£' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how spectator relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a spectator vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'stadium' AS word, 'sĂ¢n váº­n Ä‘á»™ng' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how stadium relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a stadium vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'championship' AS word, 'giáº£i vĂ´ Ä‘á»‹ch' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how championship relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a championship vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'performance' AS word, 'phong Ä‘á»™' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how performance relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a performance vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
  UNION ALL
  SELECT 'participation' AS word, 'tham gia' AS meaning_vi, 'A vocabulary term used in Sports and Recreation topics.' AS definition_en, 'The report explains how participation relates to sports and recreation.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a participation vá»›i chá»§ Ä‘á» Sports and Recreation.' AS example_vi
) terms
WHERE topic.id=19
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'tourism' AS word, 'du lá»‹ch' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how tourism relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tourism vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'tourist' AS word, 'khĂ¡ch du lá»‹ch' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how tourist relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tourist vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'attraction' AS word, 'Ä‘iá»ƒm thu hĂºt' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how attraction relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a attraction vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'destination' AS word, 'Ä‘iá»ƒm Ä‘áº¿n' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how destination relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a destination vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'heritage site' AS word, 'di sáº£n' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how heritage site relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a heritage site vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'accommodation' AS word, 'chá»— á»Ÿ' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how accommodation relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a accommodation vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'itinerary' AS word, 'lá»‹ch trĂ¬nh' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how itinerary relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a itinerary vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'tour guide' AS word, 'hÆ°á»›ng dáº«n viĂªn' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how tour guide relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a tour guide vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'excursion' AS word, 'chuyáº¿n tham quan' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how excursion relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a excursion vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'package tour' AS word, 'tour trá»n gĂ³i' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how package tour relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a package tour vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'souvenir' AS word, 'quĂ  lÆ°u niá»‡m' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how souvenir relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a souvenir vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'hospitality' AS word, 'dá»‹ch vá»¥ Ä‘Ă³n tiáº¿p' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how hospitality relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hospitality vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'ecotourism' AS word, 'du lá»‹ch sinh thĂ¡i' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how ecotourism relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ecotourism vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'mass tourism' AS word, 'du lá»‹ch Ä‘áº¡i trĂ' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how mass tourism relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mass tourism vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'peak season' AS word, 'mĂ¹a cao Ä‘iá»ƒm' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how peak season relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a peak season vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'off-season' AS word, 'mĂ¹a tháº¥p Ä‘iá»ƒm' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how off-season relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a off-season vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'booking' AS word, 'Ä‘áº·t chá»—' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how booking relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a booking vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'visa' AS word, 'thá»‹ thá»±c' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how visa relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a visa vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'currency exchange' AS word, 'Ä‘á»•i tiá»n' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how currency exchange relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a currency exchange vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'sightseeing' AS word, 'tham quan' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how sightseeing relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sightseeing vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'landmark' AS word, 'Ä‘á»‹a danh' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how landmark relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a landmark vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'resort' AS word, 'khu nghá»‰ dÆ°á»¡ng' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how resort relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a resort vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'homestay' AS word, 'chá»— á»Ÿ nhĂ  dĂ¢n' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how homestay relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a homestay vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'local culture' AS word, 'vÄƒn hĂ³a Ä‘á»‹a phÆ°Æ¡ng' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how local culture relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a local culture vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'revenue' AS word, 'doanh thu' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how revenue relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a revenue vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'accessibility' AS word, 'kháº£ nÄƒng tiáº¿p cáº­n' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how accessibility relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a accessibility vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'preservation' AS word, 'báº£o tá»“n' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how preservation relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a preservation vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'sustainable tourism' AS word, 'du lá»‹ch bá»n vá»¯ng' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how sustainable tourism relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sustainable tourism vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'cruise' AS word, 'du thuyá»n' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how cruise relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a cruise vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
  UNION ALL
  SELECT 'backpacking' AS word, 'du lá»‹ch ba lĂ´' AS meaning_vi, 'A vocabulary term used in Tourism topics.' AS definition_en, 'The report explains how backpacking relates to tourism.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a backpacking vá»›i chá»§ Ä‘á» Tourism.' AS example_vi
) terms
WHERE topic.id=20
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'energy' AS word, 'nÄƒng lÆ°á»£ng' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how energy relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a energy vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'natural resource' AS word, 'tĂ i nguyĂªn thiĂªn nhiĂªn' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how natural resource relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a natural resource vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'renewable energy' AS word, 'nÄƒng lÆ°á»£ng tĂ¡i táº¡o' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how renewable energy relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a renewable energy vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'solar power' AS word, 'nÄƒng lÆ°á»£ng máº·t trá»i' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how solar power relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a solar power vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'wind power' AS word, 'nÄƒng lÆ°á»£ng giĂ³' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how wind power relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a wind power vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'hydroelectricity' AS word, 'thá»§y Ä‘iá»‡n' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how hydroelectricity relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a hydroelectricity vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'fossil fuel' AS word, 'nhiĂªn liá»‡u hĂ³a tháº¡ch' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how fossil fuel relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fossil fuel vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'coal' AS word, 'than Ä‘Ă¡' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how coal relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a coal vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'oil' AS word, 'dáº§u' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how oil relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a oil vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'gas' AS word, 'khĂ­ Ä‘á»‘t' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how gas relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a gas vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'nuclear power' AS word, 'nÄƒng lÆ°á»£ng háº¡t nhĂ¢n' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how nuclear power relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a nuclear power vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'conservation' AS word, 'báº£o tá»“n' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how conservation relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a conservation vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'consumption' AS word, 'tiĂªu thá»¥' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how consumption relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a consumption vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'efficiency' AS word, 'hiá»‡u suáº¥t' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how efficiency relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a efficiency vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'grid' AS word, 'lÆ°á»›i Ä‘iá»‡n' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how grid relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a grid vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'generator' AS word, 'mĂ¡y phĂ¡t Ä‘iá»‡n' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how generator relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a generator vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'emission' AS word, 'khĂ­ tháº£i' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how emission relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a emission vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'scarcity' AS word, 'sá»± khan hiáº¿m' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how scarcity relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a scarcity vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'extraction' AS word, 'khai thĂ¡c' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how extraction relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a extraction vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'recycling' AS word, 'tĂ¡i cháº¿' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how recycling relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a recycling vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'storage' AS word, 'lÆ°u trá»¯' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how storage relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a storage vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'demand' AS word, 'nhu cáº§u' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how demand relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a demand vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'supply' AS word, 'nguá»“n cung' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how supply relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a supply vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'carbon neutral' AS word, 'trung hĂ²a carbon' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how carbon neutral relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a carbon neutral vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'sustainability' AS word, 'bá»n vá»¯ng' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how sustainability relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sustainability vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'power plant' AS word, 'nhĂ  mĂ¡y Ä‘iá»‡n' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how power plant relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a power plant vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'insulation' AS word, 'cĂ¡ch nhiá»‡t' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how insulation relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a insulation vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'biofuel' AS word, 'nhiĂªn liá»‡u sinh há»c' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how biofuel relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a biofuel vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'depletion' AS word, 'suy kiá»‡t' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how depletion relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a depletion vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
  UNION ALL
  SELECT 'transition' AS word, 'chuyá»ƒn Ä‘á»•i' AS meaning_vi, 'A vocabulary term used in Energy and Natural Resources topics.' AS definition_en, 'The report explains how transition relates to energy and natural resources.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a transition vá»›i chá»§ Ä‘á» Energy and Natural Resources.' AS example_vi
) terms
WHERE topic.id=21
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'animal' AS word, 'Ä‘á»™ng váº­t' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how animal relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a animal vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'wildlife' AS word, 'Ä‘á»™ng váº­t hoang dĂ£' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how wildlife relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a wildlife vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'species' AS word, 'loĂ i' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how species relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a species vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'habitat' AS word, 'mĂ´i trÆ°á»ng sá»‘ng' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how habitat relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a habitat vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'predator' AS word, 'Ä‘á»™ng váº­t sÄƒn má»“i' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how predator relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a predator vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'prey' AS word, 'con má»“i' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how prey relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a prey vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'mammal' AS word, 'Ä‘á»™ng váº­t cĂ³ vĂº' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how mammal relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mammal vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'reptile' AS word, 'bĂ² sĂ¡t' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how reptile relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a reptile vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'amphibian' AS word, 'lÆ°á»¡ng cÆ°' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how amphibian relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a amphibian vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'bird migration' AS word, 'chim di cÆ°' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how bird migration relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a bird migration vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'biodiversity' AS word, 'Ä‘a dáº¡ng sinh há»c' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how biodiversity relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a biodiversity vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'extinction' AS word, 'tuyá»‡t chá»§ng' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how extinction relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a extinction vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'endangered' AS word, 'bá»‹ Ä‘e dá»a' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how endangered relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a endangered vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'conservation' AS word, 'báº£o tá»“n' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how conservation relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a conservation vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'ecosystem' AS word, 'há»‡ sinh thĂ¡i' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how ecosystem relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ecosystem vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'sanctuary' AS word, 'khu báº£o tá»“n' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how sanctuary relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sanctuary vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'poaching' AS word, 'sÄƒn trá»™m' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how poaching relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a poaching vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'habitat loss' AS word, 'máº¥t mĂ´i trÆ°á»ng sá»‘ng' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how habitat loss relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a habitat loss vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'domestication' AS word, 'thuáº§n hĂ³a' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how domestication relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a domestication vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'breeding' AS word, 'nhĂ¢n giá»‘ng' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how breeding relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a breeding vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'veterinary' AS word, 'thĂº y' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how veterinary relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a veterinary vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'instinct' AS word, 'báº£n nÄƒng' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how instinct relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a instinct vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'herd' AS word, 'báº§y Ä‘Ă n' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how herd relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a herd vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'predation' AS word, 'sá»± sÄƒn má»“i' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how predation relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a predation vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'adaptation' AS word, 'thĂ­ch nghi' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how adaptation relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a adaptation vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'food chain' AS word, 'chuá»—i thá»©c Äƒn' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how food chain relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a food chain vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'marine life' AS word, 'sinh váº­t biá»ƒn' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how marine life relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a marine life vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'population' AS word, 'quáº§n thá»ƒ' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how population relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a population vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'migration' AS word, 'di trĂº' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how migration relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a migration vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
  UNION ALL
  SELECT 'welfare' AS word, 'phĂºc lá»£i Ä‘á»™ng váº­t' AS meaning_vi, 'A vocabulary term used in Animals and Wildlife topics.' AS definition_en, 'The report explains how welfare relates to animals and wildlife.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a welfare vá»›i chá»§ Ä‘á» Animals and Wildlife.' AS example_vi
) terms
WHERE topic.id=22
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'art' AS word, 'nghá»‡ thuáº­t' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how art relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a art vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'architecture' AS word, 'kiáº¿n trĂºc' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how architecture relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a architecture vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'design' AS word, 'thiáº¿t káº¿' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how design relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a design vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'gallery' AS word, 'phĂ²ng triá»ƒn lĂ£m' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how gallery relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a gallery vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'exhibition' AS word, 'triá»ƒn lĂ£m' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how exhibition relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a exhibition vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'sculpture' AS word, 'Ä‘iĂªu kháº¯c' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how sculpture relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sculpture vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'painting' AS word, 'há»™i há»a' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how painting relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a painting vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'portrait' AS word, 'chĂ¢n dung' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how portrait relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a portrait vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'landscape' AS word, 'phong cáº£nh' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how landscape relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a landscape vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'abstract art' AS word, 'nghá»‡ thuáº­t trá»«u tÆ°á»£ng' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how abstract art relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a abstract art vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'heritage' AS word, 'di sáº£n' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how heritage relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a heritage vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'monument' AS word, 'cĂ´ng trĂ¬nh tÆ°á»Ÿng niá»‡m' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how monument relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a monument vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'facade' AS word, 'máº·t tiá»n' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how facade relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a facade vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'structure' AS word, 'káº¿t cáº¥u' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how structure relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a structure vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'blueprint' AS word, 'báº£n váº½' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how blueprint relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a blueprint vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'renovation' AS word, 'cáº£i táº¡o' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how renovation relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a renovation vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'construction' AS word, 'xĂ¢y dá»±ng' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how construction relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a construction vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'aesthetic' AS word, 'tháº©m má»¹' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how aesthetic relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a aesthetic vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'composition' AS word, 'bá»‘ cá»¥c' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how composition relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a composition vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'proportion' AS word, 'tá»· lá»‡' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how proportion relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a proportion vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'style' AS word, 'phong cĂ¡ch' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how style relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a style vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'modernism' AS word, 'chá»§ nghÄ©a hiá»‡n Ä‘áº¡i' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how modernism relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a modernism vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'craftsmanship' AS word, 'tay nghá» thá»§ cĂ´ng' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how craftsmanship relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a craftsmanship vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'landmark' AS word, 'cĂ´ng trĂ¬nh biá»ƒu tÆ°á»£ng' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how landmark relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a landmark vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'museum' AS word, 'báº£o tĂ ng' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how museum relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a museum vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'installation' AS word, 'tĂ¡c pháº©m sáº¯p Ä‘áº·t' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how installation relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a installation vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'commission' AS word, 'Ä‘áº·t lĂ m tĂ¡c pháº©m' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how commission relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a commission vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'restoration' AS word, 'phá»¥c há»“i' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how restoration relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a restoration vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'spatial' AS word, 'khĂ´ng gian' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how spatial relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a spatial vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
  UNION ALL
  SELECT 'material' AS word, 'váº­t liá»‡u' AS meaning_vi, 'A vocabulary term used in Art and Architecture topics.' AS definition_en, 'The report explains how material relates to art and architecture.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a material vá»›i chá»§ Ä‘á» Art and Architecture.' AS example_vi
) terms
WHERE topic.id=23
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'language' AS word, 'ngĂ´n ngá»¯' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how language relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a language vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'linguistics' AS word, 'ngĂ´n ngá»¯ há»c' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how linguistics relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a linguistics vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'vocabulary' AS word, 'tá»« vá»±ng' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how vocabulary relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a vocabulary vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'grammar' AS word, 'ngá»¯ phĂ¡p' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how grammar relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a grammar vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'pronunciation' AS word, 'phĂ¡t Ă¢m' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how pronunciation relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a pronunciation vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'fluency' AS word, 'sá»± lÆ°u loĂ¡t' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how fluency relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fluency vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'accent' AS word, 'giá»ng' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how accent relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a accent vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'dialect' AS word, 'phÆ°Æ¡ng ngá»¯' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how dialect relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a dialect vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'bilingual' AS word, 'song ngá»¯' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how bilingual relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a bilingual vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'multilingual' AS word, 'Ä‘a ngá»¯' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how multilingual relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a multilingual vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'translation' AS word, 'dá»‹ch thuáº­t' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how translation relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a translation vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'interpretation' AS word, 'phiĂªn dá»‹ch' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how interpretation relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a interpretation vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'syntax' AS word, 'cĂº phĂ¡p' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how syntax relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a syntax vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'semantics' AS word, 'ngá»¯ nghÄ©a' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how semantics relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a semantics vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'phonetics' AS word, 'ngá»¯ Ă¢m há»c' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how phonetics relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a phonetics vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'morphology' AS word, 'hĂ¬nh thĂ¡i há»c' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how morphology relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a morphology vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'register' AS word, 'phong cĂ¡ch ngĂ´n ngá»¯' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how register relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a register vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'idiom' AS word, 'thĂ nh ngá»¯' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how idiom relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a idiom vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'collocation' AS word, 'káº¿t há»£p tá»«' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how collocation relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a collocation vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'slang' AS word, 'tiáº¿ng lĂ³ng' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how slang relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a slang vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'communication' AS word, 'giao tiáº¿p' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how communication relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a communication vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'comprehension' AS word, 'sá»± hiá»ƒu' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how comprehension relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a comprehension vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'literacy' AS word, 'Ä‘á»c viáº¿t' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how literacy relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a literacy vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'mother tongue' AS word, 'tiáº¿ng máº¹ Ä‘áº»' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how mother tongue relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mother tongue vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'second language' AS word, 'ngĂ´n ngá»¯ thá»© hai' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how second language relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a second language vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'loanword' AS word, 'tá»« vay mÆ°á»£n' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how loanword relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a loanword vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'meaning' AS word, 'nghÄ©a' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how meaning relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a meaning vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'context' AS word, 'ngá»¯ cáº£nh' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how context relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a context vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'expression' AS word, 'cĂ¡ch diá»…n Ä‘áº¡t' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how expression relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a expression vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
  UNION ALL
  SELECT 'linguist' AS word, 'nhĂ  ngĂ´n ngá»¯ há»c' AS meaning_vi, 'A vocabulary term used in Language and Linguistics topics.' AS definition_en, 'The report explains how linguist relates to language and linguistics.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a linguist vá»›i chá»§ Ä‘á» Language and Linguistics.' AS example_vi
) terms
WHERE topic.id=24
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
INSERT INTO vocabulary_terms(topic_id,word,ipa,meaning_vi,definition_en,example_en,example_vi,audio_media_id)
SELECT topic.id, terms.word, NULL, terms.meaning_vi, terms.definition_en, terms.example_en, terms.example_vi, NULL
FROM vocabulary_topics topic
CROSS JOIN (
  SELECT 'climate change' AS word, 'biáº¿n Ä‘á»•i khĂ­ háº­u' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how climate change relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a climate change vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'global warming' AS word, 'nĂ³ng lĂªn toĂ n cáº§u' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how global warming relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a global warming vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'greenhouse effect' AS word, 'hiá»‡u á»©ng nhĂ  kĂ­nh' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how greenhouse effect relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a greenhouse effect vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'carbon dioxide' AS word, 'khĂ­ carbon dioxide' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how carbon dioxide relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a carbon dioxide vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'emission' AS word, 'khĂ­ tháº£i' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how emission relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a emission vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'mitigation' AS word, 'giáº£m thiá»ƒu' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how mitigation relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a mitigation vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'adaptation' AS word, 'thĂ­ch á»©ng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how adaptation relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a adaptation vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'temperature rise' AS word, 'tÄƒng nhiá»‡t Ä‘á»™' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how temperature rise relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a temperature rise vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'sea level' AS word, 'má»±c nÆ°á»›c biá»ƒn' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how sea level relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sea level vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'extreme weather' AS word, 'thá»i tiáº¿t cá»±c Ä‘oan' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how extreme weather relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a extreme weather vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'drought' AS word, 'háº¡n hĂ¡n' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how drought relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a drought vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'wildfire' AS word, 'chĂ¡y rá»«ng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how wildfire relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a wildfire vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'flood' AS word, 'lá»¥t' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how flood relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a flood vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'storm' AS word, 'bĂ£o' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how storm relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a storm vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'resilience' AS word, 'kháº£ nÄƒng chá»‘ng chá»‹u' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how resilience relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a resilience vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'vulnerability' AS word, 'tĂ­nh dá»… tá»•n thÆ°Æ¡ng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how vulnerability relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a vulnerability vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'carbon footprint' AS word, 'dáº¥u chĂ¢n carbon' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how carbon footprint relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a carbon footprint vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'renewable energy' AS word, 'nÄƒng lÆ°á»£ng tĂ¡i táº¡o' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how renewable energy relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a renewable energy vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'decarbonization' AS word, 'giáº£m carbon hĂ³a' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how decarbonization relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a decarbonization vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'fossil fuel' AS word, 'nhiĂªn liá»‡u hĂ³a tháº¡ch' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how fossil fuel relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a fossil fuel vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'net zero' AS word, 'phĂ¡t tháº£i rĂ²ng báº±ng khĂ´ng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how net zero relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a net zero vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'climate policy' AS word, 'chĂ­nh sĂ¡ch khĂ­ háº­u' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how climate policy relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a climate policy vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'carbon capture' AS word, 'thu giá»¯ carbon' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how carbon capture relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a carbon capture vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'deforestation' AS word, 'phĂ¡ rá»«ng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how deforestation relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a deforestation vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'heatwave' AS word, 'Ä‘á»£t náº¯ng nĂ³ng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how heatwave relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a heatwave vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'glacier' AS word, 'sĂ´ng bÄƒng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how glacier relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a glacier vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'biodiversity loss' AS word, 'máº¥t Ä‘a dáº¡ng sinh há»c' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how biodiversity loss relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a biodiversity loss vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'environmental impact' AS word, 'tĂ¡c Ä‘á»™ng mĂ´i trÆ°á»ng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how environmental impact relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a environmental impact vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'sustainable' AS word, 'bá»n vá»¯ng' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how sustainable relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a sustainable vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
  UNION ALL
  SELECT 'ecosystem' AS word, 'há»‡ sinh thĂ¡i' AS meaning_vi, 'A vocabulary term used in Climate Change topics.' AS definition_en, 'The report explains how ecosystem relates to climate change.' AS example_en, 'BĂ i bĂ¡o giáº£i thĂ­ch má»‘i liĂªn há»‡ cá»§a ecosystem vá»›i chá»§ Ä‘á» Climate Change.' AS example_vi
) terms
WHERE topic.id=25
  AND NOT EXISTS (
    SELECT 1 FROM vocabulary_terms existing
    WHERE existing.topic_id=topic.id AND existing.word=terms.word
  );
UPDATE vocabulary_lessons
SET target_word_count=CASE sort_order WHEN 1 THEN 10 WHEN 2 THEN 20 ELSE 30 END;

DELETE FROM vocabulary_lesson_terms;

INSERT INTO vocabulary_lesson_terms(lesson_id,term_id,sort_order)
SELECT ranked.lesson_id, ranked.term_id, ranked.term_order
FROM (
  SELECT l.id AS lesson_id, t.id AS term_id,
         ROW_NUMBER() OVER (PARTITION BY l.id ORDER BY t.id) AS term_order,
         CASE l.sort_order WHEN 1 THEN 10 WHEN 2 THEN 20 ELSE 30 END AS target_count
  FROM vocabulary_lessons l
  JOIN vocabulary_terms t ON t.topic_id=l.topic_id
) ranked
WHERE ranked.term_order <= ranked.target_count;
