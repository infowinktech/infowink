package com.java.portal.dao.impl;

import java.util.List;
import javax.transaction.Transactional;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.java.portal.dao.HomeDAO;
import com.java.portal.entity.User;

@Repository
@Transactional
public class HomeDAOImpl implements HomeDAO {
	private static final Logger log = Logger.getLogger(HomeDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	public List<User> fetchUsers() {
		Session session = sessionFactory.getCurrentSession(); 
		Criteria criteria = session.createCriteria(User.class);
		List<User> userList = criteria.list();
		log.info("List of user objects.."+userList.size());	
		return userList;
	}

}
