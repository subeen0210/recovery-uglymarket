package com.recovery.cart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.recovery.account.AccountDAO;

@WebServlet("/CartAllC")
public class CartAllC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 유저와 아이템의 값을 받아와야 함
		CartDAO.cartAll(request);
		
		// 어디로?
		AccountDAO.loginCheck(request);
		request.setAttribute("contentPage", "wj/cart.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 마이페이지 cart
		
		CartDAO.cartAll(request);
		request.getRequestDispatcher("wj/cart.jsp").forward(request, response);
	
	}

}
