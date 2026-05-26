package vn.edu.hcmuaf.fit.bibica.servlet.general;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/change-lang") // URL mapping
public class LanguageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. Lấy tham số lang từ URL (ví dụ: ?lang=en)
        String lang = req.getParameter("lang");

        // 2. Lưu vào Session để dùng xuyên suốt phiên làm việc
        HttpSession session = req.getSession();
        if (lang != null && (lang.equals("vi") || lang.equals("en"))) {
            session.setAttribute("lang", lang);
        } else {
            // Mặc định là tiếng Việt nếu không chọn gì
            session.setAttribute("lang", "vi");
        }

        // 3. Quay lại trang người dùng vừa đứng (Referer) hoặc về trang chủ
        String referer = req.getHeader("referer");
        if (referer != null) {
            resp.sendRedirect(referer);
        } else {
            resp.sendRedirect("index.jsp"); // hoặc trang chủ của bạn
        }
    }
}
