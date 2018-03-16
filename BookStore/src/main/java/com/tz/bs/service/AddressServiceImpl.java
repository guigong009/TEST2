package com.tz.bs.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tz.bs.entity.Address;
import com.tz.bs.mapper.AddressMapper;
import com.tz.bs.util.MyBatiesUtil;

public class AddressServiceImpl implements AddressService{

	@Override
	public void insertAddr(Address a) {
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		AddressMapper mapper=sqlSession.getMapper(AddressMapper.class);
		mapper.insertAddr(a);
		MyBatiesUtil.close(sqlSession);
	}

	@Override
	public List<Address> selectAddrsByUserID(Long uid) {
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		AddressMapper mapper=sqlSession.getMapper(AddressMapper.class);
		return mapper.selectAddrsByUserID(uid);
	}

	@Override
	public Address selectDefAdd(Long userid) {
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		AddressMapper mapper=sqlSession.getMapper(AddressMapper.class);		
		return mapper.selectDefAdd(userid);
	}

}
