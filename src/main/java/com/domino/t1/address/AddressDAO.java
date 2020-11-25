package com.domino.t1.address;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.domino.t1.branchInfo.BranchInfoDTO;
import com.domino.t1.coupon.CouponDTO;
import com.domino.t1.util.Pager;

@Repository
public class AddressDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.domino.t1.address.AddressDAO.";
	
	public int setAddressDelete(AddressDTO addressDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setAddressDelete", addressDTO);
	}
	
	public List<CouponDTO> getMemberAddress(CouponDTO couponDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getMemberAddress", couponDTO);
	}
	
	public int setMemberAddress(AddressDTO addressDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setMemberAddress", addressDTO);
		
	}
	
	public List<BranchInfoDTO> getBranchInfo(BranchInfoDTO branchInfoDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getBranchInfo", branchInfoDTO);
	}
	
	public int setBranchInfo(BranchInfoDTO branchInfoDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setBranchInfo", branchInfoDTO);
	}

}
