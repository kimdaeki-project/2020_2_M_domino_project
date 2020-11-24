package com.domino.t1.member;

import java.util.List;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.coupon.CouponDTO;
import com.domino.t1.member.memberInquirly.MemberInquirlyDTO;
import com.domino.t1.util.Pager;

public interface MemberDAO {
	
	public MemberDTO getOneMember(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO getMemberSearch(MemberDTO memberDTO) throws Exception;
	
	public int setMemberDelete(MemberDTO memberDTO) throws Exception;
	
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO getMemberCheck(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO getMemberEmailCheck(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO getMemberPhoneCheck(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO getMemberIdCheck(MemberDTO memberDTO) throws Exception;
	
	public Pager getMemberLogin(Pager pager) throws Exception;

	public AddressDTO getMemberLogin(CouponDTO couponDTO) throws Exception;

	public int setMemberJoin(MemberDTO memberDTO) throws Exception;
	
	public List<MemberDTO> getMemberList(Pager pager) throws Exception;
	
	public long getCount(Pager pager) throws Exception;
	
	public MemberDTO getMemberSearchPw(MemberDTO memberDTO) throws Exception;
	
	public int setPassword (MemberDTO memberDTO) throws Exception;

}
