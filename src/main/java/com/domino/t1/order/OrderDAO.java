package com.domino.t1.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.coupon.CouponDTO;
import com.domino.t1.member.MemberDTO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE= "com.domino.t1.order.OrderDAO.";
	
	
	public AddressDTO getOne(AddressDTO addressDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOne", addressDTO);
	}
	
	public List<CouponDTO> getCoupon(CouponDTO couponDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getCoupon", couponDTO);
		
		
	}

	public long setOrderView(OrderDTO orderDTO) throws Exception {
		sqlSession.insert(NAMESPACE+"setOrderView", orderDTO);	
		return orderDTO.getOrder_view_num();
	}
	
	public List<OrderDTO> getUserOrderViewList(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getUserOrderViewList", memberDTO);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
