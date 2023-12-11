package com.recovery.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.recovery.main.DBManager;

public class AccountDAO {

	public static void login(HttpServletRequest request) {
		// 유저 로그인 하는 기능입니다.
		// 껍/값
		String userID = request.getParameter("userID");
		String userPW = request.getParameter("userPW");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from users where u_id = ?";
		String dbUserPW = "";
		try {
			// 연결 시도
			con = DBManager.connect();
			System.out.println("연결성공");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			
			rs = pstmt.executeQuery();
			
			// id, pw 확인절차
			if (rs.next()) {
				dbUserPW = rs.getString("u_pw");
				if (userPW.equals(dbUserPW)) {
					System.out.println("로그인 성공");
					// 개인 로그인만 출력하기 위해서 생성자에 담기
					User user = new User();
					user.setU_id(userID);
					user.setU_pw(userPW);
					user.setU_nicname(rs.getString("u_nicname"));
					user.setU_tel(rs.getString("u_tel"));
					user.setU_email(rs.getString("u_email"));
					user.setU_addrno(rs.getString("u_addrno"));
					user.setU_kanji_ln(rs.getString("u_kanji_ln"));
					user.setU_kanji_fn(rs.getString("u_kanji_fn"));
					user.setU_kata_ln(rs.getString("u_kata_ln"));
					user.setU_kata_fn(rs.getString("u_kata_fn"));
					user.setU_img(rs.getString("u_img"));
					
					// 세션 적용
					HttpSession userHS = request.getSession();
					userHS.setAttribute("userAccount", user);
					userHS.setMaxInactiveInterval(10);
				} else {
					System.out.println("비번오류");
				}
			} else {
				System.out.println("존재하지 않는 회원");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("userLogin 서버 오류");
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	public static boolean loginCheck(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("userAccount");
		if (user == null) {
			request.setAttribute("loginChange", "lgh_account/loginButton/loginButton.jsp");
			return false;
		} else {
			request.setAttribute("loginChange", "lgh_account/loginButton/loginOK.jsp");
			return true;
		}
	}

	//id 중복 확인 기능
	public static int idCheck(HttpServletRequest request) {
		System.out.println("aa");
		String userID = request.getParameter("userID");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from users where u_id = ?";
		int idCheck = 0;
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next() || userID.equals("")) {
				// 행이 있거나, 아예 입력 하지 않았을 경우 생성 불가능하게
				idCheck = 0;
			} else {
				// 행이 존재하지 않음 == id 중복이 아님이므로 생성 가능
				idCheck = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return idCheck;
	}
	
	//db에 유저정보 등록(회원가입)
	public static void regUser(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into users values(?,?,?,?,?,?,?,?,?,?,?);";
		try {
			
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

}
