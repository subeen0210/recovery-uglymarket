package com.recovery.account;

public class Seller {
	private String s_id;
	private String s_pw;
	private String s_name;
	private String s_tel;
	private String s_addr;
	private String s_Fphoto;
	private String s_Fname;
	private String s_Fstory;
	
	public Seller() {
		// TODO Auto-generated constructor stub
	}

	public Seller(String s_id, String s_pw, String s_name, String s_tel, String s_addr, String s_Fphoto, String s_Fname,
			String s_Fstory) {
		super();
		this.s_id = s_id;
		this.s_pw = s_pw;
		this.s_name = s_name;
		this.s_tel = s_tel;
		this.s_addr = s_addr;
		this.s_Fphoto = s_Fphoto;
		this.s_Fname = s_Fname;
		this.s_Fstory = s_Fstory;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getS_pw() {
		return s_pw;
	}

	public void setS_pw(String s_pw) {
		this.s_pw = s_pw;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_tel() {
		return s_tel;
	}

	public void setS_tel(String s_tel) {
		this.s_tel = s_tel;
	}

	public String getS_addr() {
		return s_addr;
	}

	public void setS_addr(String s_addr) {
		this.s_addr = s_addr;
	}

	public String getS_Fphoto() {
		return s_Fphoto;
	}

	public void setS_Fphoto(String s_Fphoto) {
		this.s_Fphoto = s_Fphoto;
	}

	public String getS_Fname() {
		return s_Fname;
	}

	public void setS_Fname(String s_Fname) {
		this.s_Fname = s_Fname;
	}

	public String getS_Fstory() {
		return s_Fstory;
	}

	public void setS_Fstory(String s_Fstory) {
		this.s_Fstory = s_Fstory;
	}
	
	
}
