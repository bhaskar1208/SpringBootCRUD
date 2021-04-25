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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hibernateExample.springHibernate.methods.Users;
import com.hibernateExample.springHibernate.services.UserService;

@Controller
public class OtherController {
	@Autowired
	public UserService userService;
	
	//Controller to add user
	@RequestMapping(value="addUser",method=RequestMethod.POST)
	public String sendAction(Users user,ModelMap model)
	{
		model.addAttribute("msg", "User "+user.getName()+" saved successfully !!");
		return this.userService.addDetails(user);
	}
	//Controller to fetch all users
	@RequestMapping("users")
	public String getAllUser(Model model) {
		List<Users> listUsers=this.userService.getUsers();
		model.addAttribute("listUsers", listUsers);
		return "allUsers";
	}
	
	//Controller to Search Single User
	@GetMapping("searchAction/{id}")
	public @ResponseBody String searchAction(@PathVariable String id) {
		return this.userService.getUser(Long.parseLong(id));
	}
	
	//Controller to Delete Single User
	@GetMapping(value="deleteUser/{uid}")
	public @ResponseBody String deleteUser(@PathVariable String uid) {
		return this.userService.deleteUser(Long.parseLong(uid));
	}
	
	//Controller to update single user details
	@PostMapping("updateUser")
	public @ResponseBody String updateUser(@RequestParam("uid") String uid,@RequestParam("name") String name, @RequestParam("email") String email,@RequestParam("address") String address) {
		Users user=new Users();
		user.setId(Long.parseLong(uid));
		user.setName(name);
		user.setEmail(email);
		user.setAddress(address);
		return this.userService.updateUser(user);
	}
}
