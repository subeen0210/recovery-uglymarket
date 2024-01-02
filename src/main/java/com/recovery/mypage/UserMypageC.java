package com.recovery.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.recovery.account.AccountDAO;

@WebServlet("/UserMypageC")
public class UserMypageC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (AccountDAO.loginCheck(request) == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script language='javascript'>");
			out.println("alert('ログインが切れました。ログインしに行きます')");
			out.println("location.href='LoginPageC'");
			out.println("</script>");

			out.flush();
		} else {
			request.setAttribute("contentPage", "wr_company/new_myPage.jsp");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
