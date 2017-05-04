package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import data.CategoryDAO;

@RestController
public class CategoryController {

	@Autowired
	CategoryDAO categoryDao;
	
	@RequestMapping(path = "/testcat", method = RequestMethod.GET)
	public String ping() {
		return "pong";
	}
	
}
