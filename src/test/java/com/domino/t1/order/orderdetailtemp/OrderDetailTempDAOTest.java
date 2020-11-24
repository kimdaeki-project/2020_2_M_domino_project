package com.domino.t1.order.orderdetailtemp;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.domino.t1.MyTestCase;
import com.domino.t1.member.MemberDTO;

public class OrderDetailTempDAOTest extends MyTestCase{
	
	@Autowired
	OrderDetailTempDAO orderDetailTempDAO;
	
	@Test
	public void emptyOrderDetailTempTest() throws Exception {
		MemberDTO dto = new MemberDTO();
		dto.setMember_num(1);
		int result = orderDetailTempDAO.emptyOrderDetailTemp(dto);
		System.out.println("result: "+ result);
		assertNotEquals(0, result);
	}

}
