package com.java.portal.controllers;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.portal.entity.User;
import com.java.portal.service.HomeService;

@Controller
public class HomeController {
	private static final Logger log = Logger.getLogger(HomeController.class);

	@Autowired(required=true)
	private ApplicationContext context;	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		log.info("Home!...");
		HomeService service = (HomeService) context.getBean("homeServiceImpl");
		List<User> userList = service.getUsers();
		for(User user : userList){
			log.info("User:"+user.getUsername());
		}
		return "home";
	}
}
