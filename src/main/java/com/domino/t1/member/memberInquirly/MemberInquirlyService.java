package com.domino.t1.member.memberInquirly;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.util.Pager;

@Service
public class MemberInquirlyService {
	
	@Autowired
	private MemberInquirlyDAO memberInquirlyDAO;
	
	public int setInqListDelete(MemberInquirlyDTO memberInquirlyDTO) throws Exception{
		return memberInquirlyDAO.setInqListDelete(memberInquirlyDTO);
	}
	
	public int setInqUpdate(MemberInquirlyDTO memberInquirlyDTO) throws Exception{
		return memberInquirlyDAO.setInqUpdate(memberInquirlyDTO);
	}
	
	public List<MemberInquirlyDTO> getInqList(MemberInquirlyDTO memberInquirlyDTO) throws Exception{
		return memberInquirlyDAO.getInqList(memberInquirlyDTO);
	}
	
	public int setInqDelete(MemberInquirlyDTO memberInquirlyDTO) throws Exception{
		return memberInquirlyDAO.setInqDelete(memberInquirlyDTO);
	}
	
	public MemberInquirlyDTO getOne(MemberInquirlyDTO memberInquirlyDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberInquirlyDAO.getOne(memberInquirlyDTO);
	}

	public List<Pager> getInqBoardList(Pager pager) throws Exception {
		
		pager.makeRow();
		pager.setTotalCount(memberInquirlyDAO.getCount(pager));
		pager.makePage();
		
		return memberInquirlyDAO.getInqBoardList(pager);
	}

	public long getCount(Pager pager) throws Exception{
		return memberInquirlyDAO.getCount(pager);
	}
	
	public int setInqBoardWrite(MemberInquirlyDTO memberInquirlyDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberInquirlyDAO.setInqBoardWrite(memberInquirlyDTO);
	}

}
