package data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;

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
	public Item show(int iid) {
		Item i = em.find(Item.class, iid);
		return i;
	}

	@Override
	public Item create(int uid, String itemJson) {
		User u = em.find(User.class, uid);
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			Item newItem = mapper.readValue(itemJson, Item.class);
			newItem.setUser(u);
			em.persist(newItem);
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
		
		return null;
	}

	@Override
	public Boolean destroy(int iid) {
		Item i = em.find(Item.class, iid);
		
		if(em.find(Item.class, iid) == null) {
			return false;
		} else {
			em.remove(i);
			return true;
		}
	}
}
