package com.domino.t1.board.qna;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.domino.t1.board.file.BoardFileDTO;

@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="com.domino.t1.board.qna.QnaDAO.";
	
	
	public int setInsertFile(BoardFileDTO boardFileDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setInsertFile", boardFileDTO);
	}
	
	public int setInsert(QnaDTO qnaDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setInsert", qnaDTO);
	}
	
}
