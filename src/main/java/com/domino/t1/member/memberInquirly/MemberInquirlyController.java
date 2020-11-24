package com.domino.t1.member.memberInquirly;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.util.Pager;

@Controller
@RequestMapping("/memberInq/**")
public class MemberInquirlyController {
	
	@Autowired
	private MemberInquirlyService memberInquirlyService;
	
	@GetMapping("memberInquirlyListDelete")
	public ModelAndView setInqListDelete(MemberInquirlyDTO memberInquirlyDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("inq list del");
		
		int result = memberInquirlyService.setInqListDelete(memberInquirlyDTO);
		
		mv.setViewName("redirect:./memberInquirlyList");
		
		
		return mv;
	}
	
	@PostMapping("memberInquirlyUpdate")
	public ModelAndView setInqUpdate(MemberInquirlyDTO memberInquirlyDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = memberInquirlyService.setInqUpdate(memberInquirlyDTO);
		
		mv.setViewName("redirect:./memberInquirlyList");
		return mv;
	} 
	
	@GetMapping("memberInquirlyUpdate")
	public ModelAndView setInqSelect(MemberInquirlyDTO memberInquirlyDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("Inq Update");
		
		memberInquirlyDTO = memberInquirlyService.getOne(memberInquirlyDTO);
		mv.addObject("dto", memberInquirlyDTO);
		mv.setViewName("memberInq/memberInquirlyUpdate");
		
		return mv;
	}
	
	@GetMapping("memberInquirlyList")
	public ModelAndView getInqList(MemberInquirlyDTO memberInquirlyDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("Inq List");
		
		List<MemberInquirlyDTO> ar = memberInquirlyService.getInqList(memberInquirlyDTO);
		
		mv.addObject("list", ar);
		mv.setViewName("memberInq/memberInquirlyList");
		
		return mv;
	}
	
	@GetMapping("memberInquirlyDelete")
	public ModelAndView setInqDelete(MemberInquirlyDTO memberInquirlyDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("Delete");
		int result = memberInquirlyService.setInqDelete(memberInquirlyDTO);
		
		String message = "문의 삭제를 실패하였습니다.";
		if(result > 0) {
			message = "문의 삭제를 완료하였습니다.";
			
		}
			mv.addObject("msg", message);
			mv.addObject("path", "./memberInquirly");
			mv.setViewName("common/result");
			
		return mv;
	}
	
	@GetMapping("memberInquirlySelect")
	public ModelAndView getOne(MemberInquirlyDTO memberInquirlyDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("member select");
		memberInquirlyDTO = memberInquirlyService.getOne(memberInquirlyDTO);
		
		
		mv.addObject("dto", memberInquirlyDTO);
		mv.setViewName("memberInq/memberInquirlySelect");
		
		
		return mv;
	}
	
	@PostMapping("memberInquirly")
	public ModelAndView setInqBoardWrite(MemberInquirlyDTO memberInquirlyDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = memberInquirlyService.setInqBoardWrite(memberInquirlyDTO);
		
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
	public ModelAndView inqBoardList(HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("member/memberInquirly");
		
		Pager pager = (Pager) session.getAttribute("member");
				
		List<Pager> ar = memberInquirlyService.getInqBoardList(pager);
		
		mv.addObject("pager", pager);
		
		mv.addObject("list", ar);
		mv.setViewName("memberInq/memberInquirly");
		return mv;
	}

}
