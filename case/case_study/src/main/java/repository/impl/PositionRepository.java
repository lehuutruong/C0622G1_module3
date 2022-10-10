package repository.impl;

import model.Position;
import repository.IPositionRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IPositionRepository {
    private String jdbcURL = "jdbc:mysql://localhost:3306/case_study_jspsvl";
    private String jdbcUsername = "root";
    private String jdbcPassword = "truongkhangasdf";
    private static String SELECT_ALL="select * from position;";

    public PositionRepository() {
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
    public List<Position> findAllPosition() {
        List<Position>positions=new ArrayList<>();
     Connection connection=getConnection();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String positionName =resultSet.getString("name");
                Position position=new Position(id,positionName);
                positions.add(position);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return positions;
    }
}
