package data;

import java.util.List;

import entities.Price;

public interface PriceDAO {
	public List<Price> index(int uid, int iid);
	public Price show(int uid, int iid, int pid);
	public Price create(int uid, int iid, String priceJson);
	public boolean destroy(int uid, int iid, int pid);
}
