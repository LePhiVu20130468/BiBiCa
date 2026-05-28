package vn.edu.hcmuaf.fit.bibica.servlet.admin.product;

import vn.edu.hcmuaf.fit.bibica.beans.Category;
import vn.edu.hcmuaf.fit.bibica.beans.Product;
import vn.edu.hcmuaf.fit.bibica.service.CategoryService;
import vn.edu.hcmuaf.fit.bibica.service.ProductService;
import vn.edu.hcmuaf.fit.bibica.utils.ImageUtils;
import vn.edu.hcmuaf.fit.bibica.utils.Protector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "DeleteProductServlet", value = "/admin/productManager/delete")
public class DeleteProductServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Protector.of(() -> Long.parseLong(request.getParameter("id"))).get(0L);
        Optional<Product> productFromServer = Protector.of(() -> productService.getById(id)).get(Optional::empty);

        if (productFromServer.isPresent()) {
            String successMessage = String.format("Xóa sản phẩm #%s thành công!", id);
            String errorMessage = String.format("Xóa sản phẩm #%s thất bại!", id);

            Optional<Category> categoryFromServer = Protector.of(() -> categoryService.getByProductId(id)).get(Optional::empty);

            Protector.of(() -> {
                        categoryFromServer.ifPresent(category -> productService.deleteProductCategory(id, category.getId()));
                        productService.delete(id);
                        Optional.ofNullable(productFromServer.get().getImageName()).ifPresent(ImageUtils::delete);
                    })
                    .done(r -> request.getSession().setAttribute("successMessage", successMessage))
                    .fail(e -> request.getSession().setAttribute("errorMessage", errorMessage));
        }

        response.sendRedirect(request.getContextPath() + "/admin/productManager");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
