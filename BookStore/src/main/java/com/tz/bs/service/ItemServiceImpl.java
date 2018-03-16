package com.tz.bs.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tz.bs.entity.OrderItem;
import com.tz.bs.mapper.ItemMapper;
import com.tz.bs.util.MyBatiesUtil;

public class ItemServiceImpl implements ItemService{

	@Override
	public void insertItemBitch(List<OrderItem> item) {
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		ItemMapper mapper=sqlSession.getMapper(ItemMapper.class);
		mapper.insertItemBitch(item);
		MyBatiesUtil.close(sqlSession);
	}

	@Override
	public void deleteItemsByOrderID(Long oid) {
	   SqlSession sqlSession=MyBatiesUtil.sqlSession();
	   ItemMapper mapper=sqlSession.getMapper(ItemMapper.class);
	   mapper.deleteItemsByOrderID(oid);
	   MyBatiesUtil.close(sqlSession);
	}

}
