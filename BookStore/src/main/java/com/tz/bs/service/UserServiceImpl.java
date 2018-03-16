package com.tz.bs.service;

import org.apache.ibatis.session.SqlSession;

import com.tz.bs.entity.User;
import com.tz.bs.mapper.UserMapper;
import com.tz.bs.util.MyBatiesUtil;

public class UserServiceImpl implements UserService{

	@Override
	public void insertUser(User u) {
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		UserMapper mapper=sqlSession.getMapper(UserMapper.class);
		mapper.insertUser(u);
		MyBatiesUtil.close(sqlSession);
	}

	@Override
	public User selectUserByUserName(String userName) {
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		UserMapper mapper=sqlSession.getMapper(UserMapper.class);
		return mapper.selectUserByUserName(userName);
	}

}
