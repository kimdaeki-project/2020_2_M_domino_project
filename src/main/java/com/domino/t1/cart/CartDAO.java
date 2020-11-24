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
	// update quantity or size(for pizza)
	public int deleteCartItem(CartDTO cartDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"deleteCartItem", cartDTO);
	}
	
	public int deleteCartGroup(CartDTO cartDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"deleteCartGroup", cartDTO);
	}
	
	public int updateCartItem(CartDTO cartDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"updateCartItem", cartDTO);
	}

	public List<CartDTO> getCartPizzaGroupItemList(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getCartPizzaGroupItemList", memberDTO);
	}
	
	public List<CartDTO> getCartStandaloneItemList(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getCartStandaloneItemList", memberDTO);
	}
	
	public List<CartDTO> getCartList(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getCartList", memberDTO);
	}
	
	public CartDTO getCartItem(CartDTO cartDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getCartItem", cartDTO);
	}

	public int setCartItem(CartDTO cartDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setCartItem", cartDTO);
	}

	// get current maximum cart_group_id from given member's cart
	public long getMaxCartGroupId(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getMaxCartGroupId", memberDTO);
	}
	
}
