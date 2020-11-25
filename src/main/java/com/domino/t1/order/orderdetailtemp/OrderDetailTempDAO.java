package com.domino.t1.order.orderdetailtemp;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.domino.t1.member.MemberDTO;

@Repository
public class OrderDetailTempDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.domino.t1.order.orderdetailtemp.OrderDetailTempDAO.";
	
	public int setOrderDetailTemp(OrderDetailTempDTO orderDetailTempDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setOrderDetailTemp", orderDetailTempDTO);
	}
	
	public int emptyOrderDetailTemp(MemberDTO memberDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"emptyOrderDetailTemp", memberDTO);
	}
	
	public List<OrderDetailTempDTO> getOrderDetailTempList(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getOrderDetailTempList", memberDTO);
	}
	
}
