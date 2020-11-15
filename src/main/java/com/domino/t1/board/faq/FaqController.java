package com.domino.t1.board.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/faq/**")
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	@GetMapping("faqList")
	public ModelAndView getList(FaqDTO faqDTO) throws Exception{
		System.out.println("C"+faqDTO.getFaq_type());
		ModelAndView mv = new ModelAndView();
		List<FaqDTO> ar = faqService.getList(faqDTO);
		mv.addObject("list", ar);
		mv.setViewName("faq/faqList");
		
		return mv;
	}
	
	@GetMapping("faqWrite")
	public ModelAndView setInsert() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("faq/faqWrite");
		return mv;
	}
	
	@PostMapping("faqWrite")
	public ModelAndView setInsert(FaqDTO faqDTO) throws Exception{
	
		int result = faqService.setInsert(faqDTO);
		if(result>0) {
			System.out.println("write scucess");
		}
		
		ModelAndView mv = new ModelAndView();
		return mv;
		
	}

}