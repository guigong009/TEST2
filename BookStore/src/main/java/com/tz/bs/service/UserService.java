package com.tz.bs.service;

import com.tz.bs.entity.User;

public interface UserService {

	//注册一个用户
	void insertUser(User u);
	
	//根据用户名查找用户
	User selectUserByUserName(String userName);
}
