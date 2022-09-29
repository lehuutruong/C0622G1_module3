import model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns={"/customer"})
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList= new ArrayList<>();
    static {
        customerList.add(new Customer(1,"Mai Văn Hoàn","1983-08-20","Hà Nội"));
        customerList.add(new Customer(2,"Nguyễn Văn Nam","1983-08-21","Bắc Giang"));
        customerList.add(new Customer(3,"Nguyễn Thái Hòa","1983-08-22","Nam Định"));
        customerList.add(new Customer(4,"Trần Đăng Khoa","1983-08-17","Hà Tây"));
        customerList.add(new Customer(5,"Nguyễn Đình Thi","1983-08-19","Hà Nội"));
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     request.setAttribute("customerList",customerList);
     request.getRequestDispatcher("/customer/listCustomer.jsp").forward(request,response);

    }
}
