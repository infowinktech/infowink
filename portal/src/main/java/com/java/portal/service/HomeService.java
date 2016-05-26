package com.java.portal.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.java.portal.entity.User;

@Service
public interface HomeService {
	public List<User> getUsers();
}
