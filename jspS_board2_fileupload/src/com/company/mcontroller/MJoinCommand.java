package com.company.mcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.Member1DAO;

public class MJoinCommand implements MCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		//3-1 dao : 글쓰기 기능 (insert) - Write 고객으로부터 데이터를
		//1.데이터 받아오기
		//2.dao불러오기
		//3.성공 실패여부 확인
		//4.경로처리?
		String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		String userpass = request.getParameter("userpass");
		String useremail = request.getParameter("useremail");
		String userpost = request.getParameter("userpost1")+"-"+request.getParameter("userpost2")+" / "+request.getParameter("address")+"　"+request.getParameter("address2");
		
				
		Member1DAO dao = new Member1DAO();
		int a = dao.m1join(userid, username, userpass, useremail, userpost);
		request.setAttribute("userid", userid);		
		if (a > 0) {
			out.print("<script> alert ('회원가입이 완료됐습니다.'); location.href='index.do'; </script>");
		}
	}

}
