package com.recovery.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.recovery.account.User;
import com.recovery.main.DBManager;

public class CartDAO {

	public static void cartAll(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("userAccount");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select c_no, item.i_no, s_f_name, i_img, i_category, i_name, i_price, c_number "
				+ "from cart, users, item, seller "
				+ "where users.u_id = cart.u_id "
				+ "and item.i_no = cart.i_no "
				+ "and item.s_id = seller.s_id "
				+ "and users.u_id = (select u_id from users where u_id = ?)";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			System.out.println(user.getU_id());
			pstmt.setString(1, user.getU_id());
			
			rs = pstmt.executeQuery();
			
			ArrayList<CartDTO> carts = new ArrayList<CartDTO>();
			CartDTO cart;
			int priceAdd = 0;
			while (rs.next()) {
				cart = new CartDTO();
				cart.setC_no(rs.getInt("c_no"));
				cart.setU_id(user.getU_id());
				cart.setU_name(user.getU_kanji_ln()+" "+user.getU_kanji_fn());
				cart.setI_no(rs.getInt("i_no"));
				cart.setC_number(rs.getInt("c_number"));
				cart.setI_img(rs.getString("i_img"));
				cart.setI_category(rs.getInt("i_category"));
				cart.setI_name(rs.getString("i_name"));
				cart.setI_price(rs.getInt("i_price"));
				cart.setF_name(rs.getString("s_f_name"));
				priceAdd += rs.getInt("i_price")*rs.getInt("c_number");
				carts.add(cart);
			}
			System.out.println("장바구니 조회 성공");
			request.setAttribute("carts", carts);
			request.setAttribute("priceAll", priceAdd);
			System.out.println(carts);
			
		} catch (Exception e) {
			System.out.println("장바구니 조회 실패");
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
	}
	
	// 상품 detail 에서 장바구니 등록하는 기능
	public static void regCart(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		User user = (User) request.getSession().getAttribute("userAccount");
		String item = request.getParameter("no");
		String count = request.getParameter("count");		
		System.out.println(count);
		System.out.println(item);
		System.out.println(user.getU_id());
		
		String sql = "insert into cart values(cart_seq.nextval, ?, ?, ?)";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getU_id());
			pstmt.setString(2, item);
			pstmt.setString(3, count);
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("장바구니 등록 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("장바구니 등록 실패");
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}
	
	// 같은 상품 있는지 없는지 확인하는 기능
	public static boolean hasCartItem(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		User user = (User) request.getSession().getAttribute("userAccount");
		String item = request.getParameter("no");
		System.out.println(item);
		System.out.println(user.getU_id());
		boolean Check = false;
		String sql = "select COUNT(*) from cart where u_id = ? and i_no = ?";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getU_id());
			pstmt.setString(2, item);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int count = rs.getInt(1);
				
				if (count > 0) {
			        System.out.println("행이 존재한다 = 값이 있다 = true");
			        Check = true;
			    } 
				
			} 
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("서버 오류");
		} finally {
			DBManager.close(con, pstmt, null);
		}
		return Check;
	}
	
	
	// 같은 상품 있으면 수량 추가하는 기능
	public static void updateCart(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		User user = (User) request.getSession().getAttribute("userAccount");
		String item = request.getParameter("no");
		String count = request.getParameter("count");		
		System.out.println(count);
		System.out.println(item);
		System.out.println(user.getU_id());
		
		String sql = "UPDATE cart SET c_number = c_number + ? WHERE u_id = ? AND i_no = ?";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, count);
			pstmt.setString(2, user.getU_id());
			pstmt.setString(3, item);
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("장바구니 수량 추가 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("수량 변경 실패");
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}

	public static void deleteCart(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String cart = request.getParameter("c_no");
		System.out.println(cart);
		
		String sql = "delete cart WHERE c_no = ?";
		try {
			con = DBManager.connect();
//			System.out.println("연결성공");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cart);
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("장바구니 삭제버튼 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("삭제 실패: " + e.getMessage());
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}
	
	// 장바구니 삭제 후 total 값을 내기 위한 메서드
	public static int totalCart(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("userAccount");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select i_price, c_number "
				+ "from cart, users, item "
				+ "where users.u_id = cart.u_id "
				+ "and item.i_no = cart.i_no "
				+ "and users.u_id = (select u_id from users where u_id = ?)";
		int priceAdd = 0;
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			System.out.println(user.getU_id());
			pstmt.setString(1, user.getU_id());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				priceAdd += rs.getInt("i_price")*rs.getInt("c_number");
			}
			System.out.println("총가격 조회 성공");
			
			
		} catch (Exception e) {
			System.out.println("총가격 조회 실패");
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return priceAdd;
	}


	// 카트 수량 변경
	public static void updateCartQuantity(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String no = request.getParameter("no");
		String count = request.getParameter("quantity");		
		System.out.println(no);
		System.out.println(count);
		
		String sql = "UPDATE cart SET c_number = ? WHERE c_no = ?";
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, count);
			pstmt.setString(2, no);
			
			if (pstmt.executeUpdate() == 1) {
				System.out.println("장바구니 수량 변경 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("수량 변경 실패");
		} finally {
			DBManager.close(con, pstmt, null);
		}
	}
	
	// 카드 수량 변경됐을 때 각 아이템 총 가격
	public static int selectedCartPirce(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select i_price, c_number "
				+ "from cart, item "
				+ "where item.i_no = cart.i_no "
				+ "and c_no = ?";
		int priceAdd = 0;
		try {
			con = DBManager.connect();
			pstmt = con.prepareStatement(sql);
			
			String no = request.getParameter("no");
			pstmt.setString(1, no);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				priceAdd += rs.getInt("i_price")*rs.getInt("c_number");
			}
			System.out.println("개별 가격 조회 성공");
			
			
		} catch (Exception e) {
			System.out.println("개별 가격 조회 실패");
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return priceAdd;
	}
	
}
