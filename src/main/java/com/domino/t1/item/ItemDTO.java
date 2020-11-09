package com.domino.t1.item;

public class ItemDTO {
	private long item_id;
	private String item_name;
	private String item_category;
	private long item_status;
	private long item_price;
	private String item_tag;
	private String item_image;
	
	public long getItem_id() {
		return item_id;
	}
	public void setItem_id(long item_id) {
		this.item_id = item_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_category() {
		return item_category;
	}
	public void setItem_category(String item_category) {
		this.item_category = item_category;
	}
	public long getItem_status() {
		return item_status;
	}
	public void setItem_status(long item_status) {
		this.item_status = item_status;
	}
	public long getItem_price() {
		return item_price;
	}
	public void setItem_price(long item_price) {
		this.item_price = item_price;
	}
	public String getItem_tag() {
		return item_tag;
	}
	public void setItem_tag(String item_tag) {
		this.item_tag = item_tag;
	}
	public String getItem_image() {
		return item_image;
	}
	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}
}
