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
 
@WebServlet(name="/BookController",urlPatterns="/book/*")
public class BookController extends HttpServlet {
	 
	private static final long serialVersionUID = -5367544229763383215L;
	private BookService bookService=(BookService) BeanFactory.getBean("bookService");
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String pathInfo=request.getPathInfo();
	    if("/list".equals(pathInfo)){
	    	int cateid=Integer.parseInt(request.getParameter("cateid"));
	    	int pageNow=Integer.parseInt(request.getParameter("pageNow"));
	    	PageBean<Book> pageBean = bookService.selectBookByPage(cateid,pageNow,4);
	    	request.setAttribute("bean", pageBean);
	    	request.getRequestDispatcher("/jsp/books_list.jsp").forward(request, response);
	    }else if("/change".equals(pathInfo)){
	    	int cateid=Integer.parseInt(request.getParameter("cateid"));
	    	int pageNow=Integer.parseInt(request.getParameter("pages"));
	    	PageBean<Book> pageBean = bookService.selectBookByPage(cateid,pageNow,4);
	    	request.setAttribute("bean", pageBean);
	    	request.getRequestDispatcher("/jsp/books_list.jsp").forward(request, response);
	    }else if("/setSize".equals(pathInfo)){
	    	int cateid=Integer.parseInt(request.getParameter("cateid"));
	    	int size=Integer.parseInt(request.getParameter("s"));
	    	PageBean<Book> pageBean = bookService.selectBookByPage(cateid,1,size);
	    	request.setAttribute("bean", pageBean);
	    	request.getRequestDispatcher("/jsp/books_list.jsp").forward(request, response);
	    }else if("/preShow".equals(pathInfo)){
	    	int cateid=Integer.parseInt(request.getParameter("bid"));
	    	int bid=Integer.parseInt(request.getParameter("id"));
	    	int pageNow=Integer.parseInt(request.getParameter("pageNow"));
	    	Book book=bookService.selectBookById(bid);
	    	request.setAttribute("book",book);
	    	PageBean<Book> pageBean = bookService.selectBookByPage(cateid,pageNow,3);
	    	request.setAttribute("bean", pageBean);
	    	request.getRequestDispatcher("/jsp/details.jsp").forward(request, response);
	    }
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
