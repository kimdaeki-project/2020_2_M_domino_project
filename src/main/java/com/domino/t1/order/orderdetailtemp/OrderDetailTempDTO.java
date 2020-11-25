package com.domino.t1.order.orderdetailtemp;

public class OrderDetailTempDTO {
	private long order_detail_temp_id;
	private long member_num;
	private long cart_group_id;
	private long is_pizza_group;
	public long getOrder_detail_temp_id() {
		return order_detail_temp_id;
	}
	public void setOrder_detail_temp_id(long order_detail_temp_id) {
		this.order_detail_temp_id = order_detail_temp_id;
	}
	public long getMember_num() {
		return member_num;
	}
	public void setMember_num(long member_id) {
		this.member_num = member_id;
	}
	public long getCart_group_id() {
		return cart_group_id;
	}
	public void setCart_group_id(long cart_group_id) {
		this.cart_group_id = cart_group_id;
	}
	public long getIs_pizza_group() {
		return is_pizza_group;
	}
	public void setIs_pizza_group(long is_pizza_group) {
		this.is_pizza_group = is_pizza_group;
	}
}
