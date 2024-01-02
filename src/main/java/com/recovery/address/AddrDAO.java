package com.recovery.address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.recovery.account.User;
import com.recovery.account.UserAddr;
import com.recovery.main.DBManager;

public class AddrDAO {

	public static void userAddrAll(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User user = (User) request.getSession().getAttribute("userAccount");
		System.out.println(user.getU_id());
		String sql = "SELECT a_no, a_postcode, a_addr, a_addrdetail, a_name, a_tel, a_req" + " FROM address, users"
				+ " where users.u_id = address.u_id" + " and users.u_id = ?";

		ArrayList<UserAddr> address = new ArrayList<UserAddr>();
		UserAddr addrs = null;
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getU_id());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				addrs = new UserAddr();
				addrs.setA_no(rs.getInt("a_no"));

				StringBuffer addrNum = new StringBuffer(rs.getString("a_postcode"));
				addrNum.insert(3, "-");
				addrs.setA_postcode(addrNum.toString());

				String addr = rs.getString("a_addr");
				addr = addr.replaceAll("!", " ");
				addrs.setA_addr(addr);

				addrs.setA_addrDetail(rs.getString("a_addrdetail"));
				addrs.setA_name(rs.getString("a_name"));
				addrs.setA_tel(rs.getString("a_tel"));
				addrs.setA_req(rs.getString("a_req"));
				address.add(addrs);
			}
			System.out.println("배송 조회 성공");
			request.setAttribute("address", address);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("배송 조회 실패");
		} finally {
			DBManager.close(con, pstmt, rs);
		}

	}

	public static void userAddr(HttpServletRequest request, HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT a_no, a_postcode, a_addr, a_addrdetail, a_name, a_tel, a_req FROM address"
				+ " where a_no = ?";

		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("a_no"));
			rs = pstmt.executeQuery();

			if (rs.next()) {
				System.out.println("배송 하나 조회 성공");
				UserAddr addr = new UserAddr();
				addr.setA_no(rs.getInt("a_no"));
				addr.setA_postcode(rs.getString("a_postcode"));
				addr.setA_addr(rs.getString("a_addr"));
				addr.setA_addrDetail(rs.getString("a_addrdetail"));
				addr.setA_name(rs.getString("a_name"));
				addr.setA_tel(rs.getString("a_tel"));
				addr.setA_req(rs.getString("a_req"));
				
				Gson g = new Gson();
				String jsonData = g.toJson(addr);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(jsonData);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("배송 하나 조회 실패");
		} finally {
			DBManager.close(con, pstmt, rs);
		}
	}

	
	public static void updateAddr(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE address SET a_postcode = ?, a_addr = ?, a_addrDetail = ?,"
				+ " a_name = ?, a_tel = ?, a_req = ?"
				+ " WHERE a_no = ?";
		try {
			request.setCharacterEncoding("UTF-8");
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			String tel = request.getParameter("a_tel");
			if (!tel.contains("-")) {
				StringBuffer telAll = new StringBuffer(tel);
				telAll.insert(3, "-");
				telAll.insert(8, "-");
				tel = telAll.toString();
			}
			System.out.println(tel);
			
			
			pstmt.setString(1, request.getParameter("userAddrN"));
			pstmt.setString(2, request.getParameter("userAddrP")+"!"+request.getParameter("userAddrC"));
			pstmt.setString(3, request.getParameter("userAddrD"));
			pstmt.setString(4, request.getParameter("a_name"));
			pstmt.setString(5, tel);
			pstmt.setString(6, request.getParameter("deliveryTime"));
			pstmt.setString(7, request.getParameter("a_no"));
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("주소 변경 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("주소 변경 실패");
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public static void regAddr(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		User user = (User) request.getSession().getAttribute("userAccount");
		String sql = "insert into address values(address_seq.nextval,?,?,?,?,?,?,?)";
		
		try {
			request.setCharacterEncoding("UTF-8");
			String name = request.getParameter("a_name");
			String tel1 = request.getParameter("a_tel1");
			String tel2 = request.getParameter("a_tel2");
			String tel3 = request.getParameter("a_tel3");
			
			String telAll = tel1+"-"+tel2+"-"+tel3;
			
			String deliveryTime = request.getParameter("deliveryTime");
			String userAddrN = request.getParameter("userAddrN");
			String userAddrP = request.getParameter("userAddrP");
			String userAddrC = request.getParameter("userAddrC");
			String userAddrD = request.getParameter("userAddrD");
			if (userAddrD.isEmpty()) {
				userAddrD = "...";
			}
			
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userAddrN);
			pstmt.setString(2, userAddrP+"!"+userAddrC);
			pstmt.setString(3, userAddrD);
			pstmt.setString(4, name);
			pstmt.setString(5, telAll);
			pstmt.setString(6, deliveryTime);
			pstmt.setString(7, user.getU_id());
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("배송지 등록 성공");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, null);
		}
	
	
	
	}

	public static void deleteAddr(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM address where a_no = ?";
		
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("no"));
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("address delete success");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("address delete failed");
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

}
