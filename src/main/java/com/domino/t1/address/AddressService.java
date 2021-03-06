package com.domino.t1.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.branchInfo.BranchInfoDTO;
import com.domino.t1.coupon.CouponDTO;
import com.domino.t1.util.Pager;

@Service
public class AddressService {
	
	@Autowired
	private AddressDAO addressDAO;
	
	public int setAddressDelete(AddressDTO addressDTO) throws Exception{
		return addressDAO.setAddressDelete(addressDTO);
	}
	
	public List<CouponDTO> getMemberAddress(CouponDTO couponDTO) throws Exception{
		return addressDAO.getMemberAddress(couponDTO);
	}
	
	public int setMemberAddress(AddressDTO addressDTO) throws Exception{
		return addressDAO.setMemberAddress(addressDTO);
	}
	
	public List<BranchInfoDTO> getRegion1(BranchInfoDTO branchInfoDTO) throws Exception {
		return addressDAO.getRegion1(branchInfoDTO);
	}
	
	public int setBranchInfo(BranchInfoDTO branchInfoDTO) throws Exception {
		return addressDAO.setBranchInfo(branchInfoDTO);
	}
	
	public List<BranchInfoDTO> pickupBrList(BranchInfoDTO branchInfoDTO) throws Exception {
		return addressDAO.pickupBrList(branchInfoDTO);
	}

}
