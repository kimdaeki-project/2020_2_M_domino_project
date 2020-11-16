package com.domino.t1.address;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@GetMapping("delivery")
	public ModelAndView delivery(MemberAddressDTO memberAddressDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("address/delivery");
		
		return mv;
	}
	
	@GetMapping("pickup")
	public ModelAndView pickup(BranchInfoDTO branchInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("address/pickup");
		
		return mv;
		
	}

}
