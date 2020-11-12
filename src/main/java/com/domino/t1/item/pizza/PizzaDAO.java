package com.domino.t1.item.pizza;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PizzaDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.domino.t1.item.pizza.PizzaDAO.";
	
	public PizzaDTO getOne(PizzaDTO pizzaDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getOne", pizzaDTO);
	}
	
	// gets pizza type from pizzaDTO, returns list of PizzaDTOs of that type
	public List<PizzaDTO> getPizzaListByType(PizzaDTO pizzaDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getPizzaListByType", pizzaDTO);
	}
}
