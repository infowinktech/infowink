package com.java.portal.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.java.portal.entity.User;

@Service
public interface UserAccountService {
	public List<User> getUsers();
	public boolean isUserAuthentic(User user);
	public String registerUser(User user);
	public User isSocialUserAuthentic(User user);
}
