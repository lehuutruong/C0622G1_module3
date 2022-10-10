package service.impl;

import dto.EmployeeDto;
import model.Employee;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;
import validation.Validation;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeService  implements IEmployeeService {
     private  static EmployeeRepository employeeRepository= new EmployeeRepository();
    @Override
    public List<Employee> showEmployeeList() {
        return employeeRepository.showEmployeeList();
    }

//    @Override
//    public void create(Employee employee) {
//        employeeRepository.create(employee);
//    }

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

    @Override
    public void deleteEmployeeList(int id) {
        employeeRepository.deleteEmployeeList(id);
    }

    @Override
    public List<EmployeeDto> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    public List<EmployeeDto> search(String searchName, String searchEmail, String searchPositionIdName) {
        return employeeRepository.search(searchName,searchEmail,searchPositionIdName);
    }

    @Override
    public Map<String, String> add(Employee employee) {
        Map<String, String> errorMap=new HashMap<>();
        if("".equals(employee.getEmail())){
            errorMap.put("email","Email not blank");
        }
        else if(!Validation.checkMail(employee.getEmail())){
            errorMap.put("email","Email is not right format");
        }
        if("".equals(employee.getName())){
            errorMap.put("name","Name is not blank");
        }
        else  if(!Validation.checkName(employee.getName())){
            errorMap.put("name","Name is not right format");
        }
        if("".equals(employee.getPhoneNumber())){
            errorMap.put("phoneNumber","Phone Number not blank");
        }
        else if(!Validation.checkPhoneNumber(employee.getPhoneNumber())){
            errorMap.put("phoneNumber","Phone number is not right format");
        }if("".equals(employee.getDateOfBirth())){
            errorMap.put("birthDay","Date of birth not blank");
        }
        else if(!Validation.checkBirthDay(employee.getDateOfBirth())){
            errorMap.put("birthDay","birthDay is not right format");
        }
        if ("".equals(employee.getSalary())){
            errorMap.put("salary","Salary is not blank");
        }
         else  if(employee.getSalary()<0&& employee.getSalary()>1000000000){
            errorMap.put("salary"," no negative salary and Salary should not be too much");
        }
        if(errorMap.size()==0){
            employeeRepository.create(employee);
        }
        return errorMap;
    }
}
