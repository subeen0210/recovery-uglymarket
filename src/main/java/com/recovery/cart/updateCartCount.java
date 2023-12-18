package com.recovery.cart;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/updateCartCount")
public class updateCartCount extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	CartDAO.updateCartQuantity(request);
	
	 // 서버에서 데이터를 가져옴
    int totalCartPrice = CartDAO.totalCart(request);
    int selectedCartPrice = CartDAO.selectedCartPirce(request);
    System.out.println(totalCartPrice);
    System.out.println(selectedCartPrice);
    
    
    // JSON 데이터 생성
    Gson gson = new Gson();
    Map<String, Object> responseData = new HashMap<>();
    responseData.put("totalCartPrice", totalCartPrice);
    responseData.put("selectedCartPrice", selectedCartPrice);

    // 클라이언트로 JSON 응답을 전송
    response.getWriter().write(gson.toJson(responseData));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
