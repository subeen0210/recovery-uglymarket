package com.recovery.account;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SellerLoginC")
public class SellerLoginC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String referer = request.getHeader("Referer");
		AccountDAO.logout(request);
		if (referer.endsWith("/SellerMypageC") || referer.endsWith("/UserMypageC") || referer.endsWith("/CartAllC")
				|| referer.endsWith("/OrderPageC")) {
			// 판매자에서 왔을 때의 동작
			response.sendRedirect("HC");
		} else if (referer != null) {
			int lastSlashIndex = referer.lastIndexOf("/");
			if (lastSlashIndex != -1) {
				String extractedValue = referer.substring(lastSlashIndex + 1);
				System.out.println(extractedValue);

				response.sendRedirect(extractedValue);
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (SellerAccountDAO.login(request)) {
			System.out.println(1);
			response.getWriter().write("1");
		} else {
			System.out.println(0);
			response.getWriter().write("0");
		}

	}
}
