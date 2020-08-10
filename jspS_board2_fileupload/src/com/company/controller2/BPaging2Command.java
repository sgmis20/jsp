package com.company.controller2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.dao.Board2DAO;
import com.company.dto.Board2;

public class BPaging2Command implements BCommand2 {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Board2DAO dao = new Board2DAO();
		
		//1.전체 글 갯수
		int listcount=dao.b2listCount();
		
		//2.한 페이지에 보여줄 게시물의 수
		double onepagelimit = 10;
		
		//3.총 페이지 계산
			//전체글(listcount) / 한페이지에 보여줄 게시물의 수(onepagelimit)
		//rount / ceil / floor
		//정수 / 정수 10/3 정수 / 실수
		double pagetotal = Math.ceil(listcount / onepagelimit);
		System.out.println("1 - 348 : " + listcount);
		System.out.println("2 - 10 : " + onepagelimit);
		System.out.println("3 - 35 : " + pagetotal);
		
		//4.하단에 페이지 나누기 수
		// <= 1 2 3 4 5 6 7 8 9 10 =>
		double bottomlist = 10;

		//5.페이지의 스타트번호 지정 : 최신글부터 불러오기
		double pstartno = 0;
		if(request.getParameter("pstartno2")!=null) {
			pstartno = Integer.parseInt(request.getParameter("pstartno2"));
		}
		
		//6.최신글부터 10개씩 보여주기
		ArrayList<Board2> dtos = dao.b2list10((int)pstartno, (int)onepagelimit);
		
		//7.하단 index : 현재페이지 0~9 => 1페이지를 의미
		//현재페이지가 1 - 최신글부터 10개 0~9
		//현재페이지가 2 - 최신글부터 10개 10~19
		//11 12 13 14 15 16 [17] 18 19 20
		double current_page = current_page = Math.ceil((pstartno+1)/onepagelimit);
		
		//8.하단 index : 시작페이지 [0-1 10-2]
		// 0  -> 1?  0  / 10+1 = 오류발생하고 + 1
		// 10 -> 2?	 10 / 10+1 = 2
		// 20 -> 3?  20 / 10+1 = 3

		/*		
 		 * 선생님방법
		 * (0 + 1) = 1  =>  1/10 => 0.1 => Math.ceil(0.1) = 1
		 * (9 + 1) = 10 => 10/10 => 1.0 => Math.ceil(1.0) = 1
		 * =================================
		 * 10 => [2] 10+1 = 11 = 1.1 = Math.ceil(1.1) = 2
		 * 19 => [2] 19+1 = 20 = 2.0 = Math.ceil(1.1) = 2
		 * =================================
		 * 20/10 + 1
		
		11	17	20
		11	17	20
		
		0) -1	11-1		17-1			20-1
		1) 1/10 1.0			1.6				1.9
		2) floor(1.1)		floor(1.7)		floor(1.9)
		3) 1				1				1
		4) *bottomlist		1*bottomlist	1*bottomlist	1*10
		5) +1				11				11				11	
		*/
		
		double start_page = Math.floor((current_page-1)/bottomlist)*bottomlist + 1;
		//11 - Math.floor ((11-1) / 10) * 10 + 1
		//17 - Math.floor ((17-1) / 10) * 10 + 1
		//20 - Math.floor ((20-1) / 10) * 10 + 1
		//37 - Math.floor ((37-1) / 10) * 10 + 1 = 36/10 3.6 3 30 31
		
		//9.하단 index : 마지막페이지
		double end_page = start_page + bottomlist - 1;
		System.out.println(start_page +"/"+ current_page +"/"+ end_page);
		
		request.setAttribute("list2p", dtos);
		request.setAttribute("listcount2p", (int)listcount);
		request.setAttribute("onepagelimit2", (int)onepagelimit);
		request.setAttribute("pagetotal2", (int)pagetotal);
		request.setAttribute("bottomlist2", (int)bottomlist);
		request.setAttribute("pstartno2", (int)pstartno);
		request.setAttribute("current_page2", (int)current_page);
		request.setAttribute("start_page2", (int)start_page);
		request.setAttribute("end_page2", (int)end_page);
	}

}
