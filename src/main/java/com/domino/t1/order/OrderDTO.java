package com.domino.t1.order;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class OrderDTO {
	
    private long member_num;
    private String order_num;
    private String order_adress;
    private String order_shop;
    private String order_name;
    private String order_phone;
    private String order_request;
    private String order_untact;
    private Date order_date;
    private long order_total;
    private long order_sale;
    private String order_salename;
    private long order_payment;
    private String order_method;
    
    
    
    
    
	public long getMember_num() {		
		return member_num;
	}
	public void setMember_num(long member_num) {
		this.member_num = member_num;
	}
	public String getOrder_num() {
		
		java.util.Date now = new java.util.Date();
		SimpleDateFormat vans = new SimpleDateFormat("yyyyMMddkkmmss");
		order_num = vans.format(now);
		   
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getOrder_adress() {
		return order_adress;
	}
	public void setOrder_adress(String order_adress) {
		this.order_adress = order_adress;
	}
	public String getOrder_shop() {
		return order_shop;
	}
	public void setOrder_shop(String order_shop) {
		this.order_shop = order_shop;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public String getOrder_request() {
		return order_request;
	}
	public void setOrder_request(String order_request) {
		this.order_request = order_request;
	}
	public String getOrder_untact() {
		return order_untact;
	}
	public void setOrder_untact(String order_untact) {
		this.order_untact = order_untact;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public long getOrder_total() {
		return order_total;
	}
	public void setOrder_total(long order_total) {
		this.order_total = order_total;
	}
	public long getOrder_sale() {
		return order_sale;
	}
	public void setOrder_sale(long order_sale) {
		this.order_sale = order_sale;
	}
	public String getOrder_salename() {
		return order_salename;
	}
	public void setOrder_salename(String order_salename) {
		this.order_salename = order_salename;
	}
	public long getOrder_payment() {
		return order_payment;
	}
	public void setOrder_payment(long order_payment) {
		this.order_payment = order_payment;
	}
	public String getOrder_method() {
		return order_method;
	}
	public void setOrder_method(String order_method) {
		this.order_method = order_method;
	}
    
    
    
	
    
    

}