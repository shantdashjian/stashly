package data;

import entities.User;

public interface UserDAO {

	User signUp(User user);

	User login(User user);

}
