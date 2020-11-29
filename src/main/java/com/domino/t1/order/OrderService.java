package com.domino.t1.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.cart.CartDTO;
import com.domino.t1.cart.CartService;
import com.domino.t1.coupon.CouponDTO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.order.orderdetail.OrderDetailDAO;
import com.domino.t1.order.orderdetail.OrderDetailDTO;

@Service
public class OrderService {

	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrderDetailDAO orderDetailDAO;
	
	public AddressDTO getOne(AddressDTO addressDTO) throws Exception {	
		
		return orderDAO.getOne(addressDTO);
		
	}
	
	public List<CouponDTO> getCoupon(CouponDTO couponDTO) throws Exception{
		
		return orderDAO.getCoupon(couponDTO);
		
		
	}
	
	public void setTest() throws Exception {
		OrderDTO testDTO = getTester();
		setOrderDetail(testDTO);
	}
	
	// orderDTO requires: member_num, order_view_num
	public void setOrderDetail(OrderDTO orderDTO) throws Exception {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMember_num(orderDTO.getMember_num());
		// get cart group id list of purchased items of the member
		List<String[]> gIdSet = cartService.getOrderDetailTempLists(memberDTO);
		
		// get cartDTO lists for pizzaGroup and (standalone)items
		List<List<CartDTO>> pizzaGroupCartList = cartService.getTempPizzaGroupItemList(gIdSet.get(0), memberDTO);
		List<CartDTO> itemCartList = cartService.getTempStandaloneItemList(gIdSet.get(1), memberDTO);

System.out.println("got cart Lists");
for(CartDTO dto: itemCartList) {
	System.out.println(dto.getItem_name());
}
		
		// merge into a single List<CartDTO>		
		List<CartDTO> cartList = new ArrayList<CartDTO>();
		if(pizzaGroupCartList.size() > 0) {
			for(List<CartDTO> l: pizzaGroupCartList) {
				cartList.addAll(l);
			}
		}
		if(itemCartList.size() > 0) {
			cartList.addAll(itemCartList);
		}
		
		// CartDTO -> OrderDetailDTO 
		List<OrderDetailDTO> orderDetailDtoList = toOrderDetailDtoList(orderDTO.getOrder_view_num(), cartList);		
		
		// insert OrderDetailDTO items into order_detail table on DB	
		for(OrderDetailDTO dto: orderDetailDtoList) {
			orderDetailDAO.setOrderDetail(dto);
		}
		
		// remove purchased items from cart
		int removed1 = removePurchasedItemsFromCart(gIdSet.get(0));
		int removed2 = removePurchasedItemsFromCart(gIdSet.get(1));
System.out.println("removed: " + removed1 + ", " + removed2);
		// empty order_detail_temp
		int emptied = cartService.emptyOrderDetailTemp(memberDTO);
System.out.println("emptied items from cart: " + emptied);
		
	}	
	
	
	// cartDTO 데이터를 OrderDetailDTO에 옮겨담아줌. + order_view_num
	public List<OrderDetailDTO> toOrderDetailDtoList(long order_view_num ,List<CartDTO> cartDtoList) throws Exception {
		List<OrderDetailDTO> arr = new ArrayList<OrderDetailDTO>();
		for(CartDTO c : cartDtoList) {
			OrderDetailDTO dto = new OrderDetailDTO();
			dto.setOrder_view_number(order_view_num);
			dto.setOrder_item_id(c.getCart_item_id());
			dto.setOrder_detail_price(c.getItem_price());
			dto.setOrder_detail_quantity(c.getCart_quantity());
			dto.setOrder_detail_size(c.getItem_size());
			dto.setOrder_detail_group_id(c.getCart_group_id());
			dto.setOrder_detail_name(c.getItem_name());
			dto.setOrder_detail_category(c.getItem_category());
			arr.add(dto);
		}		
		return arr;
	}
	
	public int removePurchasedItemsFromCart(String[] gIdList) throws Exception {
System.out.println("removing purchased items from cart....");
		CartDTO dto = new CartDTO();
		int removed = 0;
		for(String gId: gIdList) {
			dto.setCart_group_id(Long.parseLong(gId));
			cartService.deleteCartGroup(dto);
			removed++;
		}
		return removed;
	}
	
	
	public OrderDTO getTester() throws Exception {
		String s = "str";
		long l = 99900;
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setMember_num(1);
		orderDTO.setOrder_adress(s);
		orderDTO.setOrder_shop(s);
		orderDTO.setOrder_name(s);
		orderDTO.setOrder_phone(s);
		orderDTO.setOrder_total(l);
		orderDTO.setOrder_sale(l);
		orderDTO.setOrder_payment(l);
		orderDTO.setOrder_method("wallet");
		long order_view_num = orderDAO.setOrderView(orderDTO);
System.out.println("order_view_num: " + order_view_num);
		orderDTO.setOrder_view_num(order_view_num);
		return orderDTO;
	}
}
