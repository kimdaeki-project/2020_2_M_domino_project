package com.domino.t1.member.memberInquirly;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.coupon.CouponDTO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.util.Pager;

@Repository
public class MemberInquirlyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.domino.t1.member.memberInquirly.MemberInquirlyDAO.";
	
	public int setInqListDelete(MemberInquirlyDTO memberInquirlyDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setInqListDelete", memberInquirlyDTO);
	}
	
	public int setInqUpdate(MemberInquirlyDTO memberInquirlyDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setInqUpdate", memberInquirlyDTO);
	}
	
	public List<MemberInquirlyDTO> getInqList(MemberInquirlyDTO memberInquirlyDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getInqList", memberInquirlyDTO);
	}
	
	public int setInqDelete(MemberInquirlyDTO memberInquirlyDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setInqDelete", memberInquirlyDTO);
	}

	public MemberInquirlyDTO getOne(MemberInquirlyDTO memberInquirlyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getOne", memberInquirlyDTO);
	}
	
	public List<CouponDTO> getInqBoardList(CouponDTO couponDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getInqBoardList", couponDTO);
	}
	
	public long getCount(CouponDTO couponDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getCount", couponDTO);
	}
	
	public int setInqBoardWrite(MemberInquirlyDTO memberInquirlyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setInqBoardWrite", memberInquirlyDTO);
	}

}
