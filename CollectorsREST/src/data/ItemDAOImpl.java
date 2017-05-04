package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;

import entities.Category;
import entities.Item;
import entities.User;

@Transactional
public class ItemDAOImpl implements ItemDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<Item> index(int uid) {
		User managedUser = null;
				
		try {
			String q = "SELECT u FROM User u JOIN FETCH u.items WHERE u.id = :id";
			managedUser = em.createQuery(q, User.class).setParameter("id", uid).getSingleResult();
			List<Item> items = managedUser.getItems();
			return items;
		} catch (Exception e) {
			e.printStackTrace();
			String q = "SELECT u FROM User u WHERE u.id = :id";
			managedUser = em.createQuery(q, User.class).setParameter("id", uid).getSingleResult();
			return new ArrayList<Item>();
		}
	}

	@Override
	public Item show(int uid, int iid) {
		Item i = em.find(Item.class, iid);
		return i;
	}

	@Override
	public Item create(int uid, String itemJson) {
		User u = null;
		Category c = null;
				
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			Item newItem = mapper.readValue(itemJson, Item.class);
			u = em.find(User.class, uid);
			c = em.find(Category.class, newItem.getCategory().getId());
			newItem.setUser(u);
			newItem.setCategory(c);
			em.persist(newItem);
			em.flush();
			return newItem;
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}

	@Override
	public Item update(int uid, int iid, String itemJson) {
		Item i = em.find(Item.class, iid);
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			Item updateItem = mapper.readValue(itemJson, Item.class);
			i.setName(updateItem.getName());
			i.setDescription(updateItem.getDescription());
			i.setCondition(updateItem.getCondition());
			i.setNotes(updateItem.getNotes());
			i.setPurchasePrice(updateItem.getPurchasePrice());
			i.setCurrentValue(updateItem.getCurrentValue());
			i.setPurchaseDate(updateItem.getPurchaseDate());
			i.setSoldDate(updateItem.getSoldDate());
			i.setSoldPrice(updateItem.getSoldPrice());
			i.setRetired(updateItem.isRetired());
			i.setImageUrl(updateItem.getImageUrl());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return i;
	}

	@Override
	public boolean retire(int iid, String itemJson) {
		Item item = em.find(Item.class, iid);
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			Item retiredItem = mapper.readValue(itemJson, Item.class);
			item.setRetired(retiredItem.isRetired());
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
