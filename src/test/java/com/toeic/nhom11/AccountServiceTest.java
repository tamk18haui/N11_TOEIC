package com.toeic.nhom11;

import com.toeic.nhom11.dao.AccountDao;
import com.toeic.nhom11.model.Account;
import com.toeic.nhom11.model.AccountForm;
import com.toeic.nhom11.service.AccountException;
import com.toeic.nhom11.service.AccountService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

/** Kiểm tra quy tắc nghiệp vụ mà không cần MySQL thật. */
class AccountServiceTest {
    private AccountDao dao;
    private AccountService service;

    @BeforeEach
    void setup() {
        dao = mock(AccountDao.class);
        service = new AccountService(dao, new BCryptPasswordEncoder(4));
    }

    @Test
    void createsStudentWithHashedPassword() {
        AccountForm form = validForm();
        when(dao.insert(anyString(), anyString(), anyString(), isNull(), eq("STUDENT")))
                .thenReturn(5L);
        assertEquals(5L, service.create(form));
        verify(dao).insert(eq("test@example.com"), argThat(value -> value.startsWith("$2")),
                eq("Nguyễn Văn An"), isNull(), eq("STUDENT"));
    }

    @Test
    void cannotLockOwnAdminAccount() {
        when(dao.find(1)).thenReturn(Optional.of(admin(1)));
        assertThrows(AccountException.class, () -> service.changeStatus(1, "LOCKED", 1));
        verify(dao, never()).setStatus(anyLong(), anyString());
    }

    @Test
    void cannotDemoteLastActiveAdmin() {
        when(dao.find(1)).thenReturn(Optional.of(admin(1)));
        when(dao.count("ADMIN", "ACTIVE")).thenReturn(1L);
        AccountForm form = validForm();
        assertThrows(AccountException.class, () -> service.update(1, form, 2));
        verify(dao, never()).update(anyLong(), anyString(), anyString(), any(), anyString(), any());
    }

    @Test
    void acceptsOnlyTwoRoles() {
        AccountForm form = validForm();
        form.setRole("TEACHER");
        assertThrows(AccountException.class, () -> service.create(form));
    }

    @Test
    void loginAcceptsBothActiveRoles() {
        var encoder = new BCryptPasswordEncoder(4);
        service = new AccountService(dao, encoder);
        String hash = encoder.encode("Abcdef!12");
        when(dao.credentials("student@example.com"))
                .thenReturn(Optional.of(new AccountDao.Credentials(3L, hash, "STUDENT", "ACTIVE")));
        when(dao.credentials("admin@example.com"))
                .thenReturn(Optional.of(new AccountDao.Credentials(4L, hash, "ADMIN", "ACTIVE")));
        assertEquals("STUDENT", service.authenticate("STUDENT@EXAMPLE.COM", "Abcdef!12").role());
        assertEquals("ADMIN", service.authenticate("admin@example.com", "Abcdef!12").role());
    }

    @Test
    void loginRejectsLockedAccount() {
        when(dao.credentials("locked@example.com"))
                .thenReturn(Optional.of(new AccountDao.Credentials(7L, "invalid", "ADMIN", "LOCKED")));
        assertNull(service.authenticate("locked@example.com", "Abcdef!12"));
    }

    private Account admin(long id) {
        return new Account(id, "admin@example.com", "Quản trị hệ thống", null,
                "ADMIN", "ACTIVE", "01/01/2026 08:00");
    }

    private AccountForm validForm() {
        AccountForm form = new AccountForm();
        form.setEmail("TEST@EXAMPLE.COM");
        form.setFullName("Nguyễn Văn An");
        form.setPassword("Abcdef!12");
        form.setRole("STUDENT");
        return form;
    }
}
