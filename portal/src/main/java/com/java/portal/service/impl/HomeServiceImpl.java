package com.java.portal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import com.java.portal.dao.HomeDAO;
import com.java.portal.entity.User;
import com.java.portal.service.HomeService;

@Service
public class HomeServiceImpl implements HomeService {
	@Autowired(required=true)
	private ApplicationContext context;	
	
	public List<User> getUsers() {
		HomeDAO dao = (HomeDAO) context.getBean("homeDAOImpl");
		List<User> userList = dao.fetchUsers(); 
		return userList;
	}

}
