package com.hibernateExample.springHibernate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hibernateExample.springHibernate.methods.SearchId;
import com.hibernateExample.springHibernate.methods.Users;
import com.hibernateExample.springHibernate.services.UserService;

@Controller
public class OtherController {
	@Autowired
	public UserService userService;
	
	//To add user
	@RequestMapping(value="addUser",method=RequestMethod.POST)
	public String sendAction(Users user,ModelMap model)
	{
		model.addAttribute("msg", "User "+user.getName()+" saved successfully !!");
		return this.userService.addDetails(user);
	}
	@RequestMapping("users")
	public String getAllUser(Model model) {
		List<Users> listUsers=this.userService.getUsers();
		model.addAttribute("listUsers", listUsers);
		return "allUsers";
	}
	@PostMapping("searchAction")
	public Users searchAction(SearchId sid) {
		//System.out.println(this.userService.getUser(sid));
		return this.userService.getUser(sid);
	}
	
	@GetMapping("deleteUser/{uid}")
	public boolean deleteUser(@PathVariable String uid) {
		if(this.userService.deleteUser(Long.parseLong(uid))){
			System.out.println("Deleted");
		}
		return true;
	}
}
