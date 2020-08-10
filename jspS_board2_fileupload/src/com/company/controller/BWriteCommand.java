package com.company.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.Board1DAO;

public class BWriteCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();
		
		//3-1 dao : 글쓰기 기능 (insert) - Write 고객으로부터 데이터를
		//1.데이터 받아오기
		//2.dao불러오기
		//3.성공 실패여부 확인
		//4.경로처리?
		
		String bname = request.getParameter("bname");
		String bpass = request.getParameter("bpass");
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		
		Board1DAO b = new Board1DAO();
		int a = b.b1write(bname,bpass,btitle,bcontent);
		if (a > 0) {
			out.print("<script> alert ('게시물이 작성됐습니다.'); location.href='list.do'; </script>");
		}
	}
}
