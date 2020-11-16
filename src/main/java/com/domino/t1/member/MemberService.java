package com.domino.t1.member;

import java.util.List;

public interface MemberService {
	
	public MemberDTO getMemberSearch(MemberDTO memberDTO) throws Exception;
	
	public int setMemberDelete(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO getOne(MemberDTO memberDTO) throws Exception;
	
	public List<MemberDTO> getInqBoardList(MemberDTO memberDTO) throws Exception;
	
	public int setInqBoardWrite(MemberDTO memberDTO) throws Exception;
	
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO getMemberCheck(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO getMemberEmailCheck(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO getMemberPhoneCheck(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO getMemberIdCheck(MemberDTO memberDTO) throws Exception;
	
	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception;
	
	public int setMemberJoin(MemberDTO memberDTO) throws Exception;
	
	public List<MemberDTO> getMemberList(MemberDTO memberDTO) throws Exception;

}
