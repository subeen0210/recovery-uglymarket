package com.recovery.account;

public class User {
	private String u_id;
	private String u_pw;
	private String u_nicname;
	private String u_tel;
	private String u_email;
	private String u_addrno;
	private String u_kanji_ln;
	private String u_kanji_fn;
	private String u_kata_ln ;
	private String u_kata_fn;
	private String u_img;
	
	
	public User() {
		// TODO Auto-generated constructor stub
	}


	public User(String u_id, String u_pw, String u_nicname, String u_tel, String u_email, String u_addrno,
			String u_kanji_ln, String u_kanji_fn, String u_kata_ln, String u_kata_fn, String u_img) {
		super();
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_nicname = u_nicname;
		this.u_tel = u_tel;
		this.u_email = u_email;
		this.u_addrno = u_addrno;
		this.u_kanji_ln = u_kanji_ln;
		this.u_kanji_fn = u_kanji_fn;
		this.u_kata_ln = u_kata_ln;
		this.u_kata_fn = u_kata_fn;
		this.u_img = u_img;
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


	public String getU_nicname() {
		return u_nicname;
	}


	public void setU_nicname(String u_nicname) {
		this.u_nicname = u_nicname;
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


	public String getU_kanji_ln() {
		return u_kanji_ln;
	}


	public void setU_kanji_ln(String u_kanji_ln) {
		this.u_kanji_ln = u_kanji_ln;
	}


	public String getU_kanji_fn() {
		return u_kanji_fn;
	}


	public void setU_kanji_fn(String u_kanji_fn) {
		this.u_kanji_fn = u_kanji_fn;
	}


	public String getU_kata_ln() {
		return u_kata_ln;
	}


	public void setU_kata_ln(String u_kata_ln) {
		this.u_kata_ln = u_kata_ln;
	}


	public String getU_kata_fn() {
		return u_kata_fn;
	}


	public void setU_kata_fn(String u_kata_fn) {
		this.u_kata_fn = u_kata_fn;
	}


	public String getU_img() {
		return u_img;
	}


	public void setU_img(String u_img) {
		this.u_img = u_img;
	}

	
}
