package com.domino.t1.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.coupon.CouponDTO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO orderDAO;
	
	public AddressDTO getOne(AddressDTO addressDTO) throws Exception {	
		
		return orderDAO.getOne(addressDTO);
		
	}
	
	public List<CouponDTO> getCoupon(CouponDTO couponDTO) throws Exception{
		
		return orderDAO.getCoupon(couponDTO);
		
		
	}
	
	
}
