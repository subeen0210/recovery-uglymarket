package com.recovery.cart;

public class CartDTO {
	private int c_no;
	private String u_name;
	private int i_no;
	private int c_number;
	private String i_img;
	private int i_category;
	private String i_name;
	private int i_price;
	private String f_name;
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}

	public CartDTO(int c_no, String u_name, int i_no, int c_number, String i_img, int i_category, String i_name,
			int i_price, String f_name) {
		super();
		this.c_no = c_no;
		this.u_name = u_name;
		this.i_no = i_no;
		this.c_number = c_number;
		this.i_img = i_img;
		this.i_category = i_category;
		this.i_name = i_name;
		this.i_price = i_price;
		this.f_name = f_name;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public int getI_no() {
		return i_no;
	}

	public void setI_no(int i_no) {
		this.i_no = i_no;
	}

	public int getC_number() {
		return c_number;
	}

	public void setC_number(int c_number) {
		this.c_number = c_number;
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

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	
	
	
}