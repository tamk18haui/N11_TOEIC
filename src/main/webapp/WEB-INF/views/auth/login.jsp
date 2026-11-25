<%-- N11_ACCOUNT_UI_V40 N11_LOGIN_REGISTER_THEME_V40_1 --%>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="../fragments/head.jspf" %>
<%@ include file="../fragments/header.jspf" %>
<main data-n11-login="true" class="n11-reg-page" id="n11RegisterExperience">
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
      <section class="n11-reg-form-side" aria-labelledby="loginTitle">
        <div class="n11-reg-form-wrap">
          <div class="n11-reg-breadcrumb n11-reg-enter"><span class="n11-reg-dot-circle"></span> ĐĂNG NHẬP TÀI KHOẢN</div>
          <div class="n11-reg-heading"><h1 id="loginTitle">Chào mừng<br><span>bạn quay lại.</span></h1><p>Đăng nhập để tiếp tục lộ trình học tập của bạn.</p></div>
          <div class="n11-reg-form-highlights n11-reg-enter"><span><i>✓</i> Luyện thi TOEIC</span><span><i>✓</i> Lộ trình cá nhân</span><span><i>✓</i> Theo dõi tiến độ</span></div>
          <c:if test="${param.reset != null}"><div class="n11-reg-alert n11-reg-alert-success" role="status">Mật khẩu đã được đặt lại. Hãy đăng nhập bằng mật khẩu mới.</div></c:if>
<c:if test="${param.error != null}"><div class="n11-reg-alert n11-reg-alert-error" role="alert">Email hoặc mật khẩu không đúng, hoặc tài khoản đã bị khóa.</div></c:if>
          <form id="n11LoginForm" method="post" action="${pageContext.request.contextPath}/login" autocomplete="on">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <div class="n11-reg-field"><label for="email" class="form-label">Địa chỉ email <span>*</span></label><div class="n11-reg-control-wrap"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="3" y="5" width="18" height="14" rx="3"/><path d="m4 7 8 6 8-6"/></svg><input id="email" name="email" class="form-control n11-reg-input" type="email" maxlength="191" autocomplete="username" inputmode="email" required placeholder="ban@example.com"></div></div>
            <div class="n11-reg-field"><label for="password" class="form-label">Mật khẩu <span>*</span></label><div class="n11-reg-control-wrap n11-reg-password-wrap"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="5" y="10" width="14" height="11" rx="3"/><path d="M8 10V7a4 4 0 0 1 8 0v3m-4 4v3"/></svg><input id="password" name="password" class="form-control n11-reg-input" type="password" autocomplete="current-password" required placeholder="Nhập mật khẩu"><button type="button" class="n11-reg-eye" id="n11LoginEye" aria-label="Hiện mật khẩu" aria-pressed="false"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M2 12c3-5 6-7 10-7s7 2 10 7c-3 5-6 7-10 7s-7-2-10-7Z"/><circle cx="12" cy="12" r="3"/></svg></button></div></div>
            <div class="n11-reg-login n11-login-forgot"><a href="${pageContext.request.contextPath}/forgot-password">Quên mật khẩu?</a></div>
            <button class="btn n11-reg-submit" type="submit"><span>Đăng nhập</span><span class="n11-reg-submit-arrow" aria-hidden="true">↗</span></button>
          </form>
          <div class="n11-reg-login">Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký miễn phí <span aria-hidden="true">→</span></a></div>

        </div>
      </section>
    </div>
    <div class="n11-reg-trust">N11 TOEIC <span>✦</span> HỌC THÔNG MINH <span>✦</span> TỰ TIN BỨT PHÁ <span>✦</span> LEARN · PRACTICE · GROW</div>
  </div>
</main>
<%@ include file="../fragments/footer.jspf" %>
<script defer src="${pageContext.request.contextPath}/assets/js/login-v40.js?v=40.1"></script>
<%@ include file="../fragments/scripts.jspf" %>
