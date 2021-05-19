package com.hibernateExample.springHibernate.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class MainController {
	
	//Root Redirection
	@RequestMapping("/")
	public String mainMethod() {
		return "login";
	}
	
	//Login Page Redirection
	@RequestMapping("index")
	public String Index() {
		return "login";
	}
	
	//Home Page Redirection
	@RequestMapping("home")
	public String homeMethod() {
		return "home";
	}
	
	//Registration Page Redirection
	@RequestMapping("reg")
	public String goToReg() {
		return "registration";
	}
	
	//Logout
	@RequestMapping("logout")
	public String logoutFunc(){
		return "logout";
	}
}
