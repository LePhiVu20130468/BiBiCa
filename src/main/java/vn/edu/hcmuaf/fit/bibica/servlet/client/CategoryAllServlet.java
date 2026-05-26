package vn.edu.hcmuaf.fit.bibica.servlet.client;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.bibica.beans.Category;
import vn.edu.hcmuaf.fit.bibica.service.CategoryService;
import vn.edu.hcmuaf.fit.bibica.utils.Protector;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryAllServlet", value = "/categoryAll")
public class CategoryAllServlet extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = Protector.of(() -> categoryService.getOrderedPart(categoryService.count(), 0, "id", "DESC"))
                .get(ArrayList::new);
        request.setAttribute("categoriesAll", categories);
        request.getRequestDispatcher("/WEB-INF/views/categoryViewAll.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

}
