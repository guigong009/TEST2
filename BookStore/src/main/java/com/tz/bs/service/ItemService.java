package com.tz.bs.service;

import java.util.List;

import com.tz.bs.entity.OrderItem;

public interface ItemService {
    //批量插入订单项
	void insertItemBitch(List<OrderItem> item);
	
	//根据订单id删除订单项
	void deleteItemsByOrderID(Long oid);
}
