package com.domino.t1.address;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.branchInfo.BranchInfoDTO;
import com.domino.t1.branchInfo.BranchInfoService;
import com.domino.t1.coupon.CouponDTO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.member.address.MemberAddressDTO;
import com.domino.t1.member.memberInquirly.MemberInquirlyDTO;
import com.domino.t1.util.Pager;

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
	
	@GetMapping("addressDelete")
	public ModelAndView setAddressDelete(AddressDTO addressDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("Address Delete");
		int result = addressService.setAddressDelete(addressDTO);
		
		
		mv.setViewName("redirect:./deliveryAfter");
		return mv;
	} 
	
	@GetMapping("deliveryAfter")
	public ModelAndView getMemberAddress(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("DA");
		
		CouponDTO couponDTO = (CouponDTO)session.getAttribute("member");
				
		List<CouponDTO> ar = addressService.getMemberAddress(couponDTO);
	
		mv.addObject("list", ar);
		mv.setViewName("address/deliveryAfter");
		
		return mv;
		
	}
	
	@PostMapping("delivery")
	public ModelAndView delivery(AddressDTO addressDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("delivery 2");
		int result = addressService.setMemberAddress(addressDTO);
		
		String message = "배달 주소를 입력해주세요.";
		System.out.println("Result : "+result);
		
			mv.setViewName("redirect:./deliveryAfter");
		
			
		
		return mv;
	}
	
	@GetMapping("delivery")
	public ModelAndView delivery() throws Exception {
		ModelAndView mv = new ModelAndView();
		
//		mv.addObject("order", "delivery");
		mv.setViewName("address/delivery");
		System.out.println("delivery");
		
		return mv;
	}
	
	@GetMapping("pickupAfter")
	public ModelAndView pickupAfter(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
//		BranchInfoDTO branchInfoDTO = (BranchInfoDTO)session.getAttribute();
		
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
	public ModelAndView getRegion1(BranchInfoDTO branchInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<BranchInfoDTO> region1 = addressService.getRegion1(branchInfoDTO);
		
		mv.addObject("region1", region1);
		mv.setViewName("address/pickup");
		
		return mv;
	}
	
	@GetMapping("pickupBrList")
	public ModelAndView pickupBrList(BranchInfoDTO branchInfoDTO, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		String reg1 = request.getParameter("reg1");
		String reg2 = request.getParameter("reg2");
		
		branchInfoDTO.setRegion1(reg1);
		branchInfoDTO.setRegion2(reg2);
		
		List<BranchInfoDTO> ar = addressService.pickupBrList(branchInfoDTO);
		
		mv.addObject("branch", ar);
		mv.setViewName("address/pickupBrList");
		
		return mv;
		
	}
	
	@GetMapping("pickupMap")
	public ModelAndView pickupMap(BranchInfoDTO branchInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("address/pickupMap");
		
		return mv;
	}
	
	@GetMapping("pickupSelectMap")
	public ModelAndView getPickupSelectMap(BranchInfoDTO branchInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("address/pickupSelectMap");
		return mv;
	}
	
	@PostMapping("pickupSearchResult")
	public ModelAndView pickupSearchResult(BranchInfoDTO branchInfoDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("address/pickupSearchResult");
		return mv;
	}
	

}
