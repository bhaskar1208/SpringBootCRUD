package com.hibernateExample.springHibernate.services;

import java.util.List;

import com.hibernateExample.springHibernate.methods.SearchId;
import com.hibernateExample.springHibernate.methods.Users;

public interface UserService {
	public String addDetails(Users user);

	public Users getUser(SearchId sid);

	public List<Users> getUsers();

	public boolean deleteUser(long uid); 
}
