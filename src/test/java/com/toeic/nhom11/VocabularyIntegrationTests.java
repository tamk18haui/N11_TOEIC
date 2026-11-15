package com.toeic.nhom11;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import javax.sql.DataSource;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Transactional
class VocabularyIntegrationTests {
    @Autowired MockMvc mvc;
    @Autowired JdbcTemplate jdbc;
    @Autowired DataSource dataSource;

    @Test
    void loadsThreeHundredWordsAcrossTenTopicsFromTheIdempotentSeed() {
        assertEquals(10, jdbc.queryForObject("SELECT COUNT(*) FROM vocab_topics", Integer.class));
        assertEquals(300, jdbc.queryForObject("SELECT COUNT(*) FROM vocab_words", Integer.class));
        assertEquals(10, jdbc.queryForObject("""
            SELECT COUNT(*) FROM (
              SELECT topic_id FROM vocab_words GROUP BY topic_id HAVING COUNT(*)=30
            ) topic_counts
            """, Integer.class));
    }

    @Test
    void runningTheVocabularySeedAgainDoesNotDuplicateRows() {
        new ResourceDatabasePopulator(new ClassPathResource("vocab_data.sql")).execute(dataSource);
        assertEquals(10, jdbc.queryForObject("SELECT COUNT(*) FROM vocab_topics", Integer.class));
        assertEquals(300, jdbc.queryForObject("SELECT COUNT(*) FROM vocab_words", Integer.class));
    }

    @Test
    void guestCanSeeTopicsSearchAndTopicWords() throws Exception {
        mvc.perform(get("/vocabulary"))
            .andExpect(status().isOk())
            .andExpect(view().name("vocabulary/index"));

        mvc.perform(get("/vocabulary").param("q", "invoice"))
            .andExpect(status().isOk())
            .andExpect(result -> assertEquals(1,
                ((java.util.List<?>) result.getModelAndView().getModel().get("topics")).size()));

        mvc.perform(get("/vocabulary/1"))
            .andExpect(status().isOk())
            .andExpect(view().name("vocabulary/detail"))
            .andExpect(result -> assertEquals(30,
                ((java.util.List<?>) result.getModelAndView().getModel().get("words")).size()));
    }

    @Test
    void guestCanGetRandomFlashcardButCannotBookmarkIt() throws Exception {
        mvc.perform(get("/vocabulary/flashcard/next"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.word").isNotEmpty())
            .andExpect(jsonPath("$.meaningVi").isNotEmpty());

        mvc.perform(post("/vocabulary/flashcard/1/bookmark").with(csrf()))
            .andExpect(status().is3xxRedirection());
    }

    @Test
    @WithMockUser(username = "student@n11.local", roles = "STUDENT")
    void signedInUserCanBookmarkAWord() throws Exception {
        mvc.perform(post("/vocabulary/flashcard/1/bookmark").with(csrf()))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.saved").value(true));

        assertEquals(1, jdbc.queryForObject(
            "SELECT COUNT(*) FROM user_vocab_progress WHERE user_id=2 AND word_id=1 AND is_bookmarked=true",
            Integer.class));
    }
}
