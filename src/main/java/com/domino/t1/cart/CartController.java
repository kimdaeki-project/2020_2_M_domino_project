package com.domino.t1.cart;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.address.AddressService;
import com.domino.t1.coupon.CouponDTO;
import com.domino.t1.item.ItemDTO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.menu.detail.DetailService;
import com.domino.t1.order.orderdetailtemp.OrderDetailTempDAO;

@Controller
@RequestMapping(value="/cart/**")
public class CartController {
	@Autowired
	private CartService cartService;

	@Autowired
	private AddressService addressService;

	// for pizza detail page -> cart
	@PostMapping("addToCart/pizza")
	public ModelAndView setCartItems(HttpSession session, String orderType,
			@RequestParam String[] pizzaCart,
			@RequestParam String[] doughCart,
			@RequestParam String[] toppingCart,
			@RequestParam String[] sideDishCart,
			@RequestParam String[] etcCart
			) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");

		// 바로 주문 시 order_detail_temp 초기화 시켜주기 
		if(orderType.equals("direct")) {
			int emptyTempResult = cartService.emptyOrderDetailTemp(memberDTO);
		}
		
		List<String[]> arr = new ArrayList<String[]>();
		arr.add(pizzaCart);
		arr.add(doughCart);
		arr.add(toppingCart);
		arr.add(sideDishCart);
		arr.add(etcCart);

for(String s : pizzaCart) {
	System.out.println(s);
}
System.out.println("toppingLength: " + toppingCart.length);
System.out.println("sidesLen: " + sideDishCart.length);
		
		int result = cartService.setCartItemsFromPizzaDetail(orderType, arr, memberDTO);

		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}

	// for sideDish detail page -> cart
	@PostMapping("addToCart/sideDish")
	public ModelAndView setCartItems(HttpSession session, String orderType,
			@RequestParam String[] sideDishCart,
			@RequestParam String[] etcCart
			) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");		
		
		// 바로 주문 시 order_detail_temp 초기화 시켜주기 
		if(orderType.equals("direct")) {
			int emptyTempResult = cartService.emptyOrderDetailTemp(memberDTO);
		}
		
		List<String[]> arr = new ArrayList<String[]>();
		arr.add(sideDishCart);
		arr.add(etcCart);
		
		int result = cartService.setCartItemsFromSideDishDetail(orderType, arr, memberDTO);
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("hasAddress")
	public ModelAndView hasAddress(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		int result = 0;
		CouponDTO couponDTO = new CouponDTO();
		couponDTO.setMember_num(memberDTO.getMember_num());
		List<CouponDTO> addressList = addressService.getMemberAddress(couponDTO);
		
		if(addressList.size() > 0) {
			result = 1;
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	

	@GetMapping("detail")
	public ModelAndView getCartDetailPage(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		// get user's address(one)
		CouponDTO couponDTO = new CouponDTO();
		couponDTO.setMember_num(memberDTO.getMember_num());
		List<CouponDTO> addressList = addressService.getMemberAddress(couponDTO);
		if(addressList.size() > 0) {
			couponDTO = addressList.get(0);
		}else {
			couponDTO = null;
		}
		mv.addObject("address", couponDTO);
		
		// get CartDTO list of the user
		List<List<CartDTO>> pizzaGroupList = cartService.getCartPizzaGroupItemList(memberDTO);
		List<CartDTO> itemList = cartService.getCartStandaloneItemList(memberDTO);
		if(pizzaGroupList.get(0) == null && itemList.size() < 1) {
			mv.addObject("isCartEmpty", 1);
			mv.setViewName("cart/detail");
			return mv;
		}
	
		mv.addObject("isCartEmpty", 0);
		mv.addObject("pizzaGroupList", pizzaGroupList);
		mv.addObject("itemList", itemList);
		mv.setViewName("cart/detail");
		return mv;
	}
	
	@PostMapping("changeQuantity")
	public ModelAndView changeQuantity(HttpSession session, CartDTO cartDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("quantity change: to " + cartDTO.getCart_quantity());
		System.out.println("cart item id: " + cartDTO.getCart_item_id());
		int result = cartService.updateCartItemQuantity(cartDTO);
System.out.println("result: "+ result);
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("delete/item")
	public ModelAndView deleteItem(HttpSession session, CartDTO cartDTO) throws Exception{
		ModelAndView mv = new ModelAndView();	
		cartDTO.setMember_num(((MemberDTO)session.getAttribute("member")).getMember_num());
		int result = cartService.deleteCartGroup(cartDTO);
		System.out.println("result: "+result);
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("delete/topping")
	public ModelAndView deleteTopping(HttpSession session, long cart_item_id) throws Exception {
		ModelAndView mv = new ModelAndView();
		CartDTO cartDTO = new CartDTO();
		cartDTO.setCart_item_id(cart_item_id);
		int result = cartService.deleteCartItem(cartDTO);	
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("delete/emptyCart")
	public ModelAndView emptyCart(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		System.out.println("member num: "+memberDTO.getMember_num());
		int result = cartService.emptyCart(memberDTO);
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("cartEmpty")
	public ModelAndView cartEmpty() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cart/cartEmpty");
		return mv;
	}

	@PostMapping("toAddressPage")
	public ModelAndView toAddressPage(HttpSession session,
			@RequestParam String[] pizzaGIdList,
			@RequestParam String[] itemGIdList) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		int emptyTempResult = cartService.emptyOrderDetailTemp(memberDTO);
System.out.println("pLength: " + pizzaGIdList.length);
System.out.println("iLength: " + itemGIdList.length);
for(String s: pizzaGIdList) {
	System.out.println(s);
}
for(String s: itemGIdList) {
	System.out.println(s);
}
		int pResult = cartService.setOrderDetailTempFromList(1, pizzaGIdList, memberDTO);
		int iResult = cartService.setOrderDetailTempFromList(0, itemGIdList, memberDTO);
		
		int result = pResult * iResult;
System.out.println("pResult: " + pResult);
System.out.println("iResult: " + iResult);
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");		
		return mv;
	}

}
