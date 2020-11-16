package com.domino.t1.member;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.Entity;

public class MemberDTO {
	
	private String member_name;
	private String member_id;
	private String member_pw;
	private Date member_date;
	private String member_phone;
	private String member_email;
	private String member_level;
	private int member_pi_date;
	private int member_pi_agg;
	private int member_clause_agg;
	private int member_locate_agg;
	private int member_msg_agg;
	private int member_email_agg;
	private int member_post_agg;
	private Date member_reg_date;
	private long member_num;
	
	
	private long inq_num;
	private String inq_title;
	private String inq_contents;
	private Date inq_date;
	private String inq_state;
	private String inq_type;
	private String inq_shop;
	private String inq_location;
	
	
	
	//getter, setter
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
	
	//getter, setter
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public Date getMember_date() {
		return member_date;
	}
	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_level() {
		return member_level;
	}
	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}
	public int getMember_pi_date() {
		return member_pi_date;
	}
	public void setMember_pi_date(int member_pi_date) {
		this.member_pi_date = member_pi_date;
	}
	public int getMember_pi_agg() {
		return member_pi_agg;
	}
	public void setMember_pi_agg(int member_pi_agg) {
		this.member_pi_agg = member_pi_agg;
	}
	public int getMember_clause_agg() {
		return member_clause_agg;
	}
	public void setMember_clause_agg(int member_clause_agg) {
		this.member_clause_agg = member_clause_agg;
	}
	public int getMember_locate_agg() {
		return member_locate_agg;
	}
	public void setMember_locate_agg(int member_locate_agg) {
		this.member_locate_agg = member_locate_agg;
	}
	public int getMember_msg_agg() {
		return member_msg_agg;
	}
	public void setMember_msg_agg(int member_msg_agg) {
		this.member_msg_agg = member_msg_agg;
	}
	public int getMember_email_agg() {
		return member_email_agg;
	}
	public void setMember_email_agg(int member_email_agg) {
		this.member_email_agg = member_email_agg;
	}
	public int getMember_post_agg() {
		return member_post_agg;
	}
	public void setMember_post_agg(int member_post_agg) {
		this.member_post_agg = member_post_agg;
	}
	public Date getMember_reg_date() {
		return member_reg_date;
	}
	public void setMember_reg_date(Date member_reg_date) {
		this.member_reg_date = member_reg_date;
	}
	public long getMember_num() {
		return member_num;
	}
	public void setMember_num(long member_num) {
		this.member_num = member_num;
	}
	
	
	
}
