package com.codejohns;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class upload
 */
@WebServlet("/upload.do")
public class upload001 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public upload001() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("text/html; charset=utf-8");
		//1.업로드파일 용량지정(5MG)
		int uploadFileSizeLimit = 5*1024*1024;
		//2.저장할 디렉토리[SERVER]-[SERVER.XML]
		String uploadFilePath = "c:\\upload";
		//3.FileUpload객체
		//- MultipartRequest(request요청, 저장위치, 용량, 인코딩방법, 동일한 파일이름시 처리방법)
		System.out.println("zzz");
		MultipartRequest multi
		= new MultipartRequest(request, //request요청 
							   uploadFilePath, //저장위치 
							   uploadFileSizeLimit, //용량
							   "utf-8", //인코딩방법
							   new DefaultFileRenamePolicy() //input type="file" name=""
							  );
		System.out.println("zzz");
		String filename = multi.getFilesystemName("uploadFile"); //input type="file" name=""
		System.out.println("zzz");
		
		if(filename == null) {//파일이 업로드되지 않음.
			System.out.println("ㅁㅁㅁㅁㅁ 파일이 업로드되지 않음.");
		} else {
			System.out.println("zzz");
			// 앞에 폼에서 넘겨준 데이터를 result.jsp파일로 넘겨주려고함.
			String name = multi.getParameter("name");
			System.out.println("zzz");
			String title = multi.getParameter("title");
			System.out.println("zzz");
			request.setAttribute("name", name);
			System.out.println("zzz");
			request.setAttribute("title", title);
			System.out.println("zzz");
			request.setAttribute("filename", filename);
			System.out.println("zzz");
			RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
			System.out.println("zzz");
			dispatcher.forward(request, response);
			System.out.println("zzz!!");
		}
	}
}
