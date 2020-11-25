package com.domino.t1.order;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.coupon.CouponDTO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.member.memberUser.MemberUserDTO;
import com.domino.t1.member.memberUser.MemberUserService;

@Controller
@RequestMapping(value = "/order/**")
public class OrderController {
	
	@Autowired
	private OrderService orderService; 

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
		
		
			
			mv.addObject("orderTime", orderTime);
			mv.addObject("address", addressDTO);
			mv.addObject("couponList", ar);
			mv.setViewName("order/orderInfo");	

			
			
			
		
		return mv;
		
	}
	
}