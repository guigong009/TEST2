package com.tz.bs.entity;

import java.io.Serializable;

import lombok.Data;

@Data
public class Category implements Serializable{
	 
	private static final long serialVersionUID = 7944574247128764175L;
	
	private Long cateid;
	private String catename;
}
