-- Team CSDL.docx schema plus optional demo seed; import into an empty database.
-- N11 TOEIC / MySQL 8.0+ / Java Spring Boot + JSP + JDBC/DAO
-- Thiet ke theo Word: Thiet_ke_CSDL_TOEIC_Nhom11_Cap_nhat.docx
-- 31 bang, 53 khoa ngoai. KHONG co Speaking / Writing.
-- BAN SUA LOI 3823: Da bo CHECK chk_study_plan_item_target khoi study_plan_items.
-- Service Java can kiem tra item_type ung voi DUNG MOT cot tham chieu != NULL.
-- Chay lai tren database da tao do: CREATE TABLE IF NOT EXISTS KHONG XOA DU LIEU.
-- An toan: KHONG DROP DATABASE, KHONG DROP TABLE, KHONG xoa du lieu.
-- Luu y: CREATE TABLE IF NOT EXISTS khong tu dong cap nhat bang da ton tai.
-- Quyen: chi STUDENT va ADMIN. Quen mat khau qua token la chuc nang mo rong.
SET NAMES utf8mb4;
CREATE DATABASE IF NOT EXISTS `n11_toeic` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `n11_toeic`;
SET time_zone = '+00:00';
-- A. Tài khoản & xác thực / Tài khoản người dùng
-- BANG 01: users (nhom Ưu tiên 1)
CREATE TABLE IF NOT EXISTS `users` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(191) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `role` ENUM('STUDENT','ADMIN') NOT NULL DEFAULT 'STUDENT',
  `status` ENUM('ACTIVE','LOCKED') NOT NULL DEFAULT 'ACTIVE',
  `last_login_at` DATETIME NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_users_email` (`email`),
  KEY `idx_users_role` (`role`),
  KEY `idx_users_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- A. Tài khoản & xác thực / Hồ sơ người dùng
-- BANG 02: user_profiles (nhom Ưu tiên 1)
CREATE TABLE IF NOT EXISTS `user_profiles` (
  `user_id` BIGINT UNSIGNED NOT NULL,
  `full_name` VARCHAR(120) NOT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `avatar_url` VARCHAR(500) NULL DEFAULT NULL,
  `target_toeic_score` SMALLINT UNSIGNED NULL DEFAULT NULL,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_profiles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- A. Tài khoản & xác thực / Mã đặt lại mật khẩu
-- BANG 03: password_reset_tokens (nhom Mở rộng)
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `token_hash` VARCHAR(255) NOT NULL,
  `expires_at` DATETIME NOT NULL,
  `used_at` DATETIME NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_password_reset_tokens_token_hash` (`token_hash`),
  KEY `idx_password_reset_tokens_user_id` (`user_id`),
  KEY `idx_password_reset_tokens_expires_at` (`expires_at`),
  CONSTRAINT `fk_password_reset_tokens_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- B. Tệp & học liệu / Tệp âm thanh và hình ảnh
-- BANG 04: media_assets (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `media_assets` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `media_type` ENUM('AUDIO','IMAGE','OTHER') NOT NULL,
  `file_url` VARCHAR(700) NOT NULL,
  `mime_type` VARCHAR(100) NOT NULL,
  `duration_seconds` INT UNSIGNED NULL DEFAULT NULL,
  `created_by` BIGINT UNSIGNED NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_media_assets_media_type` (`media_type`),
  CONSTRAINT `fk_media_assets_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- C. Học từ vựng / Chủ đề từ vựng
-- BANG 05: vocabulary_topics (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `vocabulary_topics` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(180) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `level` ENUM('BASIC','INTERMEDIATE','ADVANCED') NOT NULL DEFAULT 'BASIC',
  `sort_order` INT UNSIGNED NOT NULL DEFAULT 0,
  `is_published` BOOLEAN NOT NULL DEFAULT 0,
  `created_by` BIGINT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vocabulary_topics_level` (`level`),
  KEY `idx_vocabulary_topics_is_published` (`is_published`),
  CONSTRAINT `fk_vocabulary_topics_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- C. Học từ vựng / Từ vựng
-- BANG 06: vocabulary_terms (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `vocabulary_terms` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `topic_id` BIGINT UNSIGNED NOT NULL,
  `word` VARCHAR(160) NOT NULL,
  `ipa` VARCHAR(160) NULL DEFAULT NULL,
  `meaning_vi` VARCHAR(500) NOT NULL,
  `definition_en` TEXT NULL DEFAULT NULL,
  `example_en` TEXT NULL DEFAULT NULL,
  `example_vi` TEXT NULL DEFAULT NULL,
  `audio_media_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_vocabulary_terms_topic_id_word` (`topic_id`, `word`),
  KEY `idx_vocabulary_terms_word` (`word`),
  CONSTRAINT `fk_vocabulary_terms_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `vocabulary_topics` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_vocabulary_terms_audio_media_id` FOREIGN KEY (`audio_media_id`) REFERENCES `media_assets` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- C. Học từ vựng / Tiến độ từng từ
-- BANG 07: user_vocabulary_progress (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `user_vocabulary_progress` (
  `user_id` BIGINT UNSIGNED NOT NULL,
  `term_id` BIGINT UNSIGNED NOT NULL,
  `learning_status` ENUM('NEW','LEARNING','MASTERED') NOT NULL DEFAULT 'NEW',
  `is_favorite` BOOLEAN NOT NULL DEFAULT 0,
  `review_count` INT UNSIGNED NOT NULL DEFAULT 0,
  `next_review_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`, `term_id`),
  KEY `idx_user_vocabulary_progress_learning_status` (`learning_status`),
  KEY `idx_user_vocabulary_progress_is_favorite` (`is_favorite`),
  KEY `idx_user_vocabulary_progress_next_review_at` (`next_review_at`),
  CONSTRAINT `fk_user_vocabulary_progress_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_user_vocabulary_progress_term_id` FOREIGN KEY (`term_id`) REFERENCES `vocabulary_terms` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- C. Học từ vựng / Lượt kiểm tra từ vựng
-- BANG 08: vocabulary_quiz_attempts (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `vocabulary_quiz_attempts` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `topic_id` BIGINT UNSIGNED NOT NULL,
  `question_count` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `correct_count` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `submitted_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_vocabulary_quiz_attempts_user_id` (`user_id`),
  KEY `idx_vocabulary_quiz_attempts_topic_id` (`topic_id`),
  KEY `idx_vocabulary_quiz_attempts_submitted_at` (`submitted_at`),
  CONSTRAINT `fk_vocabulary_quiz_attempts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_vocabulary_quiz_attempts_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `vocabulary_topics` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- C. Học từ vựng / Câu trả lời kiểm tra từ vựng
-- BANG 09: vocabulary_quiz_answers (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `vocabulary_quiz_answers` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `attempt_id` BIGINT UNSIGNED NOT NULL,
  `term_id` BIGINT UNSIGNED NOT NULL,
  `selected_term_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `is_correct` BOOLEAN NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_vocabulary_quiz_answers_attempt_id_term_id` (`attempt_id`, `term_id`),
  CONSTRAINT `fk_vocabulary_quiz_answers_attempt_id` FOREIGN KEY (`attempt_id`) REFERENCES `vocabulary_quiz_attempts` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_vocabulary_quiz_answers_term_id` FOREIGN KEY (`term_id`) REFERENCES `vocabulary_terms` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_vocabulary_quiz_answers_selected_term_id` FOREIGN KEY (`selected_term_id`) REFERENCES `vocabulary_terms` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- D. Học ngữ pháp / Chủ đề ngữ pháp
-- BANG 10: grammar_topics (nhom Ưu tiên 1)
CREATE TABLE IF NOT EXISTS `grammar_topics` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(180) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `sort_order` INT UNSIGNED NOT NULL DEFAULT 0,
  `is_published` BOOLEAN NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_grammar_topics_title` (`title`),
  KEY `idx_grammar_topics_is_published` (`is_published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- D. Học ngữ pháp / Bài học ngữ pháp
-- BANG 11: grammar_lessons (nhom Ưu tiên 1)
CREATE TABLE IF NOT EXISTS `grammar_lessons` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `topic_id` BIGINT UNSIGNED NOT NULL,
  `title` VARCHAR(200) NOT NULL,
  `content_html` LONGTEXT NOT NULL,
  `level` ENUM('BASIC','INTERMEDIATE','ADVANCED') NOT NULL DEFAULT 'BASIC',
  `sort_order` INT UNSIGNED NOT NULL DEFAULT 0,
  `is_published` BOOLEAN NOT NULL DEFAULT 0,
  `created_by` BIGINT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_grammar_lessons_topic_id` (`topic_id`),
  KEY `idx_grammar_lessons_level` (`level`),
  KEY `idx_grammar_lessons_is_published` (`is_published`),
  CONSTRAINT `fk_grammar_lessons_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `grammar_topics` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_grammar_lessons_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- D. Học ngữ pháp / Câu hỏi ngữ pháp
-- BANG 12: grammar_questions (nhom Ưu tiên 1)
CREATE TABLE IF NOT EXISTS `grammar_questions` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lesson_id` BIGINT UNSIGNED NOT NULL,
  `question_text` TEXT NOT NULL,
  `explanation` TEXT NULL DEFAULT NULL,
  `difficulty` TINYINT UNSIGNED NOT NULL DEFAULT 1,
  `sort_order` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_grammar_questions_lesson_id` (`lesson_id`),
  KEY `idx_grammar_questions_difficulty` (`difficulty`),
  CONSTRAINT `fk_grammar_questions_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `grammar_lessons` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_grammar_difficulty` CHECK (`difficulty` BETWEEN 1 AND 3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- D. Học ngữ pháp / Đáp án câu hỏi ngữ pháp
-- BANG 13: grammar_options (nhom Ưu tiên 1)
CREATE TABLE IF NOT EXISTS `grammar_options` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_id` BIGINT UNSIGNED NOT NULL,
  `option_label` CHAR(1) NOT NULL,
  `option_text` TEXT NOT NULL,
  `is_correct` BOOLEAN NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_grammar_options_question_id_option_label` (`question_id`, `option_label`),
  CONSTRAINT `fk_grammar_options_question_id` FOREIGN KEY (`question_id`) REFERENCES `grammar_questions` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- D. Học ngữ pháp / Lượt làm bài ngữ pháp
-- BANG 14: grammar_attempts (nhom Ưu tiên 1)
CREATE TABLE IF NOT EXISTS `grammar_attempts` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `lesson_id` BIGINT UNSIGNED NOT NULL,
  `correct_count` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `total_questions` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `score_percent` DECIMAL(5,2) NOT NULL DEFAULT 0.00,
  `submitted_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_grammar_attempts_user_id` (`user_id`),
  KEY `idx_grammar_attempts_lesson_id` (`lesson_id`),
  KEY `idx_grammar_attempts_submitted_at` (`submitted_at`),
  CONSTRAINT `fk_grammar_attempts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_grammar_attempts_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `grammar_lessons` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_grammar_attempts_score` CHECK (`score_percent` BETWEEN 0 AND 100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- D. Học ngữ pháp / Chi tiết trả lời ngữ pháp
-- BANG 15: grammar_attempt_answers (nhom Ưu tiên 1)
CREATE TABLE IF NOT EXISTS `grammar_attempt_answers` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `attempt_id` BIGINT UNSIGNED NOT NULL,
  `question_id` BIGINT UNSIGNED NOT NULL,
  `selected_option_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `is_correct` BOOLEAN NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_grammar_attempt_answers_attempt_id_question_id` (`attempt_id`, `question_id`),
  CONSTRAINT `fk_grammar_attempt_answers_attempt_id` FOREIGN KEY (`attempt_id`) REFERENCES `grammar_attempts` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_grammar_attempt_answers_question_id` FOREIGN KEY (`question_id`) REFERENCES `grammar_questions` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_grammar_attempt_answers_selected_option_id` FOREIGN KEY (`selected_option_id`) REFERENCES `grammar_options` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- E. Luyện Listening / Reading / Bộ bài luyện theo Part
-- BANG 16: practice_sets (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `practice_sets` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `skill` ENUM('LISTENING','READING') NOT NULL,
  `part_no` TINYINT UNSIGNED NOT NULL,
  `title` VARCHAR(200) NOT NULL,
  `instructions` TEXT NULL DEFAULT NULL,
  `difficulty` ENUM('EASY','MEDIUM','HARD') NOT NULL DEFAULT 'MEDIUM',
  `is_published` BOOLEAN NOT NULL DEFAULT 0,
  `created_by` BIGINT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_practice_sets_skill` (`skill`),
  KEY `idx_practice_sets_part_no` (`part_no`),
  KEY `idx_practice_sets_difficulty` (`difficulty`),
  KEY `idx_practice_sets_is_published` (`is_published`),
  CONSTRAINT `fk_practice_sets_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `chk_practice_skill_part` CHECK ((`skill`='LISTENING' AND `part_no` BETWEEN 1 AND 4) OR (`skill`='READING' AND `part_no` BETWEEN 5 AND 7))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- E. Luyện Listening / Reading / Đoạn nghe/đọc hoặc ảnh ngữ cảnh
-- BANG 17: practice_passages (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `practice_passages` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `practice_set_id` BIGINT UNSIGNED NOT NULL,
  `passage_text` LONGTEXT NULL DEFAULT NULL,
  `audio_media_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `image_media_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `sort_order` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_practice_passages_practice_set_id` (`practice_set_id`),
  CONSTRAINT `fk_practice_passages_practice_set_id` FOREIGN KEY (`practice_set_id`) REFERENCES `practice_sets` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_practice_passages_audio_media_id` FOREIGN KEY (`audio_media_id`) REFERENCES `media_assets` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_practice_passages_image_media_id` FOREIGN KEY (`image_media_id`) REFERENCES `media_assets` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- E. Luyện Listening / Reading / Ngân hàng câu hỏi L/R
-- BANG 18: practice_questions (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `practice_questions` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `practice_set_id` BIGINT UNSIGNED NOT NULL,
  `passage_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `question_text` TEXT NOT NULL,
  `explanation` TEXT NULL DEFAULT NULL,
  `audio_media_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `image_media_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `sort_order` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_practice_questions_practice_set_id` (`practice_set_id`),
  CONSTRAINT `fk_practice_questions_practice_set_id` FOREIGN KEY (`practice_set_id`) REFERENCES `practice_sets` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_practice_questions_passage_id` FOREIGN KEY (`passage_id`) REFERENCES `practice_passages` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_practice_questions_audio_media_id` FOREIGN KEY (`audio_media_id`) REFERENCES `media_assets` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_practice_questions_image_media_id` FOREIGN KEY (`image_media_id`) REFERENCES `media_assets` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- E. Luyện Listening / Reading / Lựa chọn A/B/C/D
-- BANG 19: practice_options (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `practice_options` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_id` BIGINT UNSIGNED NOT NULL,
  `option_label` CHAR(1) NOT NULL,
  `option_text` TEXT NOT NULL,
  `is_correct` BOOLEAN NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_practice_options_question_id_option_label` (`question_id`, `option_label`),
  CONSTRAINT `fk_practice_options_question_id` FOREIGN KEY (`question_id`) REFERENCES `practice_questions` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- E. Luyện Listening / Reading / Lượt làm bài luyện L/R
-- BANG 20: practice_attempts (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `practice_attempts` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `practice_set_id` BIGINT UNSIGNED NOT NULL,
  `correct_count` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `total_questions` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `score_percent` DECIMAL(5,2) NOT NULL DEFAULT 0.00,
  `started_at` DATETIME NOT NULL,
  `submitted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_practice_attempts_user_id` (`user_id`),
  KEY `idx_practice_attempts_practice_set_id` (`practice_set_id`),
  KEY `idx_practice_attempts_submitted_at` (`submitted_at`),
  CONSTRAINT `fk_practice_attempts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_practice_attempts_practice_set_id` FOREIGN KEY (`practice_set_id`) REFERENCES `practice_sets` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_practice_attempts_score` CHECK (`score_percent` BETWEEN 0 AND 100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- E. Luyện Listening / Reading / Chi tiết trả lời bài luyện L/R
-- BANG 21: practice_attempt_answers (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `practice_attempt_answers` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `attempt_id` BIGINT UNSIGNED NOT NULL,
  `question_id` BIGINT UNSIGNED NOT NULL,
  `selected_option_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `is_correct` BOOLEAN NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_practice_attempt_answers_attempt_id_question_id` (`attempt_id`, `question_id`),
  CONSTRAINT `fk_practice_attempt_answers_attempt_id` FOREIGN KEY (`attempt_id`) REFERENCES `practice_attempts` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_practice_attempt_answers_question_id` FOREIGN KEY (`question_id`) REFERENCES `practice_questions` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_practice_attempt_answers_selected_option_id` FOREIGN KEY (`selected_option_id`) REFERENCES `practice_options` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- F. Thi thử TOEIC / Đề thi thử
-- BANG 22: exam_papers (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `exam_papers` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(220) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `exam_type` ENUM('LR_FULL','LR_CUSTOM') NOT NULL,
  `duration_minutes` SMALLINT UNSIGNED NOT NULL,
  `is_published` BOOLEAN NOT NULL DEFAULT 0,
  `created_by` BIGINT UNSIGNED NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_exam_papers_exam_type` (`exam_type`),
  KEY `idx_exam_papers_is_published` (`is_published`),
  CONSTRAINT `fk_exam_papers_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- F. Thi thử TOEIC / Câu hỏi nằm trong đề thi
-- BANG 23: exam_paper_questions (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `exam_paper_questions` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `exam_paper_id` BIGINT UNSIGNED NOT NULL,
  `question_id` BIGINT UNSIGNED NOT NULL,
  `question_order` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_exam_paper_questions_exam_paper_id_question_order` (`exam_paper_id`, `question_order`),
  UNIQUE KEY `uq_exam_paper_questions_exam_paper_id_question_id` (`exam_paper_id`, `question_id`),
  CONSTRAINT `fk_exam_paper_questions_exam_paper_id` FOREIGN KEY (`exam_paper_id`) REFERENCES `exam_papers` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_exam_paper_questions_question_id` FOREIGN KEY (`question_id`) REFERENCES `practice_questions` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- F. Thi thử TOEIC / Lượt thi thử
-- BANG 24: exam_attempts (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `exam_attempts` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `exam_paper_id` BIGINT UNSIGNED NOT NULL,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `status` ENUM('IN_PROGRESS','SUBMITTED','EXPIRED') NOT NULL DEFAULT 'IN_PROGRESS',
  `started_at` DATETIME NOT NULL,
  `submitted_at` DATETIME NULL DEFAULT NULL,
  `listening_correct` SMALLINT UNSIGNED NULL DEFAULT NULL,
  `reading_correct` SMALLINT UNSIGNED NULL DEFAULT NULL,
  `listening_scaled` SMALLINT UNSIGNED NULL DEFAULT NULL,
  `reading_scaled` SMALLINT UNSIGNED NULL DEFAULT NULL,
  `total_scaled` SMALLINT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_exam_attempts_exam_paper_id` (`exam_paper_id`),
  KEY `idx_exam_attempts_user_id` (`user_id`),
  KEY `idx_exam_attempts_status` (`status`),
  CONSTRAINT `fk_exam_attempts_exam_paper_id` FOREIGN KEY (`exam_paper_id`) REFERENCES `exam_papers` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_exam_attempts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- F. Thi thử TOEIC / Đáp án đã chọn trong lượt thi
-- BANG 25: exam_attempt_answers (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `exam_attempt_answers` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `attempt_id` BIGINT UNSIGNED NOT NULL,
  `exam_paper_question_id` BIGINT UNSIGNED NOT NULL,
  `selected_option_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `is_correct` BOOLEAN NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_exam_attempt_answers_attempt_id_exam_paper_question_id` (`attempt_id`, `exam_paper_question_id`),
  CONSTRAINT `fk_exam_attempt_answers_attempt_id` FOREIGN KEY (`attempt_id`) REFERENCES `exam_attempts` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_exam_attempt_answers_exam_paper_question_id` FOREIGN KEY (`exam_paper_question_id`) REFERENCES `exam_paper_questions` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_exam_attempt_answers_selected_option_id` FOREIGN KEY (`selected_option_id`) REFERENCES `practice_options` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- F. Thi thử TOEIC / Thang quy đổi điểm thi thử
-- BANG 26: exam_score_scales (nhom Giai đoạn 2)
CREATE TABLE IF NOT EXISTS `exam_score_scales` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `exam_paper_id` BIGINT UNSIGNED NOT NULL,
  `skill` ENUM('LISTENING','READING') NOT NULL,
  `raw_correct` SMALLINT UNSIGNED NOT NULL,
  `scaled_score` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_exam_score_scales_exam_paper_id_skill_raw_correct` (`exam_paper_id`, `skill`, `raw_correct`),
  CONSTRAINT `fk_exam_score_scales_exam_paper_id` FOREIGN KEY (`exam_paper_id`) REFERENCES `exam_papers` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- G. Lộ trình học / Lộ trình học cá nhân
-- BANG 27: study_plans (nhom Giai đoạn 3)
CREATE TABLE IF NOT EXISTS `study_plans` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `title` VARCHAR(200) NOT NULL,
  `target_score` SMALLINT UNSIGNED NULL DEFAULT NULL,
  `start_date` DATE NOT NULL,
  `target_date` DATE NULL DEFAULT NULL,
  `status` ENUM('ACTIVE','COMPLETED','ARCHIVED') NOT NULL DEFAULT 'ACTIVE',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_study_plans_user_id` (`user_id`),
  KEY `idx_study_plans_status` (`status`),
  CONSTRAINT `fk_study_plans_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- G. Lộ trình học / Nhiệm vụ trong lộ trình
-- BANG 28: study_plan_items (nhom Giai đoạn 3)
CREATE TABLE IF NOT EXISTS `study_plan_items` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `plan_id` BIGINT UNSIGNED NOT NULL,
  `item_type` ENUM('VOCAB_TOPIC','GRAMMAR_LESSON','PRACTICE_SET','EXAM') NOT NULL,
  `vocabulary_topic_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `grammar_lesson_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `practice_set_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `exam_paper_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `item_order` INT UNSIGNED NOT NULL DEFAULT 0,
  `due_date` DATE NULL DEFAULT NULL,
  `is_completed` BOOLEAN NOT NULL DEFAULT 0,
  `completed_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_study_plan_items_plan_id` (`plan_id`),
  KEY `idx_study_plan_items_is_completed` (`is_completed`),
  CONSTRAINT `fk_study_plan_items_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `study_plans` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_study_plan_items_vocabulary_topic_id` FOREIGN KEY (`vocabulary_topic_id`) REFERENCES `vocabulary_topics` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_study_plan_items_grammar_lesson_id` FOREIGN KEY (`grammar_lesson_id`) REFERENCES `grammar_lessons` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_study_plan_items_practice_set_id` FOREIGN KEY (`practice_set_id`) REFERENCES `practice_sets` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_study_plan_items_exam_paper_id` FOREIGN KEY (`exam_paper_id`) REFERENCES `exam_papers` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- H. Tiến độ học tập / Ảnh chụp tiến độ theo ngày
-- BANG 29: user_progress_snapshots (nhom Giai đoạn 3)
CREATE TABLE IF NOT EXISTS `user_progress_snapshots` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  `snapshot_date` DATE NOT NULL,
  `mastered_terms` INT UNSIGNED NOT NULL DEFAULT 0,
  `grammar_completed` INT UNSIGNED NOT NULL DEFAULT 0,
  `listening_accuracy` DECIMAL(5,2) NULL DEFAULT NULL,
  `reading_accuracy` DECIMAL(5,2) NULL DEFAULT NULL,
  `latest_mock_score` SMALLINT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_progress_snapshots_user_id_snapshot_date` (`user_id`, `snapshot_date`),
  KEY `idx_user_progress_snapshots_snapshot_date` (`snapshot_date`),
  CONSTRAINT `fk_user_progress_snapshots_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- I. Nhật ký quản trị / Nhật ký thao tác Admin
-- BANG 30: admin_audit_logs (nhom Giai đoạn 3)
CREATE TABLE IF NOT EXISTS `admin_audit_logs` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_user_id` BIGINT UNSIGNED NOT NULL,
  `action` VARCHAR(80) NOT NULL,
  `entity_type` VARCHAR(80) NOT NULL,
  `entity_id` BIGINT UNSIGNED NULL DEFAULT NULL,
  `detail_json` JSON NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_admin_audit_logs_admin_user_id` (`admin_user_id`),
  KEY `idx_admin_audit_logs_action` (`action`),
  KEY `idx_admin_audit_logs_created_at` (`created_at`),
  CONSTRAINT `fk_admin_audit_logs_admin_user_id` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- J. Dashboard thống kê Admin / Thống kê tổng hợp theo ngày cho Admin
-- BANG 31: admin_dashboard_daily_stats (nhom Giai đoạn 3)
CREATE TABLE IF NOT EXISTS `admin_dashboard_daily_stats` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `stat_date` DATE NOT NULL,
  `total_students` INT UNSIGNED NOT NULL DEFAULT 0,
  `new_students` INT UNSIGNED NOT NULL DEFAULT 0,
  `active_students` INT UNSIGNED NOT NULL DEFAULT 0,
  `grammar_attempts` INT UNSIGNED NOT NULL DEFAULT 0,
  `listening_attempts` INT UNSIGNED NOT NULL DEFAULT 0,
  `reading_attempts` INT UNSIGNED NOT NULL DEFAULT 0,
  `submitted_exams` INT UNSIGNED NOT NULL DEFAULT 0,
  `avg_mock_score` DECIMAL(6,2) NULL DEFAULT NULL,
  `generated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_admin_dashboard_daily_stats_stat_date` (`stat_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- ----------------------------------------------------------------------
-- GHI CHU RANG BUOC study_plan_items:
--  item_type = VOCAB_TOPIC     => vocabulary_topic_id != NULL, cac cot con lai NULL
--  item_type = GRAMMAR_LESSON  => grammar_lesson_id != NULL, cac cot con lai NULL
--  item_type = PRACTICE_SET    => practice_set_id != NULL, cac cot con lai NULL
--  item_type = EXAM            => exam_paper_id != NULL, cac cot con lai NULL
-- Rule nay kiem tra tai Service/DAO khi tao/sua lộ trình.
-- ----------------------------------------------------------------------
-- Xem danh sach cac bang da tao:
-- SHOW TABLES;
-- SELECT COUNT(*) AS so_bang FROM information_schema.tables WHERE table_schema = DATABASE() AND table_type = 'BASE TABLE';
-- Quan tri: tai khoan moi mac dinh STUDENT; chi nang ADMIN sau khi xac minh dung nguoi:
-- UPDATE users SET role='ADMIN' WHERE email='email-admin-cua-ban@example.com';
-- KIEM TRA SAU KHI CHAY (khong thay doi du lieu)
SELECT COUNT(*) AS so_bang
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'n11_toeic' AND TABLE_TYPE = 'BASE TABLE';
SELECT COUNT(*) AS so_khoa_ngoai
FROM information_schema.REFERENTIAL_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'n11_toeic';

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
