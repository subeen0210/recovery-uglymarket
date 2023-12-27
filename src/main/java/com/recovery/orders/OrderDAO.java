package com.recovery.orders;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;

import com.recovery.account.User;
import com.recovery.account.UserAddr;
import com.recovery.main.DBManager;

public class OrderDAO {
	
	// 배송 조회
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
	
	// order에 db 등록
	public static void regOrders(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		User user = (User) request.getSession().getAttribute("userAccount");
		
		String[] i_no = request.getParameterValues("i_no");
		String[] quantity = request.getParameterValues("quantity");
		String[] subtotal = request.getParameterValues("subtotal");
		for (int i = 0; i < i_no.length; i++) {
		    System.out.println("i_no: " + i_no[i]);
		    System.out.println("quantity: " + quantity[i]);
		    System.out.println("subtotal: " + subtotal[i]);
		}
		
		String sql = "insert into orders values(orders_seq.nextval,?,?,?,?,?,?,?,?,?, DEFAULT, sysdate, DEFAULT)";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getU_id());
			pstmt.setString(3, "");
			pstmt.setString(4, "");
			pstmt.setString(5, "");
			pstmt.setString(6, "");
			pstmt.setString(7, "");
			
			for (int i = 0; i < i_no.length; i++) {
			pstmt.setString(2, i_no[i]);
			pstmt.setString(8, quantity[i]);
			pstmt.setString(9, subtotal[i]);
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("주문 등록 성공"+i);
			}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("주문 등록 실패");
		} finally {
			DBManager.close(con, pstmt, null);
		}
		deleteOrdersCart(request);
	}
	
	// order 등록이 되면 cart 삭제 
	public static void deleteOrdersCart(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		User user = (User) request.getSession().getAttribute("userAccount");
		String[] i_no = request.getParameterValues("i_no");
		
		for (String i : i_no) {
			System.out.println("i_no: " + i);
		}
		
		String sql = "delete cart where u_id = ? and i_no = ?";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getU_id());
			for (int i = 0; i < i_no.length; i++) {
			
			pstmt.setString(2, i_no[i]);
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("장바구니 삭제 성공 " + i);
			}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("장바구니 삭제 실패");
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}
}
