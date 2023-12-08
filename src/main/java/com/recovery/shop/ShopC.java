package com.recovery.shop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ShopC")
public class ShopC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ItemDAO.getAllItems(request);
		request.setAttribute("contentPage", "sb_shop/jsp/shopMain.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

}
