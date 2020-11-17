package com.domino.t1.order;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.domino.t1.order.OrderDAO.";
	
	
	public Long getNum()throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getNum");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
