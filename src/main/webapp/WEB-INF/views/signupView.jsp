<%@ include file="_init.jsp" %>
<!DOCTYPE html>
<html lang="vi">

<head>
  <jsp:include page="_meta.jsp"/>
  <title>BiBiCa Shop | <fmt:message key="signupview.title.dangky" /></title>
</head>

<body>
<jsp:include page="_header.jsp"/>

<section class="section-content" style="margin: 100px 0;">
  <div class="card mx-auto" style="max-width: 380px">
    <div class="card-body">
      <c:if test="${not empty requestScope.successMessage}">
        <div class="alert alert-success" role="alert">${requestScope.successMessage}</div>
      </c:if>
      <c:if test="${not empty requestScope.errorMessage}">
        <div class="alert alert-danger" role="alert">${requestScope.errorMessage}</div>
      </c:if>

      <h4 class="card-title mb-4"><fmt:message key="signupview.h4.dangky" /></h4>

      <form action="${pageContext.request.contextPath}/signup" method="post">
        <div class="mb-3">
          <label for="inputUsername" class="form-label"><fmt:message key="signupview.label.tendangnhap" /></label>
          <input type="text"
                 class="form-control ${not empty requestScope.violations.usernameViolations
                   ? 'is-invalid' : (not empty requestScope.values.username ? 'is-valid' : '')}"
                 id="inputUsername"
                 name="username"
                 value="${requestScope.values.username}">
                 <small id="msgUsername" class="form-text fw-bold"></small>
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
          <label for="inputPassword" class="form-label"><fmt:message key="signupview.label.matkhau" /></label>
          <input type="password"
                 class="form-control ${not empty requestScope.violations.passwordViolations ? 'is-invalid' : ''}"
                 id="inputPassword"
                 name="password"
                 value="${requestScope.values.password}">

          <small id="msgPassword" class="form-text fw-bold"></small>

          <c:if test="${not empty requestScope.violations.passwordViolations}">
            </c:if>
        </div>

        <div class="mb-3">
          <label for="inputRePassword" class="form-label"><fmt:message key="signupview.label.matkhauagiain" /></label>
          <input type="password"
                 class="form-control"
                 id="inputRePassword"
                 name="rePassword"
                 value=""> <small id="msgRePassword" class="form-text fw-bold"></small>
        </div>
        <div class="mb-3">
          <label for="inputFullname" class="form-label"><fmt:message key="signupview.label.hovaten" /></label>
          <input type="text"
                 class="form-control ${not empty requestScope.violations.fullnameViolations
                   ? 'is-invalid' : (not empty requestScope.values.fullname ? 'is-valid' : '')}"
                 id="inputFullname"
                 name="fullname"
                 value="${requestScope.values.fullname}">
          <c:if test="${not empty requestScope.violations.fullnameViolations}">
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.fullnameViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>
        <div class="mb-3">
          <label for="inputEmail" class="form-label">Email</label>
          <input type="email"
                 class="form-control ${not empty requestScope.violations.emailViolations
                   ? 'is-invalid' : (not empty requestScope.values.email ? 'is-valid' : '')}"
                 id="inputEmail"
                 name="email"
                 value="${requestScope.values.email}">
          <c:if test="${not empty requestScope.violations.emailViolations}">
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.emailViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>
        <div class="mb-3">
          <label for="inputPhoneNumber" class="form-label"><fmt:message key="signupview.label.sodienthoai" /></label>
          <input type="text"
                 class="form-control ${not empty requestScope.violations.phoneNumberViolations
                   ? 'is-invalid' : (not empty requestScope.values.phoneNumber ? 'is-valid' : '')}"
                 id="inputPhoneNumber"
                 name="phoneNumber"
                 value="${requestScope.values.phoneNumber}">
          <c:if test="${not empty requestScope.violations.phoneNumberViolations}">
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.phoneNumberViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>
        <div class="mb-3">
          <div class="form-check d-inline-block me-4">
            <input class="form-check-input ${not empty requestScope.violations.genderViolations
                     ? 'is-invalid' : (not empty requestScope.values.gender ? 'is-valid' : '')}"
                   type="radio"
                   name="gender"
                   id="radioGender1"
                   value="0"
            ${requestScope.values.gender.equals("0") ? 'checked' : ''}>
            <label class="form-check-label" for="radioGender1"><fmt:message key="signupview.label.nam" /></label>
          </div>
          <div class="form-check d-inline-block">
            <input class="form-check-input ${not empty requestScope.violations.genderViolations
                     ? 'is-invalid' : (not empty requestScope.values.gender ? 'is-valid' : '')}"
                   type="radio"
                   name="gender"
                   id="radioGender2"
                   value="1"
            ${requestScope.values.gender.equals("1") ? 'checked' : ''}>
            <label class="form-check-label" for="radioGender2"><fmt:message key="signupview.label.nu" /></label>
          </div>
          <c:if test="${not empty requestScope.violations.genderViolations}">
            <div class="is-invalid"></div>
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.genderViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>
        <div class="mb-3">
          <label for="inputAddress" class="form-label"><fmt:message key="signupview.label.diachi" /></label>
          <input type="text"
                 class="form-control ${not empty requestScope.violations.addressViolations
                   ? 'is-invalid' : (not empty requestScope.values.address ? 'is-valid' : '')}"
                 id="inputAddress"
                 name="address"
                 value="${requestScope.values.address}">
          <c:if test="${not empty requestScope.violations.addressViolations}">
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.addressViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>
        <div class="mb-3 form-check">
          <input class="form-check-input ${not empty requestScope.violations.policyViolations
                   ? 'is-invalid' : (not empty requestScope.values.policy ? 'is-valid' : '')}"
                 type="checkbox"
                 value="checked"
                 id="checkboxPolicy"
                 name="policy"
                 checked>
          <label class="form-check-label" for="checkboxPolicy">
            <fmt:message key="signupview.label.dongyvoi" /> <a href="#"><fmt:message key="signupview.a.dieukhoansudung" /></a>
          </label>
          <c:if test="${not empty requestScope.violations.policyViolations}">
            <div class="invalid-feedback">
              <ul class="list-unstyled">
                <c:forEach var="violation" items="${requestScope.violations.policyViolations}">
                  <li>${violation}</li>
                </c:forEach>
              </ul>
            </div>
          </c:if>
        </div>

        <button type="submit" class="btn btn-primary w-100"><fmt:message key="signupview.button.dangky" /></button>
      </form>

      <hr>

      <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/bookstore/signin-google&response_type=code&client_id=813885466812-6g7keicudc5rbeu1i4j5nqfo6rfrbrpu.apps.googleusercontent.com&approval_prompt=force"
         class="btn btn-danger w-100 mb-2">
         <fmt:message key="signupview.a.dangkyvoigg" />
      </a>

    </div> </div> <p class="text-center mt-4"><fmt:message key="signupview.p.cotaikhoan" />? <a href="${pageContext.request.contextPath}/signin"><fmt:message key="signupview.a.dangnhapngay" /></a></p>
</section> <jsp:include page="_footer.jsp"/>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    // 1. Khai báo các Element
    const inputUsername = document.getElementById('inputUsername');
    const msgUsername = document.getElementById('msgUsername');

    const inputPassword = document.getElementById('inputPassword');
    const msgPassword = document.getElementById('msgPassword');

    const inputRePassword = document.getElementById('inputRePassword');
    const msgRePassword = document.getElementById('msgRePassword');

    const formSignup = document.querySelector('form');
    const btnSubmit = formSignup.querySelector('button[type="submit"]');

    // 2. Biến trạng thái (Cờ) để kiểm soát nút Submit
    let state = {
        username: false,
        password: false,
        rePassword: false
    };

    let timeout = null; // Cho debounce username

    // Hàm cập nhật trạng thái nút Submit
    function updateSubmitButton() {
        // Chỉ mở nút khi cả 3 đều đúng
        const isValidAll = state.username && state.password && state.rePassword;
        btnSubmit.disabled = !isValidAll;
    }

    // Hàm hiển thị thông báo chung cho các ô input
    function showMessage(input, msgElement, message, type) {
        msgElement.innerText = message;

        // Xóa class cũ
        msgElement.classList.remove('text-danger', 'text-success', 'text-muted');
        input.classList.remove('is-invalid', 'is-valid');

        if (type === 'error') {
            msgElement.classList.add('text-danger');
            input.classList.add('is-invalid');
        } else if (type === 'success') {
            msgElement.classList.add('text-success');
            input.classList.add('is-valid');
        } else if (type === 'loading') {
            msgElement.classList.add('text-muted');
        }
    }

    // ==========================================
    // LOGIC 1: XỬ LÝ USERNAME (Giữ nguyên logic cũ)
    // ==========================================
    inputUsername.addEventListener('input', function() {
        const value = inputUsername.value;
        clearTimeout(timeout);
        state.username = false; // Reset trạng thái
        updateSubmitButton();

        if (value.length === 0) {
            showMessage(inputUsername, msgUsername, "", "");
            return;
        }

        // Check Client side
        const hasSpecialChar = /[^a-zA-Z0-9]/.test(value);
        if (hasSpecialChar) {
            showMessage(inputUsername, msgUsername, "Tên đăng nhập KHÔNG chứa kí tự đặc biệt", "error");
            return;
        }
        if (value.length < 6) {
            showMessage(inputUsername, msgUsername, "Tên đăng nhập PHẢI TỐI THIỂU 6 KÝ TỰ", "error");
            return;
        }

        // Check Server side (AJAX)
        showMessage(inputUsername, msgUsername, "Đang kiểm tra...", "loading");

        timeout = setTimeout(function() {
            const url = '${pageContext.request.contextPath}/api/check-username?username=' + value;
            fetch(url)
                .then(res => res.json())
                .then(data => {
                    if (data.exists) {
                        state.username = false;
                        showMessage(inputUsername, msgUsername, "Tên đăng nhập đã được sử dụng", "error");
                    } else {
                        state.username = true;
                        showMessage(inputUsername, msgUsername, "Tên đăng nhập hợp lệ", "success");
                    }
                    updateSubmitButton(); // Check lại nút submit sau khi AJAX xong
                })
                .catch(err => {
                    console.error(err);
                    state.username = false;
                    showMessage(inputUsername, msgUsername, "Lỗi kết nối server", "error");
                });
        }, 500);
    });

    // ==========================================
    // LOGIC 2: XỬ LÝ MẬT KHẨU (Password)
    // ==========================================
    inputPassword.addEventListener('input', function() {
        const value = inputPassword.value;
        state.password = false;

        // Nếu thay đổi password, bắt buộc phải check lại ô RePassword luôn (nếu đang có dữ liệu)
        if (inputRePassword.value.length > 0) {
            // Trigger sự kiện input cho ô RePassword để nó tự check lại khớp hay không
            inputRePassword.dispatchEvent(new Event('input'));
        }

        if (value.length === 0) {
            showMessage(inputPassword, msgPassword, "", "");
            updateSubmitButton();
            return;
        }

        // 1. Check độ dài
        if (value.length < 8) {
            showMessage(inputPassword, msgPassword, "Mật khẩu PHẢI TỐI THIỂU 8 KÍ TỰ", "error");
            updateSubmitButton();
            return;
        }

        // 2. Check chữ số
        if (!/[0-9]/.test(value)) {
            showMessage(inputPassword, msgPassword, "Mật khẩu PHẢI CÓ ÍT NHẤT 1 KÝ TỰ SỐ", "error");
            updateSubmitButton();
            return;
        }

        // 3. Check chữ in hoa
        if (!/[A-Z]/.test(value)) {
            showMessage(inputPassword, msgPassword, "Mật khẩu PHẢI CÓ ÍT NHẤT 1 KÝ TỰ IN HOA", "error");
            updateSubmitButton();
            return;
        }

        // 4. Check kí tự đặc biệt
        // Regex này nghĩa là: Tìm kí tự KHÔNG phải là chữ và KHÔNG phải là số
        if (!/[^a-zA-Z0-9]/.test(value)) {
            showMessage(inputPassword, msgPassword, "Mật khẩu PHẢI CÓ ÍT NHẤT 1 KÝ TỰ ĐẶC BIỆT", "error");
            updateSubmitButton();
            return;
        }

        // Nếu qua hết các ải trên
        state.password = true;
        showMessage(inputPassword, msgPassword, "Mật khẩu mạnh và hợp lệ", "success");
        updateSubmitButton();
    });

    // ==========================================
    // LOGIC 3: XỬ LÝ NHẬP LẠI MẬT KHẨU (RePassword)
    // ==========================================
    inputRePassword.addEventListener('input', function() {
        const reValue = inputRePassword.value;
        const orgValue = inputPassword.value;

        state.rePassword = false;

        if (reValue.length === 0) {
            showMessage(inputRePassword, msgRePassword, "", "");
            updateSubmitButton();
            return;
        }

        if (reValue !== orgValue) {
            showMessage(inputRePassword, msgRePassword, "Mật khẩu KHÔNG KHỚP", "error");
        } else {
            state.rePassword = true;
            showMessage(inputRePassword, msgRePassword, "Nhập lại mật khẩu HỢP LỆ", "success");
        }
        updateSubmitButton();
    });

    // Chặn submit form bằng phím Enter nếu chưa hợp lệ
    formSignup.addEventListener('submit', function(e) {
        if (!state.username || !state.password || !state.rePassword) {
            e.preventDefault();
            alert("Vui lòng kiểm tra lại thông tin nhập liệu!");
        }
    });

    // Khởi tạo trạng thái ban đầu cho nút submit
    updateSubmitButton();
  });
</script>
</body>

</html>