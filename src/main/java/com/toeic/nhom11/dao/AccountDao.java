package com.toeic.nhom11.dao;

import com.toeic.nhom11.model.Account;
import com.toeic.nhom11.model.AccountPage;

import java.util.Optional;

public interface AccountDao {
    AccountPage search(String query, String role, String status, int page, int size);
    Optional<Account> find(long id);
    Optional<Credentials> credentials(String email);
    boolean activeAdmin(long id);
    long count(String role, String status);
    boolean emailTaken(String email, Long excludeId);
    long insert(String email, String passwordHash, String fullName, String phone, String role);
    int update(long id, String email, String fullName, String phone, String role, String passwordHash);
    int setStatus(long id, String status);

    record Credentials(long id, String passwordHash, String role, String status) {}
}
