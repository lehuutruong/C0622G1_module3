package controller;

import model.Product;
import service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {
    private static ProductService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                saveProduct(request, response);
                break;
            default:
                // hiện thị list
        }
    }

    private void saveProduct(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String productCompany = request.getParameter("productCompany");
        Product product = new Product(id, name, price, productCompany);
        productService.add(product);
        request.setAttribute("mess", "Them moi Thanh Cong");
        showProduct(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addProduct(request, response);
                break;
            default:
                showProduct(request, response);
        }
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/product/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showProduct(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("showProduct", productService.showAll());
        try {
            request.getRequestDispatcher("view/product/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
