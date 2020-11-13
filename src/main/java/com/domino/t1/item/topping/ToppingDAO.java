package com.domino.t1.item.topping;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.domino.t1.item.pizza.PizzaDTO;

@Repository
public class ToppingDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.domino.t1.item.topping.ToppingDAO.";
	
	public List<ToppingDTO> getAvailableToppingList(PizzaDTO pizzaDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getAvailableToppingList", pizzaDTO);
	}
	
	public List<ToppingDTO> getAvailableMainToppingList(PizzaDTO pizzaDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getAvailableMainToppingList", pizzaDTO);
	}
	
	public List<ToppingDTO> getAvailableCheeseToppingList(PizzaDTO pizzaDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getAvailableCheeseToppingList", pizzaDTO);
	}
	
	public List<ToppingDTO> getAvailableAfterToppingList(PizzaDTO pizzaDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getAvailableAfterToppingList", pizzaDTO);
	}
}
