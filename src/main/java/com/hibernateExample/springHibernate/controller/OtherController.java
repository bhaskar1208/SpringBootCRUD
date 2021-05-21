package com.hibernateExample.springHibernate.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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
	
	@Autowired
	public PasswordEncryptionDecryption encdec;

	/**********************************************************************************************************/
	
	//Controller to login handle
	@RequestMapping("loginAction")
	public String login(@RequestParam("email") String email,@RequestParam("password") String pwd,Model model,HttpSession session) {
		String res=this.userService.userLogin(email,pwd,session);
		if(res.equals("1")){
			return "home";
		}
		else{
			model.addAttribute("msg",res);
			return "login";
		}
	}
	
	/**********************************************************************************************************/
	
	//Controller to change password
	@RequestMapping("updatePassword")
	public String changePassword(@RequestParam("email") String email,@RequestParam("currPass") String currPass, @RequestParam("newPass") String newPass, @RequestParam("confPass") String confPass,Model model) {
		if(!newPass.equals(confPass)) {
			model.addAttribute("errmsg","New Password and Confirm Password didn't matched !");
			return "login";
		}
		else if(!email.equals("") && !currPass.equals("") && !newPass.equals("") && !confPass.equals("")) {
			this.userService.updatePassword(email,currPass,newPass);
			model.addAttribute("successmsg","Password successfully changed !");
		}
		return "login";
	}
	
	/**********************************************************************************************************/
	
	//Controller to add user
	@RequestMapping(value="addUser",method=RequestMethod.POST)
	public String sendAction(Users user,ModelMap model)
	{
		model.addAttribute("msg", "User "+user.getName()+" saved successfully !!");
		return this.userService.addDetails(user);
	}
	
	/**********************************************************************************************************/
	
	//Controller to fetch all users
	@RequestMapping("users")
	public String getAllUser(Model model) {
		List<Users> listUsers=this.userService.getUsers();
		model.addAttribute("listUsers", listUsers);
		return "allUsers";
	}
	
	/**********************************************************************************************************/
	
	//Controller to Search Single User
	@RequestMapping("user")
	public String searchAction(@RequestParam("searchId") String id, Model model) throws ParseException {
		String user=this.userService.getUser(Long.parseLong(id));
		JSONParser perser=new JSONParser();
		JSONObject object=(JSONObject) perser.parse(user);
		model.addAttribute("userid",object.get("uid"));
		model.addAttribute("username",object.get("name"));
		model.addAttribute("useremail",object.get("email"));
		model.addAttribute("useradd",object.get("address"));
		model.addAttribute("userpass",object.get("password"));
		return "user";
	}
	
	/**********************************************************************************************************/
	
	//Controller to Delete Single User
	@GetMapping(value="deleteUser/{uid}")
	public @ResponseBody String deleteUser(@PathVariable String uid) {
		return this.userService.deleteUser(Long.parseLong(uid));
	}
	
	/**********************************************************************************************************/
	
	//Controller to update single user details
	@PostMapping("updateUser")
	public @ResponseBody String updateUser(@RequestParam("uid") String uid,@RequestParam("name") String name, @RequestParam("email") String email,@RequestParam("address") String address,@RequestParam("password") String password) {
		Users user=new Users();
		user.setId(Long.parseLong(uid));
		user.setName(name);
		user.setEmail(email);
		user.setAddress(address);
		user.setPassword(encdec.getEncodedString(password));
		return this.userService.updateUser(user);
	}
}
