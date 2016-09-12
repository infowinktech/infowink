package com.java.portal.dao.impl;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.portal.dao.UserAccountDao;
import com.java.portal.entity.User;

@Repository
@Transactional
public class UserAccountDaoImpl implements UserAccountDao {
	private static final Logger log = Logger.getLogger(UserAccountDaoImpl.class);
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<User> fetchUsers() {
		Session session = sessionFactory.getCurrentSession(); 
		Criteria criteria = session.createCriteria(User.class);
		List<User> userList = criteria.list();
		return userList;
	}

	public boolean isUserAuthentic(User user) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(User.class);
		criteria.add(Restrictions.eq("email", user.getEmail()));
		criteria.add(Restrictions.eq("password", user.getPassword()));
		
		List<User> results = (List<User>)criteria.list();
		
		if(results!=null && results.size()>0){
			User usr = results.get(0);
			httpSession.setAttribute("USER_BEAN", usr);
			return true;
		}else{
			return false;
		}
		
		
	}

	public String insertUser(User user) {
		String status = null;
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(User.class);
		criteria.add(Restrictions.eq("email", user.getEmail()));
		
		List<User> results = (List<User>)criteria.list();
		if(results.size()>0){
			return "Email already in use!";
		}else{
			log.info(user.getRole().getId());
			log.info(user.getRole().getRole());
			session.save(user);
			return "Succesfully registered";
		}
	}

}
