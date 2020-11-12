package com.domino.t1.item.dough;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.domino.t1.MyTestCase;
import com.domino.t1.item.pizza.PizzaDTO;

public class DoughDAOTest extends MyTestCase{

	@Autowired
	private DoughDAO doughDAO;
	
	@Test
	public void getAvailableDoughListSuccess() throws Exception {
		PizzaDTO dto = new PizzaDTO();
		dto.setPizza_id(5);
		List<DoughDTO> result = doughDAO.getAvailableDoughList(dto);
		assertEquals(6, result.size());
	}
	
	@Test
	public void getAvailableDoughListFail() throws Exception {
		PizzaDTO dto = new PizzaDTO();
		dto.setPizza_id(100);
		List<DoughDTO> result = doughDAO.getAvailableDoughList(dto);
		assertEquals(0, result.size());
	}

}
