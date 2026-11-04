package com.toeic.nhom11.model;

/** Dữ liệu hiển thị trên trang quản trị; không bao giờ chứa mật khẩu đã băm. */
public class Account {
    private final long id;
    private final String email;
    private final String fullName;
    private final String phone;
    private final String role;
    private final String status;
    private final String createdAt;

    public Account(long id, String email, String fullName, String phone, String role,
                   String status, String createdAt) {
        this.id = id;
        this.email = email;
        this.fullName = fullName;
        this.phone = phone;
        this.role = role;
        this.status = status;
        this.createdAt = createdAt;
    }

    public long getId() { return id; }
    public String getEmail() { return email; }
    public String getFullName() { return fullName; }
    public String getPhone() { return phone; }
    public String getRole() { return role; }
    public String getStatus() { return status; }
    public String getCreatedAt() { return createdAt; }
}
