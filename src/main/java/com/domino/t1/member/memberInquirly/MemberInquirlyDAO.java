package com.domino.t1.member.memberInquirly;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.domino.t1.member.MemberDTO;

@Repository
public class MemberInquirlyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.domino.t1.member.memberInquirly.MemberInquirlyDAO.";
	
	public int setInqDelete(MemberInquirlyDTO memberInquirlyDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setInqDelete", memberInquirlyDTO);
	}

	public MemberInquirlyDTO getOne(MemberInquirlyDTO memberInquirlyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getOne", memberInquirlyDTO);
	}
	
	public List<MemberInquirlyDTO> getInqBoardList(MemberInquirlyDTO memberInquirlyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getInqBoardList", memberInquirlyDTO);
	}
	
	public int setInqBoardWrite(MemberInquirlyDTO memberInquirlyDTO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setInqBoardWrite", memberInquirlyDTO);
	}

}
