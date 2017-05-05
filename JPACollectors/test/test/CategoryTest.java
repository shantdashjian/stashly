package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Category;

public class CategoryTest {

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
	public void test_name() {
		Category c = em.find(Category.class, 1);
		assertEquals("comic", c.getName());

	}
	
	@Test
	public void test_items() {
		Category c = em.find(Category.class, 1);
		assertEquals(2, c.getItems().size());

	}

}
