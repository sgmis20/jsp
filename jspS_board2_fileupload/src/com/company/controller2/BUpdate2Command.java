package com.company.controller2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.Board2DAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BUpdate2Command implements BCommand2 {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		int uploadFileSizeLimit = 5*1024*1024;
		//String uploadFilePath = "c:\\upload";
		String uploadFilePath = "/usr/local/upload";
		try {
		MultipartRequest multi
		=new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, "utf-8" , new DefaultFileRenamePolicy());
		String bfile = multi.getFilesystemName("bfile");
		String btitle = multi.getParameter("btitle");
		String bcontent = multi.getParameter("bcontent");
		int bno = Integer.parseInt(request.getParameter("bno"));
		if(bfile==null) {
			System.out.println("파일이 없습니다.");
			bfile=multi.getParameter("dbfile");
		} else {
			System.out.println(bfile+bno+btitle+bcontent);
		}
		Board2DAO b = new Board2DAO();
		b.b2update(btitle, bcontent, bfile, bno);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/detail2.do?bno="+bno);
		dispatcher.forward(request, response);
		
		
		}catch(Exception e) {
			
		}
	}

}
