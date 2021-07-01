package model.UserService;

import model.bean.User;

import javax.jws.soap.SOAPBinding;
import java.sql.SQLException;
import java.util.List;

public interface UserService {
    public void insertUser(User user)throws SQLException;
    public User selectUser(int id);
    public List<User> selectAllUser();
    public boolean deleteUser(int id) throws SQLException;
    public boolean updateUser(User user) throws SQLException;
    public List<User> search(String country);
    public List<User> sortName();
}
