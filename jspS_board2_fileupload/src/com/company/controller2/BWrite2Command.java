package com.company.controller2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.Board2DAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BWrite2Command implements BCommand2 {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		//1. 업파일 용량 지정(5MG)
		int uploadFileSizeLimit = 5*1024*1024;
		//2.저장할 디렉토리[SERVER]-[SERVER.XML]
		String uploadFilePath = "c:\\upload";
		//String uploadFilePath = "/usr/local/upload";
		//3.FileUpload객체
		MultipartRequest multi
		=new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, "utf-8" , new DefaultFileRenamePolicy());
		String bfile = multi.getFilesystemName("bfile");
		
		//3-1 dao : 글쓰기 기능 (insert) - Write 고객으로부터 데이터를
		//1.데이터 받아오기
		//2.dao불러오기
		//3.성공 실패여부 확인
		//4.경로처리?
		
		String bname = multi.getParameter("bname");
		String bpass = multi.getParameter("bpass");
		String btitle = multi.getParameter("btitle");
		String bcontent = multi.getParameter("bcontent");

		Board2DAO b = new Board2DAO();
		
		request.setAttribute("a", b.b2write(bname,bpass,btitle,bcontent,bfile));
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list2.do");
		dispatcher.forward(request, response);
	}
}
