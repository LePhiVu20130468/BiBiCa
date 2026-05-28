package vn.edu.hcmuaf.fit.bibica.servlet.client;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.bibica.beans.Product;
import vn.edu.hcmuaf.fit.bibica.beans.User;
import vn.edu.hcmuaf.fit.bibica.service.ProductService;
import vn.edu.hcmuaf.fit.bibica.service.WishlistItemService;
import vn.edu.hcmuaf.fit.bibica.utils.Protector;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductsServlet", value = "/products")
public class ProductsServlet extends HttpServlet {

    private final ProductService productService = new ProductService();
    private final WishlistItemService wishlistItemService = new WishlistItemService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = Protector.of(() -> productService.getOrderedPart(productService.count(), 0, "createdAt", "DESC"))
                .get(ArrayList::new);
        // Xử lý Logic WishlistMap (Copy từ HomeServlet qua)
        User currentUser = (User) request.getSession().getAttribute("currentUser");
        Map<Long, Integer> wishlistMap = new HashMap<>();

        if (currentUser != null) {
            for (Product product : products) { // Chú ý tên biến list sản phẩm phải khớp
                int count = Protector.of(() -> wishlistItemService
                        .countByUserIdAndProductId(currentUser.getId(), product.getId())).get(0);
                wishlistMap.put(product.getId(), count);
            }
        }
        request.setAttribute("allProduct", products);
        // 3. Gửi map qua view
        request.setAttribute("wishlistMap", wishlistMap);
        request.getRequestDispatcher("/WEB-INF/views/productsView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

}
