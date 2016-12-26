package com.niit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.niit.dao.UserDetailsDAO;
import com.niit.dao.LoginDao;
import com.niit.model.Login;
import com.niit.model.UserDetails;

@Controller
public class HomeController 
{

	@Autowired
	UserDetailsDAO userDetailsDAO;
	@Autowired
	LoginDao loginDAO;
	@RequestMapping("/")
	public ModelAndView fun1() {
		return new ModelAndView("index");
	}
	
	@ModelAttribute("UserDetails")
	public UserDetails fun2()
	{
		return new UserDetails();
		
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() 
	{
		return "index";
	}

	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() 
	{
		return "login";
	}

	@RequestMapping(value="/Register",method = RequestMethod.GET)
	public String Register() {
		return "Register";
	}

	@RequestMapping(value = "/viewproducts", method = RequestMethod.GET)
	public String viewproducts() 
	{
		return "viewproducts";
	}
	
	@RequestMapping(value = "storeUser", method = RequestMethod.POST)
	public String addUser(@Valid @ModelAttribute("UserDetails") UserDetails userDetails, BindingResult result)
	{
		if (result.hasErrors()) 
		{
			return "Register";
		}
	   
		System.out.println(userDetails.getUsername());
		System.out.println(userDetails.getAddress());
		Login l=new Login();
		l.setId(userDetails.getId());
		l.setUsername(userDetails.getUsername());
		l.setPassword(userDetails.getPassword());
		l.setEmail(userDetails.getEmail());
		l.setStatus(userDetails.isStatus());
		loginDAO.saveOrUpdate(l);		
		userDetailsDAO.saveOrupdate(userDetails);
		return "Register";
		
}

	@RequestMapping("logoutsucess")
	public ModelAndView logoutpage(){
		ModelAndView mv9 = new ModelAndView("logoutsucess");
		return mv9;
	}
	
	@RequestMapping(value = "/Logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		HttpSession newsession = request.getSession(false);
		if (newsession != null) 
	    {
	         newsession.invalidate();

	    }
		response.sendRedirect("j_spring_security_logout");	
		}
}