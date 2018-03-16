package com.tz.bs.mapper;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.tz.bs.entity.Address;
import com.tz.bs.entity.User;
import com.tz.bs.service.AddressService;
import com.tz.bs.service.AddressServiceImpl;
import com.tz.bs.util.MyBatiesUtil;

public class AddressMapperTest {

	@Test
	public void testSelectAddrByID(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		AddressMapper mapper=sqlSession.getMapper(AddressMapper.class);
		System.out.println(mapper.selectAddrByID(4L));
	}
	
	@Test
	public void testSelectDefAdd(){
		/*SqlSession sqlSession=MyBatiesUtil.sqlSession();
		AddressMapper mapper=sqlSession.getMapper(AddressMapper.class);*/
		AddressService mapper=new AddressServiceImpl();
		System.out.println(mapper.selectDefAdd(1L));
	}
	
	@Test
	public void testDeleteAddr(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		AddressMapper mapper=sqlSession.getMapper(AddressMapper.class);
		mapper.deleteAddr(1L);
		MyBatiesUtil.close(sqlSession);
	}
	
	@Test
	public void testSelectAddrsByUserID(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		AddressMapper mapper=sqlSession.getMapper(AddressMapper.class);
	    mapper.selectAddrsByUserID(1L).forEach(System.out::println);
	}
	@Test
	public void testInsertAddr(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		AddressMapper mapper=sqlSession.getMapper(AddressMapper.class);
		Address a=new Address();
		a.setArea(null);
		a.setDetailaddress("东南大道");
		a.setEmailcode(null);
		a.setIsDefault('1');
		a.setReciver(null);
		a.setTel(null);
		User u=new User();
		u.setUserid(2L);
		a.setUser(u);
		mapper.insertAddr(a);
		MyBatiesUtil.close(sqlSession);
	}
	
	@Test
	public void testUpdateAddr(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		AddressMapper mapper=sqlSession.getMapper(AddressMapper.class);
	    Address a=new Address();
	    a.setAddressid(4L);
	    a.setArea("华中区");
	    a.setDetailaddress("华中区华新街道");
	    a.setEmailcode("12312@qq.com");
	    a.setIsDefault('0');
	    a.setReciver("本人");
	    a.setTel("234324");
	    User u=new User();
	    u.setUserid(3L);
	    a.setUser(u);
	    mapper.updateAddr(a);
	    MyBatiesUtil.close(sqlSession);
	}
	
	@Test
	public void testCleanDefaultAddress(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		AddressMapper mapper=sqlSession.getMapper(AddressMapper.class);
		mapper.cleanDefaultAddress(3L);
		MyBatiesUtil.close(sqlSession);
	}
}
