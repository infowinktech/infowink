package com.java.portal.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.portal.dao.AdminDao;
import com.java.portal.entity.ContactMessage;
import com.java.portal.entity.JobApplication;
import com.java.portal.entity.Jobs;
import com.java.portal.entity.User;
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
			
			log.info("dao:"+jobs.getJobCode());
			
			session.save(jobs);
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	
	}

	public List<Jobs> selectAllJobs() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Jobs.class);
		List<Jobs> jobsList = (List<Jobs>)criteria.list();
		return jobsList;
	}

	public Jobs getJobDetails(String jobId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Jobs.class);
		criteria.add(Restrictions.eq("jobCode", jobId));
		List<Jobs> results = (List<Jobs>)criteria.list();
		
		return results.get(0);
	}

	public List<Jobs> selectActiveJobs() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Jobs.class);
		criteria.add(Restrictions.eq("jobStatus", "OPEN"));
		List<Jobs> results = (List<Jobs>)criteria.list();
		return results;
	}

	public boolean insertJobApplication(JobApplication jba) {
		try{
			Session session = sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(JobApplication.class);
			session.save(jba);
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public List<JobApplication> selectOpenApplications() {
		List<JobApplication> appList = new ArrayList<JobApplication>();

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(JobApplication.class);
		criteria.add(Restrictions.eq("applicationStatus", "OPEN"));
		List<JobApplication> results = (List<JobApplication>)criteria.list();

		return results;
	}

	public JobApplication selectApplicationBasedOnId(int id) {
		JobApplication jpa = new JobApplication();
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(JobApplication.class);
		criteria.add(Restrictions.eq("pkid", id));
		List<JobApplication> results = (List<JobApplication>)criteria.list();
		log.info("No job applications retrieved for id - "+id+" = "+results.size());
		return results.get(0);
	}

	public boolean updateApplicationStatus(int pkid, String status) {
		try{
			Session session = sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(JobApplication.class);
			criteria.add(Restrictions.eq("pkid", pkid));
			List<JobApplication> results = (List<JobApplication>)criteria.list();
			JobApplication jpa = results.get(0);
			jpa.setApplicationStatus(status);
			
			session.merge(jpa);
			
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	public List<JobApplication> selectOpenApplicationsOnStatus(List<String> status) {
		List<JobApplication> appList = new ArrayList<JobApplication>();
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(JobApplication.class);
		
		Disjunction disjunction = Restrictions.disjunction();
		for(String stat:status){
		    disjunction.add(Restrictions.or(Restrictions.eq("applicationStatus", stat))); //add your restirction here
		}
		
		criteria.add(disjunction );
		
		List<JobApplication> results = (List<JobApplication>)criteria.list();

		return results;
	
	
	}

	public long selectNoOfUsers() {
		Session session = sessionFactory.getCurrentSession();
		return (Long) session.createCriteria(User.class).setProjection(Projections.rowCount()).uniqueResult();
		
	}

	public long selectNoOfJobs() {
		Session session = sessionFactory.getCurrentSession();
		return (Long) session.createCriteria(Jobs.class).setProjection(Projections.rowCount()).uniqueResult();
	}

	public long selectNoOfApplications() {
		Session session = sessionFactory.getCurrentSession();
		return (Long) session.createCriteria(JobApplication.class).setProjection(Projections.rowCount()).uniqueResult();
	}

	public Map<String, String> selectJobsNstatus() {
		
		return null;
	}

	public List<Jobs> selectJobsOnStatus(List<String> status) {
		List<Jobs> appList = new ArrayList<Jobs>();
		
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Jobs.class);
		
		Disjunction disjunction = Restrictions.disjunction();
		for(String stat:status){
		    disjunction.add(Restrictions.or(Restrictions.eq("jobStatus", stat))); //add your restirction here
		}
		criteria.add(disjunction );
		List<Jobs> results = (List<Jobs>)criteria.list();

		return results;
	
	
	}

	public boolean updateJob(Jobs job) {
		try{
			Session session = sessionFactory.getCurrentSession();
			session.merge(job);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteJob(String jobcode) {
		try{
			Session session = sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(Jobs.class);
			criteria.add(Restrictions.eq("jobCode", jobcode));
			List<Jobs> results = (List<Jobs>)criteria.list();
			Jobs jobs = results.get(0);
			jobs.setJobStatus("INACTIVE");
			
			session.merge(jobs);
			
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	public boolean insertContactMsg(ContactMessage msg) {
		try{
			Session session = sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(ContactMessage.class);
			
			session.save(msg);
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public List<ContactMessage> fetchContactMsgs() {
		Session session = sessionFactory.getCurrentSession(); 
		Criteria criteria = session.createCriteria(ContactMessage.class);
		List<ContactMessage> msgsList = criteria.list();
		return msgsList;
	}

	public ContactMessage getContactMessage(int msgId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(ContactMessage.class);
		criteria.add(Restrictions.eq("pkid", msgId));
		List<ContactMessage> results = (List<ContactMessage>)criteria.list();
		
		return results.get(0);
	}

	public long selectNoOfMessages() {
		Session session = sessionFactory.getCurrentSession();
		return (Long) session.createCriteria(ContactMessage.class).setProjection(Projections.rowCount()).uniqueResult();
		}
	
	
	
}
