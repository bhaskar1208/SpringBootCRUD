package com.hibernateExample.springHibernate.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hibernateExample.springHibernate.methods.SearchId;
import com.hibernateExample.springHibernate.methods.Users;
import com.hibernateExample.springHibernate.repo.MainRepo;
@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private MainRepo repo;
	@Override
	public String addDetails(Users user) {
		repo.save(user);
		return "registration";
	}
	@Override
	public Users getUser(SearchId sid) {
		Users ruser=null;
		for(Users u: repo.findAll()) {
			if(u.getName()==sid.getSid())
			{
				ruser=u;
			}
		}
		return ruser;
	}
	@Override
	public List<Users> getUsers() {
		return repo.findAll();
	}
	
	@Override
	public boolean deleteUser(long uid) {
		Users user = null;
		for(Users u : repo.findAll()) {
			if(u.getId()==uid) {
				user=u;
				break;
			}
		}
		repo.delete(user);
		return true;
	}
}
