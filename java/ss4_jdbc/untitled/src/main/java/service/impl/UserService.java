package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();
    @Override
    public void insertUser(User user) throws SQLException {
        userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepository.selectAllUsers();
    }

    @Override
    public List<User> selectAllUsersNo2() {
        return userRepository.selectAllUsersNo2();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean deleteUserNo2(int id) throws SQLException {
        return userRepository.deleteUserNo2(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }

    @Override
    public boolean updateUserNo2(User user) throws SQLException {
        return userRepository.updateUserNo2(user);
    }

    @Override
    public List<User> findByCountry(String country) {
        return userRepository.findByCountry(country);
    }

    @Override
    public List<User> sortByName() {
        return userRepository.sortByName();
    }

    @Override
    public User getUserById(int id) {
        return userRepository.getUserById(id);
    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        userRepository.insertUserStore(user);
    }
}
