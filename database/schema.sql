-- Exact table definitions extracted from team CSDL.docx.
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
