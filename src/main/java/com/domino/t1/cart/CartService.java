package com.domino.t1.cart;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.member.MemberDTO;

@Service
public class CartService {
	
	@Autowired
	private CartDAO cartDAO;
	
	public List<CartDTO> getCartList(MemberDTO memberDTO) throws Exception {
		return cartDAO.getCartList(memberDTO);
	}
	
	public int setPizzaGroupCart(List<String[]> arr, MemberDTO memberDTO) throws Exception {
		//index:{ 0:pizza, 1:dough [2부터는 topping]}
		long memberNum = memberDTO.getMember_num();
		long cartGroupId = cartDAO.getMaxCartGroupId(memberDTO) + 1;
		for(String[] item: arr) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setMember_num(memberNum);
			cartDTO.setItem_id(Long.parseLong(item[0]));
			cartDTO.setCart_group_id(cartGroupId);
			cartDTO.setCart_quantity(Long.parseLong(item[2]));
			if(item.length > 4) {
				cartDTO.setItem_size(item[4]);
			}
			cartDAO.setCartItemWithCartGroupId(cartDTO);
		}
	// 트랜잭션 처리 필요????
		int result = 1;
		return result;
	}
	
	public int setItemGroupCart(List<String[]> arr, MemberDTO memberDTO) throws Exception {
		long memberNum = memberDTO.getMember_num();
		for(String[] item: arr) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setMember_num(memberNum);
			cartDTO.setItem_id(Long.parseLong(item[0]));
			cartDTO.setCart_quantity(Long.parseLong(item[2]));
			cartDAO.setCartItem(cartDTO);
		}
	// 트랜잭션 처리 필요????
		int result = 1;
		return result;			
	}
	

	

	

}
