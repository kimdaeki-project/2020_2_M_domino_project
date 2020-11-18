package com.domino.t1.member.memberInquirly;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.member.MemberDTO;

@Service
public class MemberInquirlyService {
	
	@Autowired
	private MemberInquirlyDAO memberInquirlyDAO;
	
	public int setInqDelete(MemberInquirlyDTO memberInquirlyDTO) throws Exception{
		return memberInquirlyDAO.setInqDelete(memberInquirlyDTO);
	}
	
	public MemberInquirlyDTO getOne(MemberInquirlyDTO memberInquirlyDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberInquirlyDAO.getOne(memberInquirlyDTO);
	}

	public List<AddressDTO> getInqBoardList(AddressDTO addressDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberInquirlyDAO.getInqBoardList(addressDTO);
	}

	
	public int setInqBoardWrite(MemberInquirlyDTO memberInquirlyDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberInquirlyDAO.setInqBoardWrite(memberInquirlyDTO);
	}

}
