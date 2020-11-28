package com.domino.t1.order.orderdetail;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.domino.t1.order.OrderDTO;

@Repository
public class OrderDetailDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.domino.t1.order.orderdetail.OrderDetailDAO.";
	
	public int setOrderDetail(OrderDetailDTO orderDetailDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setOrderDetail", orderDetailDTO);
	}
	
	public List<OrderDetailDTO> getOrderDetailList(OrderDTO orderDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getOrderDetailList", orderDTO);
	}
}
