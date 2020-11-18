package com.domino.t1.address;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddressDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.domino.t1.address.AddressDAO.";
	
	public List<AddressDTO> getMemberAddress(AddressDTO addressDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getMemberAddress", addressDTO);
	}
	
	public int setMemberAddress(AddressDTO addressDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setMemberAddress", addressDTO);
		
	}

}
