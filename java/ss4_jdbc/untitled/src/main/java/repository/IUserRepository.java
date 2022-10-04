package repository;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    void insertUser(User user) throws SQLException;

    User selectUser(int id);

    List<User> selectAllUsers();

    List<User> selectAllUsersNo2();

    boolean deleteUser(int id) throws SQLException;

    boolean deleteUserNo2(int id) throws SQLException;

    boolean updateUser(User user) throws SQLException;

    boolean updateUserNo2(User user) throws SQLException;

    List<User> findByCountry(String country);

    List<User> sortByName();

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;
}
