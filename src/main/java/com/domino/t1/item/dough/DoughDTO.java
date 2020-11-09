package com.domino.t1.item.dough;

import com.domino.t1.item.ItemDTO;

public class DoughDTO extends ItemDTO{
	private long dough_id;
	private String dough_name_short;
	public long getDough_id() {
		return dough_id;
	}
	public void setDough_id(long dough_id) {
		this.dough_id = dough_id;
	}
	public String getDough_name_short() {
		return dough_name_short;
	}
	public void setDough_name_short(String dough_name_short) {
		this.dough_name_short = dough_name_short;
	}
}
