package com.domino.t1.order;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.member.memberUser.MemberUserDTO;
import com.domino.t1.member.memberUser.MemberUserService;

@Controller
@RequestMapping(value = "/order/**")
public class OrderController {
	
	@Autowired
	private OrderService orderService; 

	@GetMapping("orderInfo")
	public ModelAndView orderWrite(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		AddressDTO addressDTO = (AddressDTO)session.getAttribute("member");
		
		
		addressDTO = orderService.getOne(addressDTO);			
			mv.addObject("address", addressDTO);
			mv.setViewName("order/orderInfo");	

		
		return mv;
		
	}
	
}