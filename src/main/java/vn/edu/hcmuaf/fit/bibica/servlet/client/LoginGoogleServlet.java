package vn.edu.hcmuaf.fit.bibica.servlet.client;

import vn.edu.hcmuaf.fit.bibica.beans.User;
import vn.edu.hcmuaf.fit.bibica.service.UserService;
import vn.edu.hcmuaf.fit.bibica.utils.GooglePojo;
import vn.edu.hcmuaf.fit.bibica.utils.GoogleUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginGoogleServlet", value = "/signin-google")
public class LoginGoogleServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            // Nếu user hủy hoặc lỗi -> Quay về trang login
            response.sendRedirect(request.getContextPath() + "/signin?error=google_cancel");
            return;
        }

        try {
            // 1. Lấy Token từ Code
            String accessToken = GoogleUtils.getToken(code);

            // 2. Lấy thông tin User từ Token
            GooglePojo googleUser = GoogleUtils.getUserInfo(accessToken);

            // 3. Xử lý Login hoặc Register
            User user = userService.processGoogleLogin(googleUser);

            // 4. Lưu vào Session
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);

            // 5. Về trang chủ
            response.sendRedirect(request.getContextPath() + "/");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/signin?error=google_error");
        }
    }
}