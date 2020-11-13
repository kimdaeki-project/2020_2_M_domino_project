package com.domino.t1.item.topping;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.domino.t1.MyTestCase;
import com.domino.t1.item.pizza.PizzaDTO;

public class ToppingDAOTest extends MyTestCase{

	@Autowired
	private ToppingDAO toppingDAO;
	
	@Test
	public void getAvailableToppingListSuccess() throws Exception {
		PizzaDTO dto = new PizzaDTO();
		dto.setPizza_id(3);
		List<ToppingDTO> result = toppingDAO.getAvailableToppingList(dto);
		System.out.println(result.size());
		assertNotEquals(0, result.size());
	}

	@Test
	public void getAvailableToppingListFail() throws Exception {
		PizzaDTO dto = new PizzaDTO();
		dto.setPizza_id(100);
		List<ToppingDTO> result = toppingDAO.getAvailableToppingList(dto);
		System.out.println(result.size());
		assertEquals(0, result.size());
	}
}
