package com.toeic.nhom11.dao;

import com.toeic.nhom11.service.EmailAlreadyUsedException;
import org.springframework.context.annotation.Profile;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Tao users + user_profiles trong CUNG MOT TRANSACTION JDBC.
 * Neu tao profile that bai, tai khoan users se duoc rollback.
 */
@Repository
@Profile("!ui")
public class JdbcRegistrationDao implements RegistrationDao {
    private final DataSource dataSource;

    public JdbcRegistrationDao(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public boolean emailExists(String email) {
        final String sql = "SELECT 1 FROM users WHERE email = ? LIMIT 1";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException ex) {
            throw new DataAccessResourceFailureException("Không thể truy vấn tài khoản.", ex);
        }
    }

    @Override
    public long createStudent(String email, String passwordHash, String fullName) {
        final String insertUser = "INSERT INTO users (email, password_hash, role, status) " +
                "VALUES (?, ?, 'STUDENT', 'ACTIVE')";
        final String insertProfile = "INSERT INTO user_profiles (user_id, full_name) VALUES (?, ?)";

        try (Connection conn = dataSource.getConnection()) {
            conn.setAutoCommit(false);
            try {
                long userId;
                try (PreparedStatement stmt = conn.prepareStatement(insertUser, Statement.RETURN_GENERATED_KEYS)) {
                    stmt.setString(1, email);
                    stmt.setString(2, passwordHash);
                    if (stmt.executeUpdate() != 1) throw new SQLException("Không tạo được tài khoản.");
                    try (ResultSet keys = stmt.getGeneratedKeys()) {
                        if (!keys.next()) throw new SQLException("Không lấy được ID tài khoản mới.");
                        userId = keys.getLong(1);
                    }
                }
                try (PreparedStatement stmt = conn.prepareStatement(insertProfile)) {
                    stmt.setLong(1, userId);
                    stmt.setString(2, fullName);
                    if (stmt.executeUpdate() != 1) throw new SQLException("Không tạo được hồ sơ.");
                }
                conn.commit();
                return userId;
            } catch (SQLException ex) {
                try { conn.rollback(); } catch (SQLException rb) { ex.addSuppressed(rb); }
                throw ex;
            }
        } catch (SQLException ex) {
            // 1062 = MySQL duplicate key. UNIQUE (email) chong race condition.
            if (ex.getErrorCode() == 1062) {
                throw new EmailAlreadyUsedException("Email này đã được đăng ký.");
            }
            throw new DataAccessResourceFailureException("Không thể tạo tài khoản vào MySQL.", ex);
        }
    }
}
