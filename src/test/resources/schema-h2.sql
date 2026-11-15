CREATE TABLE IF NOT EXISTS `users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(191) NOT NULL,
  `password_hash` VARCHAR(255) NOT NULL,
  `role` ENUM('STUDENT','ADMIN') NOT NULL DEFAULT 'STUDENT',
  `status` ENUM('ACTIVE','LOCKED') NOT NULL DEFAULT 'ACTIVE',
  `last_login_at` DATETIME NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE (`email`)
);

CREATE TABLE IF NOT EXISTS `grammar_topics` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(180) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `sort_order` INT NOT NULL DEFAULT 0,
  `is_published` BOOLEAN NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE (`title`)
);

CREATE TABLE IF NOT EXISTS `grammar_lessons` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `topic_id` BIGINT NOT NULL,
  `title` VARCHAR(200) NOT NULL,
  `content_html` LONGTEXT NOT NULL,
  `level` ENUM('BASIC','INTERMEDIATE','ADVANCED') NOT NULL DEFAULT 'BASIC',
  `sort_order` INT NOT NULL DEFAULT 0,
  `is_published` BOOLEAN NOT NULL DEFAULT 0,
  `created_by` BIGINT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_grammar_lessons_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `grammar_topics` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_grammar_lessons_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `grammar_questions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `lesson_id` BIGINT NOT NULL,
  `question_text` TEXT NOT NULL,
  `explanation` TEXT NULL DEFAULT NULL,
  `difficulty` TINYINT NOT NULL DEFAULT 1,
  `sort_order` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_grammar_questions_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `grammar_lessons` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_grammar_difficulty` CHECK (`difficulty` BETWEEN 1 AND 3)
);

CREATE TABLE IF NOT EXISTS `grammar_options` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `question_id` BIGINT NOT NULL,
  `option_label` CHAR(1) NOT NULL,
  `option_text` TEXT NOT NULL,
  `is_correct` BOOLEAN NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE (`question_id`, `option_label`),
  CONSTRAINT `fk_grammar_options_question_id` FOREIGN KEY (`question_id`) REFERENCES `grammar_questions` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `grammar_attempts` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT NOT NULL,
  `lesson_id` BIGINT NOT NULL,
  `correct_count` SMALLINT NOT NULL DEFAULT 0,
  `total_questions` SMALLINT NOT NULL DEFAULT 0,
  `score_percent` DECIMAL(5,2) NOT NULL DEFAULT 0.00,
  `submitted_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_grammar_attempts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_grammar_attempts_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `grammar_lessons` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_grammar_attempts_score` CHECK (`score_percent` BETWEEN 0 AND 100)
);

CREATE TABLE IF NOT EXISTS `grammar_attempt_answers` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `attempt_id` BIGINT NOT NULL,
  `question_id` BIGINT NOT NULL,
  `selected_option_id` BIGINT NULL DEFAULT NULL,
  `is_correct` BOOLEAN NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE (`attempt_id`, `question_id`),
  CONSTRAINT `fk_grammar_attempt_answers_attempt_id` FOREIGN KEY (`attempt_id`) REFERENCES `grammar_attempts` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_grammar_attempt_answers_question_id` FOREIGN KEY (`question_id`) REFERENCES `grammar_questions` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_grammar_attempt_answers_selected_option_id` FOREIGN KEY (`selected_option_id`) REFERENCES `grammar_options` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `vocab_topics` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(180) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `level` VARCHAR(16) NOT NULL DEFAULT 'BASIC',
  `display_order` INT NOT NULL DEFAULT 0,
  `is_published` BOOLEAN NOT NULL DEFAULT FALSE,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `uq_vocab_topics_title` UNIQUE (`title`),
  CONSTRAINT `chk_vocab_topics_level` CHECK (`level` IN ('BASIC','INTERMEDIATE','ADVANCED')),
  CONSTRAINT `chk_vocab_topics_display_order` CHECK (`display_order` >= 0)
);

CREATE TABLE IF NOT EXISTS `vocab_words` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `topic_id` BIGINT NOT NULL,
  `word` VARCHAR(160) NOT NULL,
  `phonetic` VARCHAR(160) NULL DEFAULT NULL,
  `part_of_speech` VARCHAR(32) NULL DEFAULT NULL,
  `meaning_vi` VARCHAR(500) NOT NULL,
  `definition_en` TEXT NULL DEFAULT NULL,
  `example_sentence` TEXT NULL DEFAULT NULL,
  `example_meaning` TEXT NULL DEFAULT NULL,
  `audio_url` VARCHAR(700) NULL DEFAULT NULL,
  `image_url` VARCHAR(700) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `uq_vocab_words_topic_word` UNIQUE (`topic_id`, `word`),
  CONSTRAINT `fk_vocab_words_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `vocab_topics` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `user_vocab_progress` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT NOT NULL,
  `word_id` BIGINT NOT NULL,
  `status` VARCHAR(16) NOT NULL DEFAULT 'NEW',
  `is_bookmarked` BOOLEAN NOT NULL DEFAULT FALSE,
  `review_count` INT NOT NULL DEFAULT 0,
  `last_reviewed_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `uq_user_vocab_progress_user_word` UNIQUE (`user_id`, `word_id`),
  CONSTRAINT `fk_user_vocab_progress_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_user_vocab_progress_word_id` FOREIGN KEY (`word_id`) REFERENCES `vocab_words` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_user_vocab_progress_status` CHECK (`status` IN ('NEW','LEARNING','MASTERED')),
  CONSTRAINT `chk_user_vocab_progress_review_count` CHECK (`review_count` >= 0)
);

CREATE TABLE IF NOT EXISTS `vocab_quiz_attempts` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT NOT NULL,
  `topic_id` BIGINT NOT NULL,
  `question_count` SMALLINT NOT NULL DEFAULT 0,
  `correct_count` SMALLINT NOT NULL DEFAULT 0,
  `score_percent` DECIMAL(5,2) NOT NULL DEFAULT 0.00,
  `submitted_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_vocab_quiz_attempts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_vocab_quiz_attempts_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `vocab_topics` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_vocab_quiz_attempts_counts` CHECK (`question_count` >= 0 AND `correct_count` >= 0 AND `correct_count` <= `question_count`),
  CONSTRAINT `chk_vocab_quiz_attempts_score` CHECK (`score_percent` BETWEEN 0 AND 100)
);

CREATE TABLE IF NOT EXISTS `vocab_quiz_attempt_answers` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `attempt_id` BIGINT NOT NULL,
  `question_no` SMALLINT NOT NULL,
  `question_type` VARCHAR(24) NOT NULL,
  `word_id` BIGINT NOT NULL,
  `selected_word_id` BIGINT NULL DEFAULT NULL,
  `is_correct` BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`id`),
  CONSTRAINT `uq_vocab_quiz_answers_attempt_question` UNIQUE (`attempt_id`, `question_no`),
  CONSTRAINT `fk_vocab_quiz_answers_attempt_id` FOREIGN KEY (`attempt_id`) REFERENCES `vocab_quiz_attempts` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_vocab_quiz_answers_word_id` FOREIGN KEY (`word_id`) REFERENCES `vocab_words` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_vocab_quiz_answers_selected_word_id` FOREIGN KEY (`selected_word_id`) REFERENCES `vocab_words` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `chk_vocab_quiz_answers_question_no` CHECK (`question_no` > 0),
  CONSTRAINT `chk_vocab_quiz_answers_question_type` CHECK (`question_type` IN ('WORD_TO_MEANING','MEANING_TO_WORD','FILL_IN_BLANK'))
);
CREATE TABLE IF NOT EXISTS `user_profiles` (
  `user_id` BIGINT NOT NULL,
  `full_name` VARCHAR(120) NOT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `avatar_url` VARCHAR(500) NULL DEFAULT NULL,
  `target_toeic_score` SMALLINT NULL DEFAULT NULL,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_profiles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);
