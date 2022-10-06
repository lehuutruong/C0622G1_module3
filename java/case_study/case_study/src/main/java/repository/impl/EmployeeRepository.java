package repository.impl;

import model.Employee;
import repository.IEmployeeRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/case_study_jspsvl";
    private String jdbcUsername = "root";
    private String jdbcPassword = "truongkhangasdf";

    private static final String INSERT_EMPLOYEE_SQL = "insert into employee (name,date_of_birth,id_card,salary,phone_number,email,address,position_id,education_degree_id,division_id,username) values(?,?,?,?,?,?,?,?,?,?,?);";
    private static final String SELECT_EMPLOYEE_BY_ID = "select name,date_of_birth,id_card,salary,phone_number,email,address,position_id,education_degree_id,division_id,username from employee where id =?";
    //    private static final String SELECT_USER_BY_COUNTRY = "select * from users where country like ?";
    private static final String SELECT_ALL_EMPLOYEE = "select * from employee;";
        private static final String DELETE_EMPLOYEE_SQL = "delete from employee where id = ?;";
    private static final String UPDATE_EMPLOYEE_SQL = "update employee set name = ?,date_of_birth = ?,id_card = ?,salary = ?,phone_number = ?,email = ?,address = ?,position_id = ?,education_degree_id = ?,division_id = ?,username = ? where id = ?;";
//    private static final String SORT_NAME = "select * from users order by name;";

    public EmployeeRepository() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<Employee> showEmployeeList() {
        List<Employee> employees = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String dateOfBirth = rs.getString("date_of_birth");
                String idCard = rs.getString("id_card");
                Double salary = rs.getDouble("salary");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int positionId = rs.getInt("position_id");
                int educationDegreeId = rs.getInt("education_degree_id");
                int divisionId = rs.getInt("division_id");
                String userName = rs.getString("username");
                Employee employee = new Employee(id, name, dateOfBirth, idCard, salary, phoneNumber, email, address, positionId, educationDegreeId, divisionId, userName);
                employees.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return employees;
    }

    @Override
    public void create(Employee employee) {
        Connection connection = getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_EMPLOYEE_SQL);
            ps.setString(1, employee.getName());
            ps.setString(2, employee.getDateOfBirth());
            ps.setString(3, employee.getIdCard());
            ps.setDouble(4, employee.getSalary());
            ps.setString(5, employee.getPhoneNumber());
            ps.setString(6, employee.getEmail());
            ps.setString(7, employee.getAddress());
            ps.setInt(8, employee.getPositionId());
            ps.setInt(9, employee.getEducationDegreeId());
            ps.setInt(10, employee.getDivisionId());
            ps.setString(11, employee.getUserName());
            ps.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public boolean updateEmployee(Employee employee) {
        boolean rowUpdated = false;
        Connection connection = getConnection();
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(UPDATE_EMPLOYEE_SQL);
            statement.setString(1, employee.getName());
            statement.setString(2, employee.getDateOfBirth());
            statement.setString(3, employee.getIdCard());
            statement.setDouble(5, employee.getSalary());
            statement.setString(6, employee.getPhoneNumber());
            statement.setString(7, employee.getEmail());
            statement.setInt(8, employee.getPositionId());
            statement.setInt(9, employee.getEducationDegreeId());
            statement.setInt(10, employee.getDivisionId());
            statement.setString(11, employee.getUserName());
            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdated;

    }

    @Override
    public Employee selectEmployee(int id) {
        Employee employee = null;
        Connection connection = getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            preparedStatement.setInt(1, id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        try {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String dateOfBirth = rs.getString("date_of_birth");
                String idCard = rs.getString("id_card");
                Double salary = rs.getDouble("salary");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int positionId = rs.getInt("position_id");
                int educationDegreeId = rs.getInt("education_degree_id");
                int divisionId = rs.getInt("division_id");
                String userName = rs.getString("username");
                employee = new Employee(name, dateOfBirth, idCard, salary, phoneNumber, email, address, positionId, educationDegreeId, divisionId, userName);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employee;
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        boolean rowDeleted;
        Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(DELETE_EMPLOYEE_SQL);
        statement.setInt(1, id);
        rowDeleted = statement.executeUpdate() > 0;

        return rowDeleted;
    }

}