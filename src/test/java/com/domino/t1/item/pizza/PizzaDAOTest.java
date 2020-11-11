package com.domino.t1.item.pizza;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.domino.t1.MyTestCase;

public class PizzaDAOTest extends MyTestCase{

	@Autowired
	private PizzaDAO pizzaDAO;
	
	@Test
	public void getOneTestSuccess() throws Exception {
		PizzaDTO dto = new PizzaDTO();
		dto.setPizza_id(1);
		dto = pizzaDAO.getOne(dto);
		assertNotNull(dto);
	}
	
	@Test
	public void getOneTestFail() throws Exception {
		PizzaDTO dto = new PizzaDTO();
		dto.setPizza_id(10);
		dto = pizzaDAO.getOne(dto);
		assertNull(dto);
	}
	
	@Test
	public void getPizzaListByType() throws Exception {
		PizzaDTO dto = new PizzaDTO();
		dto.setPizza_type("프리미엄");
		List<PizzaDTO> arr = pizzaDAO.getPizzaListByType(dto);
		System.out.println(arr.size());
		assertEquals(5, arr.size());
	}

}
