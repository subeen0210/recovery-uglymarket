package com.recovery.review;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.recovery.account.AccountDAO;


@WebServlet("/ReviewAddC")
public class ReviewAddC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 if (ReviewDAO.addReview(request)) {
		        response.getWriter().write("1"); // 성공 시에는 1을 보내기
		    } else {
		        response.getWriter().write("0"); // 실패 시에는 0을 보내기
		    }
	}

}
