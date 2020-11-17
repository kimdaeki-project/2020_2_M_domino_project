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
		mv.addObject("pizzaDTO", pizzaDTO);
		
		List<DoughDTO> availableDoughList = detailService.getAvailableDoughList(pizzaDTO);			
		mv.addObject("doughList", availableDoughList);
		
		Map<String, List<ToppingDTO>> toppingMap = detailService.getAvailableToppingMap(pizzaDTO);
		mv.addAllObjects(toppingMap);
		
		ItemDTO itemDTO = new ItemDTO();
		itemDTO.setItem_category("sidedish");
		List<ItemDTO> sideDishList = detailService.getItemListByCategory(itemDTO);
		mv.addObject("sideDishList", sideDishList);
		
		itemDTO.setItem_category("etc");
		List<ItemDTO> etcList = detailService.getItemListByCategory(itemDTO);
		mv.addObject("etcList", etcList);
		
		mv.addObject("category", "pizza");
		mv.setViewName("menu/detail/pizzaDetail");
		return mv;
	}
	
	@GetMapping("sideDishDetail")
	public ModelAndView getSideDishDetail(ItemDTO itemDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
//	@PostMapping("toCart")
//	public void setCartItem() throws Exception {
//		
//	}
}
