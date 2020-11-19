package com.domino.t1.cart;

import com.domino.t1.item.ItemDTO;

public class CartDTO extends ItemDTO{
	private long cart_item_id;
	private long member_num;
	private long cart_group_id;
	private long cart_quantity;
	private String item_size;	
	

	// private long item_id;
	
	// for dough
	private String dough_short_name;
		
	public long getMember_num() {
		return member_num;
	}
	public void setMember_num(long member_num) {
		this.member_num = member_num;
	}	
	
	public String getDough_short_name() {
		return dough_short_name;
	}
	public void setDough_short_name(String dough_short_name) {
		this.dough_short_name = dough_short_name;
	}
	public long getCart_item_id() {
		return cart_item_id;
	}
	public void setCart_item_id(long cart_item_id) {
		this.cart_item_id = cart_item_id;
	}

	public long getCart_group_id() {
		return cart_group_id;
	}
	public void setCart_group_id(long cart_group_id) {
		this.cart_group_id = cart_group_id;
	}
	public long getCart_quantity() {
		return cart_quantity;
	}
	public void setCart_quantity(long cart_quantity) {
		this.cart_quantity = cart_quantity;
	}
	public String getItem_size() {
		return item_size;
	}
	public void setItem_size(String item_size) {
		this.item_size = item_size;
	}
}
