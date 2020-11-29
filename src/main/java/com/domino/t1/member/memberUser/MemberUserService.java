package com.domino.t1.member.memberUser;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.domino.t1.address.AddressDAO;
import com.domino.t1.address.AddressDTO;
import com.domino.t1.coupon.CouponDTO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.member.MemberService;
import com.domino.t1.member.memberInquirly.MemberInquirlyDTO;
import com.domino.t1.order.OrderDAO;
import com.domino.t1.order.OrderDTO;
import com.domino.t1.order.orderdetail.OrderDetailDAO;
import com.domino.t1.order.orderdetail.OrderDetailDTO;
import com.domino.t1.util.Pager;

@Service
public class MemberUserService implements MemberService{
		
	@Autowired
	private MemberUserDAO memberDAO;
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private OrderDetailDAO orderDetailDAO;
	
	@Override
	public MemberDTO getOneMember(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getOneMember(memberDTO);
	}

	@Override
	public MemberDTO getMemberSearch(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberSearch(memberDTO);
	}

	@Override
	public int setMemberDelete(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.setMemberDelete(memberDTO);
	}

	@Override
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.setMemberUpdate(memberDTO);
	}

	@Override
	public MemberDTO getMemberCheck(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberCheck(memberDTO);
	}

	@Override
	public MemberDTO getMemberEmailCheck(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberEmailCheck(memberDTO);
	}

	@Override
	public MemberDTO getMemberPhoneCheck(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberPhoneCheck(memberDTO);
	}

	@Override
	public MemberDTO getMemberIdCheck(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberIdCheck(memberDTO);
	}

	@Override

	public Pager getMemberLogin(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberLogin(pager);
	}
	
	public CouponDTO getMemberLogin(CouponDTO couponDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberLogin(couponDTO);

	}
	
	

	@Override
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.setMemberJoin(memberDTO);
	}

	@Override
	public List<MemberDTO> getMemberList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.makeRow();
		pager.setTotalCount(memberDAO.getCount(pager));
		pager.makePage();
		return memberDAO.getMemberList(pager);
	}	
	
	@Override
	public long getCount(Pager pager) throws Exception {
	
		return memberDAO.getCount(pager);
	}
	
	@Override
	public MemberDTO getMemberSearchPw(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.getMemberSearchPw(memberDTO);
	}
	
	@Override
	public int setPassword(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.setPassword(memberDTO);
	}
	
	//추가
		public CouponDTO getMemberSocialIdCheck(CouponDTO couponDTO) throws Exception{
			return memberDAO.getMemberSocialIdCheck(couponDTO);
		}

		public CouponDTO getMemberSocialLogin(CouponDTO couponDTO) throws Exception{
			return memberDAO.getMemberSocialLogin(couponDTO);
		}
		
	// get list of User's entire list of OrderDTO(order_view records)
	public List<OrderDTO> getUserOrderList(MemberDTO memberDTO) throws Exception {
		return orderDAO.getUserOrderViewList(memberDTO);
	}
	
	// get list of- list of OrderDetailDTO 
	public List<List<OrderDetailDTO>> getUserOrderDetailList(List<OrderDTO> orderList) throws Exception{
		List<List<OrderDetailDTO>> orderItemList = new ArrayList<List<OrderDetailDTO>>();
		// get List<OrderDetailDTO> with each OrderDTO's order_view_num
		for(OrderDTO orderDTO: orderList) {
			orderItemList.add(orderDetailDAO.getOrderDetailList(orderDTO));
		}
		return orderItemList;
	}
}
