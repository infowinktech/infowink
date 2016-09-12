package com.java.portal.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import com.java.portal.dao.UserAccountDao;
import com.java.portal.entity.User;
import com.java.portal.service.UserAccountService;

@Service
public class UserAccountServiceImpl implements UserAccountService {
	private static final Logger log = Logger.getLogger(UserAccountServiceImpl.class);

	@Autowired(required=true)
	private ApplicationContext context;	
	public List<User> getUsers() {
		UserAccountDao dao = (UserAccountDao) context.getBean("userAccountDaoImpl");
		List<User> userList = dao.fetchUsers(); 
		return userList;
	}

	public boolean isUserAuthentic(User user) {
		UserAccountDao dao = (UserAccountDao) context.getBean("userAccountDaoImpl");
		return dao.isUserAuthentic(user);
	}

	public String registerUser(User user) {
		StringBuffer sb = new StringBuffer();
		UserAccountDao dao = (UserAccountDao) context.getBean("userAccountDaoImpl");
		String statusCode = null;
		log.info("role:");
		try{
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			String status = dao.insertUser(user);
			log.info("status:"+status);
			if(status!=null && status.startsWith("Email")){
				statusCode="false";
			}else{
				statusCode="true";
			}
			sb.append("<statusCode>"+statusCode+"</statusCode>");
			sb.append("<status>"+status+"</status>");
			sb.append("</data>");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return sb.toString();
	}

}
