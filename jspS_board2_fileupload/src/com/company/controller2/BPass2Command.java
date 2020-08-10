package com.company.controller2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.Board2DAO;

public class BPass2Command implements BCommand2 {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String bcommand = request.getParameter("bcommand");
		String bpass = request.getParameter("bpass");
		
		
		
		Board2DAO d = new Board2DAO();
		int a = d.b2check(bno, bpass);
		if (a > 0) {
			out.print("<script>location.href='"+bcommand+"?bno="+bno+"'; </script>");
		} else {
			out.print("<script>alert('비밀번호를 다시 확인해주세요.'); location.href='pass_view2.do?bno="+bno+"&bcommand="+bcommand+"'; </script>");
		}

	}

}
