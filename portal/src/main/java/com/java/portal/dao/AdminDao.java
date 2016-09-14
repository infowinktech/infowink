package com.java.portal.dao;

import java.util.List;

import com.java.portal.entity.Jobs;

public interface AdminDao {
	public boolean insertJob(Jobs jobs);
	public List<Jobs> selectAllJobs();
}
