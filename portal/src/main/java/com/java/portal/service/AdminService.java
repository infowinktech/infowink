package com.java.portal.service;

import org.springframework.stereotype.Service;

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
}
