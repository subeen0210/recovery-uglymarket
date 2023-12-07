package com.recovery.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;

import com.recovery.main.DBManager;

public class ItemDAO {

	
	// 쇼핑몰 페이지에서 상품 보여주기
	public static void getAllItems(HttpServletRequest request) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from item";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
