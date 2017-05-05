package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Item;

public class ItemTest {

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
	public void test_condition() {
		Item i = em.find(Item.class, 1);
		assertEquals("poor", i.getCondition());
	}
	
	@Test
	public void test_user() {
		Item i = em.find(Item.class, 1);
		assertEquals("jandis", i.getUser().getUsername());
		
	}

	@Test
	public void test_category() {
		Item i = em.find(Item.class, 1);
		assertEquals("comic", i.getCategory().getName());
		
	}
	
}
