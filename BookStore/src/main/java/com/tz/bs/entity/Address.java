package com.tz.bs.entity;

import java.io.Serializable;

import lombok.Data;

@Data
public class Address implements Serializable{
	 
	private static final long serialVersionUID = 7817535465460878730L;
	
	private Long addressid;
	private String area;
	private String detailaddress;
	private String emailcode;
	private String reciver;
	private String tel;
	private Character isDefault;
	private User user;
}
