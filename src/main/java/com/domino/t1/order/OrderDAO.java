package com.domino.t1.order;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.member.MemberDTO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE= "com.domino.t1.order.OrderDAO.";
	
	
	public AddressDTO getOne(AddressDTO addressDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOne", addressDTO);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
