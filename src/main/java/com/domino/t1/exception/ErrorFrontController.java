package com.domino.t1.exception;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/error/**")
public class ErrorFrontController {
	
	@GetMapping("error404")
	public ModelAndView error404() throws Exception{
		System.out.println("error404");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error/error_front");
		return mv;
				
	}
	
	@GetMapping("error400")
	public ModelAndView error400() throws Exception{
		System.out.println("error400");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error/error_front");
		return mv;			
	}
	
	@GetMapping("error405")
	public ModelAndView error405() throws Exception{
		System.out.println("error405");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("error/error_front");
		return mv;
				
	}
	

}
