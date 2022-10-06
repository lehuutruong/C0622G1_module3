package service.impl;

import model.Employee;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.sql.SQLException;
import java.util.List;

public class EmployeeService  implements IEmployeeService {
     private  static EmployeeRepository employeeRepository= new EmployeeRepository();
    @Override
    public List<Employee> showEmployeeList() {
        return employeeRepository.showEmployeeList();
    }

    @Override
    public void create(Employee employee) {
        employeeRepository.create(employee);
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        return employeeRepository.updateEmployee(employee);
    }

    @Override
    public Employee selectEmployee(int id) {
        return employeeRepository.selectEmployee(id);
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        return employeeRepository.deleteEmployee(id);
    }
}
