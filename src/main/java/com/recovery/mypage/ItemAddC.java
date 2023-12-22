package com.recovery.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.recovery.account.AccountDAO;
import com.recovery.account.Seller;
import com.recovery.shop.ItemDAO;


@WebServlet("/ItemAddC")
public class ItemAddC extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ItemDAO.selectItem(request, response);

//		System.out.println("mz test ------------");
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		 if (AccountDAO.loginCheck(request) != 2) {
	            // 로그인되어 있지 않으면 로그인 페이지로 이동 또는 다른 처리를 수행
	            response.sendRedirect("login.jsp");
	            return;
	        }

	        // 현재 로그인한 사용자의 Seller 객체를 가져옴
	        Seller seller = (Seller) request.getSession().getAttribute("sellerAccount");

	        // Seller 객체가 null이 아닌지 확인
	        if (seller != null) {
	            // Seller 객체의 id를 사용
	            String sellerId = seller.getS_id();

	            // 나머지 등록 로직
	            ItemDAO.addItem(request);

	            // 응답 메시지를 "상품이 등록되었습니다."로 설정
	            response.setContentType("text/plain");
	            response.setCharacterEncoding("UTF-8");
	            response.getWriter().write("1");
	        } else {
	            // 응답 메시지를 "상품 등록에 실패했습니다."로 설정
	            response.setContentType("text/plain");
	            response.setCharacterEncoding("UTF-8");
	            response.getWriter().write("0");
	        }
		
	}
}
