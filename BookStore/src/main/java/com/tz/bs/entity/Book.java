package com.tz.bs.entity;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class Book implements Serializable{
	 
	private static final long serialVersionUID = 533945479152513517L;
	
	private Integer bookid;
	private String isbn;
	private String name;
	private String author;
	private String publishHouse;
	private Date publishDate;
	private Double oldPrice;
	private Double newPrice;
	private String authorLoc;
	private String info;
	private String imageurl;
	private String suit;
	private Category category;
}
