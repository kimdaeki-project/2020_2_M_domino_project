package com.domino.t1.member.memberUser;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.coupon.CouponDTO;
import com.domino.t1.member.MemberDAO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.member.memberInquirly.MemberInquirlyDTO;
import com.domino.t1.util.Pager;

@Repository
public class MemberUserDAO implements MemberDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.domino.t1.member.memberUser.MemberUserDAO.";
	
	@Override
	public MemberDTO getOneMember(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getOneMember", memberDTO);
	}
	
	@Override
	public MemberDTO getMemberSearch(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getMemberSearch", memberDTO);
	}
	@Override
	public int setMemberDelete(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setMemberDelete", memberDTO);
	}

	@Override
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setMemberUpdate", memberDTO);
	}
	@Override
	public MemberDTO getMemberCheck(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getMemberCheck", memberDTO);
	}
	@Override
	public MemberDTO getMemberEmailCheck(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getMemberEmailCheck", memberDTO);
	}
	@Override
	public MemberDTO getMemberPhoneCheck(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getMemberPhoneCheck", memberDTO);
	}
	@Override
	public MemberDTO getMemberIdCheck(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getMemberIdCheck", memberDTO);
	}
	@Override

	public Pager getMemberLogin(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getMemberLogin", pager);
	}
	public CouponDTO getMemberLogin(CouponDTO couponDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getMemberLogin", couponDTO);

	}
	@Override
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setMemberJoin", memberDTO);
	}
	
	@Override
	public List<MemberDTO> getMemberList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getMemberList", pager);
	}
	
	@Override
	public long getCount(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getCount", pager);
	}
	
	//추가
	public CouponDTO getMemberSocialLogin(CouponDTO couponDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMemberSocialLogin", couponDTO);
	}

	@Override
	public MemberDTO getMemberSearchPw(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getMemberSearchPw", memberDTO);
	}
	
	@Override
	public int setPassword(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete(NAMESPACE+"setPassword", memberDTO);
	}
	


}
