package com.domino.t1.board.news;

import java.sql.Date;

import com.domino.t1.board.BoardDTO;

public class NewsDTO extends BoardDTO{
	
	private String news_type;
	private Date regDate;
	private long hit;
	
	public String getNews_type() {
		return news_type;
	}
	public void setNews_type(String news_type) {
		this.news_type = news_type;
	}
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
