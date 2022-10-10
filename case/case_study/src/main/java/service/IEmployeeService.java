package service;

import dto.EmployeeDto;
import model.Employee;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IEmployeeService {
    List<Employee> showEmployeeList();
//    void create(Employee employee);
    boolean updateEmployee(Employee employee);
    Employee selectEmployee(int id);
    boolean deleteEmployee(int id) throws SQLException;
    void deleteEmployeeList(int id);
    List<EmployeeDto> findAll();
    List<EmployeeDto> search(String searchName,String searchEmail,String searchPositionIdName);
  Map<String,String> add(Employee employee);
}
