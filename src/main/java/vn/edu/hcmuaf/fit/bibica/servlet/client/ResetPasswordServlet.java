package vn.edu.hcmuaf.fit.bibica.servlet.client;

import vn.edu.hcmuaf.fit.bibica.service.UserService;
import vn.edu.hcmuaf.fit.bibica.utils.HashingUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "ResetPasswordServlet", value = "/reset-password")
public class ResetPasswordServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kiểm tra xem đã verify OTP chưa (tránh truy cập trực tiếp URL này)
        HttpSession session = request.getSession();
        if (session.getAttribute("email") == null || session.getAttribute("otp") == null) {
            response.sendRedirect(request.getContextPath() + "/signin");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/views/resetPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("/WEB-INF/views/resetPassword.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        // Hash mật khẩu mới và lưu xuống DB
        String hashedPassword = HashingUtils.hash(newPassword);
        userService.changePasswordByEmail(email, hashedPassword);

        // 1. Xóa session liên quan đến OTP
        session.removeAttribute("otp");
        session.removeAttribute("email");
        session.removeAttribute("otpCreationTime");

        // 2. Thay vì redirect, ta set một biến báo hiệu thành công
        request.setAttribute("resetSuccess", true);

        // 3. Forward lại về trang JSP để hiển thị giao diện thành công
        request.getRequestDispatcher("/WEB-INF/views/resetPassword.jsp").forward(request, response);
    }
}