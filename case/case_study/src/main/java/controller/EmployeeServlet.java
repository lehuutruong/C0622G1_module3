package controller;

import dto.EmployeeDto;
import model.Employee;
import service.impl.EmployeeService;
import service.impl.PositionService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    private EmployeeService employeeService = new EmployeeService();
    private PositionService positionService = new PositionService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "add":
                saveEmployee(request, response);
                break;
            case "edit":
                updateUser(request, response);
                break;
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String userName = request.getParameter("userName");
        Employee book = new Employee(id, name, dateOfBirth, idCard, salary, phoneNumber, email, address, positionId, educationDegreeId, divisionId, userName);
        employeeService.updateEmployee(book);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addEmployeeForm(request, response);
                break;
            case "delete":
                deleteEmployeeList(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "search":
                search(request, response);
                break;
            default:
                showEmployeeList(request, response);
                break;
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String searchName = request.getParameter("searchName");
        String searchEmail = request.getParameter("searchEmail");
        String searchPositionIdName = request.getParameter("searchPositionIdName");
        request.setAttribute("position", positionService.findAllPosition());
        List<EmployeeDto> employeeDtoList = employeeService.search(searchName,searchEmail,searchPositionIdName);
         request.setAttribute("employeeList",employeeDtoList);
        try {
            request.getRequestDispatcher("/view/employeeList.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteEmployeeList(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.deleteEmployeeList(id);
        showEmployeeList(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee existingUser = employeeService.selectEmployee(id);
        try {
            request.setAttribute("employeeList", existingUser);
            request.getRequestDispatcher("/view/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void saveEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String userName = request.getParameter("userName");
        Employee employee = new Employee(name, birthday, idCard, salary, phoneNumber, email, address, positionId, educationDegreeId, divisionId, userName);
        Map<String,String> map=employeeService.add(employee);
        String mess="successfully add new ";
        if(map.size()!=0){
            mess="successfully  add new not not";
            request.setAttribute("map",map);
        }
        request.setAttribute("mess",mess);
//        employeeService.create(employee);
//        showEmployeeList(request, response);
            addEmployeeForm(request,response);

    }

    private void addEmployeeForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/addEmployeeForm.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEmployeeList(HttpServletRequest request, HttpServletResponse response) {
//        List<Employee> employeeList = employeeService.showEmployeeList();
        request.setAttribute("position", positionService.findAllPosition());
        List<EmployeeDto> employeeList = employeeService.findAll();
        request.setAttribute("employeeList", employeeList);
        try {
            request.getRequestDispatcher("view/employeeList.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}