package com.recovery.account;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PWForgotC")
public class PWForgotC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String person = request.getParameter("button");

		if (person.equals("user")) {
			request.getRequestDispatcher("lgh_account/PWForgot.jsp").forward(request, response);
		} else if (person.equals("seller")) {
			// 2번 버튼이 눌렸을 때의 처리
			request.getRequestDispatcher("lgh_account/PWForgot(seller).jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String person = request.getParameter("personCheck");
		
		if (person.equals("user")) {
			AccountDAO.createRandomPassword(request);
			request.getRequestDispatcher("wj/findResult_pw.jsp").forward(request, response);
		}  else if (person.equals("seller")) {
			SellerAccountDAO.createRandomPassword(request);
			request.getRequestDispatcher("wj/findResult_pw(seller).jsp").forward(request, response);
		}
	}

}
