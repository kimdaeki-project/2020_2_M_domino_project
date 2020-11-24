package com.domino.t1.menu.list;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.item.ItemDAO;
import com.domino.t1.item.ItemDTO;
import com.domino.t1.item.pizza.PizzaDAO;
import com.domino.t1.item.pizza.PizzaDTO;

@Service
public class ListService {
	
	@Autowired
	private PizzaDAO pizzaDAO;
	
	@Autowired
	private ItemDAO itemDAO;
	
	public List<PizzaDTO> getPizzaListByType(PizzaDTO pizzaDTO) throws Exception {
		return pizzaDAO.getPizzaListByType(pizzaDTO);
	}
	
	public List<ItemDTO> getItemListByCategory(ItemDTO itemDTO) throws Exception {
		return itemDAO.getItemListByCategory(itemDTO);
	}
	
}
