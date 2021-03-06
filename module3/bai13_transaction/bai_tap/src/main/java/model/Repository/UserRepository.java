package model.Repository;

import model.bean.User;

import java.sql.SQLException;
import java.util.List;

public interface UserRepository {
    public void insertUser(User user)throws SQLException;
    public User selectUser(int id);
    public List<User> selectAllUser();
    public boolean deleteUser(int id) throws SQLException;
    public boolean updateUser(User user) throws SQLException;
    public List<User> search(String country);
    public List<User> sortName();
    public List<User> searchId(int id);
    public void insertUserStore(User user);
    void addUserTransaction(User user,int [] permision);
    public void insertUpdateWithoutTransaction();
    public void insertUpdateTransaction();
//bài tập 1 : stored procedure
public void insertUserSP(User user);
public boolean updateUserSP(User user);
public boolean deleteUserSP(int id);


}
