package com.domino.t1.menu.detail;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.item.ItemDTO;
import com.domino.t1.item.dough.DoughDTO;
import com.domino.t1.item.pizza.PizzaDTO;
import com.domino.t1.item.topping.ToppingDTO;

@Controller
@RequestMapping("/menu/detail/**")
public class DetailController {
	
	@Autowired
	private DetailService detailService;
	
	@GetMapping("pizzaDetail")
	public ModelAndView getPizzaDetail(PizzaDTO pizzaDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		pizzaDTO = detailService.getOne(pizzaDTO);		
		List<DoughDTO> availableDoughList = detailService.getAvailableDoughList(pizzaDTO);			
		mv.addObject("pizzaDTO", pizzaDTO);
		
		Map<String, List<ToppingDTO>> toppingMap = detailService.getAvailableToppingMap(pizzaDTO);
		mv.addAllObjects(toppingMap);
		
		mv.addObject("doughList", availableDoughList);
		mv.setViewName("menu/detail/pizzaDetail");
		return mv;
	}
	
	@GetMapping("sideDishDetail")
	public ModelAndView getSideDishDetail(ItemDTO itemDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@PostMapping("toCart")
	public void setCartItem() throws Exception {
		
	}
}
