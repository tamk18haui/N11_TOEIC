package com.toeic.nhom11.model;

import java.util.List;

/** Danh sách đã phân trang để tránh tải toàn bộ tài khoản vào bộ nhớ. */
public class AccountPage {
    private final List<Account> items;
    private final int page;
    private final int pages;
    private final long total;

    public AccountPage(List<Account> items, int page, int pages, long total) {
        this.items = items;
        this.page = page;
        this.pages = pages;
        this.total = total;
    }

    public List<Account> getItems() { return items; }
    public int getPage() { return page; }
    public int getPages() { return pages; }
    public long getTotal() { return total; }
    public boolean isHasPrevious() { return page > 1; }
    public boolean isHasNext() { return page < pages; }
}
