package vn.edu.hcmuaf.fit.bibica.servlet.client;

import vn.edu.hcmuaf.fit.bibica.beans.Category;
import vn.edu.hcmuaf.fit.bibica.beans.Product;
import vn.edu.hcmuaf.fit.bibica.beans.User;
import vn.edu.hcmuaf.fit.bibica.service.CategoryService;
import vn.edu.hcmuaf.fit.bibica.service.ProductService;
import vn.edu.hcmuaf.fit.bibica.service.WishlistItemService;
import vn.edu.hcmuaf.fit.bibica.utils.Protector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.*;

@WebServlet(name = "HomeServlet", value = "")
public class HomeServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();
    private final ProductService productService = new ProductService();

    //1.
    private final WishlistItemService wishlistItemService = new WishlistItemService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = Protector.of(() -> categoryService.getOrderedPart(8, 0, "id", "DESC"))
                .get(ArrayList::new);
        List<Product> products = Protector.of(() -> productService.getOrderedPart(15, 0, "createdAt", "DESC"))
                .get(ArrayList::new);

        // 2. Xử lý Logic Wishlist cho danh sách sản phẩm
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        Map<Long, Integer> wishlistMap = new HashMap<>();

        if (currentUser != null) {
            for (Product product : products) {
                // Kiểm tra từng sản phẩm xem user có like chưa
                int count = Protector.of(() -> wishlistItemService
                        .countByUserIdAndProductId(currentUser.getId(), product.getId())).get(0);
                wishlistMap.put(product.getId(), count);
            }
        }

            request.setAttribute("categories", categories);
            request.setAttribute("products", products);

        // 3. Gửi map trạng thái wishlist qua view
        request.setAttribute("wishlistMap", wishlistMap);

            request.getRequestDispatcher("/WEB-INF/views/homeView.jsp").forward(request, response);



        //test
        System.out.println("Chạy project thành công. Đang ở HomeServlet và homeView.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
