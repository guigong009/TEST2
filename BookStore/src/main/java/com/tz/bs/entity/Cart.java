package com.tz.bs.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart implements Serializable{
	private static final long serialVersionUID = -3537617171180475790L;

	private Map<Integer, CartItem> map=new LinkedHashMap<>();
	
	private Double total=0.0;
	
	//获取所有的购物车项 CartItem
	public Collection<CartItem> getItems(){
		  return map.values();
	}
	public void add2Cart(CartItem item){
		Integer id =item.getBook().getBookid();
		if(map.containsKey(id)){
			CartItem oItem = map.get(id);
			oItem.setCount(oItem.getCount()+item.getCount());
			
		}else{
			map.put(id,item);
			
		}
		total+=item.getSubtotal();
		
	}
	public void removeFromCart(int id){
		CartItem item = map.remove(id);
		total-=item.getSubtotal();
	}
	public void clearCart(){
		map.clear();
		total=0.0;
	}
	
	public Map<Integer, CartItem> getMap() {
		return map;
	}

	public void setMap(Map<Integer, CartItem> map) {
		this.map = map;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}
	
	
}
