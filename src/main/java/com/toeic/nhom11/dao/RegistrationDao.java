package com.toeic.nhom11.dao;

/** Contract DAO: dung JDBC thuần, khong dung JPA. */
public interface RegistrationDao {
    boolean emailExists(String normalizedEmail);
    long createStudent(String normalizedEmail, String passwordHash, String fullName);
}
