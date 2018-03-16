package com.tz.bs.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Order implements Serializable{
	 
	private static final long serialVersionUID = 2990066359404192565L;
	
	private Long orderId;
	private String orderNum;
	private Date createDate;
	private List<OrderItem> items;
	private User user;
	private OrderStatus orderStatus;
	private Address address;
	private Double total;

}
