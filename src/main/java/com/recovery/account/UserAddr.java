package com.recovery.account;

public class UserAddr {
	private int a_no;
	private String a_postcode;
	private String a_addr;
	private String a_addrDetail;
	private String a_name;
	private String a_tel;
	private String a_req;
	private String u_id;
	
	public UserAddr() {
		// TODO Auto-generated constructor stub
	}

	public UserAddr(int a_no, String a_postcode, String a_addr, String a_addrDetail, String a_name, String a_tel,
			String a_req, String u_id) {
		super();
		this.a_no = a_no;
		this.a_postcode = a_postcode;
		this.a_addr = a_addr;
		this.a_addrDetail = a_addrDetail;
		this.a_name = a_name;
		this.a_tel = a_tel;
		this.a_req = a_req;
		this.u_id = u_id;
	}

	public int getA_no() {
		return a_no;
	}

	public void setA_no(int a_no) {
		this.a_no = a_no;
	}

	public String getA_postcode() {
		return a_postcode;
	}

	public void setA_postcode(String a_postcode) {
		this.a_postcode = a_postcode;
	}

	public String getA_addr() {
		return a_addr;
	}

	public void setA_addr(String a_addr) {
		this.a_addr = a_addr;
	}

	public String getA_addrDetail() {
		return a_addrDetail;
	}

	public void setA_addrDetail(String a_addrDetail) {
		this.a_addrDetail = a_addrDetail;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getA_tel() {
		return a_tel;
	}

	public void setA_tel(String a_tel) {
		this.a_tel = a_tel;
	}

	public String getA_req() {
		return a_req;
	}

	public void setA_req(String a_req) {
		this.a_req = a_req;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	
}
