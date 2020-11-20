package com.domino.t1.cart;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.domino.t1.MyTestCase;
import com.domino.t1.member.MemberDTO;

public class CartDAOTest extends MyTestCase{
	@Autowired
	private CartDAO cartDAO;
	
	private long memberNum = 8;
	
	@Test
	public void getCartItemListTest() throws Exception {
		MemberDTO m = new MemberDTO();
		m.setMember_num(memberNum);
		List<CartDTO> result = cartDAO.getCartItemList(m);
		for(CartDTO c: result) {
			System.out.println(c.getItem_name());
		}
		assertNotNull(result);
	}

}
