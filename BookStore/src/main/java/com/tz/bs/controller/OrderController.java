package com.tz.bs.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tz.bs.entity.Address;
import com.tz.bs.entity.Cart;
import com.tz.bs.entity.CartItem;
import com.tz.bs.entity.Order;
import com.tz.bs.entity.OrderItem;
import com.tz.bs.entity.OrderStatus;
import com.tz.bs.entity.SearchPojo;
import com.tz.bs.entity.User;
import com.tz.bs.service.AddressService;
import com.tz.bs.service.ItemService;
import com.tz.bs.service.OrderService;
import com.tz.bs.util.BeanFactory;
import com.tz.bs.util.DateUtil;
import com.tz.bs.util.PageBean;
import com.tz.bs.util.UUIDUtils;
 
@WebServlet(name="/OrderController",urlPatterns="/order/*")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = -7260774046882473696L;
	private AddressService addressService=(AddressService) BeanFactory.getBean("addressService");
	private OrderService orderService=(OrderService) BeanFactory.getBean("orderService");
	private ItemService itemService=(ItemService) BeanFactory.getBean("itemService");
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String pathInfo=request.getPathInfo();
	        if("/confirm".equals(pathInfo)){
	        	 String str=request.getParameter("str");
	        	 String str2=request.getParameter("str2");
		        if(str.length()==0||str==""){
		    		 response.sendRedirect("/BookStore/jsp/cart.jsp"); 
		    		 return ;
		    	 }
		    	 String[] s=str.split(",");
		    	 String[] s2=str2.split(",");
		    	 Cart cart=getCart(request);
		    	 int tem=-1;
		    	 for(int i=0;i<s2.length;i++){
		    		 for(int j=0;j<s.length;j++){
		    			 if(s2[i].equals(s[j])){
		    				 tem=i;
		    				 continue;
		    			 }
		    		 }
		    		 if(i==tem){
		    			 continue;
		    		 }
		    		 cart.removeFromCart(Integer.parseInt(s2[i]));
		    	 }
		    	 
		    	    User user=(User) request.getSession().getAttribute("user");
		        	List<Address> list = addressService.selectAddrsByUserID((user.getUserid()));
		        	if(list.size()==0){
		        		request.setAttribute("address","没有默认地址,请添加~~~");
		        	}else{
		        		request.setAttribute("address",list);
		        	}
		        	request.getRequestDispatcher("/jsp/confirm_order.jsp").forward(request, response);
	        }else if("/addNew".equals(pathInfo)){
	        	Address a=new Address();
	        	String pro=request.getParameter("province");
	        	String city=request.getParameter("city");
	        	String dis=request.getParameter("district");
	        	a.setArea(pro+city+dis);
	        	String detail=request.getParameter("details");
	        	a.setDetailaddress(detail);
	        	String email=request.getParameter("email");
	        	a.setEmailcode(email);
	        	String name=request.getParameter("username");
	        	a.setReciver(name);
	        	String tel=request.getParameter("telephone");
	        	a.setTel(tel);
	        	String check=request.getParameter("check");
	        	if("1".equals(check)){
	        		a.setIsDefault('1');
	        	}else{
	        		a.setIsDefault('0');
	        	}
	        	User u=(User) request.getSession().getAttribute("user");
	        	a.setUser(u);
	        	addressService.insertAddr(a);
	        	List<Address> list = addressService.selectAddrsByUserID((u.getUserid()));
	        	request.setAttribute("address",list);
	        	request.getRequestDispatcher("/jsp/confirm_order.jsp").forward(request, response);
	        }else if("/commit".equals(pathInfo)){
	        	 //封装数据,把order信息和orderItem信息插入数据库
	        	 Order order=new Order();
	        	 //得到当前用户
	        	 User user=(User) request.getSession().getAttribute("user");
	        	 //得到购物车
	        	 Cart cart=(Cart) request.getSession().getAttribute("cart");
	        	 //根据用户查出默认地址
	        	 Address address=addressService.selectDefAdd(user.getUserid());
	        	 order.setAddress(address);
	        	 order.setCreateDate(new Date());
	        	 //设置订单编号ordNum
	        	 String ordNum=UUIDUtils.getId();
	        	 order.setOrderNum(ordNum);
	        	 order.setOrderStatus(OrderStatus.等待发货);
	        	 
	        	 order.setTotal(cart.getTotal());
	        	 order.setUser(user);
	        	 orderService.insertOrder(order);
	        	 List<OrderItem> orderList=new ArrayList<>();
	        	 Order o=new Order();
	        	 o.setOrderId(order.getOrderId());
	        	 OrderItem orderItem;
	        	 Collection<CartItem> items = cart.getItems();
	        	 for(CartItem i : items){
	        		 orderItem=new OrderItem();
	        		 orderItem.setAllPrice(cart.getTotal());
	        		 orderItem.setBook_author(i.getBook().getAuthor());
	        		 orderItem.setBook_isbn(i.getBook().getIsbn());
	        		 orderItem.setBook_name(i.getBook().getName());
	        		 orderItem.setBook_url(i.getBook().getImageurl());
	        		 orderItem.setCount(i.getCount());
	        		 orderItem.setOrder(o);
	        		 orderItem.setUnit_price(i.getBook().getNewPrice());
	        		 orderList.add(orderItem);
	        	 }
	        	 itemService.insertItemBitch(orderList);
	        	 request.getRequestDispatcher("/order/show?pageNow="+request.getParameter("pageNow")).forward(request, response);
	        
	        }else if("/show".equals(pathInfo)){
	        	  //得到当前用户
	        	  User user=(User) request.getSession().getAttribute("user");

	        	 //得到数据在页面显示
	        	 //得到当前页,默认开始为第一页
	        	 // SearchPojo pojo=new SearchPojo();
	        	 //pojo.setOrderNum(ordNum);
	        	 int pageNow=Integer.parseInt(request.getParameter("pageNow"));
	        	 PageBean<Order> bean=orderService.queryByPage(user, pageNow,4 ,null);
	        	 request.setAttribute("bean", bean);
	        	 
	        	 request.getRequestDispatcher("/jsp/order_list.jsp").forward(request, response); 
	        }else if("/change".equals(pathInfo)){
	        	 User user=(User) request.getSession().getAttribute("user");
	        	 int pageNow=Integer.parseInt(request.getParameter("pages"));
	        	 PageBean<Order> bean=orderService.queryByPage(user, pageNow,4 ,null);
	        	 request.setAttribute("bean", bean);
	        	 request.getRequestDispatcher("/jsp/order_list.jsp").forward(request, response); 
	        }else if("/setSize".equals(pathInfo)){
	        	 User user=(User) request.getSession().getAttribute("user");
	        	 int size=Integer.parseInt(request.getParameter("s"));
	        	 PageBean<Order> bean=orderService.queryByPage(user,1,size ,null);
	        	 request.setAttribute("bean", bean);
	        	 request.getRequestDispatcher("/jsp/order_list.jsp").forward(request, response); 
	        }else if("/deleteOrder".equals(pathInfo)){
	        	 User user=(User) request.getSession().getAttribute("user");
	        	 Long oid=Long.parseLong(request.getParameter("oid"));
	        	 orderService.deleteOrderByID(oid);
	        	 itemService.deleteItemsByOrderID(oid);
	        	 PageBean<Order> bean=orderService.queryByPage(user,1,4 ,null);
	        	 request.setAttribute("bean", bean);
	        	 
	        	 request.getRequestDispatcher("/jsp/order_list.jsp").forward(request, response); 
	        }else if("/search".equals(pathInfo)){
	        	 User user=(User) request.getSession().getAttribute("user");
	        	 String ordNum=request.getParameter("ordNum");
	        	 //Order order=orderService.selectOrderByOrderNum(ordNum);
	        	 SearchPojo pojo=new SearchPojo();
	        	 pojo.setOrderNum(ordNum);
	        	 PageBean<Order> bean=orderService.queryByPage(user,1,4 ,pojo); 
	        	 request.setAttribute("bean", bean);
	        	 request.getRequestDispatcher("/jsp/order_list.jsp").forward(request, response); 
	        }else if("/forDate".equals(pathInfo)){
	        	 User user=(User) request.getSession().getAttribute("user");
	        	 Date startDate=DateUtil.chageToDate(request.getParameter("startdate"));
	        	 Date endDate=DateUtil.chageToDate(request.getParameter("enddate"));
	        	 SearchPojo pojo=new SearchPojo();
	        	 pojo.setBeginDate(startDate);
	        	 pojo.setEndDate(endDate);
	        	 PageBean<Order> bean=orderService.queryByPage(user,1,4 ,pojo); 
	        	 request.setAttribute("bean", bean);
	        	 request.getRequestDispatcher("/jsp/order_list.jsp").forward(request, response); 
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
