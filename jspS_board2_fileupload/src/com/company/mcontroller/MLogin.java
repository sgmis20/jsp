package com.company.mcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.company.dao.Member1DAO;

public class MLogin implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();

		String userid = request.getParameter("userid");
		String userpass = request.getParameter("userpass");
		String remem = request.getParameter("remem");
		// 단1명인지 확인하기위한 변수선언

		Member1DAO dao = new Member1DAO();
		int count = dao.m1login(userid, userpass);

		if (count >= 1) {
			if (remem != null) {
				remem = "remem";
			}
			out.print("<script> alert('" + userid + "님 환영합니다.');</script>");

			Cookie cookie0 = new Cookie("userid", userid);
			Cookie cookie1 = new Cookie("remem", remem);

			cookie0.setMaxAge(1 * 60 * 60 * 24);
			cookie1.setMaxAge(1 * 60 * 60 * 24);

			response.addCookie(cookie0);
			response.addCookie(cookie1);

			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);

			// request.setAttribute("userid", userid);
			// RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			// dispatcher.forward(request, response);
			out.print("<meta http-equiv='refresh' content='0;url=index.jsp'>");

		} else {
			out.print("<script> alert ('아이디와 패스워드를 확인해주세요.');</script>");
			out.print("<meta http-equiv='refresh' content='0;url=members/login.jsp'>");
		}
	}

}
