package com.toeic.nhom11.service;

import com.toeic.nhom11.dao.AccountDao;
import com.toeic.nhom11.model.Account;
import com.toeic.nhom11.model.AccountForm;
import com.toeic.nhom11.model.AccountPage;
import org.springframework.context.annotation.Profile;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.nio.charset.StandardCharsets;
import java.util.Locale;
import java.util.regex.Pattern;

/** Quy tắc nghiệp vụ và phân quyền; controller không được tự viết SQL. */
@Service
@Profile("!ui")
public class AccountService {
    private static final Pattern EMAIL = Pattern.compile(
            "^[A-Za-z0-9._%+\\-]+@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\\.)+[A-Za-z]{2,63}$");
    private static final Pattern NAME = Pattern.compile("^[\\p{L}][\\p{L} .'-]*$");
    private static final Pattern PHONE = Pattern.compile("^[0-9+() .-]{0,20}$");
    private final AccountDao dao;
    private final PasswordEncoder encoder;

    public AccountService(AccountDao dao, PasswordEncoder encoder) {
        this.dao = dao;
        this.encoder = encoder;
    }

    public AccountPage search(String q, String role, String status, int page) {
        String query = q == null ? "" : q.trim();
        if (query.length() > 100) query = query.substring(0, 100);
        return dao.search(query, filter(role, "STUDENT", "ADMIN"),
                filter(status, "ACTIVE", "LOCKED"), page, 10);
    }

    public long count(String role, String status) { return dao.count(role, status); }
    public Account get(long id) {
        return dao.find(id).orElseThrow(() -> new AccountException("Không tìm thấy tài khoản."));
    }

    public AccountForm form(long id) {
        Account account = get(id);
        AccountForm form = new AccountForm();
        form.setEmail(account.getEmail());
        form.setFullName(account.getFullName());
        form.setPhone(account.getPhone());
        form.setRole(account.getRole());
        return form;
    }

    @Transactional
    public long create(AccountForm form) {
        String email = email(form.getEmail());
        String name = name(form.getFullName());
        String phone = phone(form.getPhone());
        String role = role(form.getRole());
        String hash = password(form.getPassword(), true);
        if (dao.emailTaken(email, null)) throw new AccountException("Email đã được sử dụng.");
        try {
            return dao.insert(email, hash, name, phone, role);
        } catch (DuplicateKeyException ex) {
            throw new AccountException("Email đã được sử dụng.");
        }
    }

    @Transactional
    public void update(long id, AccountForm form, long editorId) {
        Account before = get(id);
        String email = email(form.getEmail());
        String name = name(form.getFullName());
        String phone = phone(form.getPhone());
        String role = role(form.getRole());
        String hash = password(form.getPassword(), false);
        if (id == editorId && !"ADMIN".equals(role)) {
            throw new AccountException("Không thể tự hạ quyền Admin của chính mình.");
        }
        if ("ADMIN".equals(before.getRole()) && !"ADMIN".equals(role)
                && "ACTIVE".equals(before.getStatus()) && dao.count("ADMIN", "ACTIVE") <= 1) {
            throw new AccountException("Phải giữ lại ít nhất một Admin đang hoạt động.");
        }
        if (dao.emailTaken(email, id)) throw new AccountException("Email đã được sử dụng.");
        try {
            if (dao.update(id, email, name, phone, role, hash) == 0) {
                throw new AccountException("Tài khoản không còn tồn tại.");
            }
        } catch (DuplicateKeyException ex) {
            throw new AccountException("Email đã được sử dụng.");
        }
    }

    @Transactional
    public void changeStatus(long id, String status, long editorId) {
        if (!"ACTIVE".equals(status) && !"LOCKED".equals(status)) {
            throw new AccountException("Trạng thái không hợp lệ.");
        }
        Account before = get(id);
        if (id == editorId && "LOCKED".equals(status)) {
            throw new AccountException("Không thể tự khóa tài khoản đang đăng nhập.");
        }
        if ("ACTIVE".equals(before.getStatus()) && "LOCKED".equals(status)
                && "ADMIN".equals(before.getRole()) && dao.count("ADMIN", "ACTIVE") <= 1) {
            throw new AccountException("Không thể khóa Admin hoạt động cuối cùng.");
        }
        dao.setStatus(id, status);
    }

    /** Xác thực chung cho cả Học viên và Admin, không phân quyền theo dữ liệu trình duyệt. */
    public LoginIdentity authenticate(String rawEmail, String password) {
        String email = rawEmail == null ? "" : rawEmail.trim().toLowerCase(Locale.ROOT);
        if (password == null || email.length() > 191) return null;
        return dao.credentials(email)
                .filter(account -> "ACTIVE".equals(account.status()))
                .filter(account -> "ADMIN".equals(account.role()) || "STUDENT".equals(account.role()))
                .filter(account -> encoder.matches(password, account.passwordHash()))
                .map(account -> new LoginIdentity(account.id(), account.role()))
                .orElse(null);
    }

    /** Resolve the current Admin using the principal authenticated by Spring Security. */
    public long currentAdminId(String email) {
        if (email == null) throw new AccountException("Báº¡n cáº§n Ä‘Äƒng nháº­p báº±ng tÃ i khoáº£n Admin.");
        return dao.credentials(email.trim().toLowerCase(Locale.ROOT))
                .filter(item -> "ADMIN".equals(item.role()) && "ACTIVE".equals(item.status()))
                .map(item -> item.id())
                .orElseThrow(() -> new AccountException("TÃ i khoáº£n Admin khÃ´ng há»£p lá»‡."));
    }
    public record LoginIdentity(long id, String role) { }

    private String filter(String value, String a, String b) {
        return a.equals(value) || b.equals(value) ? value : "";
    }

    private String email(String value) {
        String result = value == null ? "" : value.trim().toLowerCase(Locale.ROOT);
        if (result.length() > 191 || !EMAIL.matcher(result).matches()) {
            throw new AccountException("Email không đúng định dạng.");
        }
        return result;
    }

    private String name(String value) {
        String result = value == null ? "" : value.trim().replaceAll("\\s+", " ");
        if (result.length() < 2 || result.length() > 120 || !NAME.matcher(result).matches()) {
            throw new AccountException("Họ tên cần từ 2 đến 120 ký tự hợp lệ.");
        }
        return result;
    }

    private String phone(String value) {
        String result = value == null ? "" : value.trim();
        if (!PHONE.matcher(result).matches()) throw new AccountException("Số điện thoại không hợp lệ.");
        return result.isEmpty() ? null : result;
    }

    private String role(String value) {
        if (!"STUDENT".equals(value) && !"ADMIN".equals(value)) {
            throw new AccountException("Vai trò không hợp lệ.");
        }
        return value;
    }

    private String password(String value, boolean required) {
        if (value == null || value.isEmpty()) {
            if (required) throw new AccountException("Vui lòng nhập mật khẩu.");
            return null;
        }
        if (value.length() < 8 || value.length() > 64 || value.getBytes(StandardCharsets.UTF_8).length > 72
                || !value.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*[\\p{P}\\p{S}])\\S{8,64}$")) {
            throw new AccountException("Mật khẩu cần 8–64 ký tự, có chữ hoa, chữ thường, ký tự đặc biệt; tối đa 72 byte.");
        }
        return encoder.encode(value);
    }
}
