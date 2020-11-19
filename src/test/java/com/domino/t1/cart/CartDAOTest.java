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
	
	
	
	//@Test
	public void setCartItemTest() throws Exception {
		CartDTO cartDTO = new CartDTO();
		cartDTO.setMember_num(1);
		cartDTO.setItem_id(90);
		cartDTO.setCart_quantity(2);
		cartDTO.setItem_size(null);
		int result = cartDAO.setCartItem(cartDTO);
		assertEquals(1, result);
	}
	
	//@Test
	public void setCartItemWithCartGroupIdTest() throws Exception {
		CartDTO cartDTO = new CartDTO();
		cartDTO.setMember_num(1);
		cartDTO.setItem_id(89);
		cartDTO.setCart_quantity(1);
		cartDTO.setItem_size(null);
		cartDTO.setCart_group_id(getMaxCartGroupIdTest(1)+1);
		int result = cartDAO.setCartItemWithCartGroupId(cartDTO);
		assertEquals(1, result);		
	}
	

	public long getMaxCartGroupIdTest(long memberNum) throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_num(memberNum);
		long result = cartDAO.getMaxCartGroupId(memberDTO);
		return result;
		
	}
	
	@Test
	public void getMaxCartGroupIdTestNull() throws Exception {
		long memberNum = 2;
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_num(memberNum);
		long result = cartDAO.getMaxCartGroupId(memberDTO);
		assertEquals(0, result);
		
	}
	
	@Test
	public void getCartListTest() throws Exception {
		long memberNum = 1;
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_num(memberNum);
		List<CartDTO> arr = cartDAO.getCartList(memberDTO);
		assertNotNull(arr);		
	}

}
