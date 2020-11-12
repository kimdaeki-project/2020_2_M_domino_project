package com.domino.t1.item.dough;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.domino.t1.item.pizza.PizzaDTO;

@Repository
public class DoughDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.domino.t1.item.dough.DoughDAO.";
	
	public List<DoughDTO> getAvailableDoughList(PizzaDTO pizzaDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getAvailableDoughList", pizzaDTO);
	}	
	
}
