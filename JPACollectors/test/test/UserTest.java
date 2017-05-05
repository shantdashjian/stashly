package test;

import static org.junit.Assert.*;

import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.fasterxml.jackson.annotation.JsonBackReference;

import entities.Category;
import entities.User;

public class UserTest {

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
		assertEquals("$2a$10$GSikqmpG19jozHo/0BzKSOtt0nxxULln9Os/og/tEs9Rh66FhIKOK", user.getPassword());
		
	}
	@Test
	public void test_items() {
		User user = em.find(User.class, 1);
		assertEquals(3, user.getItems().size());
		
	}
}