package data;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;

import entities.Item;
import entities.Price;

@Transactional
public class PriceDAOImpl implements PriceDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Price> index(int uid) {
		List<Item> managedItems = null;
		List<Price> prices = new ArrayList<>();

		try {
			String q = "SELECT i FROM Item i JOIN FETCH i.prices WHERE i.user.id = :uid";
			managedItems = em.createQuery(q, Item.class).setParameter("uid", uid)
					.getResultList();
			
			Set<Item> itemSet = new HashSet<Item>(managedItems);

			for(Item i : itemSet){
				prices.addAll(i.getPrices());
			}
			
			return prices;

		} catch (Exception e) {

			return new ArrayList<Price>();
		}
	}

	@Override
	public Price show(int uid, int iid, int pid) {

		Item i = em.find(Item.class, iid);
		
		if(i.getUser().getId() != uid){
			return null;
		}
		
		for(Price p : i.getPrices()){
			if(pid == p.getId()){
				return p;
			}
		}
		
		return null;
	}

	@Override
	public Price create(int uid, int iid, String priceJson) {

		Item item = null;

		try {
			ObjectMapper mapper = new ObjectMapper();
			Price newPrice = mapper.readValue(priceJson, Price.class);

			item = em.find(Item.class, iid);

			if (uid != item.getUser().getId()) {
				throw new Exception();
			}

			newPrice.setItem(item);

			em.persist(newPrice);
			em.flush();
			
			return newPrice;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean destroy(int uid, int iid, int pid) {
		
		try {
			Item item = em.find(Item.class, iid);
			Price price = null;
			
			for(Price p : item.getPrices()){
				if(pid == p.getId()){
					price = p;
					break;
				}
			}
			
			if(uid != item.getUser().getId()){
				return false;
			}
			
			em.remove(price);
			item.getPrices().remove(price);
			em.flush();

			return true;
		} catch (Exception e) {

			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Price> indexByItem(int uid, int iid) {
		String q = "SELECT i FROM Item i JOIN FETCH i.prices WHERE i.user.id = :uid AND i.id = :iid";
		Item managedItem = em.createQuery(q, Item.class).setParameter("uid", uid).setParameter("iid", iid).getSingleResult();
			
		return managedItem.getPrices();
	}

}
