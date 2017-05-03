package data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

import entities.User;

@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Autowired
	private PasswordEncoder encoder;

	@Override
	public User signUp(User user) {
		String passwordSha = encoder.encode(user.getPassword());
		user.setPassword(passwordSha);
		em.persist(user);
		em.flush();
		return user;
	}

	@Override
	public User login(User user) {
		User managedUser = null;

		String query = "Select u from User u Where u.username = :username";
		managedUser = em.createQuery(query, User.class).setParameter("username", user.getUsername()).getSingleResult();

		return managedUser;
	}

}
