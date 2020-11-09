package com.domino.t1.item.topping;

import com.domino.t1.item.ItemDTO;

public class ToppingDTO extends ItemDTO{
	private long topping_id;
	private String topping_category;
	public long getTopping_id() {
		return topping_id;
	}
	public void setTopping_id(long topping_id) {
		this.topping_id = topping_id;
	}
	public String getTopping_category() {
		return topping_category;
	}
	public void setTopping_category(String topping_category) {
		this.topping_category = topping_category;
	}
}
