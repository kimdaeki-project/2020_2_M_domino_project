package com.domino.t1.cart;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.member.MemberDTO;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;

// get user's cart item list
	// get pizza group list
	public List<List<CartDTO>> getCartPizzaGroupItemList(MemberDTO memberDTO) throws Exception {
		List<List<CartDTO>> pizzaList = new ArrayList<List<CartDTO>>();
		List<CartDTO> pizzaItemList = cartDAO.getCartPizzaGroupItemList(memberDTO);
		ArrayList<CartDTO> itemGroup = null;
		long prevItemGroup = 0;
		long currItemGroup = 0;
		for(int i=0; i<pizzaItemList.size(); i++) {
			currItemGroup = pizzaItemList.get(i).getCart_group_id();
			if(i==0 || currItemGroup != prevItemGroup){
				if(itemGroup != null) {
					pizzaList.add(itemGroup);
				}
				itemGroup = new ArrayList<CartDTO>();
			}
			itemGroup.add(pizzaItemList.get(i));
			prevItemGroup = currItemGroup;
		}
		pizzaList.add(itemGroup);
		return pizzaList;
	}
	// get standalone items list
	public List<CartDTO> getCartStandaloneItemList(MemberDTO memberDTO) throws Exception {
		return cartDAO.getCartStandaloneItemList(memberDTO);
	}
// get user's cart item list by cart group id
	public List<List<CartDTO>> getCartPizzaGroupListByGroupId(MemberDTO memberDTO, String[] gIdList) throws Exception {
		List<List<CartDTO>> pizzaGroupList = new ArrayList<List<CartDTO>>();
		for(String gId:gIdList) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setCart_group_id(Long.parseLong(gId));
			cartDTO.setMember_num(memberDTO.getMember_num());
			pizzaGroupList.add(cartDAO.getCartPizzaGroupListByGroupId(cartDTO));		
		}
		return pizzaGroupList;
	}
	
	public List<CartDTO> getCartItemByGroupId(MemberDTO memberDTO, String[] gIdList) throws Exception{
		List<CartDTO> itemList = new ArrayList<CartDTO>();
		for(String gId:gIdList) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setCart_group_id(Long.parseLong(gId));
			cartDTO.setMember_num(memberDTO.getMember_num());	
			itemList.add(cartDAO.getCartItemByGroupId(cartDTO));
		}
		return itemList;
	}
	

// insert user cart data
	// pizza+
	public int setPizzaGroupItemCart(List<String[]> arr, MemberDTO memberDTO) throws Exception {
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
			cartDAO.setCartItem(cartDTO);
		}
	// 트랜잭션 처리 필요????
		int result = 1;
		return result;
	}

	public int setStandaloneItemCart(List<String[]> arr, MemberDTO memberDTO) throws Exception {
		long memberNum = memberDTO.getMember_num();
		for(String[] item: arr) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setMember_num(memberNum);
			cartDTO.setItem_id(Long.parseLong(item[0]));
			cartDTO.setCart_quantity(Long.parseLong(item[2]));
			// 이미 담긴 항목인지 검색 
			CartDTO dup = cartDAO.getCartItem(cartDTO);
			if(dup != null) {
				// in case the item already exists in the user's cart
				cartDTO.setCart_group_id(dup.getCart_group_id());
				cartDTO.setCart_quantity(cartDTO.getCart_quantity() + dup.getCart_quantity());
				cartDAO.updateCartItemQuantity(cartDTO);
			}else {
				// if not, add it as a new item
				cartDTO.setCart_group_id(cartDAO.getMaxCartGroupId(memberDTO) + 1);												
				cartDAO.setCartItem(cartDTO);	
			}			
		}
	// 트랜잭션 처리 필요????
		int result = 1;
		return result;
	}

	public int deleteCartGroup(CartDTO cartDTO) throws Exception {
		System.out.println("service: " + cartDTO.getCart_group_id());
		return cartDAO.deleteCartGroup(cartDTO);
	}
	
	public int deleteCartItem(CartDTO cartDTO) throws Exception {
		return cartDAO.deleteCartItem(cartDTO);
	}
	
	public int emptyCart(MemberDTO memberDTO) throws Exception {
		return cartDAO.emptyCart(memberDTO);
	}
}

