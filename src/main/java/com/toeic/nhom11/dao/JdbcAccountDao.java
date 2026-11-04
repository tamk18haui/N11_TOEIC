package com.toeic.nhom11.dao;

import com.toeic.nhom11.model.Account;
import com.toeic.nhom11.model.AccountPage;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/** Chỉ truy vấn có tham số; tuyệt đối không ghép dữ liệu người dùng vào câu SQL. */
@Repository
@Profile("!ui")
public class JdbcAccountDao implements AccountDao {
    private static final DateTimeFormatter DATE = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
    private static final String FROM = " FROM users u LEFT JOIN user_profiles p ON p.user_id = u.id WHERE 1=1";
    private static final RowMapper<Account> ACCOUNT_MAPPER = (rs, index) -> new Account(
            rs.getLong("id"), rs.getString("email"), rs.getString("full_name"),
            rs.getString("phone"), rs.getString("role"), rs.getString("status"),
            rs.getTimestamp("created_at").toLocalDateTime().format(DATE));
    private final JdbcTemplate jdbc;

    public JdbcAccountDao(JdbcTemplate jdbc) { this.jdbc = jdbc; }

    @Override
    public AccountPage search(String query, String role, String status, int requestedPage, int size) {
        StringBuilder where = new StringBuilder(FROM);
        List<Object> args = new ArrayList<>();
        if (!query.isBlank()) {
            where.append(" AND (u.email LIKE ? OR p.full_name LIKE ?)");
            String like = "%" + query + "%";
            args.add(like);
            args.add(like);
        }
        if (!role.isBlank()) { where.append(" AND u.role = ?"); args.add(role); }
        if (!status.isBlank()) { where.append(" AND u.status = ?"); args.add(status); }

        long total = jdbc.queryForObject("SELECT COUNT(*)" + where, Long.class, args.toArray());
        int pages = Math.max(1, (int) Math.ceil(total / (double) size));
        int page = Math.min(Math.max(1, requestedPage), pages);
        List<Object> rowsArgs = new ArrayList<>(args);
        rowsArgs.add(size);
        rowsArgs.add((page - 1) * size);
        List<Account> rows = jdbc.query(
                "SELECT u.id, u.email, u.role, u.status, u.created_at, p.full_name, p.phone"
                        + where + " ORDER BY u.created_at DESC, u.id DESC LIMIT ? OFFSET ?",
                ACCOUNT_MAPPER, rowsArgs.toArray());
        return new AccountPage(rows, page, pages, total);
    }

    @Override
    public Optional<Account> find(long id) {
        return jdbc.query("SELECT u.id, u.email, u.role, u.status, u.created_at, p.full_name, p.phone"
                        + FROM + " AND u.id = ?", ACCOUNT_MAPPER, id).stream().findFirst();
    }

    @Override
    public Optional<Credentials> credentials(String email) {
        return jdbc.query("SELECT id, password_hash, role, status FROM users WHERE email = ?",
                (rs, row) -> new Credentials(rs.getLong("id"), rs.getString("password_hash"),
                        rs.getString("role"), rs.getString("status")), email).stream().findFirst();
    }

    @Override
    public boolean activeAdmin(long id) {
        Integer count = jdbc.queryForObject(
                "SELECT COUNT(*) FROM users WHERE id = ? AND role = 'ADMIN' AND status = 'ACTIVE'",
                Integer.class, id);
        return count != null && count > 0;
    }

    @Override
    public long count(String role, String status) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM users WHERE 1=1");
        List<Object> args = new ArrayList<>();
        if (!role.isBlank()) { sql.append(" AND role = ?"); args.add(role); }
        if (!status.isBlank()) { sql.append(" AND status = ?"); args.add(status); }
        return jdbc.queryForObject(sql.toString(), Long.class, args.toArray());
    }

    @Override
    public boolean emailTaken(String email, Long excludeId) {
        String sql = "SELECT COUNT(*) FROM users WHERE email = ?" + (excludeId == null ? "" : " AND id <> ?");
        Integer count = excludeId == null
                ? jdbc.queryForObject(sql, Integer.class, email)
                : jdbc.queryForObject(sql, Integer.class, email, excludeId);
        return count != null && count > 0;
    }

    @Override
    public long insert(String email, String hash, String fullName, String phone, String role) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        jdbc.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(
                    "INSERT INTO users(email, password_hash, role, status) VALUES (?, ?, ?, 'ACTIVE')",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, email);
            ps.setString(2, hash);
            ps.setString(3, role);
            return ps;
        }, keyHolder);
        if (keyHolder.getKey() == null) throw new IllegalStateException("Không lấy được ID tài khoản.");
        long id = keyHolder.getKey().longValue();
        jdbc.update("INSERT INTO user_profiles(user_id, full_name, phone) VALUES (?, ?, ?)",
                id, fullName, phone);
        return id;
    }

    @Override
    public int update(long id, String email, String fullName, String phone, String role, String hash) {
        int count = hash == null
                ? jdbc.update("UPDATE users SET email = ?, role = ? WHERE id = ?", email, role, id)
                : jdbc.update("UPDATE users SET email = ?, role = ?, password_hash = ? WHERE id = ?",
                        email, role, hash, id);
        if (count == 1) {
            jdbc.update("INSERT INTO user_profiles(user_id, full_name, phone) VALUES (?, ?, ?)"
                    + " ON DUPLICATE KEY UPDATE full_name = VALUES(full_name), phone = VALUES(phone)",
                    id, fullName, phone);
        }
        return count;
    }

    @Override
    public int setStatus(long id, String status) {
        return jdbc.update("UPDATE users SET status = ? WHERE id = ?", status, id);
    }
}
