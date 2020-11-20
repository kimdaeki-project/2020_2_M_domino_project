package com.domino.t1.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.branchInfo.BranchInfoDTO;

@Service
public class AddressService {
	
	@Autowired
	private AddressDAO addressDAO;
	
	public int setAddressDelete(AddressDTO addressDTO) throws Exception{
		return addressDAO.setAddressDelete(addressDTO);
	}
	
	public List<AddressDTO> getMemberAddress(AddressDTO addressDTO) throws Exception{
		return addressDAO.getMemberAddress(addressDTO);
	}
	
	public int setMemberAddress(AddressDTO addressDTO) throws Exception{
		return addressDAO.setMemberAddress(addressDTO);
	}
	
	public List<BranchInfoDTO> getBranchInfo(BranchInfoDTO branchInfoDTO) throws Exception {
		return addressDAO.getBranchInfo(branchInfoDTO);
	}
	
	public int setBranchInfo(BranchInfoDTO branchInfoDTO) throws Exception {
		return addressDAO.setBranchInfo(branchInfoDTO);
	}

}
