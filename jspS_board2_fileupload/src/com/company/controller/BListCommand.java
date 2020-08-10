package com.company.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.Board1DAO;
import com.company.dto.Board1;

public class BListCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		Board1DAO dao = new Board1DAO();
		ArrayList<Board1> dto = dao.b1listAll();
		int listcount=dao.b1listCount();
		
		request.setAttribute("list1", dto);
		request.setAttribute("listcount", listcount);
		
		/*RequestDispatcher dispatcher = request.getRequestDispatcher("./board1/list.jsp");
		dispatcher.forward(request, response);*/
	}
}
