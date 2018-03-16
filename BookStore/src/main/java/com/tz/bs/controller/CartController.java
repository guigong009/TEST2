package com.tz.bs.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tz.bs.entity.Book;
import com.tz.bs.entity.Cart;
import com.tz.bs.entity.CartItem;
import com.tz.bs.entity.User;
import com.tz.bs.service.BookService;
import com.tz.bs.util.BeanFactory;

@WebServlet(name="/CartController",urlPatterns="/cart/*")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 8579721447786011554L;
	private BookService bookService=(BookService) BeanFactory.getBean("bookService");
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String pathInfo=request.getPathInfo();
	    if("/add".equals(pathInfo)){
	    	 User user=(User) request.getSession().getAttribute("user");
	    	 if(user!=null){
	    	 int bookid=Integer.parseInt(request.getParameter("bookid"));
	    	 int count=Integer.parseInt(request.getParameter("count"));
	    	 //根据bookid查询出book
	    	 Book book=bookService.selectBookById(bookid);
	    	 CartItem cartItem=new CartItem(book, count);
	    	 Cart cart=getCart(request);
	    	 cart.add2Cart(cartItem);
	    	 response.sendRedirect("/BookStore/jsp/cart.jsp");
	      }else{
	    	 request.setAttribute("m","请先登录,在加入购物车...");
    		 request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
	      }
	    }else if("/remove".equals(pathInfo)){
	    	 String str=request.getParameter("str");
	    	 if(str.length()==0||str==""){
	    		 response.sendRedirect("/BookStore/jsp/cart.jsp"); 
	    		 return ;
	    	 }
	    	 String[] s=str.split(",");
	    	 Cart cart=getCart(request);
	    	 for(int i=0;i<s.length;i++){
	    	    cart.removeFromCart(Integer.parseInt(s[i])); 
	    	 } 
	    	 response.sendRedirect("/BookStore/jsp/cart.jsp"); 
	    }else if("/chooseSize".equals(pathInfo)){
	    	  int size=Integer.parseInt(request.getParameter("s"));
	    	  Cart cart=(Cart) request.getSession().getAttribute("cart");
	    	  Collection<CartItem> items = cart.getItems();
	    	  if(size>=items.size()){
	    		  response.sendRedirect("/BookStore/jsp/cart.jsp");
	    		  return ;
	    	  }
	    	  List<CartItem> list=new ArrayList<>();
	    	  list.addAll(items);
	    	  List<CartItem> list2=list.subList(size,list.size());
	    	  for(CartItem c : list2){
	    		 cart.removeFromCart(c.getBook().getBookid());
	    	  }
	    	 response.sendRedirect("/BookStore/jsp/cart.jsp");
	    	 //request.getRequestDispatcher("/jsp/cart.jsp").forward(request, response);
	    }else if("/change".equals(pathInfo)){
	    	 System.out.println(request.getParameter("count"));
	    	 System.out.println(request.getParameter("ck"));
	    	 return ;
	    }
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public Cart getCart(HttpServletRequest request){
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		//如果是第一次的话
		if(cart==null){
			cart=new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		return cart;
	}
}
