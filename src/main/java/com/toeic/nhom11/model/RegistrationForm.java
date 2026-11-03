package com.toeic.nhom11.model;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

/** Du lieu nguoi dung gui qua form /register; khong nhan role tu browser. */
public class RegistrationForm {
    @NotBlank(message = "Vui lòng nhập họ và tên.")
    @Size(min = 2, max = 120, message = "Họ và tên phải từ 2 đến 120 ký tự.")
    @Pattern(regexp = "^[\\p{L}][\\p{L} .'-]*$", message = "Họ tên chỉ được chứa chữ cái và dấu phân cách tên hợp lệ.")
    private String fullName;

    @NotBlank(message = "Vui lòng nhập email.")
    @Email(message = "Email không đúng định dạng.")
    @Size(max = 191, message = "Email không được dài quá 191 ký tự.")
    @Pattern(regexp = "^[A-Za-z0-9._%+\\-]+@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\\.)+[A-Za-z]{2,63}$",
             message = "Email phải có dạng ten@tenmien.com.")
    private String email;

    @NotBlank(message = "Vui lòng nhập mật khẩu.")
    @Size(min = 8, max = 64, message = "Mật khẩu phải có từ 8 đến 64 ký tự.")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[\\p{P}\\p{S}])\\S{8,64}$",
             message = "Mật khẩu cần chữ hoa, chữ thường, ký tự đặc biệt và không có khoảng trắng.")
    private String password;

    @NotBlank(message = "Vui lòng xác nhận lại mật khẩu.")
    private String confirmPassword;

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getConfirmPassword() { return confirmPassword; }
    public void setConfirmPassword(String confirmPassword) { this.confirmPassword = confirmPassword; }
}
