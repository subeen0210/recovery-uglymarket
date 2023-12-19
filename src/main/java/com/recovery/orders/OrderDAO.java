package com.recovery.orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;

import com.recovery.account.User;
import com.recovery.account.UserAddr;
import com.recovery.main.DBManager;

public class OrderDAO {

	public static void userAddr(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User user = (User) request.getSession().getAttribute("userAccount");
		System.out.println(user.getU_id());
		String sql = "SELECT a_no, a_postcode, a_addr, a_addrdetail, a_name, a_tel, a_req"
				+" FROM address, users"
				+" where users.u_id = address.u_id"
				+" and users.u_id = ?";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getU_id());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				System.out.println("배송조회 성공");
				UserAddr addrs = new UserAddr();
				addrs.setA_no(rs.getInt("a_no"));
				addrs.setA_postcode(rs.getString("a_postcode"));
				
				String addr = rs.getString("a_addr");
				addr = addr.replaceAll("!", " ");
				
				addrs.setA_addr(addr);
				addrs.setA_addrDetail(rs.getString("a_addrdetail"));
				addrs.setA_name(rs.getString("a_name"));
				addrs.setA_tel(rs.getString("a_tel"));
				addrs.setA_req(rs.getString("a_req"));
				request.setAttribute("addr", addrs);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("배송 조회 실패");
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
	}

}
