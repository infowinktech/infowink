package com.java.portal.dao;

import java.util.List;
import com.java.portal.entity.User;


public interface UserAccountDao {
	public List<User> fetchUsers();
	public boolean isUserAuthentic(User user);
	public String insertUser(User user);
	public User isUserExists(User user);
	public User insertSocialUser(User user);
}
