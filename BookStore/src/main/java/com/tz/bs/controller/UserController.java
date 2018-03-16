package com.tz.bs.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tz.bs.entity.Address;
import com.tz.bs.entity.User;
import com.tz.bs.service.AddressService;
import com.tz.bs.service.UserService;
import com.tz.bs.util.BeanFactory;
 
@WebServlet(name="/UserController",urlPatterns="/user/*")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = -5136401367196264491L;
	private UserService userService=(UserService) BeanFactory.getBean("userService");
	private AddressService addressService=(AddressService) BeanFactory.getBean("addressService");
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     
		String pathInfo=request.getPathInfo();
		if("/register".equals(pathInfo)){
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String email=request.getParameter("email");
			String telephone=request.getParameter("telephone");
			String company=request.getParameter("company");
			String address=request.getParameter("address");
			Address a=new Address();
			a.setArea(null);
			a.setDetailaddress(address);
			a.setEmailcode(null);
			a.setIsDefault('1');
			a.setReciver(null);
			a.setTel(null);
			//根据用户名查找用户
			User user=userService.selectUserByUserName(username);
			 
			if(user!=null){
				request.setAttribute("msg","该用户名已被注册");
				request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
				return ;
			}
		    User u=new User();
		    u.setCompany(company);
		    u.setEmail(email);
		    u.setPassword(password);
		    u.setPhone(telephone);
		    u.setUserName(username);
		     
		    userService.insertUser(u);
		    
		    User u1=userService.selectUserByUserName(u.getUserName());
		    a.setUser(u1);
		    addressService.insertAddr(a);
		    request.setAttribute("msg","注册成功~~");
		    request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
		    //response.sendRedirect("/BookStore/jsp/index.jsp");
		    return ;
		}else if("/check".equals(pathInfo)){
			String username = request.getParameter("username");
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter out = response.getWriter();
			User user=userService.selectUserByUserName(username);
			if (user!=null) {
				out.print("0");
			} else {
				out.print("1");
			}
			out.flush();
			out.close();
		}else if("/login".equals(pathInfo)){
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String noLogin=request.getParameter("noLogin");
			User user=userService.selectUserByUserName(username);
			if(user!=null){
				if(user.getPassword().equals(password)){
					 Cookie cookie=null;
					 if("0".equals(noLogin)){
						 cookie=new Cookie("userinfo",username+":"+password);
						 cookie.setMaxAge(30 * 24 * 60 * 60);
					 }else{
						 cookie=new Cookie("userinfo",null);
						 cookie.setMaxAge(0);
					 }
					 //设置拿到cookie的路径(/表示任意路径)
					 cookie.setPath("/");
					 response.addCookie(cookie);
					 HttpSession session = request.getSession();
					 session.setAttribute("user", user);
					 request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
				}else{
					 request.setAttribute("ms","密码错误~~");
					 request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
				} 
			}else{
				     request.setAttribute("ms","该用户不存在~~");
				     request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
			}
			
		}else if("/logout".equals(pathInfo)){
			         //把session中的用户信息清空
			         HttpSession session = request.getSession();
			         session.setAttribute("user",null);
			         request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
   
}
