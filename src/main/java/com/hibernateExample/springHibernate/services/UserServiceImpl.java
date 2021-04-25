package com.hibernateExample.springHibernate.services;

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
	
	/**********************************************************************************************************/
	//Code to add user details
	@Override
	public String addDetails(Users user) {
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
		if(repo.save(user) != null) {
			return "User updated !";
		}
		return "User cann't update !";
	}
}
