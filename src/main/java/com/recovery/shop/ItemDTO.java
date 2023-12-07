package com.recovery.shop;

import java.util.Date;

public class ItemDTO {

	private int i_no;
	private int i_farm;
	private String i_name;
	private String i_img;
	private String i_img2;
	private String i_img3;
	private String i_img4;
	private String i_des;
	private int i_category;
	private Date i_enddate;
	private int i_price;
	private int i_stock;
	private Double i_star_avg;
	
	public ItemDTO() {
		// TODO Auto-generated constructor stub
	}

	public ItemDTO(int i_no, int i_farm, String i_name, String i_img, String i_img2, String i_img3, String i_img4,
			String i_des, int i_category, Date i_enddate, int i_price, int i_stock, Double i_star_avg) {
		super();
		this.i_no = i_no;
		this.i_farm = i_farm;
		this.i_name = i_name;
		this.i_img = i_img;
		this.i_img2 = i_img2;
		this.i_img3 = i_img3;
		this.i_img4 = i_img4;
		this.i_des = i_des;
		this.i_category = i_category;
		this.i_enddate = i_enddate;
		this.i_price = i_price;
		this.i_stock = i_stock;
		this.i_star_avg = i_star_avg;
	}

	public int getI_no() {
		return i_no;
	}

	public void setI_no(int i_no) {
		this.i_no = i_no;
	}

	public int getI_farm() {
		return i_farm;
	}

	public void setI_farm(int i_farm) {
		this.i_farm = i_farm;
	}

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public String getI_img() {
		return i_img;
	}

	public void setI_img(String i_img) {
		this.i_img = i_img;
	}

	public String getI_img2() {
		return i_img2;
	}

	public void setI_img2(String i_img2) {
		this.i_img2 = i_img2;
	}

	public String getI_img3() {
		return i_img3;
	}

	public void setI_img3(String i_img3) {
		this.i_img3 = i_img3;
	}

	public String getI_img4() {
		return i_img4;
	}

	public void setI_img4(String i_img4) {
		this.i_img4 = i_img4;
	}

	public String getI_des() {
		return i_des;
	}

	public void setI_des(String i_des) {
		this.i_des = i_des;
	}

	public int getI_category() {
		return i_category;
	}

	public void setI_category(int i_category) {
		this.i_category = i_category;
	}

	public Date getI_enddate() {
		return i_enddate;
	}

	public void setI_enddate(Date i_enddate) {
		this.i_enddate = i_enddate;
	}

	public int getI_price() {
		return i_price;
	}

	public void setI_price(int i_price) {
		this.i_price = i_price;
	}

	public int getI_stock() {
		return i_stock;
	}

	public void setI_stock(int i_stock) {
		this.i_stock = i_stock;
	}

	public Double getI_star_avg() {
		return i_star_avg;
	}

	public void setI_star_avg(Double i_star_avg) {
		this.i_star_avg = i_star_avg;
	}
	
	
	
}
