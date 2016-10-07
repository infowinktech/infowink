package com.java.portal.dao.impl;

import java.util.ArrayList;
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

import com.java.portal.dao.AdminDao;
import com.java.portal.entity.JobApplication;
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
}
