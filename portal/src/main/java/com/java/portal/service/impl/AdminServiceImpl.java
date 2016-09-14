package com.java.portal.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import com.java.portal.dao.AdminDao;
import com.java.portal.dao.UserAccountDao;
import com.java.portal.entity.Jobs;
import com.java.portal.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	private static final Logger log = Logger.getLogger(AdminServiceImpl.class);
	@Autowired(required=true)
	private ApplicationContext context;
	
	public String addJob(Jobs jobs) {
		StringBuffer sb = new StringBuffer();
		
		String status = null;
		try{
			AdminDao dao = (AdminDao) context.getBean("adminDaoImpl");
			boolean statusCode = dao.insertJob(jobs);
			sb.append("<?xml version='1.0' encoding='utf-8'?>" + "<data>");
			if(statusCode){
				status = "Successfully added the Job";
			}else{
				status = "Error occured while adding Job";
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
