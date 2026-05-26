package vn.edu.hcmuaf.fit.bibica.filter;

import vn.edu.hcmuaf.fit.bibica.beans.Category;
import vn.edu.hcmuaf.fit.bibica.dto.ErrorMessage;
import vn.edu.hcmuaf.fit.bibica.service.CategoryService;
import vn.edu.hcmuaf.fit.bibica.utils.JsonUtils;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebFilter;
import vn.edu.hcmuaf.fit.bibica.utils.Protector;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter(filterName = "ExceptionFilter", value = "/*")
public class ExceptionFilter implements Filter {
    private final CategoryService categoryService = new CategoryService();
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        try {
            HttpServletRequest requestS = (HttpServletRequest) request;

            List<Category> categories = Protector.of(() -> categoryService.getOrderedPart(8, 0, "id", "DESC"))
                    .get(ArrayList::new);
            requestS.setAttribute("categories", categories);
            chain.doFilter(request, response);
        } catch (RuntimeException e) {
            ErrorMessage errorMessage = new ErrorMessage(400, e.toString());
            JsonUtils.out(response, errorMessage, HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
