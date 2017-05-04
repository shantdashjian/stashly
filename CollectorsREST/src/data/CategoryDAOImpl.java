package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.Category;

@Transactional
public class CategoryDAOImpl implements CategoryDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Category> index(int cid) {
		
		String q = "SELECT c FROM Category c";
		List<Category> categories = em.createQuery(q, Category.class).getResultList();
		return categories;
	}

}
