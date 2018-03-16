package com.tz.bs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.tz.bs.entity.OrderItem;

public interface ItemMapper {

	OrderItem selectItemByID(Long id);

	List<OrderItem> selectItemByOrderID(Long oid);

	void insertItem(@Param("item") OrderItem item, @Param("orderid") Long orderid);

	void insertItemBitch(@Param("items")List<OrderItem> item);

	/**
	 * 通过订单id删除所有有关的物品
	 * 
	 * @param Long
	 *            订单id
	 * @return Integer 影响行数
	 */
	void deleteItemsByOrderID(Long oid);
}
