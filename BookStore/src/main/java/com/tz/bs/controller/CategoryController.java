package com.tz.bs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="/CategoryController",urlPatterns="/category/*")
public class CategoryController extends HttpServlet {
	 
	private static final long serialVersionUID = 881019113105894441L;
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
 }
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
    
}
