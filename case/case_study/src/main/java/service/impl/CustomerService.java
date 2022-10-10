package service.impl;

import model.Customer;
import model.Employee;
import service.ICustomerService;

import java.sql.SQLException;
import java.util.List;

public class CustomerService implements ICustomerService {
    @Override
    public List<Customer> showCustomerList() {
        return null;
    }

    @Override
    public void create(Customer customer) {

    }

    @Override
    public boolean updateCustomer(Customer customer) {
        return false;
    }

    @Override
    public Employee selectCustomer(int id) {
        return null;
    }

    @Override
    public boolean deleteCustomer(int id) throws SQLException {
        return false;
    }

    @Override
    public void deleteCustomerList(int id) {

    }
}
