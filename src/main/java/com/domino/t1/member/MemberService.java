package com.domino.t1.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
		
	@Autowired
	private MemberDAO memberDAO;
	
	public List<MemberDTO> getMemberList(MemberDTO memberDTO) throws Exception{
		return memberDAO.getMemberList(memberDTO);
		
	}
}
