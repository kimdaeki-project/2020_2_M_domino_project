package com.domino.t1.cart;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.domino.t1.member.MemberDTO;

@Controller
@RequestMapping(value="/cart/**")
public class CartController {
	@Autowired
	private CartService cartService;
	
	@PostMapping("addToCart")
	public void setCartItems(HttpSession session, @RequestParam Map<String, List<String>> params) {
		MemberDTO sessionDTO = (MemberDTO) session.getAttribute("member");
		String member_id = sessionDTO.getMember_id();
		System.out.println(member_id);
		List<String> l1 = params.get("pizzaCart");
		System.out.println(l1);
		
	}
}
