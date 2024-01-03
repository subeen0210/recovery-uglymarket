package com.recovery.review;

import java.util.Date;

public class ReviewDTO {

	private int r_no;
	private String r_estimation;
	private Date r_date;
	private Double r_grade;
	private String r_nickname;
	private String r_productname;
	private String u_id;
	private int i_no;
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(int r_no, String r_estimation, Date r_date, Double r_grade, String r_nickname,
			String r_productname, String u_id, int i_no) {
		super();
		this.r_no = r_no;
		this.r_estimation = r_estimation;
		this.r_date = r_date;
		this.r_grade = r_grade;
		this.r_nickname = r_nickname;
		this.r_productname = r_productname;
		this.u_id = u_id;
		this.i_no = i_no;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_estimation() {
		return r_estimation;
	}

	public void setR_estimation(String r_estimation) {
		this.r_estimation = r_estimation;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public Double getR_grade() {
		return r_grade;
	}

	public void setR_grade(Double r_grade) {
		this.r_grade = r_grade;
	}

	public String getR_nickname() {
		return r_nickname;
	}

	public void setR_nickname(String r_nickname) {
		this.r_nickname = r_nickname;
	}

	public String getR_productname() {
		return r_productname;
	}

	public void setR_productname(String r_productname) {
		this.r_productname = r_productname;
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

	
}
