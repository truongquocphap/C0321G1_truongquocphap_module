package login.model.repository;

import login.model.bean.Login;
import login.model.bean.User;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
@Repository
public class UserRepositoryImpl implements UserRepository {

    @Override
    public User checkLogin(Login login) {
        List<User> users;
            users = new ArrayList<>();
            User u1 = new User();
            u1.setAge(10);
            u1.setName("John");
            u1.setAccount("john");
            u1.setEmail("john@codegym.vn");
            u1.setPassword("123456");
            users.add(u1);

            User u2 = new User();
            u2.setAge(15);
            u2.setName("Bill");
            u2.setAccount("bill");
            u2.setEmail("bill@codegym.vn");
            u2.setPassword("123456");
            users.add(u2);

            User u3 = new User();
            u3.setAge(16);
            u3.setName("Mike");
            u3.setAccount("mike");
            u3.setEmail("mike@codegym.vn");
            u3.setPassword("123456");
            users.add(u3);


        for (User user:users) {
            System.out.println(user.getAccount());
            System.out.println(user.getPassword());
            if(user.getAccount().equals(login.getAccount())
                    && user.getPassword().equals(login.getPassword())){
                return user;
            }
        }
        return null;
    }
}
