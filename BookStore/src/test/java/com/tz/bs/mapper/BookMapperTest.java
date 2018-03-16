package com.tz.bs.mapper;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.tz.bs.service.BookService;
import com.tz.bs.service.BookServiceImpl;
import com.tz.bs.util.MyBatiesUtil;

public class BookMapperTest {

	@Test
	public void testSelectBookById(){
		 BookService service=new BookServiceImpl();
		 System.out.println(service.selectBookById(1));
	}
	
	@Test
	public void testSelectAllBooks(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		BookMapper mapper=sqlSession.getMapper(BookMapper.class);
		mapper.selectAllBooks().forEach(System.out::println);
	}
	//分页查询
	@Test
	public void testSelectBookByPage (){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		BookMapper mapper=sqlSession.getMapper(BookMapper.class);
		mapper.selectBookByPage(1,1,3).forEach(System.out::println);
	}
	
	@Test
	public void testRowCount (){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		BookMapper mapper=sqlSession.getMapper(BookMapper.class);
	    System.out.println(mapper.rowCount(2));
	}
	
	//查询所有的category
	@Test
	public void testSelectCategory(){
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		BookMapper mapper=sqlSession.getMapper(BookMapper.class);
	    mapper.selectCategory().forEach(System.out::println);
	}
}
