package com.domino.t1.menu.detail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.item.ItemDAO;
import com.domino.t1.item.ItemDTO;
import com.domino.t1.item.dough.DoughDAO;
import com.domino.t1.item.dough.DoughDTO;
import com.domino.t1.item.pizza.PizzaDAO;
import com.domino.t1.item.pizza.PizzaDTO;
import com.domino.t1.item.topping.ToppingDAO;
import com.domino.t1.item.topping.ToppingDTO;

@Service
public class DetailService {
	
	@Autowired
	private PizzaDAO pizzaDAO;
	
	@Autowired
	private DoughDAO doughDAO;
	
	@Autowired
	private ToppingDAO toppingDAO;
	
	@Autowired
	private ItemDAO itemDAO;
	
	public PizzaDTO getOne(PizzaDTO pizzaDTO) throws Exception {
		return pizzaDAO.getOne(pizzaDTO);				
	}
	
	public ItemDTO getOne(ItemDTO itemDTO) throws Exception {
		return itemDAO.getOne(itemDTO);				
	}
	
	public List<DoughDTO> getAvailableDoughList(PizzaDTO pizzaDTO) throws Exception {
		return doughDAO.getAvailableDoughList(pizzaDTO);
		
	}
	
	public Map<String, List<ToppingDTO>> getAvailableToppingMap(PizzaDTO pizzaDTO) throws Exception {
		Map<String, List<ToppingDTO>> map = new HashMap<String, List<ToppingDTO>>();
		map.put("main", toppingDAO.getAvailableMainToppingList(pizzaDTO));
		map.put("cheese", toppingDAO.getAvailableCheeseToppingList(pizzaDTO));
		map.put("after", toppingDAO.getAvailableAfterToppingList(pizzaDTO));
		return map;
	}
	
	public List<ItemDTO> getItemListByCategory(ItemDTO itemDTO) throws Exception {
		return itemDAO.getItemListByCategory(itemDTO);
	}
	
}
