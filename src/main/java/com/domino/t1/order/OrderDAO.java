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
		long order_view_num = sqlSession.insert(NAMESPACE+"setOrderView", orderDTO);	
		return order_view_num;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
