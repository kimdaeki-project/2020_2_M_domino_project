package com.domino.t1.member;

import java.util.List;

import javax.jws.WebParam.Mode;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("Sample")
	public ModelAndView getJusoPopup() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("member/Sample");
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
		
		mv.addObject("dto", memberDTO);
		mv.setViewName("member/memberSearchView");
		
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
	
	@GetMapping("memberInquirlySelect")
	public ModelAndView getOne(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("member select");
		memberDTO = memberService.getOne(memberDTO);
		
		mv.addObject("dto", memberDTO);
		mv.setViewName("member/memberInquirlySelect");
		
		
		return mv;
	}
	
	@PostMapping("memberInquirly")
	public ModelAndView setInqBoardWrite(MemberDTO memberDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.setInqBoardWrite(memberDTO);
		String message="문의 작성을 실패하였습니다.";
		if(result>0) {
			message ="문의 작성을 완료하였습니다.";
		}
		
		mv.addObject("msg", message);
		mv.addObject("path", "./memberInquirly");
		
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@GetMapping("memberInquirly")
	public ModelAndView inqBoard(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("member/memberInquirly");
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		List<MemberDTO> ar = memberService.getInqBoardList(memberDTO);
		mv.addObject("list", ar);
		mv.setViewName("member/memberInquirly");
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
	public ModelAndView getMemberLogin(MemberDTO memberDTO, String remember, HttpServletResponse response ,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		if(remember != null) {
			Cookie cookie = new Cookie("remember", memberDTO.getMember_id());
			
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("remember", "");
			
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		memberDTO = memberService.getMemberLogin(memberDTO);
		
		if(memberDTO != null) {
			session.setAttribute("member", memberDTO);
			mv.setViewName("redirect:../");
		}else {
			mv.addObject("msg","로그인 실패");
			mv.addObject("path", "./memberLogin");
			mv.setViewName("common/result");
		}
		
		return mv;
	}
	
	
	@GetMapping("memberLogin")
	public ModelAndView getMemberLogin () throws Exception{
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
	public ModelAndView getMemberList(MemberDTO memberDTO) throws Exception{
		System.out.println("Member List");
		ModelAndView mv = new ModelAndView();
		
		List<MemberDTO> ar = memberService.getMemberList(memberDTO);
		
		mv.addObject("list", ar);
		mv.setViewName("member/memberList");
		
		return mv; 
	}

}
