package com.recovery.cart;

public class CartDTO {
	private int c_no;
	private String i_img;
	private int i_category;
	private String i_name;
	private int i_price;
	private int c_number;
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}

	public CartDTO(int c_no, String i_img, int i_category, String i_name, int i_price, int c_number) {
		super();
		this.c_no = c_no;
		this.i_img = i_img;
		this.i_category = i_category;
		this.i_name = i_name;
		this.i_price = i_price;
		this.c_number = c_number;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getI_img() {
		return i_img;
	}

	public void setI_img(String i_img) {
		this.i_img = i_img;
	}

	public int getI_category() {
		return i_category;
	}

	public void setI_category(int i_category) {
		this.i_category = i_category;
	}

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public int getI_price() {
		return i_price;
	}

	public void setI_price(int i_price) {
		this.i_price = i_price;
	}

	public int getC_number() {
		return c_number;
	}

	public void setC_number(int c_number) {
		this.c_number = c_number;
	}	
	
}
