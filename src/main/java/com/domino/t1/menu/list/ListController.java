package com.domino.t1.menu.list;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.item.pizza.PizzaDTO;

@Controller
@RequestMapping("/menu/list/**")
public class ListController {
	
	@Autowired
	private ListService listService;
	
	@GetMapping("pizzaList")
	public ModelAndView getPizzaList() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		// get premium type PizzaDTO list
		PizzaDTO dto= new PizzaDTO();
		dto.setPizza_type("프리미엄");
		List<PizzaDTO> arr = listService.getPizzaListByType(dto);
		mv.addObject("premium", arr);
		// get classic type PizzaDTO list
		
		mv.addObject("category", "pizza");
		mv.setViewName("menu/list/pizzaList");
		return mv;
	}
	
	@GetMapping("sideDishList")
	public ModelAndView getSideDishList() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("menu", "sideDish");
		mv.setViewName("menu/list/sideDishList");
		return mv;
	};
	
	@GetMapping("etcList")
	public ModelAndView getEtcList() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("menu", "etc");
		mv.setViewName("menu/list/sideDishList");
		return mv;
	}
	
}
