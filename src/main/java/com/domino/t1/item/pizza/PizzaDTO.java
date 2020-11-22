package com.domino.t1.item.pizza;

import com.domino.t1.item.ItemDTO;

public class PizzaDTO extends ItemDTO{
	private long pizza_id;
	private long pizza_price_l;
	private long pizza_price_m;
	private long pizza_price_half;
	private String pizza_hashtag;
	private String pizza_type;
	public String getPizza_toppings() {
		return pizza_toppings;
	}

	public void setPizza_toppings(String pizza_toppings) {
		this.pizza_toppings = pizza_toppings;
	}

	public String getPizza_origin() {
		return pizza_origin;
	}

	public void setPizza_origin(String pizza_origin) {
		this.pizza_origin = pizza_origin;
	}
	private String pizza_toppings;
	private String pizza_origin;
	
	// L(large) is the default setting for pizza size
	public void setDefaultItemPrice() {
		this.setItem_price(this.getPizza_price_l());
	}
	
	public long getPizza_id() {
		return pizza_id;
	}
	public void setPizza_id(long pizza_id) {
		this.pizza_id = pizza_id;
	}
	public long getPizza_price_l() {
		return pizza_price_l;
	}
	public void setPizza_price_l(long pizza_price_l) {
		this.pizza_price_l = pizza_price_l;
	}
	public long getPizza_price_m() {
		return pizza_price_m;
	}
	public void setPizza_price_m(long pizza_price_m) {
		this.pizza_price_m = pizza_price_m;
	}
	public long getPizza_price_half() {
		return pizza_price_half;
	}
	public void setPizza_price_half(long pizza_price_half) {
		this.pizza_price_half = pizza_price_half;
	}
	public String getPizza_hashtag() {
		return pizza_hashtag;
	}
	public void setPizza_hashtag(String pizza_hashtag) {
		this.pizza_hashtag = pizza_hashtag;
	}
	public String getPizza_type() {
		return pizza_type;
	}
	public void setPizza_type(String pizza_type) {
		this.pizza_type = pizza_type;
	}
}
