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

import com.domino.t1.item.ItemDTO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.menu.detail.DetailService;

@Controller
@RequestMapping(value="/cart/**")
public class CartController {
	@Autowired
	private CartService cartService;

	@Autowired
	private DetailService detailService;

	// for pizza detail page -> cart
	@PostMapping("addToCart/pizza")
	public ModelAndView setCartItems(HttpSession session,
			@RequestParam String[] pizzaCart,
			@RequestParam String[] doughCart,
			@RequestParam String[] toppingCart,
			@RequestParam String[] sideDishCart,
			@RequestParam String[] etcCart
			) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");

		ArrayList<String[]> pizzaGroupCart = new ArrayList<String[]>();
		pizzaGroupCart.add(pizzaCart);
		pizzaGroupCart.add(doughCart);
		pizzaGroupCart.addAll(toArrayList(toppingCart, 4));
		int result1 = cartService.setPizzaGroupItemCart(pizzaGroupCart, memberDTO);

		ArrayList<String[]> itemGroupCart = new ArrayList<String[]>();
		itemGroupCart.addAll(toArrayList(sideDishCart, 4));
		itemGroupCart.addAll(toArrayList(etcCart, 4));
		int result2 = cartService.setStandaloneItemCart(itemGroupCart, memberDTO);

		// 나중에 꼭 트랜잭션 처리 해주기!!!!
		int result = 0;
		if(result1 > 0 && result2 > 0) {
			result = 1;
		}
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}

	// for other items's detail page -> cart
	@PostMapping("addToCart/item")
	public ModelAndView setCartItems(HttpSession session,
			@RequestParam String[] sideDishCart,
			@RequestParam String[] etcCart
			) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");

		ArrayList<String[]> itemGroupCart = new ArrayList<String[]>();
		itemGroupCart.addAll(toArrayList(sideDishCart, 4));
		itemGroupCart.addAll(toArrayList(etcCart, 4));
		int result = cartService.setStandaloneItemCart(itemGroupCart, memberDTO);

		// 나중에 꼭 트랜잭션 처리 해주기!!!!

		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}

	@GetMapping("detail")
	public ModelAndView getCartDetailPage(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
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
	public int deleteTopping(HttpSession session, long cart_item_id) throws Exception {
		CartDTO cartDTO = new CartDTO();
		cartDTO.setCart_item_id(cart_item_id);
		return cartService.deleteCartItem(cartDTO);		
	}

	public List<String[]> toArrayList(String[] arr, int size){
		ArrayList<String[]> list = new ArrayList<String[]>();
		int totalItem = arr.length/size;
		for(int i=0; i<totalItem; i++) {
			list.add(Arrays.copyOfRange(arr, i*size, (i+1)*size));
		}
		return list;
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

// 아직 테스트 데이터만 들어가있음. 
	@PostMapping("toCheckout")
	public ModelAndView toCheckoutPageTest(HttpSession session,
			@RequestParam String[] pizzaGIdList,
			@RequestParam String[] itemGIdList) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");

		List<List<CartDTO>> pizzaGroupList = cartService.getCartPizzaGroupListByGroupId(memberDTO, pizzaGIdList);
		List<CartDTO> itemList = cartService.getCartItemByGroupId(memberDTO, itemGIdList);
		session.setAttribute("pizzaGroupList", pizzaGroupList);
		session.setAttribute("itemList", itemList);
		
System.out.println("controller pizza: " + pizzaGroupList.size());
System.out.println("controller item: " + itemList.size());		
		mv.setViewName("order/orderInfo");

		return mv;
	}
}
