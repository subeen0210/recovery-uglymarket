package com.recovery.account;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateUserC")
public class updateUserC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (AccountDAO.loginCheck(request) == 0) {

			out.println("<script language='javascript'>");
			out.println("alert('ログインが切れました。ログインページに移動します')");
			out.println("location.href='LoginPageC'");
			out.println("</script>");

			out.flush();

		} else {
			AccountDAO.updateUser(request);

			out.println("<script language='javascript'>");
			out.println("alert('情報が更新されました')");
			out.println("location.href='UserMypageC'");
			out.println("</script>");
			
			out.flush();
			
		}
	}

}
