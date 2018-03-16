package com.tz.bs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tz.bs.entity.Book;
import com.tz.bs.entity.Category;
import com.tz.bs.service.BookService;
import com.tz.bs.util.BeanFactory;
import com.tz.bs.util.PageBean;
 
@WebServlet(name="/IndexController",urlPatterns="/index/*")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 8818716941118070050L;
	private BookService bookService=(BookService) BeanFactory.getBean("bookService");
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   //查询出所有的类别
	   List<Category> caList=bookService.selectCategory();
	   //放入request作用域中
	    //request.getSession().setAttribute("caList", caList);
	   ServletContext application=this.getServletContext();
	   application.setAttribute("caList",caList);
	   //转发
	   
	   //精选图书
	   PageBean<Book> bean1 = bookService.selectBookByPage(1,1,4);
	   request.getSession().setAttribute("bean1",bean1);
	   //推荐图书
	   PageBean<Book> bean2 = bookService.selectBookByPage(2,1,4);
	   request.getSession().setAttribute("bean2",bean2);
	   //特价图书
	   PageBean<Book> bean3 = bookService.selectBookByPage(3,1,4);
	   request.getSession().setAttribute("bean3",bean3);
	   request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
