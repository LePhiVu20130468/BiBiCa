package vn.edu.hcmuaf.fit.bibica.servlet.admin.product;

import vn.edu.hcmuaf.fit.bibica.beans.Category;
import vn.edu.hcmuaf.fit.bibica.beans.Product;
import vn.edu.hcmuaf.fit.bibica.service.CategoryService;
import vn.edu.hcmuaf.fit.bibica.service.ProductService;
import vn.edu.hcmuaf.fit.bibica.utils.Protector;
import vn.edu.hcmuaf.fit.bibica.utils.TextUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "ProductDetailServlet", value = "/admin/productManager/detail")
public class ProductDetailServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Protector.of(() -> Long.parseLong(request.getParameter("id"))).get(0L);
        Optional<Product> productFromServer = Protector.of(() -> productService.getById(id)).get(Optional::empty);

        if (productFromServer.isPresent()) {
            Product product = productFromServer.get();
            product.setDescription(TextUtils.toParagraph(Optional.ofNullable(product.getDescription()).orElse("")));

            Optional<Category> categoryFromServer = Protector.of(() -> categoryService.getByProductId(id)).get(Optional::empty);

            request.setAttribute("product", product);
            request.setAttribute("category", categoryFromServer.orElseGet(Category::new));
            request.getRequestDispatcher("/WEB-INF/views/productDetailView.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/productManager");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
