package com.recovery.shop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.recovery.account.AccountDAO;


@WebServlet("/ShopC_copy")
public class ShopC_copy extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		ItemDAO.getAllItems(request);
//		ItemDAO.shopPagin(1, request);
		AccountDAO.loginCheck(request);
		request.setAttribute("contentPage", "wj/shop_copy.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

}
