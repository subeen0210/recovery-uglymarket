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
		String sql = "select c_no, i_img, i_category, i_name, i_price, c_number "
				+ "from cart, users, item "
				+ "where users.u_id = cart.u_id "
				+ "and item.i_no = cart.i_no "
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
				cart.setI_img(rs.getString("i_img"));
				cart.setI_category(rs.getInt("i_category"));
				cart.setI_name(rs.getString("i_name"));
				cart.setI_price(rs.getInt("i_price"));
				cart.setC_number(rs.getInt("c_number"));
				priceAdd += rs.getInt("i_price");
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

}
