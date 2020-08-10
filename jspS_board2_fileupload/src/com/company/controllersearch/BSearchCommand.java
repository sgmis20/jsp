package com.company.controllersearch;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.SearchDAO;
import com.company.dto.Board2;

public class BSearchCommand implements BCommand3Search {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		//String bname = request.getParameter("qbname");
		String usersearch = (String) request.getAttribute("usersearch");
		SearchDAO dao = new SearchDAO();
		Board2 dto = new Board2();
		dto = dao.search(usersearch);
		request.setAttribute("dto", dto);
	}
}



