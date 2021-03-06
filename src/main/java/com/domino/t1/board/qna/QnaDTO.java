package com.domino.t1.board.qna;

import java.sql.Date;
import java.util.List;

import com.domino.t1.board.BoardDTO;
import com.domino.t1.board.file.BoardFileDTO;

/**
 * @author user
 *
 */
public class QnaDTO extends BoardDTO{
	
	private Date regDate;
	private String email;
	private String phone;
	private String qna_type;
	private String branch_info;
	private String order_num;
	
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQna_type() {
		return qna_type;
	}
	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}
	public String getBranch_info() {
		return branch_info;
	}
	public void setBranch_info(String branch_info) {
		this.branch_info = branch_info;
	}
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
}
