package com.company.mcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.dao.Member1DAO;
import com.company.dto.Members1;

public class MUpdate_ViewCommand implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		
		Member1DAO dao = new Member1DAO();
		Members1 dto = new Members1();
		dto = dao.m1update_view(userid);

		request.setAttribute("dto", dto);

	}

}
