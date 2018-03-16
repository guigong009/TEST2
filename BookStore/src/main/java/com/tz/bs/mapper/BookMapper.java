package com.tz.bs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.tz.bs.entity.Book;
import com.tz.bs.entity.Category;

public interface BookMapper {
	
	Book selectBookById(int id);

	List<Book> selectAllBooks();
    
	//分页查询
	List<Book> selectBookByPage(@Param("cateid")Integer cateid,@Param("pageNow")Integer pageNow,@Param("pageSize")Integer pageSize);
	
	List<Book> selectBooksbyCondition(@Param("pageNow") Integer pageNow, @Param("pageSize") Integer pageSize,
			@Param("cate") Long cate, @Param("str") String name);
    //根据id
	Integer rowCount(@Param("cate") int cate);

	List<Category> selectCategory();
}
