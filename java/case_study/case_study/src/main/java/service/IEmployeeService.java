package service;

import model.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeService {
    List<Employee> showEmployeeList();
    void create(Employee employee);
    boolean updateEmployee(Employee employee);
    Employee selectEmployee(int id);
    boolean deleteEmployee(int id) throws SQLException;
}
