package com.hibernateExample.springHibernate.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hibernateExample.springHibernate.methods.Users;

public interface MainRepo extends JpaRepository<Users, Long>{

}
