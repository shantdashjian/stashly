package test;

import static org.junit.Assert.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.User;

public class CollectorTest {

	private EntityManagerFactory emf = null;
	private EntityManager em = null;

	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("Collectors");
		em = emf.createEntityManager();

	}

	@After
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	public void test_username() {
		User user = em.find(User.class, 1);
		assertEquals("jandis", user.getUsername());

	}

	@Test
	public void test_password() {
		User user = em.find(User.class, 1);
		assertEquals("pw", user.getPassword());

	}

}
