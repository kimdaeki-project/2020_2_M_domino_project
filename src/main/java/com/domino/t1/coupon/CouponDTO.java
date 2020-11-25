package com.domino.t1.coupon;

import java.sql.Date;

import com.domino.t1.address.AddressDTO;
import com.domino.t1.util.Pager;


public class CouponDTO extends Pager{

    private long sale_list;
    private String sale_name;
    private int sale_discount;
    private Date sale_date;
    private Date sale_date_end;
    
	public long getSale_list() {
		return sale_list;
	}
	public void setSale_list(long sale_list) {
		this.sale_list = sale_list;
	}
	public String getSale_name() {
		return sale_name;
	}
	public void setSale_name(String sale_name) {
		this.sale_name = sale_name;
	}
	public int getSale_discount() {
		return sale_discount;
	}
	public void setSale_discount(int sale_discount) {
		this.sale_discount = sale_discount;
	}
	public Date getSale_date() {
		return sale_date;
	}
	public void setSale_date(Date sale_date) {
		this.sale_date = sale_date;
	}
	public Date getSale_date_end() {
		return sale_date_end;
	}
	public void setSale_date_end(Date sale_date_end) {
		this.sale_date_end = sale_date_end;
	}

    
    
}
