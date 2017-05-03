package data;

import java.util.List;

import entities.Item;

public interface ItemDAO {
	public List<Item> index(int uid);
	public Item show(int iid);
	public Item create(int uid, String itemJson);
	public Item update(int uid, int iid, String itemJson);
	public Boolean destroy(int iid);
}
