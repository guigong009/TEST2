package com.tz.bs.util;

import java.util.UUID;

public class UUIDUtils {
	 
	public static String getId(){
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
	 
	public static String getCode(){
		return getId();
	}
	
	public static void main(String[] args) {
		System.out.println(getId());
	}
}
