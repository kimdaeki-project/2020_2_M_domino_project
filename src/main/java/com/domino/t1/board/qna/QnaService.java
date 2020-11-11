package com.domino.t1.board.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService {
	
	@Autowired
	private QnaDAO qnaDAO;
	
	public int setInsert(QnaDTO qnaDTO) throws Exception{
		return qnaDAO.setInsert(qnaDTO);
	}

}
