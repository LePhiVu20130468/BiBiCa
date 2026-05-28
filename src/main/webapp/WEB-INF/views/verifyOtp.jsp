<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">

<head>
  <jsp:include page="_meta.jsp"/>
  <title>BiBiCa Shop | Xác thực OTP</title>
</head>

<body>
<jsp:include page="_header.jsp"/>

<section class="section-content" style="margin: 100px 0;">
  <div class="card mx-auto" style="max-width: 380px">
    <div class="card-body">
      <h4 class="card-title mb-4">Nhập mã xác thực</h4>
      <p class="text-muted">Mã OTP đã được gửi đến email: <strong>${sessionScope.email}</strong></p>

      <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert">
          ${error}
        </div>
      </c:if>

      <form action="${pageContext.request.contextPath}/verify-otp" method="post">
        <div class="mb-3">
          <input name="otp"
                 class="form-control text-center"
                 placeholder="Nhập 6 số OTP"
                 type="text"
                 maxlength="6"
                 style="letter-spacing: 5px; font-size: 1.2rem;"
                 required
                 autocomplete="off">
        </div>

        <button type="submit" class="btn btn-primary w-100">Xác thực</button>
      </form>
    </div>
  </div>

  <p class="text-center mt-4">
    <a href="${pageContext.request.contextPath}/forgot-password">Gửi lại mã?</a>
  </p>
</section>

<jsp:include page="_footer.jsp"/>
</body>
</html>