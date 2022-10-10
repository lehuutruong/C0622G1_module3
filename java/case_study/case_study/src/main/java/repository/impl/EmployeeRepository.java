package repository.impl;

import dto.EmployeeDto;
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
    private static final String SELECT_EMPLOYEE_BY_ID = "select * from employee where id = ?;";
    private static final String SELECT_ALL_EMPLOYEE = "select * from employee;";
    private static final String DELETE_EMPLOYEE_SQL = "delete from employee where id = ?;";
    private static final String UPDATE_EMPLOYEE_SQL = "update employee set name = ?,date_of_birth = ?,id_card = ?,salary = ?,phone_number = ?,email = ?,address = ?,position_id = ?,education_degree_id = ?,division_id = ?,username = ? where id = ?;";
    private static final String SELECT_ALL_EMPLOYEE_DTO = "select e.*,p.name as position_name from employee e join position p on e.position_id=p.id;";
    private static final String SEARCH = "select e.*,p.name as position_name from employee e left join position p on e.position_id=p.id where e.name like ? and e.email like ? and p.name like ?;";

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
                double salary = rs.getDouble("salary");
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
            statement.setDouble(4, employee.getSalary());
            statement.setString(5, employee.getPhoneNumber());
            statement.setString(6, employee.getEmail());
            statement.setString(7, employee.getAddress());
            statement.setInt(8, employee.getPositionId());
            statement.setInt(9, employee.getEducationDegreeId());
            statement.setInt(10, employee.getDivisionId());
            statement.setString(11, employee.getUserName());
            statement.setInt(12, employee.getId());
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
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String dateOfBirth = rs.getString("date_of_birth");
                String idCard = rs.getString("id_card");
                Double salary = rs.getDouble("salary");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int positionId = rs.getInt("position_name");
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

    @Override
    public void deleteEmployeeList(int id) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE_SQL);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public List<EmployeeDto> findAll() {
        Connection connection = getConnection();
        List<EmployeeDto> employeeDtoList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE_DTO);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String dateOfBirth = resultSet.getString("date_of_birth");
                String idCard = resultSet.getString("id_card");
                Double salary = resultSet.getDouble("salary");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                String positionIdName = resultSet.getString("position_name");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String userName = resultSet.getString("username");
                EmployeeDto employeeDto = new EmployeeDto(id, name, dateOfBirth, idCard, salary, phoneNumber, email, address, positionIdName, educationDegreeId, divisionId, userName);
                employeeDtoList.add(employeeDto);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeDtoList;
    }

    @Override
    public List<EmployeeDto> search(String searchName, String searchEmail, String searchPositionIdName) {
        List<EmployeeDto> employeeDto = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement pr = connection.prepareStatement(SEARCH);
            pr.setString(1, "%" + searchName + "%");
            pr.setString(2, "%" + searchEmail + "%");
            pr.setString(3, "%" + searchPositionIdName + "%");
            ResultSet resultSet = pr.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String dateOfBirth = resultSet.getString("date_of_birth");
                String idCard = resultSet.getString("id_card");
                Double salary = resultSet.getDouble("salary");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                String positionIdName = resultSet.getString("position_name");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");
                String userName = resultSet.getString("username");
                EmployeeDto employeeDtoList = new EmployeeDto(id, name, dateOfBirth, idCard, salary, phoneNumber, email, address, positionIdName, educationDegreeId, divisionId, userName);
                employeeDto.add(employeeDtoList);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeDto;
    }

}
