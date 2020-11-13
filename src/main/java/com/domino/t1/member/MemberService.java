package com.domino.t1.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
		
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberDTO getMemberSearch(MemberDTO memberDTO) throws Exception{
		return memberDAO.getMemberSearch(memberDTO);
	}
	
	public int setMemberDelete(MemberDTO memberDTO) throws Exception{
		return memberDAO.setMemberDelete(memberDTO);
	}
	
	public MemberDTO getOne(MemberDTO memberDTO) throws Exception{
		return memberDAO.getOne(memberDTO);
	}
	
	public List<MemberDTO> getInqBoardList(MemberDTO memberDTO) throws Exception{
		return memberDAO.getInqBoardList(memberDTO);
	}
	
	public int setInqBoardWrite(MemberDTO memberDTO) throws Exception{
		return memberDAO.setInqBoardWrite(memberDTO);
	}
	
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception{
		return memberDAO.setMemberUpdate(memberDTO);
	}
	
	public MemberDTO getMemberCheck(MemberDTO memberDTO) throws Exception{
		return memberDAO.getMemberCheck(memberDTO);
	}
	
	public MemberDTO getMemberEmailCheck(MemberDTO memberDTO) throws Exception{
		return memberDAO.getMemberEmailCheck(memberDTO);
	}
	
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
