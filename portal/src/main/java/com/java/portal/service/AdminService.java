package com.java.portal.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.java.portal.entity.Jobs;
@Service
public interface AdminService {
	public String addJob(Jobs jobs);
	public String getAllJobs();
}
