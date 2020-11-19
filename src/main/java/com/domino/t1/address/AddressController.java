package com.domino.t1.address;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.branchInfo.BranchInfoDTO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.member.address.MemberAddressDTO;
import com.domino.t1.member.memberInquirly.MemberInquirlyDTO;

@Controller
@RequestMapping("/address/**")
public class AddressController {
	
	@Autowired
	private AddressService addressService;
	
	@PostMapping("jusoPopup")
	public ModelAndView getJusoPopup2() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("address/jusoPopup");
		return mv;
	}
	
	@GetMapping("jusoPopup")
	public ModelAndView getJusoPopup() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("address/jusoPopup");
		return mv;
	}
	
	@GetMapping("deliveryAfter")
	public ModelAndView deliveryAfrer(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("DA");
		
		AddressDTO addressDTO = (AddressDTO)session.getAttribute("member");
		
		List<AddressDTO> ar = addressService.getMemberAddress(addressDTO);
	
		mv.addObject("list", ar);
		mv.setViewName("address/deliveryAfter");
		
		return mv;
		
	}
	
	@PostMapping("delivery")
	public ModelAndView delivery(AddressDTO addressDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("delivery 2");
		int result = addressService.setMemberAddress(addressDTO);
		
		
		mv.setViewName("address/deliveryAfter");
		
		return mv;
	}
	
	@GetMapping("delivery")
	public ModelAndView delivery() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("address/delivery");
		System.out.println("delivery");
		
		return mv;
	}
	
	@GetMapping("pickupAfter")
	public ModelAndView pickupAfter() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("pickupAfter");
		mv.setViewName("address/pickupAfter");
		
		return mv;
	}
	
	@PostMapping("pickupAfter")
	public ModelAndView pickupAfter(BranchInfoDTO branchInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("pickup after");
		int result = addressService.setBranchInfo(branchInfoDTO);
		
		mv.setViewName("address/pickupAfter");
		
		return mv;
	}
	
	@GetMapping("pickup")
	public ModelAndView pickup() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("address/pickup");
		System.out.println("pickup");
		
		return mv;
		
	}

}
