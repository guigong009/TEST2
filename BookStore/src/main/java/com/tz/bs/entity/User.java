package com.tz.bs.entity;

import java.io.Serializable;

import lombok.Data;

@Data
public class User implements Serializable{
	 
	private static final long serialVersionUID = -8788383441333085477L;
	
	private Long userid;
	private String userName;
	private String password;
	private String phone;
	private String email;
	private String company;
}
