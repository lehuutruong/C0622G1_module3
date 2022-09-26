import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(name = "ProductDiscountCalculatorAppServlet", urlPatterns = "/display-discount")
public class ProductDiscountCalculatorAppServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productDescription = request.getParameter("product_description");
        double listPrice = Double.parseDouble(request.getParameter("list_price"));
        double discountPercent = Double.parseDouble(request.getParameter("discount_percent"));
        BigDecimal discountAmount= new BigDecimal(listPrice * discountPercent * 0.01);
        BigDecimal discountPrice=new BigDecimal(listPrice-listPrice * discountPercent * 0.01);
        request.setAttribute("productDescription", productDescription);
        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("discountPrice", discountPrice);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
