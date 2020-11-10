package com.domino.t1.menu.list;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/menu/list/**")
public class ListController {
	
	@Autowired
	private ListService listService;
	
	@GetMapping("pizza")
	public ModelAndView getPizzaList() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("menu/list");
		return mv;
	}
	
	@GetMapping("sideMenu")
	public ModelAndView getSideMenuList() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("menu/list");
		return mv;
	}
	
}
