package com.tz.bs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tz.bs.entity.Book;
import com.tz.bs.service.BookService;
import com.tz.bs.util.BeanFactory;
import com.tz.bs.util.PageBean;
 
@WebServlet(name="/IndexPageController",urlPatterns="/page/*")
public class IndexPageController extends HttpServlet {
	 
	private static final long serialVersionUID = 5223030473447852247L;
	private BookService bookService=(BookService) BeanFactory.getBean("bookService");
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     String pathInfo=request.getPathInfo();
	     if("/book1".equals(pathInfo)){
	    	 int pageNow=Integer.parseInt(request.getParameter("pageNow"));
		     PageBean<Book> pageBean = bookService.selectBookByPage(1,pageNow,4);
		     request.setAttribute("bean1", pageBean);
		     request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
	     }else if("/book2".equals(pathInfo)){
	    	 int pageNow=Integer.parseInt(request.getParameter("pageNow"));
		     PageBean<Book> pageBean = bookService.selectBookByPage(2,pageNow,4);
		     request.setAttribute("bean2", pageBean);
		     request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
	     }else if("/book3".equals(pathInfo)){
	    	 int pageNow=Integer.parseInt(request.getParameter("pageNow"));
		     PageBean<Book> pageBean = bookService.selectBookByPage(3,pageNow,4);
		     request.setAttribute("bean3", pageBean);
		     request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
	     }
	}
 
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
