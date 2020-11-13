package com.domino.t1.board.faq;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.domino.t1.board.BoardDTO;
import com.domino.t1.util.Pager;

@Repository
public class FaqDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.domino.t1.faq.FaqDAO.";
	
	public List<FaqDTO> getList(FaqDTO faqDTO) throws Exception{
		System.out.println("D"+ faqDTO.getFaq_type());
		return sqlSession.selectList(NAMESPACE+"getList", faqDTO);
	}
	
	public int setInsert(FaqDTO faqDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setInsert", faqDTO);
	}
}
