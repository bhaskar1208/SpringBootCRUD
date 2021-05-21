package com.hibernateExample.springHibernate.services;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hibernateExample.springHibernate.controller.PasswordEncryptionDecryption;
import com.hibernateExample.springHibernate.methods.Users;
import com.hibernateExample.springHibernate.repo.MainRepo;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	public PasswordEncryptionDecryption encdec;
	
	@Autowired
	private MainRepo repo;
	@SuppressWarnings("null")
	@Override
	
	/**********************************************************************************************************/
	//Code to handle login
	public String userLogin(String email, String pwd,HttpSession session) {
		int status=0;
		String epwd=encdec.getEncodedString(pwd);
		for(Users us : repo.findAll()) {
			if(us.getEmail().equals(email) && us.getPassword().equals(epwd)) {
				session.setAttribute("name", us.getName());
				session.setAttribute("email", us.getEmail());
				session.setAttribute("address", us.getAddress());
				session.setAttribute("password", encdec.getDecodedString(us.getPassword()));
				status=1;
			}
			else if(us.getEmail().equals(email) && !us.getPassword().equals(epwd)) {
				status=2;	
			}
			else if(!us.getEmail().equals(email) && us.getPassword().equals(epwd)) {
				status=3;
			}
			else {
				status=4;
			}
		}
		if(status==1) 
		return "1";
		else if(status==2)
		return "Incorrect password ! Please try again.";
		else if(status==3)
		return "Invalid mail id ! Please try again.";
		else if(status==4)
		return "Invalid credentials ! Please try again.";
		else
		return "0";
	}
	

	/**********************************************************************************************************/
	
	//Code to update password
	@Override
	public String updatePassword(String email,String currPass, String newPass) {
		for(Users u : repo.findAll()) {
			if(u.getEmail().equals(email) && u.getPassword().equals(encdec.getEncodedString(currPass))) {		
				Users res=new Users();
				res.setId(u.getId());
				res.setName(u.getName());
				res.setEmail(u.getEmail());
				res.setAddress(u.getAddress());
				res.setPassword(encdec.getEncodedString(newPass));
				repo.save(res);
			}
		}
		return "Password updated successfully !";
	}
	
	/**********************************************************************************************************/
	//Code to add user details
	@Override
	public String addDetails(Users user) {
		user.setPassword(encdec.getEncodedString(user.getPassword()));
		repo.save(user);
		return "registration";
	}
	
	/**********************************************************************************************************/
	@SuppressWarnings("unchecked")
	//Code to get single user details
	@Override
	public String getUser(Long sid) {
		JSONObject userobject=new JSONObject();
		for(Users u: repo.findAll()) {
			if(u.getId()==sid)
			{
				userobject.put("uid", u.getId());
				userobject.put("name", u.getName());
				userobject.put("email", u.getEmail());
				userobject.put("address", u.getAddress());
				userobject.put("password",encdec.getDecodedString(u.getPassword()));
			}
		}
		return userobject.toString();
	}
	
	/**********************************************************************************************************/
	
	//Code to fetch all users
	@Override
	public List<Users> getUsers() {
		List<Users> ml=new ArrayList<Users>();
		for(Users u: repo.findAll()) {
			Users user = new Users();
			user.setId(u.getId());
			user.setName(u.getName());
			user.setEmail(u.getEmail());
			user.setAddress(u.getAddress());
			user.setPassword(encdec.getDecodedString(u.getPassword().toString()));
			ml.add(user);
		}
		return ml;
	}
	
	/**********************************************************************************************************/
	//Code to delete single user
	@SuppressWarnings("unchecked")
	@Override
	public String deleteUser(long uid) {
		JSONObject jsonobject=new JSONObject();
		Users user = null;
		for(Users u : repo.findAll()) {
			if(u.getId()==uid) {
				user=u;
				break;
			}
		}
		try {
			repo.delete(user);
			jsonobject.put("message","User "+uid+" deleted successfully !");
		}
		catch(Exception e) {
			System.out.println("Error-> "+e);
		}
		return jsonobject.toString();
	}
	/**********************************************************************************************************/
	//Code to update user details
	@Override
	public String updateUser(Users user) {
		if(repo.save(user) != null) {
			return "User updated !";
		}
		return "User cann't update !";
	}
}
