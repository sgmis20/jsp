package com.company.mcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.dao.Member1DAO;

public class MDeleteCommand implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		System.out.println("==1");
		HttpSession session = request.getSession();
		System.out.println("==2");
		String userid = (String) session.getAttribute("userid");
		System.out.println("==3");

		Member1DAO dao = new Member1DAO();
		System.out.println("==4");
		int a = dao.m1delete(userid);
		System.out.println("==5");
		if (a > 0) {
			System.out.println("==6");
			session.invalidate();
			System.out.println("==7");
			out.write("<script>alert('삭제가 완료됐습니다.');</script>");
			System.out.println("==8");
			out.write("<meta http-equiv='refresh' content='0;url=index.jsp'>");
			System.out.println("==9");
		}
	}

}
