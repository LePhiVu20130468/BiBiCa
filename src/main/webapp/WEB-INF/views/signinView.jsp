<%@ include file="_init.jsp" %>
<!DOCTYPE html>
<html lang="vi">

<head>
  <jsp:include page="_meta.jsp"/>
  <title>BiBiCa Shop | <fmt:message key="signinview.title.dangnhap" /></title>
</head>

<body>
<jsp:include page="_header.jsp"/>

<section class="section-content" style="margin: 100px 0;">
  <div class="card mx-auto" style="max-width: 380px">
    <div class="card-body">
      <h4 class="card-title mb-4"><fmt:message key="signinview.h4.dangnhap" /></h4>

      <c:if test="${param.error == 'google_error'}">
         <div class="alert alert-danger">Lỗi đăng nhập Google. Vui lòng thử lại.</div>
      </c:if>

      <form action="${pageContext.request.contextPath}/signin" method="post">
        <div class="mb-3">
        <fmt:message key="signinview.input.placeholder.username" var="username" />
          <input name="username"
                 class="form-control ${not empty requestScope.violations.usernameViolations
                   ? 'is-invalid' : (not empty requestScope.values.username ? 'is-valid' : '')}"
                 placeholder="${username}"
                 type="text"
                 autocomplete="off"
                 value="${requestScope.values.username}">
          <c:if test="${not empty requestScope.violations.usernameViolations}">
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.usernameViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>
        <div class="mb-3">
          <fmt:message key="signinview.input.placeholder.password" var="password" />
          <input name="password"
                 class="form-control ${not empty requestScope.violations.passwordViolations
                   ? 'is-invalid' : (not empty requestScope.values.password ? 'is-valid' : '')}"
                 placeholder="${password}"
                 type="password"
                 autocomplete="off"
                 value="${requestScope.values.password}">
          <c:if test="${not empty requestScope.violations.passwordViolations}">
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.passwordViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>
        <div class="mb-3 text-end">
            <a href="${pageContext.request.contextPath}/forgot-password" class="float-right"><fmt:message key="signinview.a.quenmatkhau" /></a>
        </div>
        <button type="submit" class="btn btn-primary w-100"><fmt:message key="signinview.button.dangnhap" /></button>
      </form>

      <hr>
      <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/bookstore/signin-google&response_type=code&client_id=813885466812-6g7keicudc5rbeu1i4j5nqfo6rfrbrpu.apps.googleusercontent.com&approval_prompt=force"
         class="btn btn-danger w-100 mb-2">
         <fmt:message key="signinview.a.dangnhapbanggg" />
      </a>

    </div> </div> <p class="text-center mt-4"><fmt:message key="signinview.p.khongcotaikhoan" /> <a href="${pageContext.request.contextPath}/signup"><fmt:message key="signinview.a.dangkyngay" /></a></p>
</section>
<jsp:include page="_footer.jsp"/>
</body>
</html>