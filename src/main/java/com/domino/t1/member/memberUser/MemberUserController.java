package com.domino.t1.member.memberUser;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.cart.CartDTO;
import com.domino.t1.cart.CartService;
import com.domino.t1.coupon.CouponDTO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.member.memberInquirly.MemberInquirlyDTO;
import com.domino.t1.order.OrderDTO;
import com.domino.t1.order.orderdetail.OrderDetailDTO;
import com.domino.t1.util.Pager;

@Controller
@RequestMapping("/member/**")
public class MemberUserController {
	
	@Autowired
	private MemberUserService memberService;
	@Autowired
	private CartService cartService;
	//추가
		@GetMapping("memberSocialIdCheck")
		public ModelAndView getMemberSocialIdCheck(CouponDTO couponDTO, HttpServletRequest request,HttpSession session) throws Exception{
		
			ModelAndView mv = new ModelAndView();
			couponDTO = memberService.getMemberSocialIdCheck(couponDTO);
			
			
			if(couponDTO != null) { //있으면 자동로그인
				couponDTO = memberService.getMemberSocialLogin(couponDTO);
				session.setAttribute("member", couponDTO);
				System.out.println(couponDTO.getMember_name());
				mv.setViewName("redirect:../");
			}
			
			else { //없으면 회원가입 창으로 이동 
				String id = request.getParameter("member_id");
				mv.addObject("id", id);
				mv.setViewName("member/memberJoin");
			}
			
			return mv;	
		}

		@GetMapping("memberOrder")
		public ModelAndView orderWrite(HttpSession session) throws Exception {
			ModelAndView mv = new ModelAndView();			
			
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			// user's entire list of OrderDTO(order_view records)
			List<OrderDTO> orderList = memberService.getUserOrderList(memberDTO);
			// user's entire list of-list of OrderDetailDTO
			List<List<OrderDetailDTO>> orderItemList = memberService.getUserOrderDetailList(orderList);			
						
			//———주문 상품 데이터 가져오기 end————			
			mv.addObject("orderList", orderList);
			mv.addObject("orderItemList", orderItemList);		
			mv.setViewName("member/memberOrder");	

			return mv;
			
		}
	

	@GetMapping("memberDeleteAdmin")
	public ModelAndView setMemberDeleteAdmin(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("Post Admin Delete");
		
		int result = memberService.setMemberDelete(memberDTO);
		
		mv.setViewName("redirect:./memberList");
		
		return mv;
	} 
	
	@PostMapping("memberUpdateAdmin") 
	public ModelAndView setMemberUpdateAdmin(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("Post Admin Update");
		
		int result = memberService.setMemberUpdate(memberDTO);
		
		mv.setViewName("redirect:./memberList");
		return mv;
	}
	
	@GetMapping("memberUpdateAdmin")
	public ModelAndView getOneMember(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("Admin Update");
		
		memberDTO = memberService.getOneMember(memberDTO);
		
		mv.addObject("dto", memberDTO);
		mv.setViewName("member/memberUpdateAdmin");
		
		return mv;
	}
	
	@PostMapping("setPassword")
	public ModelAndView setPassword(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = memberService.setPassword(memberDTO);
		
		mv.setViewName("redirect:./memberLogin");
		
		return mv;
	}
	
	@GetMapping("memberSearchViewPw")
	public ModelAndView getMemberSearchViewPw() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@PostMapping("memberSearchPw")
	public ModelAndView getMemberSearchPw(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("search pw post");
		
		memberDTO = memberService.getMemberSearchPw(memberDTO);
		String message = "입력한 정보가 틀립니다. 다시 확인해주세요.";
		if(memberDTO != null) {
			mv.addObject("dto", memberDTO);
			mv.setViewName("member/memberSearchViewPw");
		}else {
			mv.addObject("msg", message);
			mv.addObject("path", "./memberSearchPw");
			mv.setViewName("common/result");
		}
		
		
		
		return mv;
	}
	
	@GetMapping("memberSearchPw")
	public ModelAndView getMemberSearchPw(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("search pw");
		
		List<MemberDTO> ar = memberService.getMemberList(pager);
		
		mv.addObject("dto", ar);
		mv.setViewName("member/memberSearchPw");
		return mv;
	}

	@GetMapping("memberSearchView")
	public ModelAndView getMemberSearchView() throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("view");
		
		mv.setViewName("member/memberSearchView");
		return mv;
	}
	
	@PostMapping("memberSearch")
	public ModelAndView getMemberSearch(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.getMemberSearch(memberDTO);
		
		String message = "입력한 정보가 틀립니다. 다시 확인해주세요.";
		if(memberDTO != null) {
			mv.addObject("dto", memberDTO);
			mv.setViewName("member/memberSearchView");
			
		}else {
			mv.addObject("msg", message);
			mv.addObject("path", "./memberSearch");
			mv.setViewName("common/result");
		}
		
		
		return mv;
	}
	
	
	@GetMapping("memberSearch")
	public ModelAndView getMemberSearch() throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("Search");
		
		mv.setViewName("member/memberSearch");
		return mv;
		
	}
	
	@GetMapping("memberDelete")
	public ModelAndView setMemberDelete(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("Delete");
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		int result = memberService.setMemberDelete(memberDTO);
		
		session.invalidate();
		mv.setViewName("redirect:../");
		
		return mv;
		
	}
	
	
	@PostMapping("memberUpdate")
	public ModelAndView setMemberUpdate(MemberDTO memberDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO s = (MemberDTO)session.getAttribute("member");
		memberDTO.setMember_id(s.getMember_id());
		
		int result = memberService.setMemberUpdate(memberDTO);
		
		if(result>0) {
			s.setMember_name(memberDTO.getMember_name());
			s.setMember_email(memberDTO.getMember_email());
		}	
		
		mv.setViewName("redirect:./memberPage");
		
		return mv;
	}
	
	@GetMapping("memberUpdate")
	public ModelAndView setMemberUpdate() throws Exception{
		ModelAndView mv= new ModelAndView();
		System.out.println("Update");
		
		mv.setViewName("member/memberUpdate");
		return mv;
		
	}
	
	@PostMapping("memberCheck")
	public ModelAndView getMemberCheck(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		memberDTO = memberService.getMemberCheck(memberDTO);
		if(memberDTO != null) {
			mv.addObject("dto", memberDTO);
			mv.setViewName("redirect:./memberUpdate");
		}else {
			mv.addObject("msg","비밀번호를 다시 입력해주세요");
			mv.addObject("path", "./memberCheck");
			mv.setViewName("common/result");
		}
		
		
		return mv;
	}
	
	@GetMapping("memberCheck")
	public ModelAndView getMemberCheck() throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("memberCheck");
		
		
		mv.setViewName("member/memberCheck");
		return mv;
	}
	
	@GetMapping("memberEmailCheck")
	public ModelAndView getMemberEmailCheck(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.getMemberEmailCheck(memberDTO);
		
		int result=1;
		if(memberDTO == null) {
			result=0;
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@GetMapping("memberPhoneCheck")
	public ModelAndView getMemberPhoneCheck(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.getMemberPhoneCheck(memberDTO);
		
		int result=1;
		if(memberDTO == null) {
			result=0;
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@GetMapping("memberIdCheck")
	public ModelAndView getMemberIdCheck(MemberDTO memberDTO) throws Exception{
	
		ModelAndView mv = new ModelAndView();
		memberDTO = memberService.getMemberIdCheck(memberDTO);
		
		int result=1;
		if(memberDTO == null) {
			result=0;
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/ajaxResult");
		return mv;
		
	}
	
	@GetMapping("memberPage")
	public ModelAndView getMemberPage() throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("memberPage");
		
		return mv;
	}
	
	@GetMapping("memberLogout")
	public ModelAndView getMemberLogout(HttpSession session) throws Exception{
		System.out.println("memberLogout");
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.setViewName("redirect:../");
		
		return mv;
	}
	
	@PostMapping("memberLogin")



	public ModelAndView getMemberLogin(CouponDTO couponDTO, String remember, HttpServletResponse response ,HttpSession session) throws Exception{

		ModelAndView mv = new ModelAndView();
			
		if(remember != null) {
			Cookie cookie = new Cookie("remember", couponDTO.getMember_id());
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("remember", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		couponDTO = memberService.getMemberLogin(couponDTO);
		
		if(couponDTO != null) {
			session.setAttribute("member", couponDTO);

			mv.setViewName("redirect:../");
		}else {
			mv.addObject("msg","로그인 실패");
			mv.addObject("path", "./memberLogin");
			mv.setViewName("common/result");
		}
		return mv;
	}
	
	@GetMapping("memberLogin")
	public ModelAndView getMemberLogin() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberLogin");
		System.out.println("memberLogin");
		return mv;	
	}
		
	@PostMapping("memberJoin")
	public ModelAndView setMemberJoin(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.setMemberJoin(memberDTO);
		mv.setViewName("redirect:../");
		return mv;
	}
	
	@GetMapping("memberJoin")
	public ModelAndView setMemberJoin() throws Exception{
		System.out.println("Member Join");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberJoin");
		return mv;
	}
	
	@GetMapping("memberList")
	public ModelAndView getMemberList(Pager pager) throws Exception{
		System.out.println("Member List");
		ModelAndView mv = new ModelAndView();
		
		List<MemberDTO> ar = memberService.getMemberList(pager);
		mv.addObject("pager", pager);
		
		mv.addObject("list", ar);
		mv.setViewName("member/memberList");
		
		return mv; 
	}

}
