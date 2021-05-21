package com.hibernateExample.springHibernate.services;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.hibernateExample.springHibernate.methods.Users;

public interface UserService {
	public String addDetails(Users user);

	public String getUser(Long sid);

	public List<Users> getUsers();

	public String deleteUser(long uid);

	public String updateUser(Users user);

	public String userLogin(String email, String pwd, HttpSession session);

	public String updatePassword(String email,String currPass, String newPass);
}
