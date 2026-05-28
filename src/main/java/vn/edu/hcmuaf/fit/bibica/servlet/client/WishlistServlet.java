package vn.edu.hcmuaf.fit.bibica.servlet.client;

import vn.edu.hcmuaf.fit.bibica.beans.Product;
import vn.edu.hcmuaf.fit.bibica.beans.User;
import vn.edu.hcmuaf.fit.bibica.beans.WishlistItem;
import vn.edu.hcmuaf.fit.bibica.dto.ErrorMessage;
import vn.edu.hcmuaf.fit.bibica.dto.SuccessMessage;
import vn.edu.hcmuaf.fit.bibica.dto.WishlistItemRequest;
import vn.edu.hcmuaf.fit.bibica.service.ProductService;
import vn.edu.hcmuaf.fit.bibica.service.WishlistItemService;
import vn.edu.hcmuaf.fit.bibica.utils.JsonUtils;
import vn.edu.hcmuaf.fit.bibica.utils.Protector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "WishlistServlet", value = "/wishlist")
public class WishlistServlet extends HttpServlet {
    private final WishlistItemService wishlistItemService = new WishlistItemService();
    private final ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");

        if (user != null) {
            List<WishlistItem> wishlistItems = Protector.of(() -> wishlistItemService.getByUserId(user.getId()))
                    .get(ArrayList::new);

            for (WishlistItem wishlistItem : wishlistItems) {
                wishlistItem.setProduct(productService.getById(wishlistItem.getProductId()).orElseGet(Product::new));
            }

            request.setAttribute("wishlistItems", wishlistItems);
        }

        request.getRequestDispatcher("/WEB-INF/views/wishlistView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Protector.of(() -> Long.parseLong(request.getParameter("id"))).get(0L);
        Protector.of(() -> wishlistItemService.delete(id));
        response.sendRedirect(request.getContextPath() + "/wishlist");
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        WishlistItemRequest wishlistItemRequest = JsonUtils.get(request, WishlistItemRequest.class);

        String successMessage = "Đã thêm sản phẩm vào danh sách yêu thích thành công!";
        String errorMessage = "Đã có lỗi truy vấn!";

        Runnable doneFunction = () -> JsonUtils.out(
                response,
                new SuccessMessage(200, successMessage),
                HttpServletResponse.SC_OK);
        Runnable failFunction = () -> JsonUtils.out(
                response,
                new ErrorMessage(404, errorMessage),
                HttpServletResponse.SC_NOT_FOUND);

        WishlistItem wishlistItem = new WishlistItem();
        wishlistItem.setUserId(wishlistItemRequest.getUserId());
        wishlistItem.setProductId(wishlistItemRequest.getProductId());

        Protector.of(() -> wishlistItemService.insert(wishlistItem))
                .done(r -> doneFunction.run())
                .fail(e -> failFunction.run());
    }
}
