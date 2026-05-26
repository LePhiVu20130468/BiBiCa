package vn.edu.hcmuaf.fit.bibica.servlet.client;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "VerifyOtpServlet", value = "/verify-otp")
public class VerifyOtpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/verifyOtp.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String inputOtp = request.getParameter("otp");
        HttpSession session = request.getSession();
        String sessionOtp = (String) session.getAttribute("otp");

        if (sessionOtp != null && sessionOtp.equals(inputOtp)) {
            // OTP đúng -> Cho phép đổi mật khẩu
            response.sendRedirect(request.getContextPath() + "/reset-password");
        } else {
            request.setAttribute("error", "Mã OTP không chính xác!");
            request.getRequestDispatcher("/WEB-INF/views/verifyOtp.jsp").forward(request, response);
        }
    }
}