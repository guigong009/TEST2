package com.tz.bs.service;

import com.tz.bs.entity.Order;
import com.tz.bs.entity.SearchPojo;
import com.tz.bs.entity.User;
import com.tz.bs.util.PageBean;

public interface OrderService {

	//插入一个订单
	void insertOrder(Order o);
	
	//根据用户名查询一个订单
	Order selectOrderByUserId(Long userid);
	
	//分页
	public PageBean<Order> queryByPage(User user,int now,int size,SearchPojo searchPojo);
	
	//根据订单id删除一个订单
	void deleteOrderByID(Long oid);
	
	//根据订单编号查询一个订单
	Order selectOrderByOrderNum(String orderNum);
}
