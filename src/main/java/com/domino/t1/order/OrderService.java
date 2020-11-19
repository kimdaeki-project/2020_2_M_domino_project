package com.domino.t1.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.member.MemberDTO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO orderDAO;
	
	public AddressDTO getOne(AddressDTO addressDTO) throws Exception {	
		
		return orderDAO.getOne(addressDTO);
		
		
		
	}
	
	
	
}
