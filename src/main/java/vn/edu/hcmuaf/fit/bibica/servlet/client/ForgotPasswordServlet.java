package vn.edu.hcmuaf.fit.bibica.servlet.client;

import vn.edu.hcmuaf.fit.bibica.service.UserService;
import vn.edu.hcmuaf.fit.bibica.utils.EmailUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "ForgotPasswordServlet", value = "/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/forgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        // 1. Kiểm tra email có tồn tại trong DB không
        if (userService.checkEmailExist(email)) {
            // 2. Sinh OTP
            String otp = EmailUtils.generateOTP();

            // 3. Gửi mail (Nên chạy trong Thread riêng để user không phải đợi lâu, nhưng làm đơn giản thì cứ để đây)
            EmailUtils.sendEmail(email, "Mã xác thực quên mật khẩu BiBiCa Shop", "Mã OTP của bạn là: " + otp);

            // 4. Lưu OTP và Email vào Session để check ở bước sau
            HttpSession session = request.getSession();
            session.setAttribute("otp", otp);
            session.setAttribute("email", email);
            session.setAttribute("otpCreationTime", System.currentTimeMillis()); // Để check hết hạn nếu cần

            // 5. Chuyển hướng sang trang nhập OTP
            response.sendRedirect(request.getContextPath() + "/verify-otp");
        } else {
            request.setAttribute("error", "Email không tồn tại trong hệ thống!");
            request.getRequestDispatcher("/WEB-INF/views/forgotPassword.jsp").forward(request, response);
        }
    }
}