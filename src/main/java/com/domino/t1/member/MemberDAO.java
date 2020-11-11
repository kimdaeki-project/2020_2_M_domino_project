package com.domino.t1.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.domino.t1.member.MemberDAO.";
	
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setMemberUpdate", memberDTO);
	}
	
	public MemberDTO getMemberCheck(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMemberCheck", memberDTO);
	}
	
	public MemberDTO getMemberEmailCheck(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMemberEmailCheck", memberDTO);
	}
	
	public MemberDTO getMemberPhoneCheck(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMemberPhoneCheck", memberDTO);
	}
	
	public MemberDTO getMemberIdCheck(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMemberIdCheck", memberDTO);
	}
	
	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMemberLogin", memberDTO);
	}
	
	public int setMemberJoin(MemberDTO memberDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setMemberJoin", memberDTO);
	}
	
	public List<MemberDTO> getMemberList(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getMemberList", memberDTO);
	}

}
