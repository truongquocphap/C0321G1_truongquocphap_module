package login.model.service;

import login.model.bean.Login;
import login.model.bean.User;

public interface UserService {
    public User checkLogin(Login login);
}
