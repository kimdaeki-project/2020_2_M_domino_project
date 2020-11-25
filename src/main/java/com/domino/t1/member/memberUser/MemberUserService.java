package com.domino.t1.member.memberUser;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.address.AddressDAO;
import com.domino.t1.address.AddressDTO;
import com.domino.t1.coupon.CouponDTO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.member.MemberService;
import com.domino.t1.member.memberInquirly.MemberInquirlyDTO;
import com.domino.t1.util.Pager;

@Service
public class MemberUserService implements MemberService{
		
	@Autowired
	private MemberUserDAO memberDAO;

	@Override
	public MemberDTO getMemberSearch(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberSearch(memberDTO);
	}

	@Override
	public int setMemberDelete(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.setMemberDelete(memberDTO);
	}

	@Override
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.setMemberUpdate(memberDTO);
	}

	@Override
	public MemberDTO getMemberCheck(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberCheck(memberDTO);
	}

	@Override
	public MemberDTO getMemberEmailCheck(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberEmailCheck(memberDTO);
	}

	@Override
	public MemberDTO getMemberPhoneCheck(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberPhoneCheck(memberDTO);
	}

	@Override
	public MemberDTO getMemberIdCheck(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberIdCheck(memberDTO);
	}

	@Override
	public CouponDTO getMemberLogin(CouponDTO couponDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberLogin(couponDTO);
	}
	
	

	@Override
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.setMemberJoin(memberDTO);
	}

	@Override
	public List<MemberDTO> getMemberList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.makeRow();
		pager.setTotalCount(memberDAO.getCount(pager));
		pager.makePage();
		return memberDAO.getMemberList(pager);
	}	
	
	@Override
	public long getCount(Pager pager) throws Exception {
	
		return memberDAO.getCount(pager);
	}
	
	//추가
	public CouponDTO getMemberSocialLogin(CouponDTO couponDTO) throws Exception{
		return memberDAO.getMemberSocialLogin(couponDTO);
	}
	

	
}
