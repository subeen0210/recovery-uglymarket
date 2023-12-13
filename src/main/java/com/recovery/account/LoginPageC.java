package com.recovery.account;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginPageC")
public class LoginPageC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("lgh_account/loginPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 정보가 안맞으면 0
		// 정보가 맞으면 1
		if (AccountDAO.login(request)) {
			System.out.println(1);
			response.getWriter().write("1");
		} else {
			System.out.println(0);
			response.getWriter().write("0");
		}
	}
	

}
