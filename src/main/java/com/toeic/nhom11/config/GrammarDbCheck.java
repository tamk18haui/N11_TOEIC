package com.toeic.nhom11.config;

import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

@Configuration
public class GrammarDbCheck {

    @Bean
    ApplicationRunner reportGrammarDatabase(JdbcTemplate jdbc) {
        return args -> {
            var server = jdbc.queryForMap(
                "SELECT DATABASE() AS db, " +
                "@@hostname AS host, " +
                "@@port AS port, " +
                "@@server_uuid AS uuid"
            );

            var counts = jdbc.queryForMap(
                "SELECT " +
                "(SELECT COUNT(*) FROM grammar_topics) AS topics, " +
                "(SELECT COUNT(*) FROM grammar_lessons) AS lessons, " +
                "(SELECT COUNT(*) FROM grammar_lessons l " +
                " JOIN grammar_topics t ON t.id=l.topic_id " +
                " WHERE l.is_published=1 " +
                " AND t.is_published=1) AS visible_lessons"
            );

            System.out.println("========== GRAMMAR DB CHECK ==========");
            System.out.println("SERVER: " + server);
            System.out.println("COUNTS: " + counts);
            System.out.println("======================================");
        };
    }
}