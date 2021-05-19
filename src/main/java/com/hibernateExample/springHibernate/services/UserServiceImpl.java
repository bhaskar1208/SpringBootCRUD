package com.hibernateExample.springHibernate.services;

import java.util.Base64;
import java.util.List;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hibernateExample.springHibernate.methods.Users;
import com.hibernateExample.springHibernate.repo.MainRepo;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private MainRepo repo;
	@Override
	
	/**********************************************************************************************************/
	//Code to handle login
	public String userLogin(String email, String pwd) {
		int status=0;
		String epwd=getEncodedString(pwd);
		for(Users us : repo.findAll()) {
			//System.out.println("Entered: "+email+"   "+epwd);
			//System.out.println("From Database: "+us.getEmail()+"   "+us.getPassword());
			if(us.getEmail().equals(email) && us.getPassword().equals(epwd)) {
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
	
	@SuppressWarnings("null")
	//Code to update password
	@Override
	public String updatePassword(String email,String currPass, String newPass) {
		for(Users u : repo.findAll()) {
			if(u.getEmail().equals(email) && u.getPassword().equals(getEncodedString(currPass))) {		
				Users res=new Users();
				res.setId(u.getId());
				res.setName(u.getName());
				res.setEmail(u.getEmail());
				res.setAddress(u.getAddress());
				res.setPassword(getEncodedString(newPass));
				repo.save(res);
			}
		}
		return "Password updated successfully !";
	}
	
	/**********************************************************************************************************/
	//Code to add user details
	@Override
	public String addDetails(Users user) {
		user.setPassword(getEncodedString(user.getPassword()));
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
			}
		}
		return userobject.toString();
	}
	
	/**********************************************************************************************************/
	@SuppressWarnings("unchecked")
	//Code to fetch all users
	@Override
	public List<Users> getUsers() {
		/* Test code to fetch users using JSON  */
		int id=0;
		JSONObject jsobj=new JSONObject();
		for(Users u : repo.findAll()) {
			id++;
			jsobj.put("user"+id, u);
		}
		/* Test code to fetch users using JSON ends */
		
		return repo.findAll();
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
		String pass="";
		for(Users uu : repo.findAll()) {
			if(user.getEmail().equals(uu.getEmail())){
				pass=uu.getPassword();
			}
		}
		user.setPassword(pass);
		if(repo.save(user) != null) {
			return "User updated !";
		}
		return "User cann't update !";
	}
	
	/**********************************************************************************************************/
	
	//To encrypt password string
	public String getEncodedString(String str) {
		return Base64.getEncoder().encodeToString(str.getBytes());
	}
	
	/**********************************************************************************************************/
	
	//To decrypt the encrypted password string
	public String getDecodedString(String encoded) {
		return new String(Base64.getDecoder().decode(encoded));
	}
}
