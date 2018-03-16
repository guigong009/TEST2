package com.tz.bs.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tz.bs.entity.Order;
import com.tz.bs.entity.SearchPojo;
import com.tz.bs.entity.User;
import com.tz.bs.mapper.OrderMapper;
import com.tz.bs.util.MyBatiesUtil;
import com.tz.bs.util.PageBean;

public class OrderServiceImpl implements OrderService{

	@Override
	public void insertOrder(Order o) {
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		OrderMapper mapper=sqlSession.getMapper(OrderMapper.class);
		mapper.insertOrder(o);
		MyBatiesUtil.close(sqlSession);
	}

	@Override
	public Order selectOrderByUserId(Long userid) {
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		OrderMapper mapper=sqlSession.getMapper(OrderMapper.class);
		return mapper.selectOrderByUserId(userid);
	}

	@Override
	public PageBean<Order> queryByPage(User user, int now, int size, SearchPojo searchPojo) {
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		OrderMapper mapper=sqlSession.getMapper(OrderMapper.class);
		PageBean<Order> pageBean=new PageBean<>();
		List<Order> pageDatas = mapper.selectOrderPageByUserID(user.getUserid(),now,size, searchPojo);
		pageBean.setPageDatas(pageDatas);
		pageBean.setPageNow(now);
		pageBean.setPageSize(size);
		pageBean.setTotalRecords(mapper.countOrderByUserIDAndSearch(user.getUserid(), searchPojo));
		return pageBean;
	}

	@Override
	public void deleteOrderByID(Long oid) {
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		OrderMapper mapper=sqlSession.getMapper(OrderMapper.class);
		mapper.deleteOrderByID(oid);
		MyBatiesUtil.close(sqlSession);
	}

	@Override
	public Order selectOrderByOrderNum(String orderNum) {
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		OrderMapper mapper=sqlSession.getMapper(OrderMapper.class);
		return mapper.selectOrderByOrderNum(orderNum);
	}

 
}
