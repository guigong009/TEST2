package com.tz.bs.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tz.bs.entity.User;

@WebServlet(name="/CheckController",urlPatterns="/check/*")
public class CheckController extends HttpServlet {
	private static final long serialVersionUID = 6345464155626114473L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      String pathInfo=request.getPathInfo();
	      String base=request.getContextPath();
	      if("/checkOrder".equals(pathInfo)){
	    	   User user=(User) request.getSession().getAttribute("user");
	    	   if(user==null){
	    		   request.setAttribute("m","请先登录,在查看你的订单信息~~~");
	    		   request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
	    	   }else{
	    		   response.sendRedirect(base+"/order/show?pageNow=1");
	    	   }
	      }else if("/checkCart".equals(pathInfo)){
	    	  User user=(User) request.getSession().getAttribute("user");
	    	   if(user==null){
	    		   request.setAttribute("m","请先登录,在查看你的购物车~~~");
	    		   request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
	    	   }else{
	    		   response.sendRedirect(base+"/jsp/cart.jsp");
	    	   }
	      }
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
