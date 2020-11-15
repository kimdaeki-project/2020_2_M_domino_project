package com.domino.t1.board.faq;

import com.domino.t1.board.BoardDTO;

public class FaqDTO extends BoardDTO{
	
	private long faq_type;

	public long getFaq_type() {
		return faq_type;
	}

	public void setFaq_type(long faq_type) {
		this.faq_type = faq_type;
	}

}
