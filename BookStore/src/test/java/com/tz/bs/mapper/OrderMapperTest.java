package com.tz.bs.mapper;


import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.tz.bs.entity.Address;
import com.tz.bs.entity.Order;
import com.tz.bs.entity.OrderStatus;
import com.tz.bs.entity.SearchPojo;
import com.tz.bs.entity.User;
import com.tz.bs.service.OrderService;
import com.tz.bs.service.OrderServiceImpl;
import com.tz.bs.util.MyBatiesUtil;

public class OrderMapperTest {

	@Test
	public void testSelectOrderByID(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		OrderMapper mapper=sqlSession.getMapper(OrderMapper.class);
		System.out.println(mapper.selectOrderByID(1L));
	}
	
	@Test
	public void testInsertOrder(){
		OrderService service=new OrderServiceImpl();
		Order o=new Order();
		Address a=new Address();
		a.setAddressid(3L);
		o.setAddress(a);
		o.setCreateDate(new Date());
		o.setOrderNum("3432");
		o.setOrderStatus(OrderStatus.已签收);
		o.setTotal(123.22);
		User u=new User();
		u.setUserid(1L);
		o.setUser(u);
		service.insertOrder(o);
	}
	
	@Test
	public void testUpdateOrder(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		OrderMapper mapper=sqlSession.getMapper(OrderMapper.class);
		Order o=new Order();
		Address a=new Address();
		a.setAddressid(4L);
		o.setAddress(a);
		o.setCreateDate(new Date());
		o.setOrderNum("34322");
		o.setOrderStatus(OrderStatus.退货中);
		o.setTotal(122.22);
		User u=new User();
		u.setUserid(3L);
		o.setUser(u);
		o.setOrderId(2L);
		mapper.updateOrder(o);
		MyBatiesUtil.close(sqlSession);
	}
	
	@Test
	public void testDeleteOrderByID(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		OrderMapper mapper=sqlSession.getMapper(OrderMapper.class);
		mapper.deleteOrderByID(1L);
		MyBatiesUtil.close(sqlSession);
	}
	
	@Test
	public void testSelectOrderPageByUserID(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		OrderMapper mapper=sqlSession.getMapper(OrderMapper.class);
		SearchPojo pojo=new SearchPojo();
		pojo.setOrderNum("84E12ABD85C14776BDFE9AB6393EB318");
		List<Order> list = mapper.selectOrderPageByUserID(1L,1,1,null);
		list.forEach(System.out::println);
	}
	
	@Test
	public void testCountOrderByUserIDAndSearch(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		OrderMapper mapper=sqlSession.getMapper(OrderMapper.class);
		int a=mapper.countOrderByUserIDAndSearch(1L,null);
		System.out.println(a);
	}
}
