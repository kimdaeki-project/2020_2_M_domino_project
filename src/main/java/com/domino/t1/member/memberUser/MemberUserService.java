package com.domino.t1.member.memberUser;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.member.MemberDTO;
import com.domino.t1.member.MemberService;

@Service
public class MemberUserService implements MemberService{
		
	@Autowired
	private MemberUserDAO memberDAO;

	@Override
	public MemberDTO getMemberSearch(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberCheck(memberDTO);
	}

	@Override
	public int setMemberDelete(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.setMemberDelete(memberDTO);
	}

	@Override
	public MemberDTO getOne(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getOne(memberDTO);
	}

	@Override
	public List<MemberDTO> getInqBoardList(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getInqBoardList(memberDTO);
	}

	@Override
	public int setInqBoardWrite(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.setInqBoardWrite(memberDTO);
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
	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberLogin(memberDTO);
	}

	@Override
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.setMemberJoin(memberDTO);
	}

	@Override
	public List<MemberDTO> getMemberList(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberList(memberDTO);
	}
	
	
}
