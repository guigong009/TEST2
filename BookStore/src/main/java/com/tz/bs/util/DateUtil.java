/**
 * 
 */
package com.tz.bs.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author z.h
 * @create 2018��1��15�� ����5:28:10
 */
public class DateUtil {
 
	 public static String getDate(Date d){
		   return new SimpleDateFormat("yyyy-MM-dd").format(d);
	 }
	 
	 public static Date chageToDate(String s){
 		  try {
			  return new SimpleDateFormat("yyyy-MM-dd").parse(s);
		} catch (ParseException e) {
 			e.printStackTrace();
		}
		return null;
	 }
 
}
