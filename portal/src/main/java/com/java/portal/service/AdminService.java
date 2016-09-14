package com.java.portal.service;

import org.springframework.stereotype.Service;

import com.java.portal.entity.Jobs;
@Service
public interface AdminService {
	public String addJob(Jobs jobs);
}
