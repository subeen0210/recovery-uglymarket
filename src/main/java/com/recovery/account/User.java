package com.recovery.account;

public class User {
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_tel;
	private String u_email;
	private String u_addrno;
	private String u_signout;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String u_id, String u_pw, String u_name, String u_tel, String u_email, String u_addrno,
			String u_signout) {
		super();
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.u_tel = u_tel;
		this.u_email = u_email;
		this.u_addrno = u_addrno;
		this.u_signout = u_signout;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_tel() {
		return u_tel;
	}

	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_addrno() {
		return u_addrno;
	}

	public void setU_addrno(String u_addrno) {
		this.u_addrno = u_addrno;
	}

	public String getU_signout() {
		return u_signout;
	}

	public void setU_signout(String u_signout) {
		this.u_signout = u_signout;
	}
	
	
}
