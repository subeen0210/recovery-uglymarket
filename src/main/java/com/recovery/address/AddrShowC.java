package com.recovery.address;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.recovery.orders.OrderDAO;

@WebServlet("/AddrShowC")
public class AddrShowC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	AddrDAO.userAddr(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	AddrDAO.userAddrAll(request);
	request.getRequestDispatcher("lgh_account/addrUpdate.jsp").forward(request, response);
	}

}
