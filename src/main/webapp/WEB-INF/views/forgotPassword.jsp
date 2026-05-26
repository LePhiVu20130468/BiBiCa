<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
  <jsp:include page="_meta.jsp"/>
  <title>BiBiCa Shop | Quên mật khẩu</title>
</head>

<body>
<jsp:include page="_header.jsp"/>

<section class="section-content" style="margin: 100px 0;">
  <div class="card mx-auto" style="max-width: 380px">
    <div class="card-body">
      <h4 class="card-title mb-4">Lấy lại mật khẩu</h4>

      <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert">
          ${error}
        </div>
      </c:if>

      <form action="${pageContext.request.contextPath}/forgot-password" method="post">
        <div class="mb-3">
          <label class="form-label">Nhập email của bạn</label>
          <input name="email"
                 class="form-control"
                 placeholder="example@gmail.com"
                 type="email"
                 required
                 autofocus>
          <div class="form-text">Chúng tôi sẽ gửi mã xác thực đến email này.</div>
        </div>

        <button type="submit" class="btn btn-primary w-100">Gửi mã OTP</button>
      </form>
    </div>
  </div>

  <p class="text-center mt-4">
    <a href="${pageContext.request.contextPath}/signin">Quay lại đăng nhập</a>
  </p>
</section>

<jsp:include page="_footer.jsp"/>
</body>
</html>