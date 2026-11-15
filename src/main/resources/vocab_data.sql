INSERT INTO vocab_topics (title, description, level, display_order, is_published)
SELECT 'Business & Office', 'Từ vựng giao tiếp và công việc văn phòng thường gặp trong TOEIC.', 'BASIC', 1, TRUE
WHERE NOT EXISTS (SELECT 1 FROM vocab_topics WHERE title = 'Business & Office');
INSERT INTO vocab_topics (title, description, level, display_order, is_published)
SELECT 'Travel & Transport', 'Từ vựng về lịch trình, phương tiện và dịch vụ du lịch.', 'BASIC', 2, TRUE
WHERE NOT EXISTS (SELECT 1 FROM vocab_topics WHERE title = 'Travel & Transport');
INSERT INTO vocab_topics (title, description, level, display_order, is_published)
SELECT 'Shopping & Sales', 'Từ vựng mua sắm, bán hàng, thanh toán và chăm sóc khách hàng.', 'BASIC', 3, TRUE
WHERE NOT EXISTS (SELECT 1 FROM vocab_topics WHERE title = 'Shopping & Sales');
INSERT INTO vocab_topics (title, description, level, display_order, is_published)
SELECT 'Jobs & Recruitment', 'Từ vựng tuyển dụng, hồ sơ nghề nghiệp và môi trường làm việc.', 'BASIC', 4, TRUE
WHERE NOT EXISTS (SELECT 1 FROM vocab_topics WHERE title = 'Jobs & Recruitment');
INSERT INTO vocab_topics (title, description, level, display_order, is_published)
SELECT 'Finance & Banking', 'Từ vựng về ngân hàng, giao dịch và báo cáo tài chính.', 'INTERMEDIATE', 5, TRUE
WHERE NOT EXISTS (SELECT 1 FROM vocab_topics WHERE title = 'Finance & Banking');
INSERT INTO vocab_topics (title, description, level, display_order, is_published)
SELECT 'Marketing', 'Từ vựng về nghiên cứu thị trường, quảng bá và chiến dịch tiếp thị.', 'INTERMEDIATE', 6, TRUE
WHERE NOT EXISTS (SELECT 1 FROM vocab_topics WHERE title = 'Marketing');
INSERT INTO vocab_topics (title, description, level, display_order, is_published)
SELECT 'Manufacturing', 'Từ vựng về sản xuất, nhà máy, kiểm tra chất lượng và giao hàng.', 'INTERMEDIATE', 7, TRUE
WHERE NOT EXISTS (SELECT 1 FROM vocab_topics WHERE title = 'Manufacturing');
INSERT INTO vocab_topics (title, description, level, display_order, is_published)
SELECT 'Contracts', 'Từ vựng về hợp đồng, điều khoản và nghĩa vụ pháp lý trong kinh doanh.', 'ADVANCED', 8, TRUE
WHERE NOT EXISTS (SELECT 1 FROM vocab_topics WHERE title = 'Contracts');
INSERT INTO vocab_topics (title, description, level, display_order, is_published)
SELECT 'Technology', 'Từ vựng về phần mềm, hệ thống và hỗ trợ công nghệ thông tin.', 'INTERMEDIATE', 9, TRUE
WHERE NOT EXISTS (SELECT 1 FROM vocab_topics WHERE title = 'Technology');
INSERT INTO vocab_topics (title, description, level, display_order, is_published)
SELECT 'Health', 'Từ vựng về chăm sóc sức khỏe, khám chữa bệnh và bảo hiểm.', 'BASIC', 10, TRUE
WHERE NOT EXISTS (SELECT 1 FROM vocab_topics WHERE title = 'Health');

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'appointment' AS word, '/əˈpɔɪntmənt/' AS phonetic, 'n' AS part_of_speech, 'cuộc hẹn' AS meaning_vi, 'an arrangement to meet someone at a particular time' AS definition_en, 'I have an appointment with the regional manager at ten.' AS example_sentence, 'Tôi có cuộc hẹn với quản lý khu vực lúc mười giờ.' AS example_meaning
  UNION ALL SELECT 'agenda', '/əˈdʒendə/', 'n', 'chương trình nghị sự', 'a list of items to be discussed at a meeting', 'The agenda was sent to all participants yesterday.', 'Chương trình nghị sự đã được gửi cho tất cả người tham dự hôm qua.'
  UNION ALL SELECT 'deadline', '/ˈdedlaɪn/', 'n', 'hạn chót', 'the latest time by which something must be completed', 'Please submit the expense report before the deadline.', 'Vui lòng nộp báo cáo chi phí trước hạn chót.'
  UNION ALL SELECT 'department', '/dɪˈpɑːrtmənt/', 'n', 'phòng ban', 'a section of an organization responsible for a particular activity', 'The accounting department moved to the third floor.', 'Phòng kế toán đã chuyển lên tầng ba.'
  UNION ALL SELECT 'supervisor', '/ˈsuːpərvaɪzər/', 'n', 'người giám sát', 'a person who oversees the work of others', 'Ask your supervisor to approve the schedule.', 'Hãy nhờ người giám sát phê duyệt lịch trình.'
  UNION ALL SELECT 'colleague', '/ˈkɑːliːɡ/', 'n', 'đồng nghiệp', 'a person with whom one works', 'A colleague will cover the reception desk this afternoon.', 'Một đồng nghiệp sẽ trực quầy lễ tân chiều nay.'
  UNION ALL SELECT 'stationery', '/ˈsteɪʃəneri/', 'n', 'văn phòng phẩm', 'writing materials and office supplies', 'The office ordered stationery for the new employees.', 'Văn phòng đã đặt mua văn phòng phẩm cho nhân viên mới.'
  UNION ALL SELECT 'facility', '/fəˈsɪləti/', 'n', 'cơ sở; tiện nghi', 'a building or service provided for a particular purpose', 'The training facility is available after 2 P.M.', 'Cơ sở đào tạo có thể sử dụng sau 2 giờ chiều.'
  UNION ALL SELECT 'distribute', '/dɪˈstrɪbjuːt/', 'v', 'phân phát; phân phối', 'to give or deliver things to a number of people', 'Please distribute the meeting notes to the team.', 'Vui lòng gửi biên bản cuộc họp cho cả nhóm.'
  UNION ALL SELECT 'correspondence', '/ˌkɔːrəˈspɑːndəns/', 'n', 'thư từ; trao đổi thư tín', 'letters and messages exchanged between people or organizations', 'All customer correspondence is stored electronically.', 'Mọi thư từ của khách hàng đều được lưu trữ điện tử.'
) s ON t.title = 'Business & Office'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'employee' AS word, '/ɪmˈplɔɪiː/' AS phonetic, 'n' AS part_of_speech, 'nhân viên' AS meaning_vi, 'a person who works for an organization' AS definition_en, 'Each employee must complete the safety training.' AS example_sentence, 'Mỗi nhân viên phải hoàn thành khóa đào tạo an toàn.' AS example_meaning
  UNION ALL SELECT 'employer', '/ɪmˈplɔɪər/', 'n', 'người sử dụng lao động; nhà tuyển dụng', 'a person or organization that hires people', 'The employer offers health insurance to full-time staff.', 'Nhà tuyển dụng cung cấp bảo hiểm y tế cho nhân viên toàn thời gian.'
  UNION ALL SELECT 'manager', '/ˈmænɪdʒər/', 'n', 'người quản lý', 'a person responsible for controlling or organizing a business or team', 'The manager approved the revised schedule.', 'Người quản lý đã phê duyệt lịch trình sửa đổi.'
  UNION ALL SELECT 'executive', '/ɪɡˈzekjətɪv/', 'n', 'giám đốc; quản lý cấp cao', 'a senior person responsible for making business decisions', 'The executive will meet with branch managers on Friday.', 'Giám đốc sẽ họp với các quản lý chi nhánh vào thứ Sáu.'
  UNION ALL SELECT 'director', '/dəˈrektər/', 'n', 'giám đốc', 'a senior person who manages an organization or department', 'The director signed the proposal this morning.', 'Giám đốc đã ký đề xuất sáng nay.'
  UNION ALL SELECT 'headquarters', '/ˈhedˌkwɔːrtərz/', 'n', 'trụ sở chính', 'the main office of an organization', 'The company headquarters is located downtown.', 'Trụ sở chính của công ty nằm ở khu trung tâm.'
  UNION ALL SELECT 'branch', '/bræntʃ/', 'n', 'chi nhánh', 'an office or shop that is part of a larger organization', 'The bank opened a new branch near the station.', 'Ngân hàng đã mở chi nhánh mới gần nhà ga.'
  UNION ALL SELECT 'memo', '/ˈmemoʊ/', 'n', 'bản ghi nhớ', 'a short written message used for communication within an organization', 'Please circulate the memo before the end of the day.', 'Vui lòng phổ biến bản ghi nhớ trước khi kết thúc ngày làm việc.'
  UNION ALL SELECT 'report', '/rɪˈpɔːrt/', 'n', 'báo cáo', 'a written account that presents information or findings', 'The sales report is due by noon on Monday.', 'Báo cáo bán hàng phải được nộp trước trưa thứ Hai.'
  UNION ALL SELECT 'schedule', '/ˈskedʒuːl/', 'n', 'lịch trình', 'a plan that lists the times when activities will happen', 'The updated schedule is available on the office noticeboard.', 'Lịch trình cập nhật có trên bảng thông báo văn phòng.'
  UNION ALL SELECT 'conference', '/ˈkɑːnfərəns/', 'n', 'hội nghị; hội thảo', 'a formal meeting where people discuss a subject', 'The annual conference will begin at nine o''clock.', 'Hội nghị thường niên sẽ bắt đầu lúc chín giờ.'
  UNION ALL SELECT 'meeting', '/ˈmiːtɪŋ/', 'n', 'cuộc họp', 'an occasion when people gather to discuss business', 'The budget meeting has been postponed until Thursday.', 'Cuộc họp ngân sách đã được hoãn đến thứ Năm.'
  UNION ALL SELECT 'payroll', '/ˈpeɪroʊl/', 'n', 'bảng lương; việc trả lương', 'a list of employees and the money paid to them', 'Payroll is processed on the last working day of each month.', 'Bảng lương được xử lý vào ngày làm việc cuối cùng mỗi tháng.'
  UNION ALL SELECT 'personnel', '/ˌpɜːrsəˈnel/', 'n', 'nhân sự; nhân viên', 'the people who work for an organization', 'Personnel will contact the shortlisted applicants.', 'Phòng nhân sự sẽ liên hệ với các ứng viên được chọn.'
  UNION ALL SELECT 'receptionist', '/rɪˈsepʃənɪst/', 'n', 'nhân viên lễ tân', 'a person who welcomes visitors and answers calls at an office', 'The receptionist directed visitors to the conference room.', 'Nhân viên lễ tân hướng dẫn khách đến phòng hội nghị.'
  UNION ALL SELECT 'minutes', '/ˈmɪnɪts/', 'n', 'biên bản cuộc họp', 'a written record of what was discussed at a meeting', 'The secretary emailed the meeting minutes to all participants.', 'Thư ký đã gửi biên bản cuộc họp cho tất cả người tham dự.'
  UNION ALL SELECT 'participant', '/pɑːrˈtɪsɪpənt/', 'n', 'người tham gia', 'a person who takes part in an activity or event', 'Each participant received a copy of the agenda.', 'Mỗi người tham gia nhận được một bản chương trình nghị sự.'
  UNION ALL SELECT 'workplace', '/ˈwɜːrkpleɪs/', 'n', 'nơi làm việc', 'a place where people do their jobs', 'The new workplace policy takes effect next month.', 'Chính sách nơi làm việc mới có hiệu lực vào tháng tới.'
  UNION ALL SELECT 'procedure', '/prəˈsiːdʒər/', 'n', 'quy trình; thủ tục', 'an established way of doing a task', 'Please follow the procedure for submitting travel expenses.', 'Vui lòng làm theo quy trình nộp chi phí công tác.'
  UNION ALL SELECT 'confidential', '/ˌkɑːnfɪˈdenʃəl/', 'adj', 'bảo mật; bí mật', 'intended to be kept private', 'The file contains confidential information about the merger.', 'Tệp này chứa thông tin bảo mật về thương vụ sáp nhập.'
) s ON t.title = 'Business & Office'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'airline' AS word, '/ˈerlaɪn/' AS phonetic, 'n' AS part_of_speech, 'hãng hàng không' AS meaning_vi, 'a company that provides air transport for passengers or cargo' AS definition_en, 'The airline added a direct flight to Osaka.' AS example_sentence, 'Hãng hàng không đã bổ sung chuyến bay thẳng đến Osaka.' AS example_meaning
  UNION ALL SELECT 'flight', '/flaɪt/', 'n', 'chuyến bay', 'a journey made by aircraft', 'Our flight departs from Gate 12 at 8:30.', 'Chuyến bay của chúng tôi khởi hành từ Cổng 12 lúc 8 giờ 30.'
  UNION ALL SELECT 'arrival', '/əˈraɪvəl/', 'n', 'sự đến nơi; giờ đến', 'the act or time of reaching a destination', 'The arrival time has changed because of bad weather.', 'Giờ đến đã thay đổi do thời tiết xấu.'
  UNION ALL SELECT 'airport', '/ˈerpɔːrt/', 'n', 'sân bay', 'a place where aircraft take off and land', 'Please arrive at the airport two hours before departure.', 'Vui lòng đến sân bay hai giờ trước giờ khởi hành.'
  UNION ALL SELECT 'terminal', '/ˈtɜːrmɪnəl/', 'n', 'nhà ga; nhà ga sân bay', 'a building where passengers begin or end a journey', 'The shuttle stops outside the international terminal.', 'Xe đưa đón dừng bên ngoài nhà ga quốc tế.'
  UNION ALL SELECT 'gate', '/ɡeɪt/', 'n', 'cổng lên máy bay', 'a place at an airport where passengers board an aircraft', 'Boarding will begin at Gate 24 in ten minutes.', 'Việc lên máy bay sẽ bắt đầu tại Cổng 24 sau mười phút.'
  UNION ALL SELECT 'passport', '/ˈpæspɔːrt/', 'n', 'hộ chiếu', 'an official document used to identify a traveler internationally', 'Keep your passport in a secure place during the trip.', 'Hãy cất hộ chiếu ở nơi an toàn trong suốt chuyến đi.'
  UNION ALL SELECT 'customs', '/ˈkʌstəmz/', 'n', 'hải quan', 'the place where baggage is checked when entering a country', 'All arriving passengers must pass through customs.', 'Tất cả hành khách đến nơi phải làm thủ tục qua hải quan.'
  UNION ALL SELECT 'ticket', '/ˈtɪkɪt/', 'n', 'vé', 'a document that gives the holder permission to travel or enter an event', 'You can collect your train ticket at the station kiosk.', 'Bạn có thể nhận vé tàu tại quầy tự động trong nhà ga.'
  UNION ALL SELECT 'fare', '/fer/', 'n', 'giá vé; cước phí', 'the money paid for a journey on public transport', 'The bus fare can be paid with a travel card.', 'Có thể thanh toán giá vé xe buýt bằng thẻ đi lại.'
  UNION ALL SELECT 'route', '/ruːt/', 'n', 'tuyến đường', 'a way taken to travel from one place to another', 'The driver chose a shorter route to the hotel.', 'Tài xế đã chọn tuyến đường ngắn hơn đến khách sạn.'
  UNION ALL SELECT 'shuttle', '/ˈʃʌtəl/', 'n', 'xe đưa đón; tuyến trung chuyển', 'a vehicle that travels regularly between two places', 'A complimentary shuttle runs between the hotel and airport.', 'Xe đưa đón miễn phí chạy giữa khách sạn và sân bay.'
  UNION ALL SELECT 'commute', '/kəˈmjuːt/', 'v', 'đi lại giữa nhà và nơi làm việc', 'to travel regularly between home and work', 'Many employees commute by train.', 'Nhiều nhân viên đi làm bằng tàu hỏa.'
  UNION ALL SELECT 'vehicle', '/ˈviːɪkəl/', 'n', 'phương tiện giao thông', 'a machine used to carry people or goods', 'The rental company inspected the vehicle before handover.', 'Công ty cho thuê đã kiểm tra phương tiện trước khi bàn giao.'
  UNION ALL SELECT 'traffic', '/ˈtræfɪk/', 'n', 'giao thông; xe cộ', 'the vehicles moving along a road', 'Heavy traffic delayed the airport transfer.', 'Giao thông đông đúc đã làm chậm chuyến xe trung chuyển đến sân bay.'
  UNION ALL SELECT 'railway', '/ˈreɪlweɪ/', 'n', 'đường sắt', 'a system of tracks used by trains', 'The railway connects the airport with the city center.', 'Đường sắt nối sân bay với trung tâm thành phố.'
  UNION ALL SELECT 'platform', '/ˈplætfɔːrm/', 'n', 'sân ga', 'a raised area beside railway tracks where passengers board trains', 'The express train is waiting at Platform 3.', 'Tàu tốc hành đang chờ tại Sân ga số 3.'
  UNION ALL SELECT 'cancellation', '/ˌkænsəˈleɪʃən/', 'n', 'sự hủy bỏ', 'the act of deciding that a planned event will not happen', 'Passengers will receive a refund after the flight cancellation.', 'Hành khách sẽ được hoàn tiền sau khi chuyến bay bị hủy.'
  UNION ALL SELECT 'travel agent', '/ˈtrævəl ˌeɪdʒənt/', 'n', 'đại lý du lịch', 'a person or company that arranges travel services', 'The travel agent reserved two rooms near the conference center.', 'Đại lý du lịch đã đặt hai phòng gần trung tâm hội nghị.'
  UNION ALL SELECT 'rental car', '/ˈrentəl kɑːr/', 'n', 'xe cho thuê', 'a car hired for temporary use', 'A rental car is available at the arrivals desk.', 'Có xe cho thuê tại quầy khu vực đến.'
) s ON t.title = 'Travel & Transport'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'price' AS word, '/praɪs/' AS phonetic, 'n' AS part_of_speech, 'giá; giá cả' AS meaning_vi, 'the amount of money required to buy something' AS definition_en, 'The store reduced the price of selected appliances.' AS example_sentence, 'Cửa hàng đã giảm giá một số thiết bị gia dụng.' AS example_meaning
  UNION ALL SELECT 'wholesale', '/ˈhoʊlseɪl/', 'adj', 'bán buôn; bán sỉ', 'related to selling goods in large quantities to retailers', 'The supplier offers wholesale prices to local shops.', 'Nhà cung cấp đưa ra giá bán sỉ cho các cửa hàng địa phương.'
  UNION ALL SELECT 'cashier', '/kæˈʃɪr/', 'n', 'thu ngân', 'a person who receives payments in a store', 'The cashier issued a receipt for the purchase.', 'Thu ngân đã xuất biên lai cho giao dịch mua hàng.'
  UNION ALL SELECT 'exchange', '/ɪksˈtʃeɪndʒ/', 'v', 'đổi; trao đổi', 'to give one thing and receive another in return', 'Customers may exchange an item within fourteen days.', 'Khách hàng có thể đổi mặt hàng trong vòng mười bốn ngày.'
  UNION ALL SELECT 'return', '/rɪˈtɜːrn/', 'v', 'trả lại; hoàn trả', 'to take or send a purchased item back to the seller', 'Please return the damaged item with its original packaging.', 'Vui lòng trả lại mặt hàng bị hỏng cùng bao bì ban đầu.'
  UNION ALL SELECT 'order', '/ˈɔːrdər/', 'n', 'đơn đặt hàng', 'a request to buy or supply goods', 'The online order will be delivered tomorrow.', 'Đơn đặt hàng trực tuyến sẽ được giao vào ngày mai.'
  UNION ALL SELECT 'catalog', '/ˈkætəlɔːɡ/', 'n', 'danh mục sản phẩm', 'a list of products offered for sale', 'The new catalog includes prices for office furniture.', 'Danh mục mới có giá của các món đồ nội thất văn phòng.'
  UNION ALL SELECT 'delivery', '/dɪˈlɪvəri/', 'n', 'việc giao hàng', 'the act of bringing goods to a customer', 'Free delivery is available for orders over fifty dollars.', 'Miễn phí giao hàng cho đơn đặt hàng trên năm mươi đô la.'
  UNION ALL SELECT 'sale', '/seɪl/', 'n', 'đợt giảm giá; việc bán hàng', 'an occasion when goods are sold at reduced prices', 'The store will hold a clearance sale this weekend.', 'Cửa hàng sẽ tổ chức đợt giảm giá thanh lý vào cuối tuần này.'
  UNION ALL SELECT 'buyer', '/ˈbaɪər/', 'n', 'người mua', 'a person or organization that purchases goods', 'The buyer requested a sample before placing a large order.', 'Người mua yêu cầu mẫu thử trước khi đặt đơn hàng lớn.'
  UNION ALL SELECT 'vendor', '/ˈvendər/', 'n', 'nhà cung cấp; người bán', 'a person or company that sells goods or services', 'The vendor delivered the supplies to the warehouse.', 'Nhà cung cấp đã giao vật tư đến kho.'
  UNION ALL SELECT 'product', '/ˈprɑːdʌkt/', 'n', 'sản phẩm', 'an item made or offered for sale', 'The product comes with a one-year warranty.', 'Sản phẩm đi kèm bảo hành một năm.'
  UNION ALL SELECT 'payment', '/ˈpeɪmənt/', 'n', 'khoản thanh toán; việc thanh toán', 'money given to settle a purchase or debt', 'Payment is due within thirty days of the invoice date.', 'Khoản thanh toán đến hạn trong vòng ba mươi ngày kể từ ngày lập hóa đơn.'
  UNION ALL SELECT 'checkout', '/ˈtʃekaʊt/', 'n', 'quầy thanh toán; bước thanh toán', 'the place or process where a customer pays for goods', 'The checkout line is shorter near the garden department.', 'Hàng chờ thanh toán ngắn hơn ở gần khu vực làm vườn.'
  UNION ALL SELECT 'coupon', '/ˈkuːpɑːn/', 'n', 'phiếu giảm giá', 'a document that gives a discount on a purchase', 'Customers can use the coupon until the end of the month.', 'Khách hàng có thể sử dụng phiếu giảm giá đến cuối tháng.'
  UNION ALL SELECT 'stock', '/stɑːk/', 'n', 'hàng tồn kho', 'goods kept by a store for sale', 'The popular model is currently out of stock.', 'Mẫu sản phẩm được ưa chuộng hiện đã hết hàng.'
  UNION ALL SELECT 'sample', '/ˈsæmpəl/', 'n', 'mẫu thử; mẫu hàng', 'a small part of a product used to show its quality', 'The supplier sent a sample of the new packaging.', 'Nhà cung cấp đã gửi mẫu bao bì mới.'
  UNION ALL SELECT 'client', '/ˈklaɪənt/', 'n', 'khách hàng', 'a person or organization that buys professional services', 'The client approved the final product design.', 'Khách hàng đã phê duyệt thiết kế sản phẩm cuối cùng.'
  UNION ALL SELECT 'purchase order', '/ˈpɜːrtʃəs ˌɔːrdər/', 'n', 'đơn đặt mua hàng', 'a document authorizing a seller to provide specified goods', 'Please include the purchase order number on the invoice.', 'Vui lòng ghi số đơn đặt mua hàng trên hóa đơn.'
  UNION ALL SELECT 'point-of-sale', '/ˌpɔɪnt əv ˈseɪl/', 'n', 'điểm bán hàng; hệ thống bán hàng', 'the place where a retail transaction is completed', 'The new point-of-sale system accepts contactless payments.', 'Hệ thống bán hàng mới chấp nhận thanh toán không tiếp xúc.'
) s ON t.title = 'Shopping & Sales'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'job' AS word, '/dʒɑːb/' AS phonetic, 'n' AS part_of_speech, 'công việc; việc làm' AS meaning_vi, 'a paid position or a specific task to be completed' AS definition_en, 'The company posted a job opening on its website.' AS example_sentence, 'Công ty đã đăng vị trí tuyển dụng trên trang web.' AS example_meaning
  UNION ALL SELECT 'occupation', '/ˌɑːkjuˈpeɪʃən/', 'n', 'nghề nghiệp', 'a person''s regular work or profession', 'Please state your occupation on the application form.', 'Vui lòng ghi nghề nghiệp trên mẫu đơn đăng ký.'
  UNION ALL SELECT 'employer', '/ɪmˈplɔɪər/', 'n', 'nhà tuyển dụng', 'a person or organization that hires workers', 'The employer provides paid leave to eligible staff.', 'Nhà tuyển dụng cấp ngày nghỉ có lương cho nhân viên đủ điều kiện.'
  UNION ALL SELECT 'employee', '/ɪmˈplɔɪiː/', 'n', 'nhân viên', 'a person who is paid to work for an organization', 'Every new employee attends an orientation session.', 'Mỗi nhân viên mới tham dự buổi định hướng.'
  UNION ALL SELECT 'recruiter', '/rɪˈkruːtər/', 'n', 'nhân viên tuyển dụng; nhà tuyển dụng', 'a person whose job is to find suitable candidates for jobs', 'The recruiter arranged interviews with three candidates.', 'Nhân viên tuyển dụng đã sắp xếp phỏng vấn với ba ứng viên.'
  UNION ALL SELECT 'recruitment', '/rɪˈkruːtmənt/', 'n', 'việc tuyển dụng', 'the process of finding and hiring new employees', 'The recruitment process usually takes two weeks.', 'Quy trình tuyển dụng thường kéo dài hai tuần.'
  UNION ALL SELECT 'hiring', '/ˈhaɪərɪŋ/', 'n', 'việc tuyển dụng', 'the process of employing someone for a job', 'Hiring for the sales department will begin next month.', 'Việc tuyển dụng cho phòng bán hàng sẽ bắt đầu vào tháng tới.'
  UNION ALL SELECT 'hire', '/ˈhaɪər/', 'v', 'thuê; tuyển dụng', 'to employ someone for a job', 'The firm plans to hire two accounting assistants.', 'Công ty dự định tuyển hai trợ lý kế toán.'
  UNION ALL SELECT 'retirement', '/rɪˈtaɪərmənt/', 'n', 'sự nghỉ hưu', 'the act of leaving a job after reaching a certain age', 'The director announced her retirement effective in June.', 'Giám đốc thông báo sẽ nghỉ hưu từ tháng Sáu.'
  UNION ALL SELECT 'intern', '/ˈɪntɜːrn/', 'n', 'thực tập sinh', 'a student or trainee who works to gain experience', 'The intern prepared a summary of the market research.', 'Thực tập sinh đã chuẩn bị bản tóm tắt nghiên cứu thị trường.'
  UNION ALL SELECT 'internship', '/ˈɪntɜːrnʃɪp/', 'n', 'kỳ thực tập', 'a temporary job that provides practical work experience', 'She applied for a summer internship at the bank.', 'Cô ấy đã ứng tuyển kỳ thực tập mùa hè tại ngân hàng.'
  UNION ALL SELECT 'application', '/ˌæplɪˈkeɪʃən/', 'n', 'đơn xin việc; đơn đăng ký', 'a formal request for a job or position', 'Please submit your application before the closing date.', 'Vui lòng nộp đơn trước ngày hết hạn.'
  UNION ALL SELECT 'probation', '/proʊˈbeɪʃən/', 'n', 'thời gian thử việc', 'a period when a new employee is evaluated', 'The probation period lasts for three months.', 'Thời gian thử việc kéo dài ba tháng.'
  UNION ALL SELECT 'wage', '/weɪdʒ/', 'n', 'tiền công; tiền lương', 'money paid to a worker, usually based on hours worked', 'Temporary staff receive their wages every Friday.', 'Nhân viên thời vụ nhận tiền công vào mỗi thứ Sáu.'
  UNION ALL SELECT 'benefit', '/ˈbenɪfɪt/', 'n', 'phúc lợi', 'an additional advantage provided by an employer', 'The position includes a retirement benefit and health coverage.', 'Vị trí này bao gồm phúc lợi hưu trí và bảo hiểm sức khỏe.'
  UNION ALL SELECT 'overtime', '/ˈoʊvərtaɪm/', 'n', 'giờ làm thêm', 'time worked beyond normal working hours', 'Employees will be paid for approved overtime.', 'Nhân viên được trả lương cho giờ làm thêm đã được duyệt.'
  UNION ALL SELECT 'workforce', '/ˈwɜːrkfɔːrs/', 'n', 'lực lượng lao động', 'the people who work for a company or in an industry', 'The company is expanding its workforce this year.', 'Công ty đang mở rộng lực lượng lao động trong năm nay.'
  UNION ALL SELECT 'job opening', '/ˈdʒɑːb ˌoʊpənɪŋ/', 'n', 'vị trí tuyển dụng', 'a job that is available for a new employee', 'There are two job openings in the marketing department.', 'Có hai vị trí tuyển dụng trong phòng tiếp thị.'
  UNION ALL SELECT 'resignation', '/ˌrezɪɡˈneɪʃən/', 'n', 'đơn xin nghỉ việc; sự từ chức', 'a formal statement that someone is leaving a job', 'The supervisor submitted her resignation last week.', 'Giám sát viên đã nộp đơn xin nghỉ việc vào tuần trước.'
  UNION ALL SELECT 'work experience', '/ˈwɜːrk ɪkˌspɪriəns/', 'n', 'kinh nghiệm làm việc', 'knowledge and skills gained by doing a job', 'The position requires at least two years of work experience.', 'Vị trí này yêu cầu ít nhất hai năm kinh nghiệm làm việc.'
) s ON t.title = 'Jobs & Recruitment'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'budget' AS word, '/ˈbʌdʒɪt/' AS phonetic, 'n' AS part_of_speech, 'ngân sách' AS meaning_vi, 'a plan for income and spending over a period of time' AS definition_en, 'The department must stay within its annual budget.' AS example_sentence, 'Phòng ban phải chi tiêu trong phạm vi ngân sách hằng năm.' AS example_meaning
  UNION ALL SELECT 'expense', '/ɪkˈspens/', 'n', 'chi phí; khoản chi', 'money spent to operate a business or complete an activity', 'Travel expenses must be reported within ten days.', 'Chi phí công tác phải được báo cáo trong vòng mười ngày.'
  UNION ALL SELECT 'revenue', '/ˈrevənuː/', 'n', 'doanh thu', 'income received by a company from its business activities', 'Online sales generated additional revenue this quarter.', 'Doanh số trực tuyến tạo thêm doanh thu trong quý này.'
  UNION ALL SELECT 'profit', '/ˈprɑːfɪt/', 'n', 'lợi nhuận', 'money remaining after business costs have been paid', 'The company reported a higher profit than expected.', 'Công ty báo cáo lợi nhuận cao hơn dự kiến.'
  UNION ALL SELECT 'loss', '/lɔːs/', 'n', 'khoản lỗ; sự thua lỗ', 'money lost when costs exceed income', 'The retailer reduced its operating loss this year.', 'Nhà bán lẻ đã giảm khoản lỗ hoạt động trong năm nay.'
  UNION ALL SELECT 'asset', '/ˈæset/', 'n', 'tài sản', 'something valuable owned by a person or company', 'The building is listed as a company asset.', 'Tòa nhà được ghi nhận là tài sản của công ty.'
  UNION ALL SELECT 'liability', '/ˌlaɪəˈbɪləti/', 'n', 'khoản nợ; nghĩa vụ tài chính', 'a debt or financial obligation owed by a company', 'The report lists each liability separately.', 'Báo cáo liệt kê riêng từng khoản nợ.'
  UNION ALL SELECT 'mortgage', '/ˈmɔːrɡɪdʒ/', 'n', 'khoản vay thế chấp', 'a loan secured by property', 'The bank approved a mortgage for the new office building.', 'Ngân hàng đã duyệt khoản vay thế chấp cho tòa nhà văn phòng mới.'
  UNION ALL SELECT 'credit', '/ˈkredɪt/', 'n', 'tín dụng; khoản tín dụng', 'an arrangement that allows a customer to borrow money or pay later', 'The company requested a higher credit limit.', 'Công ty yêu cầu nâng hạn mức tín dụng.'
  UNION ALL SELECT 'debit', '/ˈdebɪt/', 'n', 'khoản ghi nợ; ghi nợ', 'an amount taken from an account', 'The bank recorded the payment as a debit.', 'Ngân hàng ghi nhận khoản thanh toán là một khoản ghi nợ.'
  UNION ALL SELECT 'tax', '/tæks/', 'n', 'thuế', 'money paid to the government based on income or purchases', 'The accountant filed the company tax return on time.', 'Kế toán viên đã nộp tờ khai thuế doanh nghiệp đúng hạn.'
  UNION ALL SELECT 'audit', '/ˈɔːdɪt/', 'n', 'cuộc kiểm toán', 'an official examination of financial records', 'The external audit will begin in early May.', 'Cuộc kiểm toán độc lập sẽ bắt đầu vào đầu tháng Năm.'
  UNION ALL SELECT 'investment', '/ɪnˈvestmənt/', 'n', 'khoản đầu tư; sự đầu tư', 'money used to support a business or purchase an asset', 'The investment helped the company expand its operations.', 'Khoản đầu tư giúp công ty mở rộng hoạt động.'
  UNION ALL SELECT 'expenditure', '/ɪkˈspendɪtʃər/', 'n', 'khoản chi tiêu', 'the amount of money spent on something', 'All equipment expenditure requires approval from the director.', 'Mọi khoản chi mua thiết bị cần được giám đốc phê duyệt.'
  UNION ALL SELECT 'fund', '/fʌnd/', 'n', 'quỹ; nguồn vốn', 'a supply of money set aside for a particular purpose', 'The training fund covers course fees for employees.', 'Quỹ đào tạo chi trả học phí khóa học cho nhân viên.'
  UNION ALL SELECT 'capital', '/ˈkæpɪtəl/', 'n', 'vốn', 'money or property used to start or operate a business', 'The firm raised capital to build a new facility.', 'Công ty huy động vốn để xây dựng cơ sở mới.'
  UNION ALL SELECT 'stock', '/stɑːk/', 'n', 'cổ phiếu', 'shares that represent ownership in a company', 'Investors purchased stock after the earnings announcement.', 'Các nhà đầu tư mua cổ phiếu sau thông báo kết quả kinh doanh.'
  UNION ALL SELECT 'exchange rate', '/ɪksˈtʃeɪndʒ reɪt/', 'n', 'tỷ giá hối đoái', 'the value of one currency expressed in another currency', 'The exchange rate changed before the overseas payment was processed.', 'Tỷ giá hối đoái đã thay đổi trước khi khoản thanh toán quốc tế được xử lý.'
  UNION ALL SELECT 'cash flow', '/ˈkæʃ floʊ/', 'n', 'dòng tiền', 'the movement of money into and out of a business', 'The finance team monitors cash flow every week.', 'Nhóm tài chính theo dõi dòng tiền hằng tuần.'
  UNION ALL SELECT 'financial', '/faɪˈnænʃəl/', 'adj', 'thuộc tài chính', 'related to money or the management of money', 'The board reviewed the financial statements.', 'Hội đồng đã xem xét các báo cáo tài chính.'
) s ON t.title = 'Finance & Banking'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'advertisement' AS word, '/ˌædvərˈtaɪzmənt/' AS phonetic, 'n' AS part_of_speech, 'quảng cáo' AS meaning_vi, 'a public message that promotes a product or service' AS definition_en, 'The advertisement appeared in the weekend newspaper.' AS example_sentence, 'Quảng cáo xuất hiện trên tờ báo cuối tuần.' AS example_meaning
  UNION ALL SELECT 'consumer', '/kənˈsuːmər/', 'n', 'người tiêu dùng', 'a person who buys or uses goods and services', 'The survey asked consumers about their shopping habits.', 'Cuộc khảo sát hỏi người tiêu dùng về thói quen mua sắm.'
  UNION ALL SELECT 'promotion', '/prəˈmoʊʃən/', 'n', 'chương trình khuyến mãi; sự quảng bá', 'an activity intended to increase sales or awareness', 'The store launched a promotion for its new product line.', 'Cửa hàng triển khai chương trình khuyến mãi cho dòng sản phẩm mới.'
  UNION ALL SELECT 'target market', '/ˈtɑːrɡɪt ˌmɑːrkɪt/', 'n', 'thị trường mục tiêu', 'the group of customers a product is intended for', 'The research identified a new target market.', 'Nghiên cứu xác định một thị trường mục tiêu mới.'
  UNION ALL SELECT 'publicity', '/pʌbˈlɪsəti/', 'n', 'sự quảng bá; sự chú ý của công chúng', 'public attention given to a product, person, or event', 'The product launch received considerable publicity.', 'Buổi ra mắt sản phẩm nhận được sự chú ý đáng kể.'
  UNION ALL SELECT 'sponsor', '/ˈspɑːnsər/', 'n', 'nhà tài trợ', 'a person or company that supports an event financially', 'A local bank became the main sponsor of the trade fair.', 'Một ngân hàng địa phương trở thành nhà tài trợ chính của hội chợ thương mại.'
  UNION ALL SELECT 'media', '/ˈmiːdiə/', 'n', 'truyền thông; phương tiện truyền thông', 'channels used to communicate information to the public', 'The campaign will use both print and digital media.', 'Chiến dịch sẽ sử dụng cả truyền thông in ấn và kỹ thuật số.'
  UNION ALL SELECT 'demand', '/dɪˈmænd/', 'n', 'nhu cầu', 'the amount of interest customers have in a product or service', 'Demand for the new service exceeded expectations.', 'Nhu cầu đối với dịch vụ mới vượt quá dự kiến.'
  UNION ALL SELECT 'competitor', '/kəmˈpetɪtər/', 'n', 'đối thủ cạnh tranh', 'a company that offers similar products or services', 'The competitor introduced a lower-priced model.', 'Đối thủ cạnh tranh đã giới thiệu mẫu sản phẩm có giá thấp hơn.'
  UNION ALL SELECT 'subscription', '/səbˈskrɪpʃən/', 'n', 'gói đăng ký; phí đăng ký', 'an arrangement to receive a service for a period of time', 'The magazine offers an annual subscription for businesses.', 'Tạp chí có gói đăng ký thường niên dành cho doanh nghiệp.'
  UNION ALL SELECT 'press release', '/ˈpres rɪˌliːs/', 'n', 'thông cáo báo chí', 'an official statement sent to the media', 'The company issued a press release about its new service.', 'Công ty đã phát hành thông cáo báo chí về dịch vụ mới.'
  UNION ALL SELECT 'brand awareness', '/ˈbrænd əˌwernəs/', 'n', 'mức độ nhận diện thương hiệu', 'the extent to which customers recognize a brand', 'The campaign aims to increase brand awareness.', 'Chiến dịch nhằm tăng mức độ nhận diện thương hiệu.'
  UNION ALL SELECT 'commercial', '/kəˈmɜːrʃəl/', 'n', 'quảng cáo thương mại', 'a paid advertisement on television, radio, or online media', 'The commercial will air during the evening program.', 'Quảng cáo sẽ được phát trong chương trình buổi tối.'
  UNION ALL SELECT 'trademark', '/ˈtreɪdmɑːrk/', 'n', 'nhãn hiệu thương mại', 'a legally protected name or symbol used to identify a product', 'The company registered its new trademark last month.', 'Công ty đã đăng ký nhãn hiệu thương mại mới vào tháng trước.'
  UNION ALL SELECT 'slogan', '/ˈsloʊɡən/', 'n', 'khẩu hiệu', 'a short phrase used in advertising', 'The agency proposed a slogan for the product launch.', 'Đơn vị quảng cáo đề xuất khẩu hiệu cho buổi ra mắt sản phẩm.'
  UNION ALL SELECT 'market research', '/ˈmɑːrkɪt rɪˌsɜːrtʃ/', 'n', 'nghiên cứu thị trường', 'the process of collecting information about customers and markets', 'Market research showed strong interest in the service.', 'Nghiên cứu thị trường cho thấy khách hàng quan tâm nhiều đến dịch vụ.'
  UNION ALL SELECT 'prospect', '/ˈprɑːspekt/', 'n', 'khách hàng tiềm năng', 'a person or company that may become a customer', 'Sales representatives contacted each qualified prospect.', 'Nhân viên bán hàng đã liên hệ từng khách hàng tiềm năng phù hợp.'
  UNION ALL SELECT 'feedback', '/ˈfiːdbæk/', 'n', 'ý kiến phản hồi', 'comments or information about a product or service', 'The team used customer feedback to improve the website.', 'Nhóm đã dùng ý kiến phản hồi của khách hàng để cải thiện trang web.'
  UNION ALL SELECT 'endorsement', '/ɪnˈdɔːrsmənt/', 'n', 'sự chứng thực; lời giới thiệu', 'a public statement of support for a product or service', 'The campaign features an endorsement from a well-known chef.', 'Chiến dịch có lời giới thiệu từ một đầu bếp nổi tiếng.'
  UNION ALL SELECT 'distribution', '/ˌdɪstrɪˈbjuːʃən/', 'n', 'sự phân phối', 'the process of delivering products to stores or customers', 'The company expanded its distribution network overseas.', 'Công ty đã mở rộng mạng lưới phân phối ra nước ngoài.'
) s ON t.title = 'Marketing'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'machine' AS word, '/məˈʃiːn/' AS phonetic, 'n' AS part_of_speech, 'máy móc; máy' AS meaning_vi, 'a device that uses power to perform a task' AS definition_en, 'The machine must be inspected before each shift.' AS example_sentence, 'Máy móc phải được kiểm tra trước mỗi ca làm việc.' AS example_meaning
  UNION ALL SELECT 'machinery', '/məˈʃiːnəri/', 'n', 'máy móc; thiết bị máy', 'machines used for a particular industrial activity', 'The factory replaced its old machinery last year.', 'Nhà máy đã thay thế máy móc cũ vào năm ngoái.'
  UNION ALL SELECT 'component', '/kəmˈpoʊnənt/', 'n', 'bộ phận; linh kiện', 'one of the parts that make up a larger product', 'Each component is tested before final assembly.', 'Mỗi linh kiện được kiểm tra trước khi lắp ráp hoàn chỉnh.'
  UNION ALL SELECT 'plant', '/plænt/', 'n', 'nhà máy; cơ sở sản xuất', 'a factory or industrial building where goods are made', 'The plant operates three production lines.', 'Nhà máy vận hành ba dây chuyền sản xuất.'
  UNION ALL SELECT 'warehouse', '/ˈwerhaʊs/', 'n', 'nhà kho', 'a large building used to store goods', 'Finished products are stored in the warehouse.', 'Thành phẩm được lưu trữ trong nhà kho.'
  UNION ALL SELECT 'supplier', '/səˈplaɪər/', 'n', 'nhà cung cấp', 'a company that provides materials or products', 'The supplier delivered the parts ahead of schedule.', 'Nhà cung cấp đã giao các bộ phận sớm hơn lịch trình.'
  UNION ALL SELECT 'production line', '/prəˈdʌkʃən laɪn/', 'n', 'dây chuyền sản xuất', 'a series of machines and workers that make a product', 'A new production line will open next quarter.', 'Dây chuyền sản xuất mới sẽ đi vào hoạt động trong quý tới.'
  UNION ALL SELECT 'defect', '/ˈdiːfekt/', 'n', 'lỗi; khuyết điểm', 'a fault that makes a product imperfect', 'The inspection team found a defect in the metal casing.', 'Nhóm kiểm tra phát hiện lỗi trên vỏ kim loại.'
  UNION ALL SELECT 'repair', '/rɪˈper/', 'v', 'sửa chữa', 'to fix something that is damaged or not working', 'Technicians repair the equipment during scheduled downtime.', 'Kỹ thuật viên sửa chữa thiết bị trong thời gian ngừng máy theo lịch.'
  UNION ALL SELECT 'safety', '/ˈseɪfti/', 'n', 'sự an toàn; an toàn', 'the condition of being protected from harm or danger', 'All workers must follow the factory safety rules.', 'Tất cả công nhân phải tuân thủ quy định an toàn của nhà máy.'
  UNION ALL SELECT 'package', '/ˈpækɪdʒ/', 'n', 'kiện hàng; bao bì', 'a wrapped item prepared for transport or sale', 'Each package is labeled before it leaves the facility.', 'Mỗi kiện hàng được dán nhãn trước khi rời cơ sở.'
  UNION ALL SELECT 'output', '/ˈaʊtpʊt/', 'n', 'sản lượng; đầu ra', 'the amount of goods produced by a factory or machine', 'The new equipment increased daily output.', 'Thiết bị mới đã tăng sản lượng hằng ngày.'
  UNION ALL SELECT 'capacity', '/kəˈpæsəti/', 'n', 'công suất; năng lực sản xuất', 'the maximum amount that a machine or facility can produce', 'The factory is operating at full capacity this month.', 'Nhà máy đang hoạt động hết công suất trong tháng này.'
  UNION ALL SELECT 'process', '/ˈprɑːses/', 'n', 'quy trình', 'a series of steps used to make or handle a product', 'The quality team reviewed the packaging process.', 'Nhóm chất lượng đã xem xét quy trình đóng gói.'
  UNION ALL SELECT 'raw material', '/ˌrɔː məˈtɪriəl/', 'n', 'nguyên liệu thô', 'a basic substance used to manufacture a product', 'The factory ordered raw materials from a local supplier.', 'Nhà máy đã đặt nguyên liệu thô từ nhà cung cấp địa phương.'
  UNION ALL SELECT 'assembly line', '/əˈsembli laɪn/', 'n', 'dây chuyền lắp ráp', 'a line of workers or machines that assemble a product', 'The assembly line stopped when one machine required repair.', 'Dây chuyền lắp ráp dừng lại khi một máy cần được sửa chữa.'
  UNION ALL SELECT 'quality control', '/ˈkwɑːləti kənˌtroʊl/', 'n', 'kiểm soát chất lượng', 'the process of checking that products meet required standards', 'Quality control staff inspect every finished unit.', 'Nhân viên kiểm soát chất lượng kiểm tra từng sản phẩm hoàn thiện.'
  UNION ALL SELECT 'conveyor belt', '/kənˈveɪər belt/', 'n', 'băng chuyền', 'a moving belt that carries materials or products', 'Boxes move along the conveyor belt to the packing area.', 'Các thùng hàng di chuyển trên băng chuyền đến khu vực đóng gói.'
  UNION ALL SELECT 'inspection', '/ɪnˈspekʃən/', 'n', 'sự kiểm tra; cuộc kiểm định', 'a careful examination to ensure that something meets standards', 'The safety inspection is scheduled for Wednesday.', 'Cuộc kiểm định an toàn được lên lịch vào thứ Tư.'
  UNION ALL SELECT 'technician', '/tekˈnɪʃən/', 'n', 'kỹ thuật viên', 'a person trained to operate or repair technical equipment', 'A technician calibrated the machine before production began.', 'Kỹ thuật viên đã hiệu chuẩn máy trước khi bắt đầu sản xuất.'
) s ON t.title = 'Manufacturing'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'policy' AS word, '/ˈpɑːləsi/' AS phonetic, 'n' AS part_of_speech, 'chính sách; điều khoản' AS meaning_vi, 'a formal rule or plan used by an organization' AS definition_en, 'The revised policy applies to all suppliers.' AS example_sentence, 'Chính sách sửa đổi áp dụng cho tất cả nhà cung cấp.' AS example_meaning
  UNION ALL SELECT 'regulation', '/ˌreɡjəˈleɪʃən/', 'n', 'quy định; quy chế', 'an official rule made by an authority', 'The company updated its procedures to meet the new regulation.', 'Công ty đã cập nhật quy trình để đáp ứng quy định mới.'
  UNION ALL SELECT 'provision', '/prəˈvɪʒən/', 'n', 'điều khoản; quy định', 'a condition or requirement included in a legal document', 'A provision in the contract covers late delivery.', 'Một điều khoản trong hợp đồng quy định về việc giao hàng trễ.'
  UNION ALL SELECT 'obligation', '/ˌɑːblɪˈɡeɪʃən/', 'n', 'nghĩa vụ', 'a legal or moral duty to do something', 'The supplier has an obligation to replace defective goods.', 'Nhà cung cấp có nghĩa vụ thay thế hàng hóa bị lỗi.'
  UNION ALL SELECT 'valid', '/ˈvælɪd/', 'adj', 'có hiệu lực; hợp lệ', 'legally acceptable or effective', 'The offer remains valid until the end of the month.', 'Đề nghị vẫn có hiệu lực đến cuối tháng.'
  UNION ALL SELECT 'expire', '/ɪkˈspaɪər/', 'v', 'hết hạn', 'to come to an end after a fixed period', 'The service agreement will expire in December.', 'Thỏa thuận dịch vụ sẽ hết hạn vào tháng Mười Hai.'
  UNION ALL SELECT 'renewal', '/rɪˈnuːəl/', 'n', 'sự gia hạn; việc làm mới', 'the act of extending the period of an agreement', 'The lease renewal must be approved by both parties.', 'Việc gia hạn hợp đồng thuê phải được cả hai bên phê duyệt.'
  UNION ALL SELECT 'amend', '/əˈmend/', 'v', 'sửa đổi; bổ sung', 'to change a document or agreement formally', 'The parties agreed to amend the delivery schedule.', 'Các bên đồng ý sửa đổi lịch giao hàng.'
  UNION ALL SELECT 'amendment', '/əˈmendmənt/', 'n', 'bản sửa đổi; sự sửa đổi', 'a formal change made to a document or law', 'The amendment was attached to the original contract.', 'Bản sửa đổi được đính kèm hợp đồng ban đầu.'
  UNION ALL SELECT 'confidential', '/ˌkɑːnfɪˈdenʃəl/', 'adj', 'bảo mật; bí mật', 'intended to be kept private', 'The parties agreed to keep the pricing details confidential.', 'Các bên đồng ý giữ kín thông tin giá cả.'
  UNION ALL SELECT 'confidentiality', '/ˌkɑːnfɪdenʃiˈæləti/', 'n', 'tính bảo mật; sự giữ bí mật', 'the requirement to keep information private', 'All contractors must sign a confidentiality agreement.', 'Tất cả nhà thầu phải ký thỏa thuận bảo mật.'
  UNION ALL SELECT 'guarantee', '/ˌɡærənˈtiː/', 'n', 'sự bảo đảm; cam kết', 'a promise that something will be done or will work', 'The agreement includes a guarantee of product quality.', 'Thỏa thuận bao gồm cam kết về chất lượng sản phẩm.'
  UNION ALL SELECT 'warranty', '/ˈwɔːrənti/', 'n', 'bảo hành; giấy bảo hành', 'a written promise to repair or replace a product', 'The warranty covers repairs for two years.', 'Chế độ bảo hành chi trả việc sửa chữa trong hai năm.'
  UNION ALL SELECT 'settlement', '/ˈsetəlmənt/', 'n', 'sự dàn xếp; thỏa thuận giải quyết', 'an agreement that resolves a dispute', 'The companies reached a settlement without going to court.', 'Các công ty đạt thỏa thuận giải quyết mà không cần ra tòa.'
  UNION ALL SELECT 'dispute', '/dɪˈspjuːt/', 'n', 'tranh chấp; bất đồng', 'a serious disagreement between people or organizations', 'The contract describes how to resolve a payment dispute.', 'Hợp đồng nêu cách giải quyết tranh chấp thanh toán.'
  UNION ALL SELECT 'consent', '/kənˈsent/', 'n', 'sự đồng ý; chấp thuận', 'permission given for an action or agreement', 'The change requires written consent from both parties.', 'Thay đổi này cần có sự đồng ý bằng văn bản của cả hai bên.'
  UNION ALL SELECT 'binding', '/ˈbaɪndɪŋ/', 'adj', 'có tính ràng buộc', 'creating a legal duty that must be followed', 'The signed agreement is binding on both companies.', 'Thỏa thuận đã ký có tính ràng buộc đối với cả hai công ty.'
  UNION ALL SELECT 'enforce', '/ɪnˈfɔːrs/', 'v', 'thi hành; thực thi', 'to make sure that a rule or agreement is obeyed', 'The agency can enforce the terms of the license.', 'Cơ quan có thể thực thi các điều khoản của giấy phép.'
  UNION ALL SELECT 'breach', '/briːtʃ/', 'n', 'sự vi phạm', 'an act of breaking a law or agreement', 'The late payment constituted a breach of contract.', 'Việc thanh toán trễ cấu thành hành vi vi phạm hợp đồng.'
  UNION ALL SELECT 'counsel', '/ˈkaʊnsəl/', 'n', 'luật sư; cố vấn pháp lý', 'a lawyer or legal adviser', 'The company consulted legal counsel before signing.', 'Công ty đã tham khảo ý kiến luật sư trước khi ký.'
) s ON t.title = 'Contracts'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'computer' AS word, '/kəmˈpjuːtər/' AS phonetic, 'n' AS part_of_speech, 'máy tính' AS meaning_vi, 'an electronic device that stores and processes information' AS definition_en, 'The new computer is connected to the office network.' AS example_sentence, 'Máy tính mới được kết nối với mạng văn phòng.' AS example_meaning
  UNION ALL SELECT 'hardware', '/ˈhɑːrdwer/', 'n', 'phần cứng', 'the physical parts of a computer or electronic system', 'The technician replaced the damaged hardware.', 'Kỹ thuật viên đã thay thế phần cứng bị hỏng.'
  UNION ALL SELECT 'server', '/ˈsɜːrvər/', 'n', 'máy chủ', 'a computer that provides data or services to other computers', 'The server stores files for the entire department.', 'Máy chủ lưu trữ tệp cho toàn bộ phòng ban.'
  UNION ALL SELECT 'website', '/ˈwebsaɪt/', 'n', 'trang web', 'a set of pages on the internet maintained by an organization', 'The company updated its website with the latest prices.', 'Công ty đã cập nhật giá mới nhất trên trang web.'
  UNION ALL SELECT 'email', '/ˈiːmeɪl/', 'n', 'thư điện tử; email', 'a message sent electronically over a computer network', 'Please send the invoice by email.', 'Vui lòng gửi hóa đơn qua thư điện tử.'
  UNION ALL SELECT 'password', '/ˈpæswɜːrd/', 'n', 'mật khẩu', 'a secret word or code used to access a system', 'Employees must change their password every ninety days.', 'Nhân viên phải đổi mật khẩu mỗi chín mươi ngày.'
  UNION ALL SELECT 'wireless', '/ˈwaɪərləs/', 'adj', 'không dây', 'using radio signals instead of cables', 'The conference room has wireless internet access.', 'Phòng hội nghị có kết nối Internet không dây.'
  UNION ALL SELECT 'system', '/ˈsɪstəm/', 'n', 'hệ thống', 'a set of connected parts that work together', 'The booking system will be unavailable overnight.', 'Hệ thống đặt chỗ sẽ tạm ngừng hoạt động qua đêm.'
  UNION ALL SELECT 'information', '/ˌɪnfərˈmeɪʃən/', 'n', 'thông tin', 'facts or details about a subject', 'The website provides information about technical support.', 'Trang web cung cấp thông tin về hỗ trợ kỹ thuật.'
  UNION ALL SELECT 'upgrade', '/ʌpˈɡreɪd/', 'v', 'nâng cấp', 'to improve a computer system or software', 'IT staff will upgrade the network this weekend.', 'Nhân viên IT sẽ nâng cấp mạng vào cuối tuần này.'
  UNION ALL SELECT 'support', '/səˈpɔːrt/', 'n', 'hỗ trợ; dịch vụ hỗ trợ', 'help provided to users of a product or system', 'Technical support is available by phone around the clock.', 'Dịch vụ hỗ trợ kỹ thuật sẵn sàng qua điện thoại suốt ngày đêm.'
  UNION ALL SELECT 'browser', '/ˈbraʊzər/', 'n', 'trình duyệt', 'software used to view websites on the internet', 'Open the link in a different browser if it does not load.', 'Hãy mở liên kết bằng trình duyệt khác nếu trang không tải được.'
  UNION ALL SELECT 'download', '/ˌdaʊnˈloʊd/', 'v', 'tải xuống', 'to copy a file from the internet to a device', 'You can download the updated manual from the portal.', 'Bạn có thể tải hướng dẫn cập nhật xuống từ cổng thông tin.'
  UNION ALL SELECT 'backup', '/ˈbækʌp/', 'n', 'bản sao lưu', 'a copy of data kept in case the original is lost', 'The system creates a backup of all files each night.', 'Hệ thống tạo bản sao lưu tất cả các tệp mỗi đêm.'
  UNION ALL SELECT 'digital', '/ˈdɪdʒɪtəl/', 'adj', 'kỹ thuật số', 'using computer technology to store or process information', 'The office converted its paper records to digital files.', 'Văn phòng đã chuyển hồ sơ giấy thành tệp kỹ thuật số.'
  UNION ALL SELECT 'security', '/sɪˈkjʊrəti/', 'n', 'bảo mật; an ninh', 'measures taken to protect a system or information', 'The security update fixed a problem with user accounts.', 'Bản cập nhật bảo mật đã khắc phục sự cố với tài khoản người dùng.'
  UNION ALL SELECT 'screen', '/skriːn/', 'n', 'màn hình', 'the part of a device that displays information', 'The technician replaced the cracked screen.', 'Kỹ thuật viên đã thay màn hình bị nứt.'
  UNION ALL SELECT 'data', '/ˈdeɪtə/', 'n', 'dữ liệu', 'facts or information stored or used by a computer', 'Customer data is encrypted before it is transferred.', 'Dữ liệu khách hàng được mã hóa trước khi truyền đi.'
  UNION ALL SELECT 'application', '/ˌæplɪˈkeɪʃən/', 'n', 'ứng dụng', 'a program designed to perform a particular task', 'The application allows staff to submit requests online.', 'Ứng dụng cho phép nhân viên gửi yêu cầu trực tuyến.'
  UNION ALL SELECT 'user', '/ˈjuːzər/', 'n', 'người dùng', 'a person who operates a computer or software', 'Each user receives a separate account and password.', 'Mỗi người dùng được cấp một tài khoản và mật khẩu riêng.'
) s ON t.title = 'Technology'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'diagnosis' AS word, '/ˌdaɪəɡˈnoʊsɪs/' AS phonetic, 'n' AS part_of_speech, 'sự chẩn đoán; kết quả chẩn đoán' AS meaning_vi, 'the identification of an illness from its signs and tests' AS definition_en, 'The doctor explained the diagnosis to the patient.' AS example_sentence, 'Bác sĩ đã giải thích kết quả chẩn đoán cho bệnh nhân.' AS example_meaning
  UNION ALL SELECT 'disease', '/dɪˈziːz/', 'n', 'bệnh; căn bệnh', 'an illness that affects a person or animal', 'The clinic provides information about preventing heart disease.', 'Phòng khám cung cấp thông tin về cách phòng ngừa bệnh tim.'
  UNION ALL SELECT 'illness', '/ˈɪlnəs/', 'n', 'bệnh; tình trạng ốm', 'a condition that makes someone unwell', 'Employees should report an illness to their supervisor.', 'Nhân viên nên báo tình trạng bệnh cho người giám sát.'
  UNION ALL SELECT 'injury', '/ˈɪndʒəri/', 'n', 'vết thương; chấn thương', 'physical harm to a person''s body', 'The worker received treatment for a minor injury.', 'Công nhân đã được điều trị vết thương nhẹ.'
  UNION ALL SELECT 'nurse', '/nɜːrs/', 'n', 'y tá; điều dưỡng', 'a trained person who cares for sick or injured people', 'A nurse will check the patient''s temperature.', 'Y tá sẽ kiểm tra nhiệt độ của bệnh nhân.'
  UNION ALL SELECT 'hospital', '/ˈhɑːspɪtəl/', 'n', 'bệnh viện', 'a place where sick or injured people receive medical care', 'The hospital opened a new outpatient department.', 'Bệnh viện đã mở khoa khám ngoại trú mới.'
  UNION ALL SELECT 'dentist', '/ˈdentɪst/', 'n', 'nha sĩ', 'a medical professional who treats teeth', 'The dentist is available for appointments on Fridays.', 'Nha sĩ nhận lịch hẹn vào các ngày thứ Sáu.'
  UNION ALL SELECT 'pharmacy', '/ˈfɑːrməsi/', 'n', 'nhà thuốc; hiệu thuốc', 'a place where medicines are prepared and sold', 'The pharmacy is located next to the main entrance.', 'Nhà thuốc nằm cạnh lối vào chính.'
  UNION ALL SELECT 'medicine', '/ˈmedɪsən/', 'n', 'thuốc; dược phẩm', 'a substance used to prevent or treat an illness', 'Take the medicine according to the instructions on the label.', 'Hãy uống thuốc theo hướng dẫn trên nhãn.'
  UNION ALL SELECT 'medical', '/ˈmedɪkəl/', 'adj', 'thuộc y tế; thuộc y khoa', 'related to the treatment of illness or injury', 'The company provides medical coverage to its employees.', 'Công ty cung cấp bảo hiểm y tế cho nhân viên.'
  UNION ALL SELECT 'health', '/helθ/', 'n', 'sức khỏe', 'the condition of a person''s body or mind', 'Regular exercise is important for good health.', 'Tập thể dục thường xuyên rất quan trọng đối với sức khỏe.'
  UNION ALL SELECT 'fitness', '/ˈfɪtnəs/', 'n', 'thể lực; tình trạng sức khỏe', 'the condition of being physically healthy and strong', 'The wellness program includes a fitness assessment.', 'Chương trình chăm sóc sức khỏe bao gồm đánh giá thể lực.'
  UNION ALL SELECT 'checkup', '/ˈtʃekʌp/', 'n', 'lần khám sức khỏe', 'a medical examination to check a person''s health', 'New employees must complete a medical checkup.', 'Nhân viên mới phải hoàn thành buổi khám sức khỏe.'
  UNION ALL SELECT 'medical record', '/ˈmedɪkəl ˌrekərd/', 'n', 'hồ sơ bệnh án', 'a document containing information about a person''s medical care', 'The clinic keeps each medical record secure.', 'Phòng khám bảo mật hồ sơ bệnh án của từng người.'
  UNION ALL SELECT 'care', '/ker/', 'n', 'sự chăm sóc; dịch vụ chăm sóc', 'attention or treatment given to someone who is ill', 'The center provides care for older adults.', 'Trung tâm cung cấp dịch vụ chăm sóc người cao tuổi.'
  UNION ALL SELECT 'therapy', '/ˈθerəpi/', 'n', 'liệu pháp; phương pháp điều trị', 'a treatment intended to improve a health condition', 'The physician recommended physical therapy after surgery.', 'Bác sĩ đề xuất vật lý trị liệu sau phẫu thuật.'
  UNION ALL SELECT 'dental', '/ˈdentəl/', 'adj', 'thuộc nha khoa', 'related to the care and treatment of teeth', 'The insurance plan includes dental services.', 'Gói bảo hiểm bao gồm dịch vụ nha khoa.'
  UNION ALL SELECT 'dosage', '/ˈdoʊsɪdʒ/', 'n', 'liều lượng thuốc', 'the amount of medicine that should be taken', 'Follow the dosage printed on the prescription label.', 'Hãy tuân theo liều lượng in trên nhãn đơn thuốc.'
  UNION ALL SELECT 'wellness', '/ˈwelnəs/', 'n', 'sức khỏe toàn diện; trạng thái khỏe mạnh', 'the state of being healthy in body and mind', 'The company introduced a wellness program for staff.', 'Công ty đã triển khai chương trình chăm sóc sức khỏe toàn diện cho nhân viên.'
  UNION ALL SELECT 'vaccination', '/ˌvæksɪˈneɪʃən/', 'n', 'việc tiêm chủng; mũi tiêm', 'the act of giving a vaccine to protect against disease', 'The clinic offers vaccination appointments throughout the week.', 'Phòng khám nhận lịch hẹn tiêm chủng trong suốt tuần.'
) s ON t.title = 'Health'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'itinerary' AS word, '/aɪˈtɪnəreri/' AS phonetic, 'n' AS part_of_speech, 'lịch trình chuyến đi' AS meaning_vi, 'a plan of a journey, including places and times' AS definition_en, 'The travel agent emailed us the updated itinerary.' AS example_sentence, 'Đại lý du lịch đã gửi email lịch trình cập nhật cho chúng tôi.' AS example_meaning
  UNION ALL SELECT 'boarding pass', '/ˈbɔːrdɪŋ pæs/', 'n', 'thẻ lên máy bay', 'a document that allows a passenger to board an aircraft', 'Passengers can download their boarding passes online.', 'Hành khách có thể tải thẻ lên máy bay trực tuyến.'
  UNION ALL SELECT 'departure', '/dɪˈpɑːrtʃər/', 'n', 'sự khởi hành', 'the act of leaving a place to begin a journey', 'Please arrive at the gate before the scheduled departure.', 'Vui lòng đến cửa khởi hành trước giờ khởi hành dự kiến.'
  UNION ALL SELECT 'passenger', '/ˈpæsəndʒər/', 'n', 'hành khách', 'a person traveling in a vehicle but not operating it', 'Each passenger may bring one carry-on bag.', 'Mỗi hành khách có thể mang theo một túi xách tay.'
  UNION ALL SELECT 'accommodation', '/əˌkɑːməˈdeɪʃən/', 'n', 'chỗ ở', 'a place where someone can stay temporarily', 'The conference hotel provides accommodation for visitors.', 'Khách sạn hội nghị cung cấp chỗ ở cho khách tham dự.'
  UNION ALL SELECT 'luggage', '/ˈlʌɡɪdʒ/', 'n', 'hành lý', 'the bags and cases that a traveler carries', 'The airline offers free luggage storage at the terminal.', 'Hãng hàng không cung cấp dịch vụ gửi hành lý miễn phí tại nhà ga.'
  UNION ALL SELECT 'destination', '/ˌdestɪˈneɪʃən/', 'n', 'điểm đến', 'the place to which someone or something is going', 'Our final destination is the convention center.', 'Điểm đến cuối cùng của chúng tôi là trung tâm hội nghị.'
  UNION ALL SELECT 'delay', '/dɪˈleɪ/', 'n', 'sự trì hoãn; sự chậm trễ', 'a period of time when something happens later than expected', 'The flight was delayed because of heavy rain.', 'Chuyến bay bị hoãn do mưa lớn.'
  UNION ALL SELECT 'transfer', '/ˈtrænsfər/', 'n', 'sự trung chuyển; chuyến chuyển tiếp', 'a change from one vehicle or route to another', 'A shuttle transfer to the airport is included in the fare.', 'Giá vé đã bao gồm chuyến xe trung chuyển đến sân bay.'
  UNION ALL SELECT 'reservation', '/ˌrezərˈveɪʃən/', 'n', 'sự đặt chỗ; đặt phòng', 'an arrangement to keep a seat or room for someone', 'Please confirm your hotel reservation by email.', 'Vui lòng xác nhận đặt phòng khách sạn qua email.'
) s ON t.title = 'Travel & Transport'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'purchase' AS word, '/ˈpɜːrtʃəs/' AS phonetic, 'n' AS part_of_speech, 'việc mua hàng; món hàng đã mua' AS meaning_vi, 'the act of buying something' AS definition_en, 'All purchases over fifty dollars qualify for free delivery.' AS example_sentence, 'Mọi đơn mua hàng trên năm mươi đô la đều được giao miễn phí.' AS example_meaning
  UNION ALL SELECT 'invoice', '/ˈɪnvɔɪs/', 'n', 'hóa đơn', 'a document requesting payment for goods or services', 'The supplier included an invoice with the shipment.', 'Nhà cung cấp gửi kèm hóa đơn trong lô hàng.'
  UNION ALL SELECT 'receipt', '/rɪˈsiːt/', 'n', 'biên lai; hóa đơn bán hàng', 'a document showing that payment has been made', 'Keep your receipt in case you need to return the item.', 'Hãy giữ biên lai phòng khi bạn cần trả lại món hàng.'
  UNION ALL SELECT 'refund', '/ˈriːfʌnd/', 'n', 'khoản hoàn tiền', 'an amount of money returned to a customer', 'Customers can request a refund within thirty days.', 'Khách hàng có thể yêu cầu hoàn tiền trong vòng ba mươi ngày.'
  UNION ALL SELECT 'discount', '/ˈdɪskaʊnt/', 'n', 'khoản giảm giá', 'a reduction in the usual price', 'Members receive a discount on selected products.', 'Thành viên được giảm giá cho một số sản phẩm được chọn.'
  UNION ALL SELECT 'merchandise', '/ˈmɜːrtʃəndaɪs/', 'n', 'hàng hóa', 'goods that are bought and sold', 'The new merchandise will arrive on Friday.', 'Lô hàng hóa mới sẽ đến vào thứ Sáu.'
  UNION ALL SELECT 'inventory', '/ˈɪnvəntɔːri/', 'n', 'hàng tồn kho; bản kiểm kê', 'the goods a store has available for sale', 'The store checks its inventory every month.', 'Cửa hàng kiểm tra hàng tồn kho mỗi tháng.'
  UNION ALL SELECT 'customer', '/ˈkʌstəmər/', 'n', 'khách hàng', 'a person who buys goods or services', 'A customer requested more information about the warranty.', 'Một khách hàng yêu cầu thêm thông tin về bảo hành.'
  UNION ALL SELECT 'retailer', '/ˈriːteɪlər/', 'n', 'nhà bán lẻ', 'a business that sells goods directly to consumers', 'The retailer opened a branch near the station.', 'Nhà bán lẻ đã mở một chi nhánh gần nhà ga.'
  UNION ALL SELECT 'warranty', '/ˈwɔːrənti/', 'n', 'chế độ bảo hành', 'a written promise to repair or replace a product', 'The appliance comes with a two-year warranty.', 'Thiết bị đi kèm chế độ bảo hành hai năm.'
) s ON t.title = 'Shopping & Sales'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'applicant' AS word, '/ˈæplɪkənt/' AS phonetic, 'n' AS part_of_speech, 'ứng viên; người nộp đơn' AS meaning_vi, 'a person who formally asks for a job or position' AS definition_en, 'Each applicant must submit a completed form.' AS example_sentence, 'Mỗi ứng viên phải nộp một mẫu đơn đã điền đầy đủ.' AS example_meaning
  UNION ALL SELECT 'resume', '/ˈrezəmeɪ/', 'n', 'sơ yếu lý lịch; CV', 'a summary of a person''s education and work experience', 'Please attach your resume to the online application.', 'Vui lòng đính kèm CV vào đơn ứng tuyển trực tuyến.'
  UNION ALL SELECT 'interview', '/ˈɪntərvjuː/', 'n', 'cuộc phỏng vấn', 'a formal meeting to assess a job candidate', 'The interview will take place at the downtown office.', 'Buổi phỏng vấn sẽ diễn ra tại văn phòng trung tâm.'
  UNION ALL SELECT 'qualification', '/ˌkwɑːlɪfɪˈkeɪʃən/', 'n', 'trình độ; bằng cấp', 'a skill, experience, or certificate needed for a job', 'The position requires a professional qualification.', 'Vị trí này yêu cầu bằng cấp chuyên môn.'
  UNION ALL SELECT 'recruit', '/rɪˈkruːt/', 'v', 'tuyển dụng', 'to find and employ suitable people for a job', 'The company plans to recruit three sales assistants.', 'Công ty dự định tuyển dụng ba trợ lý bán hàng.'
  UNION ALL SELECT 'vacancy', '/ˈveɪkənsi/', 'n', 'vị trí tuyển dụng còn trống', 'a job that is available for someone to take', 'The vacancy was advertised on the company website.', 'Vị trí tuyển dụng đã được đăng trên trang web công ty.'
  UNION ALL SELECT 'candidate', '/ˈkændɪdeɪt/', 'n', 'ứng viên', 'a person being considered for a job', 'The hiring manager will contact the successful candidate.', 'Quản lý tuyển dụng sẽ liên hệ với ứng viên được chọn.'
  UNION ALL SELECT 'salary', '/ˈsæləri/', 'n', 'tiền lương', 'a fixed amount of money paid regularly for work', 'The salary is reviewed after the probation period.', 'Mức lương sẽ được xem xét sau thời gian thử việc.'
  UNION ALL SELECT 'promotion', '/prəˈmoʊʃən/', 'n', 'sự thăng chức', 'a move to a more important job or position', 'Her promotion will take effect next month.', 'Việc thăng chức của cô ấy sẽ có hiệu lực vào tháng tới.'
  UNION ALL SELECT 'reference', '/ˈrefərəns/', 'n', 'người/thư giới thiệu', 'a person or letter providing information about a candidate', 'The employer contacted two professional references.', 'Nhà tuyển dụng đã liên hệ với hai người giới thiệu chuyên môn.'
) s ON t.title = 'Jobs & Recruitment'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'account' AS word, '/əˈkaʊnt/' AS phonetic, 'n' AS part_of_speech, 'tài khoản' AS meaning_vi, 'an arrangement with a bank for keeping and using money' AS definition_en, 'The company opened a separate account for payroll.' AS example_sentence, 'Công ty đã mở một tài khoản riêng để trả lương.' AS example_meaning
  UNION ALL SELECT 'transaction', '/trænˈzækʃən/', 'n', 'giao dịch', 'an instance of buying, selling, or transferring money', 'The bank confirmed the transaction by text message.', 'Ngân hàng xác nhận giao dịch bằng tin nhắn.'
  UNION ALL SELECT 'deposit', '/dɪˈpɑːzɪt/', 'n', 'khoản tiền gửi', 'money placed in a bank account', 'A minimum deposit is required to open the account.', 'Cần có khoản tiền gửi tối thiểu để mở tài khoản.'
  UNION ALL SELECT 'withdraw', '/wɪðˈdrɔː/', 'v', 'rút tiền', 'to take money out of a bank account', 'Customers can withdraw cash at any branch.', 'Khách hàng có thể rút tiền tại bất kỳ chi nhánh nào.'
  UNION ALL SELECT 'balance', '/ˈbæləns/', 'n', 'số dư', 'the amount of money in a bank account', 'You can check your account balance online.', 'Bạn có thể kiểm tra số dư tài khoản trực tuyến.'
  UNION ALL SELECT 'loan', '/loʊn/', 'n', 'khoản vay', 'money borrowed from a bank that must be repaid', 'The bank approved a loan for the new equipment.', 'Ngân hàng đã duyệt khoản vay để mua thiết bị mới.'
  UNION ALL SELECT 'interest', '/ˈɪntrəst/', 'n', 'tiền lãi; lãi suất', 'money paid for borrowing or earned from saving money', 'The savings account offers a competitive interest rate.', 'Tài khoản tiết kiệm có lãi suất cạnh tranh.'
  UNION ALL SELECT 'statement', '/ˈsteɪtmənt/', 'n', 'bản sao kê', 'a record of money paid into and out of an account', 'Monthly statements are available in digital format.', 'Sao kê hằng tháng có sẵn dưới dạng điện tử.'
  UNION ALL SELECT 'currency', '/ˈkɜːrənsi/', 'n', 'tiền tệ', 'the system of money used in a particular country', 'The service converts foreign currency at the daily rate.', 'Dịch vụ đổi ngoại tệ theo tỷ giá hằng ngày.'
  UNION ALL SELECT 'fee', '/fiː/', 'n', 'khoản phí', 'an amount of money charged for a service', 'There is no annual fee for the business card.', 'Thẻ doanh nghiệp không thu phí thường niên.'
) s ON t.title = 'Finance & Banking'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'campaign' AS word, '/kæmˈpeɪn/' AS phonetic, 'n' AS part_of_speech, 'chiến dịch' AS meaning_vi, 'a planned series of activities to achieve a goal' AS definition_en, 'The advertising campaign begins in early September.' AS example_sentence, 'Chiến dịch quảng cáo bắt đầu vào đầu tháng Chín.' AS example_meaning
  UNION ALL SELECT 'advertise', '/ˈædvərtaɪz/', 'v', 'quảng cáo', 'to promote a product or service to the public', 'The company will advertise the new service online.', 'Công ty sẽ quảng cáo dịch vụ mới trên mạng.'
  UNION ALL SELECT 'audience', '/ˈɔːdiəns/', 'n', 'đối tượng khán giả; khách hàng mục tiêu', 'the people a message or event is intended to reach', 'The survey helped identify the target audience.', 'Cuộc khảo sát giúp xác định nhóm khách hàng mục tiêu.'
  UNION ALL SELECT 'brand', '/brænd/', 'n', 'thương hiệu', 'a name or design that identifies a company''s product', 'The brand is well known among local customers.', 'Thương hiệu này nổi tiếng với khách hàng địa phương.'
  UNION ALL SELECT 'survey', '/ˈsɜːrveɪ/', 'n', 'cuộc khảo sát', 'a set of questions used to collect information', 'Customers completed a survey after the product launch.', 'Khách hàng hoàn thành khảo sát sau khi ra mắt sản phẩm.'
  UNION ALL SELECT 'launch', '/lɔːntʃ/', 'v', 'ra mắt; tung ra thị trường', 'to introduce a new product or service', 'The firm will launch its mobile application next month.', 'Công ty sẽ ra mắt ứng dụng di động vào tháng tới.'
  UNION ALL SELECT 'promote', '/prəˈmoʊt/', 'v', 'quảng bá; xúc tiến', 'to support or publicize a product or activity', 'Local stores will promote the event on social media.', 'Các cửa hàng địa phương sẽ quảng bá sự kiện trên mạng xã hội.'
  UNION ALL SELECT 'brochure', '/broʊˈʃʊr/', 'n', 'tờ quảng cáo; sách giới thiệu', 'a small booklet containing information about a service', 'The hotel brochure lists all available facilities.', 'Tờ giới thiệu khách sạn liệt kê mọi tiện nghi hiện có.'
  UNION ALL SELECT 'market', '/ˈmɑːrkɪt/', 'n', 'thị trường', 'the people who may buy a product or service', 'The company is entering a new regional market.', 'Công ty đang thâm nhập một thị trường khu vực mới.'
  UNION ALL SELECT 'strategy', '/ˈstrætədʒi/', 'n', 'chiến lược', 'a plan designed to achieve a particular goal', 'The team developed a strategy for increasing sales.', 'Nhóm đã xây dựng chiến lược tăng doanh số.'
) s ON t.title = 'Marketing'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'assembly' AS word, '/əˈsembli/' AS phonetic, 'n' AS part_of_speech, 'dây chuyền/lắp ráp; sự lắp ráp' AS meaning_vi, 'the process of fitting parts together to make a product' AS definition_en, 'The assembly line will operate on Saturday.' AS example_sentence, 'Dây chuyền lắp ráp sẽ hoạt động vào thứ Bảy.' AS example_meaning
  UNION ALL SELECT 'equipment', '/ɪˈkwɪpmənt/', 'n', 'thiết bị', 'the tools or machinery needed for a particular activity', 'The factory replaced its outdated equipment.', 'Nhà máy đã thay thế thiết bị lỗi thời.'
  UNION ALL SELECT 'factory', '/ˈfæktəri/', 'n', 'nhà máy', 'a building where goods are made', 'The factory employs more than two hundred workers.', 'Nhà máy tuyển dụng hơn hai trăm công nhân.'
  UNION ALL SELECT 'production', '/prəˈdʌkʃən/', 'n', 'sự sản xuất; sản lượng', 'the process of making goods', 'Production increased after the new machines were installed.', 'Sản lượng tăng sau khi máy móc mới được lắp đặt.'
  UNION ALL SELECT 'quality', '/ˈkwɑːləti/', 'n', 'chất lượng', 'how good or well made something is', 'Every item undergoes a quality check before shipping.', 'Mỗi mặt hàng đều được kiểm tra chất lượng trước khi giao.'
  UNION ALL SELECT 'inspect', '/ɪnˈspekt/', 'v', 'kiểm tra; thanh tra', 'to examine something carefully', 'Technicians inspect the machines at the start of each shift.', 'Kỹ thuật viên kiểm tra máy móc vào đầu mỗi ca.'
  UNION ALL SELECT 'shipment', '/ˈʃɪpmənt/', 'n', 'lô hàng; việc vận chuyển hàng', 'a quantity of goods sent from one place to another', 'The shipment is expected to arrive by Thursday.', 'Lô hàng dự kiến sẽ đến trước thứ Năm.'
  UNION ALL SELECT 'operate', '/ˈɑːpəreɪt/', 'v', 'vận hành', 'to control or use a machine or system', 'Only trained staff may operate the equipment.', 'Chỉ nhân viên đã qua đào tạo mới được vận hành thiết bị.'
  UNION ALL SELECT 'material', '/məˈtɪriəl/', 'n', 'nguyên vật liệu', 'a substance used to make or build something', 'The supplier provides recycled packaging material.', 'Nhà cung cấp cung cấp vật liệu đóng gói tái chế.'
  UNION ALL SELECT 'maintenance', '/ˈmeɪntənəns/', 'n', 'việc bảo trì', 'work done to keep equipment in good condition', 'Regular maintenance prevents unexpected production delays.', 'Bảo trì thường xuyên giúp ngăn sự chậm trễ sản xuất ngoài dự kiến.'
) s ON t.title = 'Manufacturing'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'agreement' AS word, '/əˈɡriːmənt/' AS phonetic, 'n' AS part_of_speech, 'thỏa thuận' AS meaning_vi, 'a decision or arrangement accepted by two or more parties' AS definition_en, 'Both companies reached an agreement on delivery dates.' AS example_sentence, 'Hai công ty đã đạt thỏa thuận về ngày giao hàng.' AS example_meaning
  UNION ALL SELECT 'clause', '/klɔːz/', 'n', 'điều khoản', 'a particular section of a legal document', 'The final clause explains how disputes are handled.', 'Điều khoản cuối cùng giải thích cách xử lý tranh chấp.'
  UNION ALL SELECT 'contract', '/ˈkɑːntrækt/', 'n', 'hợp đồng', 'a written legal agreement between people or organizations', 'The supplier signed a three-year contract.', 'Nhà cung cấp đã ký hợp đồng ba năm.'
  UNION ALL SELECT 'terms', '/tɜːrmz/', 'n', 'các điều khoản', 'the conditions included in an agreement', 'Please review the payment terms before signing.', 'Vui lòng xem lại các điều khoản thanh toán trước khi ký.'
  UNION ALL SELECT 'comply', '/kəmˈplaɪ/', 'v', 'tuân thủ', 'to act according to a rule or agreement', 'All vendors must comply with the safety requirements.', 'Tất cả nhà cung cấp phải tuân thủ các yêu cầu an toàn.'
  UNION ALL SELECT 'liability', '/ˌlaɪəˈbɪləti/', 'n', 'trách nhiệm pháp lý', 'legal responsibility for something', 'The contract limits the company''s liability for indirect losses.', 'Hợp đồng giới hạn trách nhiệm pháp lý của công ty đối với tổn thất gián tiếp.'
  UNION ALL SELECT 'renew', '/rɪˈnuː/', 'v', 'gia hạn; làm mới', 'to extend the period for which an agreement is valid', 'The client chose to renew the service contract.', 'Khách hàng chọn gia hạn hợp đồng dịch vụ.'
  UNION ALL SELECT 'terminate', '/ˈtɜːrmɪneɪt/', 'v', 'chấm dứt', 'to bring an agreement or activity to an end', 'Either party may terminate the agreement with notice.', 'Mỗi bên có thể chấm dứt thỏa thuận sau khi thông báo.'
  UNION ALL SELECT 'signature', '/ˈsɪɡnətʃər/', 'n', 'chữ ký', 'a person''s name written to authorize a document', 'The form requires the director''s signature.', 'Biểu mẫu cần chữ ký của giám đốc.'
  UNION ALL SELECT 'authorize', '/ˈɔːθəraɪz/', 'v', 'ủy quyền; cho phép', 'to give official permission for something', 'The board must authorize any changes to the contract.', 'Hội đồng phải phê duyệt mọi thay đổi đối với hợp đồng.'
) s ON t.title = 'Contracts'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'software' AS word, '/ˈsɔːftwer/' AS phonetic, 'n' AS part_of_speech, 'phần mềm' AS meaning_vi, 'programs used by a computer to perform tasks' AS definition_en, 'The software update will be installed overnight.' AS example_sentence, 'Bản cập nhật phần mềm sẽ được cài đặt qua đêm.' AS example_meaning
  UNION ALL SELECT 'device', '/dɪˈvaɪs/', 'n', 'thiết bị', 'a piece of equipment made for a particular purpose', 'Employees can connect the device to the office network.', 'Nhân viên có thể kết nối thiết bị với mạng văn phòng.'
  UNION ALL SELECT 'database', '/ˈdeɪtəbeɪs/', 'n', 'cơ sở dữ liệu', 'an organized collection of information stored electronically', 'The customer database is backed up every evening.', 'Cơ sở dữ liệu khách hàng được sao lưu mỗi tối.'
  UNION ALL SELECT 'network', '/ˈnetwɜːrk/', 'n', 'mạng lưới; mạng máy tính', 'a group of connected computers or people', 'The technician restored access to the network.', 'Kỹ thuật viên đã khôi phục quyền truy cập mạng.'
  UNION ALL SELECT 'update', '/ˈʌpdeɪt/', 'n', 'bản cập nhật', 'a more recent version of software or information', 'A security update is available for the application.', 'Ứng dụng hiện có bản cập nhật bảo mật.'
  UNION ALL SELECT 'install', '/ɪnˈstɔːl/', 'v', 'cài đặt', 'to put software or equipment in place for use', 'IT staff will install the new printers tomorrow.', 'Nhân viên IT sẽ cài đặt máy in mới vào ngày mai.'
  UNION ALL SELECT 'access', '/ˈækses/', 'n', 'quyền truy cập', 'the ability or permission to use a system or resource', 'Only managers have access to the payroll system.', 'Chỉ quản lý mới có quyền truy cập hệ thống tính lương.'
  UNION ALL SELECT 'secure', '/sɪˈkjʊr/', 'adj', 'an toàn; được bảo mật', 'protected from unauthorized access or danger', 'The portal provides a secure way to share documents.', 'Cổng thông tin cung cấp cách chia sẻ tài liệu an toàn.'
  UNION ALL SELECT 'feature', '/ˈfiːtʃər/', 'n', 'tính năng', 'a useful or important part of a product', 'The latest version includes a useful search feature.', 'Phiên bản mới nhất có thêm tính năng tìm kiếm hữu ích.'
  UNION ALL SELECT 'technical', '/ˈteknɪkəl/', 'adj', 'thuộc kỹ thuật', 'relating to practical or specialized technology', 'Contact the technical support team if the error continues.', 'Hãy liên hệ nhóm hỗ trợ kỹ thuật nếu lỗi vẫn tiếp diễn.'
) s ON t.title = 'Technology'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);

INSERT INTO vocab_words (topic_id, word, phonetic, part_of_speech, meaning_vi, definition_en, example_sentence, example_meaning)
SELECT t.id, s.word, s.phonetic, s.part_of_speech, s.meaning_vi, s.definition_en, s.example_sentence, s.example_meaning
FROM vocab_topics t
JOIN (
  SELECT 'patient' AS word, '/ˈpeɪʃənt/' AS phonetic, 'n' AS part_of_speech, 'bệnh nhân' AS meaning_vi, 'a person receiving medical care' AS definition_en, 'The clinic asks each patient to arrive fifteen minutes early.' AS example_sentence, 'Phòng khám yêu cầu mỗi bệnh nhân đến sớm mười lăm phút.' AS example_meaning
  UNION ALL SELECT 'physician', '/fɪˈzɪʃən/', 'n', 'bác sĩ', 'a medical doctor qualified to treat illness', 'A physician will review the test results this afternoon.', 'Bác sĩ sẽ xem kết quả xét nghiệm vào chiều nay.'
  UNION ALL SELECT 'prescription', '/prɪˈskrɪpʃən/', 'n', 'đơn thuốc', 'an instruction from a doctor for medicine', 'The pharmacy filled the prescription within an hour.', 'Nhà thuốc đã chuẩn bị thuốc theo đơn trong vòng một giờ.'
  UNION ALL SELECT 'symptom', '/ˈsɪmptəm/', 'n', 'triệu chứng', 'a change that indicates a possible illness', 'Please describe each symptom to the nurse.', 'Vui lòng mô tả từng triệu chứng cho y tá.'
  UNION ALL SELECT 'treatment', '/ˈtriːtmənt/', 'n', 'sự điều trị', 'medical care given to a person for an illness', 'The treatment is available at the regional clinic.', 'Phương pháp điều trị có tại phòng khám khu vực.'
  UNION ALL SELECT 'insurance', '/ɪnˈʃʊrəns/', 'n', 'bảo hiểm', 'an arrangement that provides financial protection', 'The plan includes health insurance for employees.', 'Gói này bao gồm bảo hiểm y tế cho nhân viên.'
  UNION ALL SELECT 'clinic', '/ˈklɪnɪk/', 'n', 'phòng khám', 'a place where people receive medical care', 'The clinic is located next to the main entrance.', 'Phòng khám nằm cạnh lối vào chính.'
  UNION ALL SELECT 'emergency', '/ɪˈmɜːrdʒənsi/', 'n', 'trường hợp khẩn cấp', 'a serious situation requiring immediate action', 'Call the emergency number if urgent assistance is needed.', 'Hãy gọi số khẩn cấp nếu cần hỗ trợ ngay lập tức.'
  UNION ALL SELECT 'recovery', '/rɪˈkʌvəri/', 'n', 'sự hồi phục', 'the process of becoming healthy again', 'The doctor expects a full recovery within two weeks.', 'Bác sĩ dự kiến bệnh nhân sẽ hồi phục hoàn toàn trong vòng hai tuần.'
  UNION ALL SELECT 'appointment', '/əˈpɔɪntmənt/', 'n', 'lịch hẹn khám', 'an arranged time to see a doctor or health professional', 'You can schedule a follow-up appointment by phone.', 'Bạn có thể đặt lịch tái khám qua điện thoại.'
) s ON t.title = 'Health'
WHERE NOT EXISTS (SELECT 1 FROM vocab_words w WHERE w.topic_id = t.id AND w.word = s.word);
