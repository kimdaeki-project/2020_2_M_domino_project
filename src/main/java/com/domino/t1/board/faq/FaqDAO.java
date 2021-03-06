package com.domino.t1.board.faq;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class FaqDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.domino.t1.faq.FaqDAO.";
	
	public List<FaqDTO> getList(FaqDTO faqDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", faqDTO);
	}
	
	public int setInsert(FaqDTO faqDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setInsert", faqDTO);
	}
	
	public int setDelete(FaqDTO faqDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", faqDTO);
	}
}
