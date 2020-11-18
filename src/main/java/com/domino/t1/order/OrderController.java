package com.domino.t1.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.member.memberUser.MemberUserService;

@Controller
@RequestMapping(value = "/order/**")
public class OrderController {
	
	private MemberUserService memberUserService;
	

	@GetMapping("orderInfo")
	public ModelAndView orderWrite() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("order/orderInfo");
		
		return mv;
		
	}
	
}