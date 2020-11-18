package com.domino.t1.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.domino.t1.member.MemberDTO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.domino.t1.cart.CartDAO.";
	
	public List<CartDTO> getCartList(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getCartList");
	}
	
	public int setCartItem(CartDTO cartDTO) {
		return sqlSession.insert(NAMESPACE+"setCartItem", cartDTO);
	}
	
	// insert a Cart record with given cart_group_id
	public int setCartItemWithCartGroupId(CartDTO cartDTO) {
		return sqlSession.insert(NAMESPACE+"setCartItemWithCartGroupId", cartDTO);
	}
	
	// get current maximum cart_group_id from given member's cart
	public long getMaxCartGroupId(MemberDTO memberDTO) {
		return sqlSession.selectOne(NAMESPACE+"getMaxCartGroupId", memberDTO);
	}	
}
