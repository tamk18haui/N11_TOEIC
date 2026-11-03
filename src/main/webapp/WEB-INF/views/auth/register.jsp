<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/header.jspf" %>

<main class="n11-reg-page" id="n11RegisterExperience">
  <div class="n11-reg-page-orb n11-reg-page-orb-a" aria-hidden="true"></div>
  <div class="n11-reg-page-orb n11-reg-page-orb-b" aria-hidden="true"></div>
  <div class="container container-n11 py-4 py-lg-5">
    <div class="n11-reg-shell">
      <aside class="n11-reg-story" aria-label="Giới thiệu N11 TOEIC">
        <div class="n11-reg-aurora n11-reg-aurora-1" aria-hidden="true"></div>
        <div class="n11-reg-aurora n11-reg-aurora-2" aria-hidden="true"></div>
        <div class="n11-reg-grain" aria-hidden="true"></div>
        <div class="n11-reg-story-inner">
          <div class="n11-reg-story-meta n11-reg-enter">
            <span class="n11-reg-story-monogram"><span class="n11-reg-story-brand-mark">N</span> N11 <b>TOEIC</b></span>
            <span class="n11-reg-story-edition">YOUR NEXT CHAPTER <span class="n11-reg-story-edition-line"></span> 2026</span>
          </div>
          <div class="n11-reg-story-copy n11-reg-enter">
            <div class="n11-reg-intro-chip"><span class="n11-reg-live-dot"></span> BẮT ĐẦU HÀNH TRÌNH CỦA BẠN <span class="n11-reg-chip-arrow">↗</span></div>
            <h2>Học thông minh.<br><span>Tiến bộ khác biệt.</span></h2>
            <p>Biến mục tiêu TOEIC thành những bước tiến mỗi ngày. Một không gian học tập được thiết kế riêng cho hành trình của bạn.</p>
          </div>
          <div class="n11-reg-illustration" id="n11MotionStage" aria-hidden="true">
            <div class="n11-reg-stage-ring ring-one"></div>
            <div class="n11-reg-stage-ring ring-two"></div>
            <div class="n11-reg-stage-glint glint-a">✦</div>
            <div class="n11-reg-stage-glint glint-b">✦</div>
            <div class="n11-reg-stage-glint glint-c">✧</div>
            <div class="n11-reg-progress-card" id="n11TiltCard">
              <div class="n11-reg-meter-head"><span class="n11-reg-meter-brand"><span class="n11-reg-meter-logo">N</span> N11 TOEIC</span><span class="n11-reg-meter-live"><i></i> LIVE PROGRESS</span></div>
              <div class="n11-reg-meter-caption">HÀNH TRÌNH CHINH PHỤC</div>
              <div class="n11-reg-meter-main"><span>700<em>+</em></span><div class="n11-reg-meter-target">MỤC TIÊU<br><b>TOEIC</b></div></div>
              <div class="n11-reg-meter-chart-title"><span>Tiến bộ từng ngày</span><span>↗</span></div>
              <div class="n11-reg-chart"><i style="--bar:33%;--delay:0s"></i><i style="--bar:49%;--delay:.07s"></i><i style="--bar:42%;--delay:.14s"></i><i style="--bar:63%;--delay:.21s"></i><i style="--bar:57%;--delay:.28s"></i><i style="--bar:82%;--delay:.35s"></i><i style="--bar:100%;--delay:.42s"></i></div>
              <div class="n11-reg-progress-foot"><span>T2</span><span>T3</span><span>T4</span><span>T5</span><span>T6</span><span>T7</span><span>CN</span></div>
            </div>
            <div class="n11-reg-float n11-reg-float-headphones"><span class="n11-reg-bubble n11-bubble-violet">♫</span><span><strong>Listening</strong><small>Luyện nghe mỗi ngày</small></span><b class="n11-reg-float-check">✓</b></div>
            <div class="n11-reg-float n11-reg-float-stars"><span class="n11-reg-bubble n11-bubble-amber">✦</span><span><strong>Keep growing</strong><small>Bước tiến nhỏ, mục tiêu lớn</small></span></div>
            <div class="n11-reg-float n11-reg-float-words"><span class="n11-reg-bubble n11-bubble-mint">Aa</span><span><strong>Vocabulary</strong><small>Tích lũy mỗi ngày</small></span></div>
          </div>
          <div class="n11-reg-story-bottom n11-reg-enter"><span class="n11-reg-benefit-icon">✓</span><span>Listening &amp; Reading</span><span class="n11-reg-benefit-separator"></span><span class="n11-reg-benefit-icon">✓</span><span>Theo dõi tiến độ</span></div>
        </div>
      </aside>

      <section class="n11-reg-form-side" aria-labelledby="registerTitle">
        <div class="n11-reg-form-wrap">
          <div class="n11-reg-breadcrumb n11-reg-enter"><span class="n11-reg-dot-circle"></span> TẠO TÀI KHOẢN </div>
          <div class="n11-reg-heading">
            <h1 id="registerTitle">Khởi đầu hành trình<br><span>TOEIC của bạn.</span></h1>
            <p>Đăng ký miễn phí, lưu tiến độ học và chinh phục mục tiêu từng ngày.</p>
          </div>

          <div class="n11-reg-form-highlights n11-reg-enter"><span><i>✓</i> Miễn phí</span><span><i>✓</i> Lộ trình cá nhân</span><span><i>✓</i> Theo dõi tiến độ</span></div>

          <c:if test="${not empty registerSuccessEmail}">
            <div class="n11-reg-alert n11-reg-alert-success" role="status">
              <span class="n11-reg-alert-icon">✓</span>
              <div><strong>Đăng ký thành công!</strong><div>Tài khoản <b><c:out value="${registerSuccessEmail}" /></b> đã được tạo. <a href="${pageContext.request.contextPath}/login">Đăng nhập ngay</a>.</div></div>
            </div>
          </c:if>
          <c:if test="${not empty formError}">
            <div class="n11-reg-alert n11-reg-alert-error" role="alert">
              <span class="n11-reg-alert-icon">!</span><div><c:out value="${formError}" /></div>
            </div>
          </c:if>

          <form id="n11RegisterForm" method="post" action="${pageContext.request.contextPath}/register" novalidate autocomplete="on">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <input type="hidden" name="_registrationCsrf" value="<c:out value='${registerCsrfToken}'/>" />
            <div class="n11-reg-field">
              <label for="n11FullName" class="form-label">Họ và tên <span>*</span></label>
              <div class="n11-reg-control-wrap">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true"><circle cx="12" cy="8" r="4"/><path d="M4 21a8 8 0 0 1 16 0"/></svg>
                <input id="n11FullName" class="form-control n11-reg-input ${not empty fieldErrors.fullName ? 'is-invalid' : ''}" name="fullName" type="text" maxlength="120" minlength="2" required autocomplete="name" placeholder="Ví dụ: Nguyễn Văn An" value="<c:out value='${registrationForm.fullName}'/>" aria-describedby="n11FullNameError" />
              </div>
              <div class="n11-reg-error" id="n11FullNameError" aria-live="polite"><c:out value="${fieldErrors.fullName}" /></div>
            </div>
            <div class="n11-reg-field">
              <label for="n11Email" class="form-label">Địa chỉ email <span>*</span></label>
              <div class="n11-reg-control-wrap">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true"><rect x="3" y="5" width="18" height="14" rx="3"/><path d="m4 7 8 6 8-6"/></svg>
                <input id="n11Email" class="form-control n11-reg-input ${not empty fieldErrors.email ? 'is-invalid' : ''}" name="email" type="email" maxlength="191" required autocomplete="email" inputmode="email" placeholder="ban@example.com" value="<c:out value='${registrationForm.email}'/>" aria-describedby="n11EmailError" />
              </div>
              <div class="n11-reg-error" id="n11EmailError" aria-live="polite"><c:out value="${fieldErrors.email}" /></div>
            </div>

            <div class="n11-reg-field">
              <label for="n11Password" class="form-label">Mật khẩu <span>*</span></label>
              <div class="n11-reg-control-wrap n11-reg-password-wrap">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true"><rect x="5" y="11" width="14" height="10" rx="2"/><path d="M8 11V8a4 4 0 0 1 8 0v3"/></svg>
                <input id="n11Password" class="form-control n11-reg-input ${not empty fieldErrors.password ? 'is-invalid' : ''}" name="password" type="password" minlength="8" maxlength="64" autocomplete="new-password" required placeholder="Nhập mật khẩu mạnh" aria-describedby="n11PasswordError" />
                <button type="button" class="n11-reg-eye" data-toggle-password="n11Password" aria-label="Hiện mật khẩu" aria-pressed="false"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><path d="M2 12c2.8-4.5 6.2-7 10-7s7.2 2.5 10 7c-2.8 4.5-6.2 7-10 7S4.8 16.5 2 12Z"/><circle cx="12" cy="12" r="3"/></svg></button>
              </div>
              <div class="n11-reg-error" id="n11PasswordError" aria-live="polite"><c:out value="${fieldErrors.password}" /></div>
              <div class="n11-reg-strength" aria-label="Độ mạnh mật khẩu"><div class="n11-reg-strength-bars"><i></i><i></i><i></i><i></i></div><span id="n11StrengthText">Chưa nhập mật khẩu</span></div>
              <div class="n11-reg-rules" id="n11PasswordRules">
                <span data-rule="length">8–64 ký tự</span>
                <span data-rule="upper">Chữ hoa (A–Z)</span>
                <span data-rule="lower">Chữ thường (a–z)</span>
                <span data-rule="special">Ký tự đặc biệt (!@#...)</span>
              </div>
            </div>

            <div class="n11-reg-field n11-reg-confirm-field">
              <label for="n11ConfirmPassword" class="form-label">Xác nhận lại mật khẩu <span>*</span></label>
              <div class="n11-reg-control-wrap n11-reg-password-wrap">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true"><rect x="5" y="11" width="14" height="10" rx="2"/><path d="M8 11V8a4 4 0 0 1 8 0v3"/><path d="m10 16 1.5 1.5L14 15"/></svg>
                <input id="n11ConfirmPassword" class="form-control n11-reg-input ${not empty fieldErrors.confirmPassword ? 'is-invalid' : ''}" name="confirmPassword" type="password" maxlength="64" autocomplete="new-password" required placeholder="Nhập lại mật khẩu" aria-describedby="n11ConfirmError" />
                <button type="button" class="n11-reg-eye" data-toggle-password="n11ConfirmPassword" aria-label="Hiện mật khẩu xác nhận" aria-pressed="false"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><path d="M2 12c2.8-4.5 6.2-7 10-7s7.2 2.5 10 7c-2.8 4.5-6.2 7-10 7S4.8 16.5 2 12Z"/><circle cx="12" cy="12" r="3"/></svg></button>
              </div>
              <div class="n11-reg-error" id="n11ConfirmError" aria-live="polite"><c:out value="${fieldErrors.confirmPassword}" /></div>
            </div>
            <button class="btn n11-reg-submit" id="n11RegisterSubmit" type="submit"><span>Tạo tài khoản miễn phí</span><span class="n11-reg-submit-arrow" aria-hidden="true">↗</span></button>
            <p class="n11-reg-footnote"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><rect x="5" y="10" width="14" height="11" rx="2"/><path d="M8 10V7a4 4 0 0 1 8 0v3"/></svg> Mật khẩu của bạn được mã hóa an toàn trước khi lưu.</p>
          </form>
          <div class="n11-reg-login">Đã là thành viên N11 TOEIC? <a href="${pageContext.request.contextPath}/login">Đăng nhập <span aria-hidden="true">→</span></a></div>
        </div>
      </section>
    </div>
    <div class="n11-reg-trust">N11 TOEIC <span>✦</span> HỌC THÔNG MINH <span>✦</span> TỰ TIN BỨT PHÁ <span>✦</span> LEARN · PRACTICE · GROW</div>
  </div>
</main>
<%@ include file="../fragments/footer.jspf" %>
<script src="${pageContext.request.contextPath}/assets/js/register.js"></script>
<%@ include file="../fragments/scripts.jspf" %>
