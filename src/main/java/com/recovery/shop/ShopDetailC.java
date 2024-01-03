package com.recovery.shop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.recovery.account.AccountDAO;
import com.recovery.review.ReviewDAO;


@WebServlet("/ShopDetailC")
public class ShopDetailC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ItemDAO.getItem(request,response);
		ReviewDAO.getItemReview(request, response);
		ReviewDAO.getAvgReview(request);
		AccountDAO.loginCheck(request);
		request.setAttribute("contentPage", "wj/itemDetail.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ItemDAO.getItem(request,response);
		
	}

}
