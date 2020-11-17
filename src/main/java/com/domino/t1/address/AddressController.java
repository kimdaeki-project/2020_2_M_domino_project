package com.domino.t1.address;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.branchInfo.BranchInfoDTO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.member.address.MemberAddressDTO;

@Controller
@RequestMapping("/address/**")
public class AddressController {
	
	@Autowired
	private AddressService addressService;
	
//	@PostMapping("delivery")
//	public ModelAndView setDelivery(MemberAddressDTO memberAddressDTO) throws Exception {
//		ModelAndView mv = new ModelAndView();
//		
//		mv.setViewName("address/delivery");
//		
//		return mv;
//	}
	
	@GetMapping("delivery")
	public ModelAndView getDelivery(MemberAddressDTO memberAddressDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
//		mv.addObject("order", "delivery");
		mv.setViewName("address/delivery");
		System.out.println("delivery");
		
		return mv;
	}
	
	@GetMapping("pickup")
	public ModelAndView pickup(BranchInfoDTO branchInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
//		mv.addObject("order", "pickup");
		mv.setViewName("address/pickup");
		System.out.println("pickup");
		
		return mv;
		
	}

}
