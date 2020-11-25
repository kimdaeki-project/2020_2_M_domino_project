package com.domino.t1.member.memberInquirly;

import java.sql.Date;

import com.domino.t1.member.MemberDTO;

public class MemberInquirlyDTO extends MemberDTO{
	
	private long inq_num;
	private String inq_title;
	private String inq_contents;
	private Date inq_date;
	private String inq_state;
	private String inq_type;
	private String inq_shop;
	private String inq_location;
	private String inq_reply;
	
	public String getInq_reply() {
		return inq_reply;
	}
	public void setInq_reply(String inq_reply) {
		this.inq_reply = inq_reply;
	}
	public long getInq_num() {
		return inq_num;
	}
	public void setInq_num(long inq_num) {
		this.inq_num = inq_num;
	}
	public String getInq_title() {
		return inq_title;
	}
	public void setInq_title(String inq_title) {
		this.inq_title = inq_title;
	}
	public String getInq_contents() {
		return inq_contents;
	}
	public void setInq_contents(String inq_contents) {
		this.inq_contents = inq_contents;
	}
	public Date getInq_date() {
		return inq_date;
	}
	public void setInq_date(Date inq_date) {
		this.inq_date = inq_date;
	}
	public String getInq_state() {
		return inq_state;
	}
	public void setInq_state(String inq_state) {
		this.inq_state = inq_state;
	}
	public String getInq_type() {
		return inq_type;
	}
	public void setInq_type(String inq_type) {
		this.inq_type = inq_type;
	}
	public String getInq_shop() {
		return inq_shop;
	}
	public void setInq_shop(String inq_shop) {
		this.inq_shop = inq_shop;
	}
	public String getInq_location() {
		return inq_location;
	}
	public void setInq_location(String inq_location) {
		this.inq_location = inq_location;
	}
	
	
	

}
