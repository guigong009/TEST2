package com.tz.bs.service;

import java.util.List;

import com.tz.bs.entity.Book;
import com.tz.bs.entity.Category;
import com.tz.bs.util.PageBean;

public interface BookService {

	List<Category> selectCategory();
	
	//分页查询
	PageBean<Book> selectBookByPage(int cateid,Integer pageNow,Integer pageSize);
	
	//根据书的id查询
	Book selectBookById(int id);
}
