package login.model.repository;

import login.model.bean.Login;
import login.model.bean.User;

public interface UserRepository {
    public User checkLogin(Login login);
}
