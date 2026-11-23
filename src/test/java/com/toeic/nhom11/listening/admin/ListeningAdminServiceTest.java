package com.toeic.nhom11.listening.admin;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.Map;
import java.util.Optional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ListeningAdminServiceTest {
    private ListeningAdminDao dao;
    private ListeningAdminService service;

    @BeforeEach
    void setup() {
        dao=mock(ListeningAdminDao.class);
        service=new ListeningAdminService(dao,mock(ListeningMediaStore.class));
    }
    private void draft(long id, int attempts) {
        when(dao.set(id)).thenReturn(Optional.of(Map.of(
                "id",id,"part_no",2,"is_published",false,"attempt_count",attempts)));
    }

    @Test
    void partFiveMustNotBeAcceptedForListening() {
        assertThrows(IllegalArgumentException.class,()->service.saveSet(null,5,"Test",null,"EASY","admin@example.com"));
        verifyNoInteractions(dao);
    }
    @Test
    void cannotPublishSetWithoutQuestions() {
        draft(10,0);
        when(dao.count(10,"practice_questions")).thenReturn(0L);
        assertThrows(IllegalArgumentException.class,()->service.publish(10,true));
        verify(dao,never()).publish(anyLong(),anyBoolean());
    }
    @Test
    void cannotPublishSetWithMissingAudioOrIncorrectOptions() {
        draft(10,0);
        when(dao.count(10,"practice_questions")).thenReturn(3L);
        when(dao.countInvalidQuestions(10,2)).thenReturn(1L);
        assertThrows(IllegalArgumentException.class,()->service.publish(10,true));
        verify(dao,never()).publish(anyLong(),anyBoolean());
    }
    @Test
    void validListeningSetCanBePublished() {
        draft(10,0);
        when(dao.count(10,"practice_questions")).thenReturn(3L);
        service.publish(10,true);
        verify(dao).publish(10,true);
    }
    @Test
    void cannotModifySetAfterStudentAttempt() {
        draft(10,1);
        assertThrows(IllegalArgumentException.class,()->service.saveSet(10,2,"Test",null,"MEDIUM","admin@example.com"));
        verify(dao,never()).updateSet(anyLong(),anyInt(),anyString(),any(),anyString());
    }
}
