package com.tz.bs.entity;

import java.io.Serializable;

public class CartItem implements Serializable{
  
	  private static final long serialVersionUID = -6710278597850041381L;
	  
	  private Book book; 
	  private Integer count; 
	  private Double subtotal=0.0;
	  
	  public CartItem() {
		 super();
	  }

	public CartItem(Book book, Integer count) {
		super();
		this.book = book;
		this.count = count;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Double getSubtotal() {
		return  Math.ceil(book.getNewPrice()* count * 100) / 100;
	}

}
