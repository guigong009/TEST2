package com.tz.bs.service;

import java.util.List;

import com.tz.bs.entity.Address;

public interface AddressService {
    //注册时插入的数据(收货地址)
	void insertAddr(Address a);
	
	//根据用户id查询出默认地址
    Address selectDefAdd(Long userid);
	
    //根据用户id查询所有的地址
	List<Address> selectAddrsByUserID(Long uid);
}
