package com.java.portal.dao;

import java.util.List;

import com.java.portal.entity.JobApplication;
import com.java.portal.entity.Jobs;

public interface AdminDao {
	public boolean insertJob(Jobs jobs);
	public List<Jobs> selectAllJobs();
	public Jobs getJobDetails(String jobId);
	public List<Jobs> selectActiveJobs();
	public boolean insertJobApplication(JobApplication jba);
	public List<JobApplication> selectOpenApplications();
}
