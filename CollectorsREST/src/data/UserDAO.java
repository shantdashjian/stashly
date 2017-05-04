package data;

import entities.User;

public interface UserDAO {

	User signup(User user);

	User login(User user);

}
