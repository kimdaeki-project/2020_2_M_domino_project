package com.domino.t1.cart;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.member.MemberDTO;
import com.domino.t1.order.orderdetailtemp.OrderDetailTempDAO;
import com.domino.t1.order.orderdetailtemp.OrderDetailTempDTO;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
	
	@Autowired 
	private OrderDetailTempDAO orderDetailTempDAO;

	
// get user's *entire* cart item list
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
	// get pizza group list with cart_group_id(String) list
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
	
	// get item list with cart_group_id(String) list
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
	// from pizza detail page
	public int setCartItemsFromPizzaDetail(String orderType, List<String[]> arr, MemberDTO memberDTO) throws Exception {
		ArrayList<String[]> pizzaGroupCart = new ArrayList<String[]>();
		pizzaGroupCart.add(arr.get(0));
		pizzaGroupCart.add(arr.get(1));
		pizzaGroupCart.addAll(toArrayList(arr.get(2), 4));
		int setPizzaResult = setPizzaGroupItemCart(orderType, pizzaGroupCart, memberDTO);

		ArrayList<String[]> itemGroupCart = new ArrayList<String[]>();
		itemGroupCart.addAll(toArrayList(arr.get(3), 4));
		itemGroupCart.addAll(toArrayList(arr.get(4), 4));
		int setItemResult = setStandaloneItemCart(orderType, itemGroupCart, memberDTO);
		
		return setPizzaResult * setItemResult;
	}
	
	// from sideDish detail page
	public int setCartItemsFromSideDishDetail(String orderType, List<String[]> arr, MemberDTO memberDTO) throws Exception {
		ArrayList<String[]> itemGroupCart = new ArrayList<String[]>();
		itemGroupCart.addAll(toArrayList(arr.get(0), 4));
		itemGroupCart.addAll(toArrayList(arr.get(1), 4));
		return setStandaloneItemCart(orderType, itemGroupCart, memberDTO);		
	}
	
	// insert a cartDTO group of a pizza + a dough [+toppings]
	// and insert a orderDetailTempDTO item if it's a direct order from a detail page
	public int setPizzaGroupItemCart(String orderType, List<String[]> arr, MemberDTO memberDTO) throws Exception {
		//index:{ 0:pizza, 1:dough [2부터는 topping]}
		long memberNum = memberDTO.getMember_num();
		long cartGroupId = cartDAO.getMaxCartGroupId(memberDTO) + 1;
		int result = 1;
		int resultCurr = 0;
		for(String[] item: arr) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setMember_num(memberNum);
			cartDTO.setItem_id(Long.parseLong(item[0]));
			cartDTO.setCart_group_id(cartGroupId);
			cartDTO.setCart_quantity(Long.parseLong(item[2]));
			if(cartDTO.getCart_quantity() < 1) {
				continue;
			}
			if(item.length > 4) {				
				cartDTO.setItem_size(item[4]);
			}
			resultCurr = cartDAO.setCartItem(cartDTO);

			result *= resultCurr;
		}
		if(orderType.equals("direct")) {
			setOrderDetailTemp(1, cartGroupId, memberDTO);
		}				
		return result;
	}
	// insert sideDish & etc items
	public int setStandaloneItemCart(String orderType, List<String[]> arr, MemberDTO memberDTO) throws Exception {
		long memberNum = memberDTO.getMember_num();
		int result = 1;
		int resultCurr = 0;
		for(String[] item: arr) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setMember_num(memberNum);
			cartDTO.setItem_id(Long.parseLong(item[0]));
			cartDTO.setCart_quantity(Long.parseLong(item[2]));
			if(cartDTO.getCart_quantity() < 1) {
				continue;
			}
			// 이미 담긴 항목인지 검색 
			CartDTO dup = cartDAO.getCartItem(cartDTO);
			if(dup != null) {
				// in case the item already exists in the user's cart
				cartDTO.setCart_item_id(dup.getCart_item_id());
				cartDTO.setCart_quantity(cartDTO.getCart_quantity() + dup.getCart_quantity());
				resultCurr = cartDAO.updateCartItemQuantity(cartDTO);
			}else {
				// if not, add it as a new item
				cartDTO.setCart_group_id(cartDAO.getMaxCartGroupId(memberDTO) + 1);												
				resultCurr = cartDAO.setCartItem(cartDTO);	
			}	
			if(orderType.equals("direct")) {
				setOrderDetailTemp(0, cartDTO.getCart_group_id(), memberDTO);
			}
			result *= resultCurr;
		}
		return result;
	}
	
	// group a string array into groups of strings that represent items
		public List<String[]> toArrayList(String[] arr, int size){
			ArrayList<String[]> list = new ArrayList<String[]>();
			int totalItem = arr.length/size;
			for(int i=0; i<totalItem; i++) {
				list.add(Arrays.copyOfRange(arr, i*size, (i+1)*size));
			}
			return list;
		}	

// update cart item's quantity
	public int updateCartItemQuantity(CartDTO cartDTO) throws Exception {
		return cartDAO.updateCartItemQuantity(cartDTO);
	}
		

// delete a group of, or a single CartDTO item
	// delete an entire cart group of item(s) <- cart_group_id, member_num(fk)
	public int deleteCartGroup(CartDTO cartDTO) throws Exception {
		return cartDAO.deleteCartGroup(cartDTO);
	}
	
	// delete a single record <- cart_item_id(pk)
	public int deleteCartItem(CartDTO cartDTO) throws Exception {
		return cartDAO.deleteCartItem(cartDTO);
	}
	
	// delete an user's entire cart data <- member_num(fk)
	public int emptyCart(MemberDTO memberDTO) throws Exception {
		return cartDAO.emptyCart(memberDTO);
	}
	
//	retrieve user's entire order_detail_temp data and get CartDTO data based on the cart_group_id list & member_num data retrieved
	// get a list of pizza group item list 
	public List<List<CartDTO>> getTempPizzaGroupItemList(String[] gIdList, MemberDTO memberDTO) throws Exception {
		return getCartPizzaGroupListByGroupId(memberDTO, gIdList);		
	}
	
	// get a list of sideDish & etc items
	public List<CartDTO> getTempStandaloneItemList(String[] gIdList, MemberDTO memberDTO) throws Exception {
		return getCartItemByGroupId(memberDTO, gIdList);
	}
	
	// returned list[0]: pizza group id list, [1]: item id list
	public List<String[]> getOrderDetailTempLists(MemberDTO memberDTO) throws Exception {
		List<OrderDetailTempDTO> tempAll = orderDetailTempDAO.getOrderDetailTempList(memberDTO);
		ArrayList<String[]> gIdListSet = new ArrayList<String[]>();
		ArrayList<String> pizzaGIdList = new ArrayList<String>();
		ArrayList<String> itemGIdList = new ArrayList<String>();
		for(OrderDetailTempDTO dto: tempAll) {
			String gId = String.valueOf(dto.getCart_group_id());
			if(dto.getIs_pizza_group() == 1) {
				pizzaGIdList.add(gId);
			}else {
				itemGIdList.add(gId);
			}
		}
		String[] pList = pizzaGIdList.toArray(new String[0]);
		String[] iList = itemGIdList.toArray(new String[0]);
		gIdListSet.add(pList);
		gIdListSet.add(iList);
		return gIdListSet;
	}

// 사용자의 바로 주문 / 장바구니->구매하기 접근 시나, 결제 절차 완료 시 임시 정보를 모두 삭제하는데 사용 
	public int emptyOrderDetailTemp(MemberDTO memberDTO) throws Exception {
		return orderDetailTempDAO.emptyOrderDetailTemp(memberDTO);
	}	
	
// insert user's order_detail_temp data
	// 바로 주문 / 장바구니에서 구매하기 버튼 클릭 시 구매 대상 항목 정보를 임시 저장 
	public int setOrderDetailTemp(long isPizzaGroup, long cart_group_id, MemberDTO memberDTO) throws Exception {
		OrderDetailTempDTO dto = new OrderDetailTempDTO();
		dto.setCart_group_id(cart_group_id);
		dto.setIs_pizza_group(isPizzaGroup);
		dto.setMember_num(memberDTO.getMember_num());
		return orderDetailTempDAO.setOrderDetailTemp(dto);
	}
	
	public int setOrderDetailTempFromList(long isPizzaGroup, String[] GIdList, MemberDTO memberDTO) throws Exception {
		int result = 1;
		int currResult = 0;
		for(String gId: GIdList) {
			currResult = setOrderDetailTemp(isPizzaGroup, Long.parseLong(gId), memberDTO);
			result *= currResult;
		}
		return result;
	}

}

