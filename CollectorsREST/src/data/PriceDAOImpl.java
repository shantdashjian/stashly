package data;

import java.util.ArrayList;
import java.util.List;

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
	public List<Price> index(int uid, int iid) {
		Item managedItem = null;

		try {
			String q = "SELECT i FROM Item i JOIN FETCH i.prices WHERE i.id = :iid AND i.user.id = :uid";
			managedItem = em.createQuery(q, Item.class).setParameter("iid", iid).setParameter("uid", uid)
					.getSingleResult();
			return managedItem.getPrices();

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

}
