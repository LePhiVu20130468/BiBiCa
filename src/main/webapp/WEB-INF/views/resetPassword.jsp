<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">

<head>
  <jsp:include page="_meta.jsp"/>
  <title>BiBiCa Shop | Đặt lại mật khẩu</title>
</head>

<body>
<jsp:include page="_header.jsp"/>

<section class="section-content" style="margin: 100px 0;">
  <div class="card mx-auto" style="max-width: 500px"> <div class="card-body text-center"> <c:choose>

        <%-- TRƯỜNG HỢP 1: THÀNH CÔNG --%>
        <c:when test="${not empty resetSuccess}">
          <div class="my-4">
            <h2 class="text-success mb-3">Đổi mật khẩu thành công!</h2>
            <p class="mb-4">
              Quý khách hãy đăng nhập lại với mật khẩu mới bằng cách ấn nút bên dưới.
            </p>
            <a href="${pageContext.request.contextPath}/signin" class="btn btn-primary btn-lg">
              Đăng nhập lại bằng mật khẩu mới
            </a>
          </div>
        </c:when>

        <%-- TRƯỜNG HỢP 2: CHƯA THÀNH CÔNG (HIỆN FORM) --%>
        <c:otherwise>
          <h4 class="card-title mb-4 text-start">Đặt mật khẩu mới</h4> <c:if test="${not empty error}">
            <div class="alert alert-danger text-start" role="alert">
              ${error}
            </div>
          </c:if>

          <form action="${pageContext.request.contextPath}/reset-password" method="post" class="text-start">
            <div class="mb-3">
              <label class="form-label">Mật khẩu mới</label>
              <input name="newPassword"
                     class="form-control"
                     placeholder="Nhập mật khẩu mới"
                     type="password"
                     required>
            </div>
            <div class="mb-3">
              <label class="form-label">Xác nhận mật khẩu</label>
              <input name="confirmPassword"
                     class="form-control"
                     placeholder="Nhập lại mật khẩu mới"
                     type="password"
                     required>
            </div>

            <button type="submit" class="btn btn-primary w-100">Đổi mật khẩu</button>
          </form>
        </c:otherwise>

      </c:choose>

    </div>
  </div>
</section>

<jsp:include page="_footer.jsp"/>
</body>
</html>