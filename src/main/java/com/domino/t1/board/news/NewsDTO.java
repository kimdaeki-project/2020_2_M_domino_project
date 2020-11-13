package com.domino.t1.board.news;

import java.sql.Date;
import java.util.List;

import com.domino.t1.board.BoardDTO;
import com.domino.t1.board.file.BoardFileDTO;

public class NewsDTO extends BoardDTO{
	
	private Date regDate;
	private long hit;
	
	List<BoardFileDTO> boardFileDTOs;
	
	public List<BoardFileDTO> getBoardFileDTOs() {
		return boardFileDTOs;
	}
	public void setBoardFileDTOs(List<BoardFileDTO> boardFileDTOs) {
		this.boardFileDTOs = boardFileDTOs;
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
