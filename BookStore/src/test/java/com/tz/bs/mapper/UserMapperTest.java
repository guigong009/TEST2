package com.tz.bs.mapper;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.tz.bs.entity.User;
import com.tz.bs.util.MyBatiesUtil;

public class UserMapperTest {

	@Test
	public void testSelectUser(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		UserMapper mapper=sqlSession.getMapper(UserMapper.class);
		System.out.println(mapper.selectUser(1L));
	}
	
	@Test
	public void testSelectUserByUserName(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		UserMapper mapper=sqlSession.getMapper(UserMapper.class);
		System.out.println(mapper.selectUserByUserName("jack"));
	}
	
	@Test
	public void testInsertUser(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		UserMapper mapper=sqlSession.getMapper(UserMapper.class);
		User u=new User();
		u.setUserName("李白");
		u.setCompany("阿里巴巴");
		u.setEmail("2331@qq.com");
		u.setPassword("888");
		u.setPhone("234343");
		mapper.insertUser(u);
		MyBatiesUtil.close(sqlSession);
	}
	
	@Test
	public void testUpdateUser(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		UserMapper mapper=sqlSession.getMapper(UserMapper.class);
		User u=new User();
		u.setUserName("王连");
		u.setCompany("虎牙");
		u.setEmail("32221@qq.com");
		u.setPassword("988");
		u.setPhone("4422243");
		u.setUserid(2L);
		mapper.updateUser(u);
		MyBatiesUtil.close(sqlSession);
	}
}
