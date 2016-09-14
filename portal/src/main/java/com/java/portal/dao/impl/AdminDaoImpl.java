package com.java.portal.dao.impl;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.portal.dao.AdminDao;
import com.java.portal.entity.Jobs;
@Repository
@Transactional
public class AdminDaoImpl implements AdminDao {
	private static final Logger log = Logger.getLogger(AdminDaoImpl.class);
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private SessionFactory sessionFactory;

	public boolean insertJob(Jobs jobs) {
		try{
			Session session = sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(Jobs.class);
			session.save(jobs);
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	
	}
	
	
}