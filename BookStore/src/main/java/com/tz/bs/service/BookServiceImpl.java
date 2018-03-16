package com.tz.bs.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.tz.bs.entity.Book;
import com.tz.bs.entity.Category;
import com.tz.bs.mapper.BookMapper;
import com.tz.bs.util.MyBatiesUtil;
import com.tz.bs.util.PageBean;

public class BookServiceImpl implements BookService{

	@Override
	public List<Category> selectCategory() {
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		BookMapper mapper=sqlSession.getMapper(BookMapper.class);
		return mapper.selectCategory();
	}

	@Override
	public PageBean<Book> selectBookByPage(int cateid, Integer pageNow, Integer pageSize) {
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		BookMapper mapper=sqlSession.getMapper(BookMapper.class);
		PageBean<Book> pageBean=new PageBean<>();
		pageBean.setPageDatas(mapper.selectBookByPage(cateid, pageNow, pageSize));
		pageBean.setPageNow(pageNow);
		pageBean.setPageSize(pageSize);
		pageBean.setTotalRecords(mapper.rowCount(cateid));
		return pageBean;
	}

	@Override
	public Book selectBookById(int id) {
		SqlSession sqlSession=MyBatiesUtil.sqlSession();
		BookMapper mapper=sqlSession.getMapper(BookMapper.class);
		return mapper.selectBookById(id);
	}

}
