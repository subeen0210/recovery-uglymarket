package com.recovery.account;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/IDForgotC")
public class IDForgotC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String person = request.getParameter("button");

		if (person.equals("user")) {
			request.getRequestDispatcher("lgh_account/idForgot.jsp").forward(request, response);
		} else if (person.equals("seller")) {
			// 2번 버튼이 눌렸을 때의 처리
			request.getRequestDispatcher("lgh_account/idForgot(seller).jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String person = request.getParameter("personCheck");
		System.out.println(person);
		
		if (person.equals("user")) {
			// 유저 - id 확인 있는지 확인
			if (AccountDAO.emailConfirm(request)) {
				request.setAttribute("isEmailConfirmed", true);
			} else {
				request.setAttribute("isEmailConfirmed", false);
			}
			request.getRequestDispatcher("wj/findResult_id.jsp").forward(request, response);
		} else if (person.equals("seller")) {
			// 2번 버튼이 눌렸을 때의 처리
			if (SellerAccountDAO.idConfirm(request)) {
				request.setAttribute("isIDConfirmed", true);
			} else {
				request.setAttribute("isIDConfirmed", false);
			}
			request.getRequestDispatcher("wj/findResult_id(seller).jsp").forward(request, response);
		}

		
	}

}
