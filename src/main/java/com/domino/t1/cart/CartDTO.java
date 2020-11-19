package com.domino.t1.cart;

import com.domino.t1.item.ItemDTO;

public class CartDTO extends ItemDTO{
	private long cart_item_id;
	private String member_id;
	// private long item_id;
	private long cart_group_id;
	private long cart_quantity;
	private String item_size;
	public long getCart_item_id() {
		return cart_item_id;
	}
	public void setCart_item_id(long cart_item_id) {
		this.cart_item_id = cart_item_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
