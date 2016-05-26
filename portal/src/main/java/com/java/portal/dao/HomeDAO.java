package com.java.portal.dao;

import java.util.List;
import com.java.portal.entity.User;


public interface HomeDAO {
	public List<User> fetchUsers();
}
