package com.domino.t1.address;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.branchInfo.BranchInfoDTO;
import com.domino.t1.member.MemberDTO;

@Controller
@RequestMapping("/address/**")
public class AddressController {
	
	@GetMapping("delivery")
	public ModelAndView delivery(MemberDTO memberDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("address/delivery");
		
		return mv;
	}
	
	public ModelAndView pickup(BranchInfoDTO branchInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("address/pickup");
		
		return mv;
		
	}

}
