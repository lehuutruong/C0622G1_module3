package service;

import model.Customer;
import model.Employee;

import java.sql.SQLException;
import java.util.List;

public interface ICustomerService {
    List<Customer> showCustomerList();
    void create(Customer customer);
    boolean updateCustomer(Customer customer);
    Employee selectCustomer(int id);
    boolean deleteCustomer(int id) throws SQLException;
    void deleteCustomerList(int id);
}
