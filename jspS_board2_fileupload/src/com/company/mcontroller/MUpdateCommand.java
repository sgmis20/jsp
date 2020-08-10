package com.company.mcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.dao.Board1DAO;
import com.company.dao.Member1DAO;

public class MUpdateCommand implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		String userpass = request.getParameter("userpass");
		String useremail = request.getParameter("useremail");
		String uesrpassre = request.getParameter("userpassre");
		String userpost = request.getParameter("userpost1")+"-"+request.getParameter("userpost2")+" / "+request.getParameter("address")+"　"+request.getParameter("address2");
		
		Member1DAO dao = new Member1DAO();
		int a = dao.m1update(userpass, useremail, userid, userpost);
		/*if (a > 0) {
			out.print("<script> alert ('게시물이 작성됐습니다.'); location.href='list.do'; </script>");
		}*/
		

	}

}
