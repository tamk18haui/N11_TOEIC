-- N11 Listening: scaffold for 4 Parts x 5 levels, WITHOUT demo questions/media.
-- Run ONCE on your existing n11_toeic schema (or the database selected in Workbench).
-- Safe to re-run: creates missing levels only; does not delete/modify existing data.
-- Import real public Cloudinary HTTPS links using media_assets, practice_passages, and practice_questions.

-- Part 1 / Level 1
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',1,'Part 1 - Hình ảnh - Cấp 1','[LISTENING_LEVEL:1] Bộ luyện nghe TOEIC','EASY',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=1 AND instructions LIKE '%[LISTENING_LEVEL:1]%');

-- Part 1 / Level 2
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',1,'Part 1 - Hình ảnh - Cấp 2','[LISTENING_LEVEL:2] Bộ luyện nghe TOEIC','EASY',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=1 AND instructions LIKE '%[LISTENING_LEVEL:2]%');

-- Part 1 / Level 3
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',1,'Part 1 - Hình ảnh - Cấp 3','[LISTENING_LEVEL:3] Bộ luyện nghe TOEIC','MEDIUM',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=1 AND instructions LIKE '%[LISTENING_LEVEL:3]%');

-- Part 1 / Level 4
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',1,'Part 1 - Hình ảnh - Cấp 4','[LISTENING_LEVEL:4] Bộ luyện nghe TOEIC','HARD',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=1 AND instructions LIKE '%[LISTENING_LEVEL:4]%');

-- Part 1 / Level 5
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',1,'Part 1 - Hình ảnh - Cấp 5','[LISTENING_LEVEL:5] Bộ luyện nghe TOEIC','HARD',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=1 AND instructions LIKE '%[LISTENING_LEVEL:5]%');

-- Part 2 / Level 1
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',2,'Part 2 - Hỏi – Đáp - Cấp 1','[LISTENING_LEVEL:1] Bộ luyện nghe TOEIC','EASY',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=2 AND instructions LIKE '%[LISTENING_LEVEL:1]%');

-- Part 2 / Level 2
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',2,'Part 2 - Hỏi – Đáp - Cấp 2','[LISTENING_LEVEL:2] Bộ luyện nghe TOEIC','EASY',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=2 AND instructions LIKE '%[LISTENING_LEVEL:2]%');

-- Part 2 / Level 3
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',2,'Part 2 - Hỏi – Đáp - Cấp 3','[LISTENING_LEVEL:3] Bộ luyện nghe TOEIC','MEDIUM',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=2 AND instructions LIKE '%[LISTENING_LEVEL:3]%');

-- Part 2 / Level 4
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',2,'Part 2 - Hỏi – Đáp - Cấp 4','[LISTENING_LEVEL:4] Bộ luyện nghe TOEIC','HARD',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=2 AND instructions LIKE '%[LISTENING_LEVEL:4]%');

-- Part 2 / Level 5
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',2,'Part 2 - Hỏi – Đáp - Cấp 5','[LISTENING_LEVEL:5] Bộ luyện nghe TOEIC','HARD',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=2 AND instructions LIKE '%[LISTENING_LEVEL:5]%');

-- Part 3 / Level 1
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',3,'Part 3 - Hội thoại ngắn - Cấp 1','[LISTENING_LEVEL:1] Bộ luyện nghe TOEIC','EASY',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=3 AND instructions LIKE '%[LISTENING_LEVEL:1]%');

-- Part 3 / Level 2
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',3,'Part 3 - Hội thoại ngắn - Cấp 2','[LISTENING_LEVEL:2] Bộ luyện nghe TOEIC','EASY',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=3 AND instructions LIKE '%[LISTENING_LEVEL:2]%');

-- Part 3 / Level 3
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',3,'Part 3 - Hội thoại ngắn - Cấp 3','[LISTENING_LEVEL:3] Bộ luyện nghe TOEIC','MEDIUM',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=3 AND instructions LIKE '%[LISTENING_LEVEL:3]%');

-- Part 3 / Level 4
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',3,'Part 3 - Hội thoại ngắn - Cấp 4','[LISTENING_LEVEL:4] Bộ luyện nghe TOEIC','HARD',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=3 AND instructions LIKE '%[LISTENING_LEVEL:4]%');

-- Part 3 / Level 5
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',3,'Part 3 - Hội thoại ngắn - Cấp 5','[LISTENING_LEVEL:5] Bộ luyện nghe TOEIC','HARD',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=3 AND instructions LIKE '%[LISTENING_LEVEL:5]%');

-- Part 4 / Level 1
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',4,'Part 4 - Độc thoại - Cấp 1','[LISTENING_LEVEL:1] Bộ luyện nghe TOEIC','EASY',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=4 AND instructions LIKE '%[LISTENING_LEVEL:1]%');

-- Part 4 / Level 2
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',4,'Part 4 - Độc thoại - Cấp 2','[LISTENING_LEVEL:2] Bộ luyện nghe TOEIC','EASY',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=4 AND instructions LIKE '%[LISTENING_LEVEL:2]%');

-- Part 4 / Level 3
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',4,'Part 4 - Độc thoại - Cấp 3','[LISTENING_LEVEL:3] Bộ luyện nghe TOEIC','MEDIUM',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=4 AND instructions LIKE '%[LISTENING_LEVEL:3]%');

-- Part 4 / Level 4
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',4,'Part 4 - Độc thoại - Cấp 4','[LISTENING_LEVEL:4] Bộ luyện nghe TOEIC','HARD',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=4 AND instructions LIKE '%[LISTENING_LEVEL:4]%');

-- Part 4 / Level 5
INSERT INTO practice_sets (skill,part_no,title,instructions,difficulty,is_published)
SELECT 'LISTENING',4,'Part 4 - Độc thoại - Cấp 5','[LISTENING_LEVEL:5] Bộ luyện nghe TOEIC','HARD',1
WHERE NOT EXISTS (SELECT 1 FROM practice_sets WHERE skill='LISTENING' AND part_no=4 AND instructions LIKE '%[LISTENING_LEVEL:5]%');
