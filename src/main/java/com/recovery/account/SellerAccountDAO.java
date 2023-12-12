package com.recovery.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.recovery.account.User;
import com.recovery.main.DBManager;

public class SellerAccountDAO {

	public static void login(HttpServletRequest request) {
		String sellerID = request.getParameter("sellerID");
		String sellerPW = request.getParameter("sellerPW");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from seller where s_id = ?";
		String dbSellerPW = "";
		try {
			// 연결 시작
			con = DBManager.connect();
			System.out.println("연결 성공");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sellerID);
			
			rs = pstmt.executeQuery();
			
			// id, pw 맞는지 확인
			if (rs.next()) {
				dbSellerPW = rs.getString("s_pw");
				if (sellerPW.equals(dbSellerPW)) {
					System.out.println("판매자 로그인 성공");
					// Seller bean 에 판매자 정보 입력
					Seller seller = new Seller();
					seller.setS_id(sellerID);
					seller.setS_pw(sellerPW);
					seller.setS_name(rs.getString("s_name"));
					seller.setS_tel(rs.getString("s_tel"));
					seller.setS_addr(rs.getString("s_addr"));
					seller.setS_Fphoto(rs.getString("s_f_photo"));
					seller.setS_Fname(rs.getString("s_f_name"));
					seller.setS_Fstory(rs.getString("s_f_story"));
					
					// 세션 생성
					HttpSession sellerHS = request.getSession();
					sellerHS.setAttribute("sellerAccount", seller);
					sellerHS.setMaxInactiveInterval(100);
				} else {
					System.out.println("비밀번호 오류");
				}
			} else {
				System.out.println("존재하지 않는 판매자");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("sellerLogin 서버 오류");
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

}
