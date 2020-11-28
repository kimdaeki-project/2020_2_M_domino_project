package com.domino.t1.order.orderdetail;

public class OrderDetailDTO {
	private long order_detail_id;
	private long order_view_num;
    
    private long order_item_id;
    private long order_detail_price;
    private long order_detail_quantity;
    private String order_detail_size;
    private long order_detail_group_id;
    private String  order_detail_name;
    private String order_detail_category;
	public long getOrder_detail_id() {
		return order_detail_id;
	}
	public void setOrder_detail_id(long order_detail_id) {
		this.order_detail_id = order_detail_id;
	}
	public long getOrder_view_number() {
		return order_view_num;
	}
	public void setOrder_view_number(long order_view_num) {
		this.order_view_num = order_view_num;
	}
	public long getOrder_item_id() {
		return order_item_id;
	}
	public void setOrder_item_id(long order_item_id) {
		this.order_item_id = order_item_id;
	}
	public long getOrder_detail_price() {
		return order_detail_price;
	}
	public void setOrder_detail_price(long order_detail_price) {
		this.order_detail_price = order_detail_price;
	}
	public long getOrder_detail_quantity() {
		return order_detail_quantity;
	}
	public void setOrder_detail_quantity(long order_detail_quantity) {
		this.order_detail_quantity = order_detail_quantity;
	}
	public String getOrder_detail_size() {
		return order_detail_size;
	}
	public void setOrder_detail_size(String order_detail_size) {
		this.order_detail_size = order_detail_size;
	}
	public long getOrder_detail_group_id() {
		return order_detail_group_id;
	}
	public void setOrder_detail_group_id(long order_detail_group_id) {
		this.order_detail_group_id = order_detail_group_id;
	}
	public String getOrder_detail_name() {
		return order_detail_name;
	}
	public void setOrder_detail_name(String order_detail_name) {
		this.order_detail_name = order_detail_name;
	}
	public String getOrder_detail_category() {
		return order_detail_category;
	}
	public void setOrder_detail_category(String order_detail_category) {
		this.order_detail_category = order_detail_category;
	}
}
