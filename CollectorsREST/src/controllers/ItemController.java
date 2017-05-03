package controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import data.ItemDAO;
import entities.Item;

@RestController
public class ItemController {
	
	@Autowired
	ItemDAO itemDao;
	
//	WORKS
	@RequestMapping(path = "/testitem", method = RequestMethod.GET)
	public String ping() {
		return "pong";
	}
	
//	WORKS
	@RequestMapping(path = "user/{uid}/item", method = RequestMethod.GET)
	public List<Item> index(HttpServletRequest req, HttpServletResponse res, @PathVariable int uid) {
		return itemDao.index(uid);
	}
	
	
	@RequestMapping(path = "user/{uid}/item/{iid}", method = RequestMethod.GET)
	public Item show(HttpServletRequest req, HttpServletResponse res, @PathVariable int uid, @PathVariable int iid) {
		return itemDao.show(uid, iid);
	}

}
