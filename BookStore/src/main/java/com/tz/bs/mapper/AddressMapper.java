package com.tz.bs.mapper;

import java.util.List;

import com.tz.bs.entity.Address;

public interface AddressMapper {
	
	Address selectAddrByID(Long ID);
    //根据用户id查询出默认地址
	Address selectDefAdd(Long userid);
	
	void deleteAddr(Long ID);

	List<Address> selectAddrsByUserID(Long uid);

	void insertAddr(Address a);

	void updateAddr(Address a);

	void cleanDefaultAddress(Long uid);
}
