package com.domino.t1.board.news;

import java.sql.Date;

import com.domino.t1.board.BoardDTO;

public class NewsDTO extends BoardDTO{

	private Date regDate;
	private long hit;

	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public long getHit() {
		return hit;
	}
	public void setHit(long hit) {
		this.hit = hit;
	}
	 
	 

}
