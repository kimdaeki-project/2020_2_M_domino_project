package com.domino.t1.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddressService {
	
	@Autowired
	private AddressDAO addressDAO;
	
	public List<AddressDTO> getMemberAddress(AddressDTO addressDTO) throws Exception{
		return addressDAO.getMemberAddress(addressDTO);
	}
	
	public int setMemberAddress(AddressDTO addressDTO) throws Exception{
		return addressDAO.setMemberAddress(addressDTO);
	}

}
