package com.niit.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.LoginDao;
import com.niit.dao.UserDetailsDAO;
import com.niit.model.Login;
import com.niit.model.UserDetails;

@Controller
public class UserController {
	@Autowired
	UserDetailsDAO userDetailsDAO;
	@Autowired
	LoginDao loginDAO;

	@RequestMapping("ManageUsers")
	public ModelAndView userList() {
		ModelAndView mv9 = new ModelAndView("ManageUsers");
		return mv9;
	}

	@RequestMapping("viewuser")
	public ModelAndView viewuser() {
		ModelAndView mv9 = new ModelAndView("viewuser");
		return mv9;
	}

	

	@RequestMapping(value = "edituser", method = RequestMethod.GET)
	public ModelAndView edituser(@RequestParam int id) {
		Login u1 = loginDAO.get(id);
		return new ModelAndView("edituser", "Login", u1);
	}

	

	@RequestMapping("login")
	public ModelAndView display1() {
		ModelAndView mv1 = new ModelAndView("login");
		return mv1;
	}

	@RequestMapping(value = "fail2login", method = RequestMethod.GET)
	public ModelAndView loginerror(ModelMap model) {
		return new ModelAndView("login", "error", true);
	}

	@RequestMapping("Register")
	public ModelAndView display2() {

		ModelAndView mv2 = new ModelAndView("Register");
		return mv2;
	}

	
	@RequestMapping("deleteuser")
	public ModelAndView deleteUser(@RequestParam int id, @Valid @ModelAttribute("Login") Login loginuser) {
		loginDAO.delete(id);
		ModelAndView m1 = new ModelAndView("ManageUsers");
		return m1;
	}

	@ModelAttribute("UserDetails")
	public UserDetails registerUser() {
		return new UserDetails();

	}

	@ModelAttribute("Login")
	public Login createUser() {
		return new Login();

	}

	@RequestMapping("/Admin")
	public ModelAndView display5() {
		ModelAndView m5 = new ModelAndView("Admin");
		return m5;
	}

	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public ModelAndView checkUserOne(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		if (request.isUserInRole("ROLE_ADMIN")) {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String str = auth.getName(); // get username
			session = request.getSession(true);
			session.setAttribute("loggedInUser", str);
			// session.invalidate();
			ModelAndView m1 = new ModelAndView("Admin");
			return m1;
		} else {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			String str = auth.getName();
			session = request.getSession(true);
			session.setAttribute("loggedInUser", str);
			ModelAndView m2 = new ModelAndView("manageproducts");
			return m2;
		}

	}

	@RequestMapping(value = "/updateuser", method = RequestMethod.POST)
	public ModelAndView updateUser(HttpServletRequest request, @Valid @ModelAttribute("Login") Login editlogin,
			BindingResult result) {
		loginDAO.update(editlogin);
		return new ModelAndView("ManageUsers");
	}

}
