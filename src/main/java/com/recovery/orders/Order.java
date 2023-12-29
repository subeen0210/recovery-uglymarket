package com.recovery.orders;

import java.util.Date;

public class Order {
	private int o_no;
	private String o_orderNum;
	private int i_no;
	private String o_name;
	private String o_addrNum;
	private String o_addr;
	private String o_tel;
	private String o_arrival;
	private int o_quantity;
	private int o_totalprice;
	private String o_status;
	private Date o_date;
	private String i_name;
	private int i_category;
	private int i_price;	
	private Date i_ed;
	private String f_name;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(int o_no, String o_orderNum, int i_no, String o_name, String o_addrNum, String o_addr, String o_tel,
			String o_arrival, int o_quantity, int o_totalprice, String o_status, Date o_date, String i_name,
			int i_category, int i_price, Date i_ed, String f_name) {
		super();
		this.o_no = o_no;
		this.o_orderNum = o_orderNum;
		this.i_no = i_no;
		this.o_name = o_name;
		this.o_addrNum = o_addrNum;
		this.o_addr = o_addr;
		this.o_tel = o_tel;
		this.o_arrival = o_arrival;
		this.o_quantity = o_quantity;
		this.o_totalprice = o_totalprice;
		this.o_status = o_status;
		this.o_date = o_date;
		this.i_name = i_name;
		this.i_category = i_category;
		this.i_price = i_price;
		this.i_ed = i_ed;
		this.f_name = f_name;
	}

	public int getO_no() {
		return o_no;
	}

	public void setO_no(int o_no) {
		this.o_no = o_no;
	}

	public String getO_orderNum() {
		return o_orderNum;
	}

	public void setO_orderNum(String o_orderNum) {
		this.o_orderNum = o_orderNum;
	}

	public int getI_no() {
		return i_no;
	}

	public void setI_no(int i_no) {
		this.i_no = i_no;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public String getO_addrNum() {
		return o_addrNum;
	}

	public void setO_addrNum(String o_addrNum) {
		this.o_addrNum = o_addrNum;
	}

	public String getO_addr() {
		return o_addr;
	}

	public void setO_addr(String o_addr) {
		this.o_addr = o_addr;
	}

	public String getO_tel() {
		return o_tel;
	}

	public void setO_tel(String o_tel) {
		this.o_tel = o_tel;
	}

	public String getO_arrival() {
		return o_arrival;
	}

	public void setO_arrival(String o_arrival) {
		this.o_arrival = o_arrival;
	}

	public int getO_quantity() {
		return o_quantity;
	}

	public void setO_quantity(int o_quantity) {
		this.o_quantity = o_quantity;
	}

	public int getO_totalprice() {
		return o_totalprice;
	}

	public void setO_totalprice(int o_totalprice) {
		this.o_totalprice = o_totalprice;
	}

	public String getO_status() {
		return o_status;
	}

	public void setO_status(String o_status) {
		this.o_status = o_status;
	}

	public Date getO_date() {
		return o_date;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	public String getI_name() {
		return i_name;
	}

	public void setI_name(String i_name) {
		this.i_name = i_name;
	}

	public int getI_category() {
		return i_category;
	}

	public void setI_category(int i_category) {
		this.i_category = i_category;
	}

	public int getI_price() {
		return i_price;
	}

	public void setI_price(int i_price) {
		this.i_price = i_price;
	}

	public Date getI_ed() {
		return i_ed;
	}

	public void setI_ed(Date i_ed) {
		this.i_ed = i_ed;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	
}


