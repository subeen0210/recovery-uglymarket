package com.recovery.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.recovery.account.AccountDAO;
import com.recovery.shop.ItemDAO;


@WebServlet("/MypageC")
public class MypageC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ItemDAO.addItem(request);
		AccountDAO.loginCheck(request);
		request.setAttribute("mypageContent", "sb_mypage/jsp/itemAdd.jsp");
		request.setAttribute("contentPage", "sb_mypage/jsp/mypageMain.jsp");
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}

}
