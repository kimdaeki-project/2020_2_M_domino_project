package com.domino.t1.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
		
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberDTO getMemberPhoneCheck(MemberDTO memberDTO) throws Exception{
		return memberDAO.getMemberPhoneCheck(memberDTO);
	}
	
	public MemberDTO getMemberIdCheck(MemberDTO memberDTO) throws Exception{
		return memberDAO.getMemberIdCheck(memberDTO);
	}
	
	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception{
		return memberDAO.getMemberLogin(memberDTO);
	}
	
	public int setMemberJoin(MemberDTO memberDTO) throws Exception{
		return memberDAO.setMemberJoin(memberDTO);
	}
	
	public List<MemberDTO> getMemberList(MemberDTO memberDTO) throws Exception{
		return memberDAO.getMemberList(memberDTO);
		
	}
}
