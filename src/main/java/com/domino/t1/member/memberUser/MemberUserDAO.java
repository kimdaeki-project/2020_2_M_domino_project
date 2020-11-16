package com.domino.t1.member.memberUser;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.domino.t1.member.MemberDAO;
import com.domino.t1.member.MemberDTO;
import com.domino.t1.util.Pager;

@Repository
public class MemberUserDAO implements MemberDAO{
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.domino.t1.member.MemberDAO.";
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
	public MemberDTO getOne(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getOne", memberDTO);
	}
	@Override
	public List<MemberDTO> getInqBoardList(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getInqBoardList", memberDTO);
	}
	@Override
	public int setInqBoardWrite(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setInqBoardWrite", memberDTO);
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
	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getMemberLogin", memberDTO);
	}
	@Override
	public int setMemberJoin(MemberDTO memberDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setMemberJoin", memberDTO);
	}
	@Override
	public List<MemberDTO> getMemberList(MemberDTO memberDTO, Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getMemberList", memberDTO, pager);
	}
	
	

}
