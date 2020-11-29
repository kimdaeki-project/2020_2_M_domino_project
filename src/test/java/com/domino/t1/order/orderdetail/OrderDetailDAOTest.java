package com.domino.t1.order.orderdetail;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.domino.t1.MyTestCase;
import com.domino.t1.order.OrderDAO;
import com.domino.t1.order.OrderDTO;
import com.domino.t1.order.OrderService;

public class OrderDetailDAOTest extends MyTestCase{
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private OrderDetailDAO orderDetailDAO;	

	//@Test
	public void createOVTest() throws Exception {
		String s = "str";
		long l = 99900;
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setOrder_view_num(1);
		orderDTO.setMember_num(1);
		orderDTO.setOrder_adress(s);
		orderDTO.setOrder_shop(s);
		orderDTO.setOrder_name(s);
		orderDTO.setOrder_phone(s);
		orderDTO.setOrder_total(l);
		orderDTO.setOrder_sale(l);
		orderDTO.setOrder_payment(l);
		orderDTO.setOrder_method("wallet");
		long result = orderDAO.setOrderView(orderDTO);
		assertNotEquals(0, result);
	}
	
	@Test
	public void setOrderDetailTest() throws Exception {
		//orderService.setTest();
	}
	
	@Test
	public void getOrderDetailItemTest() throws Exception {
		long order_view_num = 17;
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setOrder_view_num(order_view_num);
		List<OrderDetailDTO> ordered = orderDetailDAO.getOrderDetailList(orderDTO);
		System.out.println("entered test");
		for(OrderDetailDTO dto: ordered) {
			System.out.println(dto.getOrder_detail_name());
		}
	}

}
