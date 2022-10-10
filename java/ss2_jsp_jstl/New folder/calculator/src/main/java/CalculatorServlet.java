import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculator")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstOperand = Double.parseDouble(request.getParameter("firstOperand"));

        double secondOperand = Double.parseDouble(request.getParameter("secondOperand"));

        String operator = request.getParameter("operator");

        double result = 0;

        if (operator.equals("add")) {
            result = firstOperand * secondOperand;
        } else if (operator.equals("div")) {
            result = firstOperand / secondOperand;
        } else if (operator.equals("sum")) {
            result = firstOperand + secondOperand;
        } else if (operator.equals("sub")) {
            result = firstOperand - secondOperand;
        }
        request.setAttribute("result", result);
        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
