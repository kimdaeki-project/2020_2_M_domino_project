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
	public void getCartStandaloneItemListTest() throws Exception {
		MemberDTO m = new MemberDTO();
		m.setMember_num(memberNum);
		List<CartDTO> result = cartDAO.getCartStandaloneItemList(m);
		for(CartDTO c: result) {
			System.out.println(c.getItem_name());
		}
		assertNotNull(result);
	}
	
	@Test
	public void getCartPizzaGroupItemListTest() throws Exception {
		MemberDTO m = new MemberDTO();
		m.setMember_num(memberNum);
		List<CartDTO> result = cartDAO.getCartPizzaGroupItemList(m);
		for(CartDTO c: result) {
			System.out.println(c.getItem_name());
		}
		assertNotNull(result);
	}
	

	
	//@Test
	public void deleteCartGroupIdTest() throws Exception {
		long cartGroupId = 2;
		long memberNum = 11;
		CartDTO cartDTO = new CartDTO();
		cartDTO.setCart_group_id(cartGroupId);
		cartDTO.setMember_num(memberNum);
		int result = cartDAO.deleteCartGroup(cartDTO);
		System.out.println(result);
		assertEquals(1, result);
	}

	//@Test
	public void deleteCartItemTest() throws Exception {
		long cartItemId = 184;
		long memberNum = 11;
		CartDTO cartDTO = new CartDTO();
		cartDTO.setCart_item_id(cartItemId);
		cartDTO.setMember_num(memberNum);
		int result = cartDAO.deleteCartItem(cartDTO);
		System.out.println(result);
		assertNotEquals(0, result);	
	}
}
