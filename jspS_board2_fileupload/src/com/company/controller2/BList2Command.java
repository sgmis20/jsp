package com.company.controller2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.Board2DAO;
import com.company.dto.Board2;

public class BList2Command implements BCommand2 {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		Board2DAO dao = new Board2DAO();
		ArrayList<Board2> dto = dao.b2listAll();
		int listcount=dao.b2listCount();
		
		request.setAttribute("list2", dto);
		request.setAttribute("listcount", listcount);
		
	}
}
