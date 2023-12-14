package com.recovery.cart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegCartC")
public class RegCartC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// cart u_id/ i_no 있는지 없는지 확인
	if (CartDAO.hasCartItem(request)) {		
		//업데이트
	CartDAO.updateCart(request);
	
	}else {
		// cart db에 장바구니 추가 
	CartDAO.regCart(request);
		
	}
	System.out.println(CartDAO.hasCartItem(request));	
	// 이전 페이지로 이동
	response.sendRedirect(request.getHeader("referer"));

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

