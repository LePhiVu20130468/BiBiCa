package vn.edu.hcmuaf.fit.bibica.servlet.client;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bibica.dao.UserDAO;
import vn.edu.hcmuaf.fit.bibica.utils.JdbiUtils;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = {"/api/check-username"})
public class CheckUsernameServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1. Thiết lập kiểu trả về là JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        // 2. Lấy tham số username từ AJAX gửi lên
        String username = req.getParameter("username");
        boolean exists = false;

        // Chỉ xử lý nếu username không rỗng
        if (username != null && !username.trim().isEmpty()) {
            try {
                // 3. Khởi tạo JDBI từ Utils của bạn
                Jdbi jdbi = JdbiUtils.createInstance();

                // 4. Lấy UserDAO (dùng onDemand để tự quản lý connection đóng/mở)
                UserDAO userDAO = jdbi.onDemand(UserDAO.class);

                // 5. Kiểm tra username có tồn tại không
                // getByUsername trả về Optional, isPresent() trả về true nếu có data
                exists = userDAO.getByUsername(username).isPresent();

            } catch (Exception e) {
                e.printStackTrace();
                // Nếu lỗi kết nối DB, trả về mã lỗi 500 để bên Javascript biết
                resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                return;
            }
        }

        // 6. Trả kết quả về cho Client
        try (PrintWriter out = resp.getWriter()) {
            out.print("{\"exists\": " + exists + "}");
            out.flush();
        }
    }
}