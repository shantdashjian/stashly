package controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import data.PriceDAO;
import entities.Price;

@RestController
public class PriceController {
	
	@Autowired
	PriceDAO priceDao;
	
	@RequestMapping(path = "user/{uid}/item/{iid}/price", method = RequestMethod.GET)
	public List<Price> index(HttpServletRequest req, HttpServletResponse res, @PathVariable int uid, @PathVariable int iid) {
		return priceDao.index(uid, iid);
	}
	
	@RequestMapping(path = "user/{uid}/item/{iid}/price/{pid}", method = RequestMethod.GET)
	public Price show(HttpServletRequest req, HttpServletResponse res, @PathVariable int uid, @PathVariable int iid,  @PathVariable int pid) {
		return priceDao.show(uid, iid, pid);
	}
	
	
	@RequestMapping(path = "user/{uid}/item/{iid}/price", method = RequestMethod.POST)
	public Price create(HttpServletRequest req, HttpServletResponse res, @PathVariable int uid,
			 @PathVariable int iid, @RequestBody String priceJson) {
		System.out.println(priceJson + "*****************************************************************");
		return priceDao.create(uid, iid, priceJson);
	}

	@RequestMapping(value = "/user/{uid}/item/{iid}/price/{pid}", method = RequestMethod.DELETE)
	public Boolean destroy(HttpServletRequest req, HttpServletResponse res, @PathVariable int uid,
			@PathVariable int iid, @PathVariable int pid) {

		return priceDao.destroy(uid, iid, pid);
	}
}
