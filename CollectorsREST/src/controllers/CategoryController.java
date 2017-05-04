package controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import data.CategoryDAO;
import entities.Category;

@RestController
public class CategoryController {

	@Autowired
	CategoryDAO categoryDao;
	
//	WORKS
	@RequestMapping(path = "/testcat", method = RequestMethod.GET)
	public String ping() {
		return "pong";
	}
	
//	WORKS
	@RequestMapping(path = "user/{cid}/category", method = RequestMethod.GET)
	public List<Category> index(HttpServletRequest req, HttpServletResponse res, @PathVariable int cid) {
		return categoryDao.index(cid);
	}
	
}
