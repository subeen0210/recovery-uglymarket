package com.recovery.orders;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteOrderC")
public class deleteOrderC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 누군가 delete 한 적 있는지 check
		String result = OrderDAO.deleteOrderCheck(request);
		System.out.println("delete result: " + result);
		if (result.equals("uDel") || result.equals("sDel")) {
			//delete o_no
			OrderDAO.deleteOrder(request);
		} else if (result.equals("both")) {
			//update o_no
			OrderDAO.deleteSelectOrder(request);
		}
		
		// 이전 페이지로
		String referer = request.getHeader("Referer");

	    if (referer != null && referer.endsWith("/SellerMypageC")) {
	        // 판매자에서 왔을 때의 동작
	        response.sendRedirect("SellerMypageC");
	    } else if (referer != null && referer.endsWith("/UserMypageC")) {
	        // 유저에서 왔을 때의 동작
	        response.sendRedirect("UserMypageC");
	    } else {
	        // 다른 경우에 대한 동작
	        response.sendRedirect("HC");
	    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
