package com.recovery.cart;

public class CartDTO {
	private int c_no;
	private String u_id;
	private int i_no;
	private int c_number;
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}

	public CartDTO(int c_no, String u_id, int i_no, int c_number) {
		super();
		this.c_no = c_no;
		this.u_id = u_id;
		this.i_no = i_no;
		this.c_number = c_number;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
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
	
	
}
