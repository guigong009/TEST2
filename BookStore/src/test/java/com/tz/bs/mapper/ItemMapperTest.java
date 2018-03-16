package com.tz.bs.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.tz.bs.entity.Order;
import com.tz.bs.entity.OrderItem;
import com.tz.bs.service.ItemService;
import com.tz.bs.service.ItemServiceImpl;
import com.tz.bs.util.MyBatiesUtil;

public class ItemMapperTest {

	@Test
	public void testSelectItemByID(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		ItemMapper mapper=sqlSession.getMapper(ItemMapper.class);
		System.out.println(mapper.selectItemByID(1L));
	}
	
	@Test
	public void testSelectItemByOrderID(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		ItemMapper mapper=sqlSession.getMapper(ItemMapper.class);
		mapper.selectItemByOrderID(1L).forEach(System.out::println);
	}
	
	@Test
	public void testInsertItem(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		ItemMapper mapper=sqlSession.getMapper(ItemMapper.class);
		OrderItem i=new OrderItem();
		i.setAllPrice(1231.2);
		i.setBook_author("徐静");
		i.setBook_name("此刻花开");
		i.setBook_isbn("此书畅销中");
		i.setBook_url("www.cikehua.com");
		i.setCount(8);
		i.setUnit_price(57.0);
		mapper.insertItem(i,1L);
		MyBatiesUtil.close(sqlSession);
	}
	
	@Test
	public void testInsertItemBitch(){
		ItemService service=new ItemServiceImpl();
		List<OrderItem> item=new ArrayList<>();
		OrderItem i=new OrderItem();
		i.setAllPrice(1231.2);
		i.setBook_author("梅里");
		i.setBook_name("西藏");
		i.setBook_isbn("降价此书畅销中");
		i.setBook_url("www.xizang.com");
		i.setCount(18);
		i.setUnit_price(69.0);
		Order o=new Order();
		o.setOrderId(2L);
		i.setOrder(o);
	    item.add(i);
	    
	    OrderItem i2=new OrderItem();
		i2.setAllPrice(1231.2);
		i2.setBook_author("Smiethos");
		i2.setBook_name("天下");
		i2.setBook_isbn("降价此书畅销中");
		i2.setBook_url("www.dffdd.com");
		i2.setCount(18);
		i2.setUnit_price(99.0);
		Order o2=new Order();
		o2.setOrderId(2L);
		i2.setOrder(o2);
		item.add(i2);
		service.insertItemBitch(item);
	}
	
	@Test
	public void testDeleteItemsByOrderID (){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		ItemMapper mapper=sqlSession.getMapper(ItemMapper.class);
	    mapper.deleteItemsByOrderID(2L);
	    MyBatiesUtil.close(sqlSession);
	}
}
