package com.company.controller2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.Board2DAO;
import com.company.dto.Board2;

public class BDetail2Command implements BCommand2 {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		Board2DAO c = new Board2DAO();
		Board2 dto = new Board2();
		dto = c.b2getInfo(bno);
		
		request.setAttribute("dto", dto);
		RequestDispatcher dispatcher = request.getRequestDispatcher("./board2/detail2.jsp");
		dispatcher.forward(request, response);
	}
}
