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
					user.setU_name(rs.getString("u_name"));
					user.setU_tel(rs.getString("u_tel"));
					user.setU_email(rs.getString("u_email"));
					user.setU_addrno(rs.getString("u_addrno"));
					user.setU_signout(rs.getString("u_signout"));
					
					// 세션 적용
					HttpSession userHS = request.getSession();
					userHS.setAttribute("userAccount", user);
					userHS.setMaxInactiveInterval(30);
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
			request.setAttribute("loginChange", "../lgh_account/loginButton/loginButton.jsp");
			return false;
		} else {
			request.setAttribute("loginChange", "../lgh_account/loginButton/loginOK.jsp");
			return true;
		}
	}

}
