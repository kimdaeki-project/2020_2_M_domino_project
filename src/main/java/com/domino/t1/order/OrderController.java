package com.domino.t1.order;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.MoveAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.cart.CartDTO;
import com.domino.t1.cart.CartService;
import com.domino.t1.coupon.CouponDTO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.member.memberUser.MemberUserDTO;
import com.domino.t1.member.memberUser.MemberUserService;

@Controller
@RequestMapping(value = "/order/**")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private CartService cartService;

	@GetMapping("orderInfo")
	public ModelAndView orderWrite(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		//-----시간구하기----------
		String orderTime = null;				
		
		SimpleDateFormat sdformat = new SimpleDateFormat("HH시mm분");
		
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.MINUTE, 30);
		orderTime = sdformat.format(cal.getTime());
		//----시간구하기 end-----------
		

		
		//------주소 가져오기-------------
		AddressDTO addressDTO = (AddressDTO)session.getAttribute("member");
		
		addressDTO = orderService.getOne(addressDTO);
		
		//------주소 가져오기 end---------
		
		//------쿠폰 가져오기-------------		
		CouponDTO couponDTO =(CouponDTO)session.getAttribute("member");
		
		List<CouponDTO> ar = orderService.getCoupon(couponDTO);
		
		//------쿠폰 가져오기 end-------------	
		
		//———주문 상품 데이터 가져오기————
			CartDTO cartDTO = new CartDTO();
		
		
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			List<String[]> gIdList = cartService.getOrderDetailTempLists(memberDTO);
			List<List<CartDTO>> pizzaGroupList = cartService.getTempPizzaGroupItemList(gIdList.get(0), memberDTO);
			List<CartDTO> itemList = cartService.getTempStandaloneItemList(gIdList.get(1), memberDTO);
				
					
		//———주문 상품 데이터 가져오기 end————
		

			

		
			mv.addObject("pizzaGroupList", pizzaGroupList);
			mv.addObject("itemList", itemList);		

			mv.addObject("orderTime", orderTime);
			mv.addObject("address", addressDTO);
			mv.addObject("couponList", ar);
			mv.setViewName("order/orderInfo");	

		return mv;
		
	}
	
	@GetMapping("orderPay")
	public ModelAndView orderPay(HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		//------주소 가져오기-------------
		AddressDTO addressDTO = (AddressDTO)session.getAttribute("member");
		
		addressDTO = orderService.getOne(addressDTO);
		//------주소 가져오기 end---------
		
		//주문번호 가져오기---------------
		OrderDTO orderDTO = new OrderDTO();
		
		String number = orderDTO.getOrder_num();
		System.out.println(number);
		//--------------------------------------------
		
		mv.addObject("orderNum", number);
		mv.addObject("address", addressDTO);
		mv.setViewName("order/orderPay");
		
		return mv;
		
	}
	
	
	
	
}