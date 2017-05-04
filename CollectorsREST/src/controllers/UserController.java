package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import data.UserDAO;
import entities.User;

@RestController
public class UserController {
  
  @Autowired
  private UserDAO userDAO;
  
  @RequestMapping(path = "/ping", method = RequestMethod.GET)
  public String pong(){
	  return "pong";
  }

  @RequestMapping(path = "/signup", method = RequestMethod.POST)
  public User signup(HttpSession session, @RequestBody User user) {

    User sessionUser = userDAO.signup(user);
    session.setAttribute("user", sessionUser);
    return sessionUser;
  }
  
  @RequestMapping(path = "/login", method = RequestMethod.POST)
  public User login(HttpSession session, @RequestBody User user) {
	  System.out.println(user);
        User sessionUser = userDAO.login(user);
        session.setAttribute("user", sessionUser);

        return sessionUser;
  }
  
  @RequestMapping(path = "/logout", method = RequestMethod.POST)
  public Boolean logout(HttpServletRequest req, HttpServletResponse res) {
    req.getSession().removeAttribute("user");
    return true;
  }
  
  @RequestMapping(path = "/unauthorized")
  public String unauth(HttpServletResponse response) {
    response.setStatus(401);
    return "unauthorized";
  }
}