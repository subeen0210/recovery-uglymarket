package com.recovery.account;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/CheckSellerC")
public class CheckSellerC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  HttpSession session = request.getSession();
	        String s_id = (String) session.getAttribute("sellerAccount.s_id");
	        
	        // s_id가 존재하는지 여부에 따라 true 또는 false를 응답으로 보냄
	        response.getWriter().write((s_id != null) ? "true" : "false");
		
	}

}
