package com.domino.t1.cart;

import java.util.ArrayList;
import java.util.Arrays;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.member.MemberDTO;

@Controller
@RequestMapping(value="/cart/**")
public class CartController {
	
	@Autowired
	private CartService cartService;

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
		int result2 = cartService.setPizzaGroupCart(itemGroupCart, memberDTO);
		
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
		int result = cartService.setPizzaGroupCart(itemGroupCart, memberDTO);
		
		// 나중에 꼭 트랜잭션 처리 해주기!!!! 

		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getCartDetailPage(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO sessionDTO = (MemberDTO) session.getAttribute("member");
		String memberId = sessionDTO.getMember_id();
		// get CartDTO list of the user
		
		mv.setViewName("cart/detail");
		return mv;
	}
	
	public ArrayList<String[]> toArrayList(String[] arr, int size){
		ArrayList<String[]> list = new ArrayList<String[]>();
		int totalItem = arr.length/size;
		for(int i=0; i<totalItem; i++) {
			list.add(Arrays.copyOfRange(arr, i*size, (i+1)*size));
		}
		return list;
	}
}
