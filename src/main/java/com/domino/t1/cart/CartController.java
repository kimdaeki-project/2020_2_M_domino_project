package com.domino.t1.cart;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

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
	@PostMapping("addToCart/pizzaDetail")
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
		int result1 = cartService.setPizzaGroupCart(pizzaGroupCart, memberDTO);

		ArrayList<String[]> itemGroupCart = new ArrayList<String[]>();
		itemGroupCart.addAll(toArrayList(sideDishCart, 4));
		itemGroupCart.addAll(toArrayList(etcCart, 4));
		int result2 = cartService.setItemGroupCart(itemGroupCart, memberDTO);

		// 나중에 꼭 트랜잭션 처리 해주기!!!!
		int result = 0;
		if(result1 == 1 && result2 == 1) {
			result = 1;
		}
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}

	// for other items's detail page -> cart
	@PostMapping("addToCart/itemDetail")
	public ModelAndView setCartItems(HttpSession session,
			@RequestParam String[] sideDishCart,
			@RequestParam String[] etcCart
			) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");

		ArrayList<String[]> itemGroupCart = new ArrayList<String[]>();
		itemGroupCart.addAll(toArrayList(sideDishCart, 4));
		itemGroupCart.addAll(toArrayList(etcCart, 4));
		int result = cartService.setItemGroupCart(itemGroupCart, memberDTO);

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
		List<CartDTO> arr = cartService.getCartList(memberDTO);
		mv.addObject("cartList", arr);
		mv.setViewName("cart/detail");

		return mv;
	}

	public List<String[]> toArrayList(String[] arr, int size){
		ArrayList<String[]> list = new ArrayList<String[]>();
		int totalItem = arr.length/size;
		for(int i=0; i<totalItem; i++) {
			list.add(Arrays.copyOfRange(arr, i*size, (i+1)*size));
		}
		return list;
	}

	@GetMapping("toCheckout")
	public ModelAndView toCheckoutPage(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		long memberNum = 999;

		// create dummy Data

		ArrayList<ArrayList<CartDTO>> pizzaGroupList = new ArrayList<ArrayList<CartDTO>>();
		long cart_seq = 1;
		long cart_group_seq = 1;
		// get pizza group 1
		ArrayList<CartDTO> pizzaGroup1 = new ArrayList<CartDTO>();
		long[] pizzaGroupIdList1 = {1, 21};
		for(int i=0; i < pizzaGroupIdList1.length; i++) {
			ItemDTO dto = new ItemDTO();
			dto.setItem_id(pizzaGroupIdList1[i]);

			dto = detailService.getOne(dto);
			CartDTO cartDTO = new CartDTO();
			cartDTO.setItem_id(dto.getItem_id());
			cartDTO.setItem_name(dto.getItem_name());
			cartDTO.setItem_category(dto.getItem_category());
			cartDTO.setItem_price(dto.getItem_price());

			cartDTO.setCart_item_id(cart_seq++);
			cartDTO.setMember_num(memberNum);
			cartDTO.setCart_group_id(cart_group_seq);
			cartDTO.setCart_quantity(3);
			if(i == 0) {
				cartDTO.setItem_size("M");
			}
			if(i == 1) {
				cartDTO.setDough_short_name("도우 짧은이름1");
			}
			pizzaGroup1.add(cartDTO);
		}
		pizzaGroupList.add(pizzaGroup1);

		// get item list
		cart_group_seq++;
		ArrayList<CartDTO> itemList = new ArrayList<CartDTO>();
		long[] itemIdList = {67, 69, 75, 81, 84, 90};
		for(int i=0; i < itemIdList.length; i++) {
			ItemDTO dto = new ItemDTO();
			dto.setItem_id(itemIdList[i]);

			dto = detailService.getOne(dto);
			CartDTO cartDTO = new CartDTO();
			cartDTO.setItem_id(dto.getItem_id());
			cartDTO.setItem_name(dto.getItem_name());
			cartDTO.setItem_category(dto.getItem_category());
			cartDTO.setItem_price(dto.getItem_price());

			cartDTO.setCart_item_id(cart_seq++);
			cartDTO.setMember_num(memberNum);
			cartDTO.setCart_group_id(cart_group_seq++);
			cartDTO.setCart_quantity(2);
			itemList.add(cartDTO);
		}


		// get pizza group 2
		ArrayList<CartDTO> pizzaGroup2 = new ArrayList<CartDTO>();
		long[] pizzaGroupIdList2 = {8, 23, 28, 30};
		for(int i=0; i < pizzaGroupIdList2.length; i++) {
			ItemDTO dto = new ItemDTO();
			dto.setItem_id(pizzaGroupIdList2[i]);

			dto = detailService.getOne(dto);
			CartDTO cartDTO = new CartDTO();
			cartDTO.setItem_id(dto.getItem_id());
			cartDTO.setItem_name(dto.getItem_name());
			cartDTO.setItem_category(dto.getItem_category());
			cartDTO.setItem_price(dto.getItem_price());

			cartDTO.setCart_item_id(cart_seq++);
			cartDTO.setMember_num(memberNum);
			cartDTO.setCart_group_id(cart_group_seq);
			cartDTO.setCart_quantity(1);
			if(i == 0) {
				cartDTO.setItem_size("L");
			}
			if(i == 1) {
				cartDTO.setDough_short_name("도우 짧은이름2");
			}
			pizzaGroup2.add(cartDTO);
		}
		pizzaGroupList.add(pizzaGroup2);


		mv.addObject("pizzaGroupList", pizzaGroupList);
		mv.addObject("itemList", itemList);
		mv.setViewName("cart/cartTestTemp");

		return mv;
	}
}
