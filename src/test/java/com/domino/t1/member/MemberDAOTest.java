package com.domino.t1.member;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.domino.t1.MyTestCase;

public class MemberDAOTest extends MyTestCase{

	@Autowired
	private MemberDAO memberDAO;
	
	@Test
	public void memberJoinTest() throws Exception{
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_name("test_name");
		memberDTO.setMember_id("test id");
		memberDTO.setMember_pw("test_pw");
		memberDTO.setMember_phone("test_phone");
		memberDTO.setMember_email("test1");
		memberDTO.setMember_level("regular");
		memberDTO.setMember_pi_date(1);
		memberDTO.setMember_pi_agg(1);
		memberDTO.setMember_clause_agg(1);
		memberDTO.setMember_locate_agg(1);
		memberDTO.setMember_msg_agg(1);
		memberDTO.setMember_email_agg(1);
		memberDTO.setMember_post_agg(1);
		
		
		int result = memberDAO.setMemberJoin(memberDTO);
		assertNotNull(result);
	}

}
