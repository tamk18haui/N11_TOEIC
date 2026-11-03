package com.toeic.nhom11;

import com.toeic.nhom11.dao.RegistrationDao;
import com.toeic.nhom11.model.RegistrationForm;
import com.toeic.nhom11.service.EmailAlreadyUsedException;
import com.toeic.nhom11.service.impl.RegistrationServiceImpl;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;
import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import static org.junit.jupiter.api.Assertions.*;

/** Test validation khong can MySQL. */
class RegistrationFeatureTest {
    private RegistrationForm form(String email, String password, String confirm) {
        RegistrationForm f = new RegistrationForm();
        f.setFullName("Nguyễn Văn An");
        f.setEmail(email);
        f.setPassword(password);
        f.setConfirmPassword(confirm);
        return f;
    }

    @Test
    void matKhauThieuChuHoaBiChan() {
        try (ValidatorFactory factory = Validation.buildDefaultValidatorFactory()) {
            Validator validator = factory.getValidator();
            RegistrationForm f = form("an@example.com", "lowercase@123", "lowercase@123");
            assertTrue(validator.validate(f).stream().anyMatch(e -> e.getPropertyPath().toString().equals("password")));
        }
    }

    @Test
    void emailKhongCoTenMienBiChan() {
        try (ValidatorFactory factory = Validation.buildDefaultValidatorFactory()) {
            Validator validator = factory.getValidator();
            RegistrationForm f = form("an@gmail", "Strong@123", "Strong@123");
            assertTrue(validator.validate(f).stream().anyMatch(e -> e.getPropertyPath().toString().equals("email")));
        }
    }

    @Test
    void matKhauXacNhanKhongKhopBiChan() {
        RegistrationDao fake = new RegistrationDao() {
            @Override public boolean emailExists(String email) { return false; }
            @Override public long createStudent(String email, String hash, String fullName) { throw new AssertionError("Should not insert"); }
        };
        RegistrationServiceImpl svc = new RegistrationServiceImpl(fake, new BCryptPasswordEncoder(4));
        assertThrows(IllegalArgumentException.class,
                () -> svc.register(form("an@example.com", "Strong@123", "Strong@124")));
    }

    @Test
    void emailTrungBiChan() {
        RegistrationDao fake = new RegistrationDao() {
            @Override public boolean emailExists(String email) { return true; }
            @Override public long createStudent(String email, String hash, String fullName) { throw new AssertionError("Should not insert"); }
        };
        RegistrationServiceImpl svc = new RegistrationServiceImpl(fake, new BCryptPasswordEncoder(4));
        assertThrows(EmailAlreadyUsedException.class,
                () -> svc.register(form("an@example.com", "Strong@123", "Strong@123")));
    }

    @Test
    void dangKyThanhCongLuuMatKhauDaMaHoa() {
        final String[] row = new String[3];
        RegistrationDao fake = new RegistrationDao() {
            @Override public boolean emailExists(String email) { return false; }
            @Override public long createStudent(String email, String hash, String fullName) {
                row[0] = email; row[1] = hash; row[2] = fullName; return 7L;
            }
        };
        RegistrationServiceImpl svc = new RegistrationServiceImpl(fake, new BCryptPasswordEncoder(4));
        assertEquals(7L, svc.register(form("AN@EXAMPLE.COM", "Strong@123", "Strong@123")));
        assertEquals("an@example.com", row[0]);
        assertNotEquals("Strong@123", row[1]);
        assertTrue(new BCryptPasswordEncoder().matches("Strong@123", row[1]));
        assertEquals("Nguyễn Văn An", row[2]);
    }
}
