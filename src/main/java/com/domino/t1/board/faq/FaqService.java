package com.domino.t1.board.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaqService {
	
	@Autowired
	private FaqDAO faqDAO;
	
	public List<FaqDTO> getList(FaqDTO faqDTO) throws Exception{
		return faqDAO.getList(faqDTO);
	}
	
	public int setInsert(FaqDTO faqDTO) throws Exception{
		return faqDAO.setInsert(faqDTO);
	}
	
	public int setDelete(FaqDTO faqDTO) throws Exception{
		return faqDAO.setDelete(faqDTO);
	}

}
