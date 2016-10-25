package com.java.portal.dao;

import java.util.List;
import java.util.Map;

import com.java.portal.entity.ContactMessage;
import com.java.portal.entity.JobApplication;
import com.java.portal.entity.Jobs;
import com.java.portal.entity.User;

public interface AdminDao {
	public boolean insertJob(Jobs jobs);
	public List<Jobs> selectAllJobs();
	public Jobs getJobDetails(String jobId);
	public List<Jobs> selectActiveJobs();
	public boolean insertJobApplication(JobApplication jba);
	public List<JobApplication> selectOpenApplications();
	public JobApplication selectApplicationBasedOnId(int id);
	public boolean updateApplicationStatus(int pkid, String status);
	public List<JobApplication> selectOpenApplicationsOnStatus(List<String> status);
	public long selectNoOfUsers();
	public long selectNoOfJobs();
	public long selectNoOfApplications();
	public long selectNoOfMessages();
	public Map<String,String> selectJobsNstatus();
	public List<Jobs> selectJobsOnStatus(List<String> status);
	public boolean updateJob(Jobs job);
	public boolean deleteJob(String jobcode);
	public boolean insertContactMsg(ContactMessage msg);
	public List<ContactMessage> fetchContactMsgs();
	public ContactMessage getContactMessage(int msgId);
	public List<Jobs> selectJobsOnStatus(String status);
	public List<Jobs> selectJobsOnType(String status);
	public List<JobApplication> selectApplicationsOnStatus(String status);
	public List<Jobs> selectJobsOnType(List<String> type);
	public List<JobApplication> selectMyJobs(int userId);
	public boolean updateUser(User user);
	public User getResetEmailUser(String resetEmail);
}
