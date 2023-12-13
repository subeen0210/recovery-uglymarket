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
		// 정보가 안맞으면 로그인 창으로 가게
		// 정보가 맞으면 HC로
		if (AccountDAO.login(request)) {
			response.sendRedirect("HC");
		}else {
			request.getRequestDispatcher("lgh_account/loginPage.jsp").forward(request, response);
		}
	}

}
