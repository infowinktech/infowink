package com.java.portal.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.java.portal.entity.ContactMessage;
import com.java.portal.entity.JobApplication;
import com.java.portal.entity.Jobs;
@Service
public interface AdminService {
	public String addJob(Jobs jobs);
	public String getAllJobs();
	public String getJobDetails(String jobId);
	public String getActiveJobs();
	public boolean saveApplication(JobApplication jba);
	public String getOpenApplications();
	public String getUsers();
	public String loadApplicationBasedOnId(int id);
	public String updateApplicationStatus(int pkid, String status);
	public String getApplicationsOnStatus(List<String> status);
	public String getDashboard();
	public String getPieChart();
	public String getJobsOnStatus(List<String> status);
	public String getJobBasedOnCode(String jobcode);
	public String updateJob(Jobs job);
	public String deleteJob(String jobcode);
	public String saveMessage(ContactMessage msg);
	public String getContactMsgs();
	public String getContactMsgBasedOnId(int msgId);
	public String getBarH();
	public String getBarV();
	public String getCareers(List<String> type);
	public String getMyJobs();
	public String exportJobs(List<String> status);
	public String exportApplications(List<String> status);
	public String exportUsers();
	public String exportMsgs();
	public String addBulkJobs(List<Jobs> jobList);
}
