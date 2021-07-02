package model.Service;

import model.Repository.UserRepository;
import model.Repository.UserRepositoryIplm;
import model.bean.User;

import java.sql.SQLException;
import java.util.List;

public class UserServiceIplm implements UserService {
    private UserRepository userRepository=new UserRepositoryIplm();

    @Override
    public void insertUser(User user) throws SQLException {
        userRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUser() {
        return userRepository.selectAllUser();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRepository.updateUser(user);
    }

    @Override
    public List<User> search(String country) {
        return userRepository.search(country);
    }

    @Override
    public List<User> sortName() {
        return userRepository.sortName();
    }

    @Override
    public List<User> searchId(int id) {
        return userRepository.searchId(id);
    }

    @Override
    public void insertUserStore(User user) {
        userRepository.insertUserStore(user);
    }

    @Override
    public void addUserTransaction(User user, int[] permision) {
        userRepository.addUserTransaction(user,permision);
    }


}
