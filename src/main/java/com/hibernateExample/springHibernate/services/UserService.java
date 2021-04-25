package com.hibernateExample.springHibernate.services;

import java.util.List;

import com.hibernateExample.springHibernate.methods.Users;

public interface UserService {
	public String addDetails(Users user);

	public String getUser(Long sid);

	public List<Users> getUsers();

	public String deleteUser(long uid);

	public String updateUser(Users user);
}
