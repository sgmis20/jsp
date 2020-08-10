package com.company.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.SendResult;

import com.company.controller.BCommand;
import com.company.controller.BDeleteCommand;
import com.company.controller.BDetailCommand;
import com.company.controller.BListCommand;
import com.company.controller.BPagingCommand;
import com.company.controller.BPassCommand;
import com.company.controller.BUpdateCommand;
import com.company.controller.BUpdateViewCommand;
import com.company.controller.BWriteCommand;
import com.company.controller2.BBest2Command;
import com.company.controller2.BCommand2;
import com.company.controller2.BDelete2Command;
import com.company.controller2.BDetail2Command;
import com.company.controller2.BList2Command;
import com.company.controller2.BPaging2Command;
import com.company.controller2.BPass2Command;
import com.company.controller2.BUpdate2Command;
import com.company.controller2.BUpdateView2Command;
import com.company.controller2.BWrite2Command;
import com.company.controllersearch.BCommand3Search;
import com.company.controllersearch.BSearchCommand;
import com.company.dto.Board2;
import com.company.mcontroller.MLogoutCommand;
import com.company.mcontroller.MMypageCommand;
import com.company.mcontroller.MUpdateCommand;
import com.company.mcontroller.MUpdate_ViewCommand;
import com.company.mcontroller.MCommand;
import com.company.mcontroller.MDeleteCommand;
import com.company.mcontroller.MJoinCommand;
import com.company.mcontroller.MJoin_InfoCommand;
import com.company.mcontroller.MLogin;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BFrontControllerTest
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionTest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionTest(request, response);
	}

	private void actionTest(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException, ServletException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 설계도 시작
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		//System.out.println("=1 : " + uri);
		// =1 : /jspS_board2_fileupload/*.test

		String context = request.getContextPath();
		//System.out.println("=2 : " + context);
		// =2 : /jspS_board2_fileupload

		String command = uri.substring(context.length());
		//System.out.println("=3 : " + command);
		// =3 : /*.test

		// list.test
		// write.test
		// update.test
		try {
			
			//DAO START
			/*if (command.equals("/test.do")){
				Board2DAO a = new Board2DAO();
				System.out.println(a.b1listCount());
				
				Board2DAO b = new Board2DAO();
				System.out.println(b.b1write("이름","1234","제목1","내용1","file"));
				
				Board2DAO c = new Board2DAO();
				System.out.println(c.b1getInfo(2));
				
				Board2DAO d = new Board2DAO();
				System.out.println(d.b1check(2,"pass"));
				
				Board2DAO e = new Board2DAO();
				System.out.println(e.b1update("제목", "내용", 2));
				
				Board2DAO f = new Board2DAO();
				System.out.println(f.b1delete(1));
				
				Board2DAO g = new Board2DAO();
				System.out.println(g.b1hit(2));
				
			}*/
			
			BCommand controller = null;
			if (command.equals("/list.do")) {
				System.out.println("ㅁlist");
				//1-2 list.jsp로 페이지 넘기기
				//1-1 dao : 전체글 가져오기
				/*controller = new BListCommand();
				controller.execute(request, response);*/
				
				controller = new BPagingCommand();
				controller.execute(request, response);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("./board1/list.jsp");
				dispatcher.forward(request, response);
				
				
			} else if (command.equals("/write_view.do")) {
				System.out.println("ㅁwrite_view");
				//2-1 dao : x
				//2-2 write.jsp로 페이지 넘기기
				response.sendRedirect(request.getContextPath() + "/board1/write.jsp");
				
				
			} else if (command.equals("/write.do")) {
				System.out.println("ㅁwrite");
				//3-1 dao : 글쓰기 기능 (insert) - 1데이터 받아오기 2.DAO불러오기 3.DAO삽입매서드 불르기 4.성공여부 확인
				//3-2 list.jsp로 페이지 넘기기
				controller = new BWriteCommand();
				controller.execute(request, response);
				
				
			} else if (command.equals("/detail.do")) {
				System.out.println("ㅁdetail");
				//4-1 dao : 해당글번호의 데이터 가져오기  1.bno받기 2.dao연결 3.c.b1getInfo(2) 4.성공여부 확인
				//4-1 detail.jsp로 페이지 넘기기
				controller = new BDetailCommand();
				controller.execute(request, response);
			
				
			} else if (command.equals("/pass_view.do")) {
				System.out.println("ㅁpass_view");
				//5-1 dao : x
				//5-2 detail.jsp로 페이지 넘기기
				request.setAttribute("bno", request.getParameter("bno"));
				request.setAttribute("bconmmand", request.getParameter("bcommand"));
				RequestDispatcher dispatcher = request.getRequestDispatcher("./board1/pass.jsp");
				dispatcher.forward(request, response);
				
				
			} else if (command.equals("/pass.do")) {
				System.out.println("ㅁpass");
				//6-1 dao : 해당유저인지 판단 1.bno, command 받기 2.dao연결 3.d.b1check(2) 4.성공여부 확인
				//6-2 command(delete.do / update_view.do)경로로
				controller = new BPassCommand();
				controller.execute(request, response);
				
				
			} else if (command.equals("/delete.do")) {
				System.out.println("ㅁdelete");
				//7-1 dao : 삭제기능 1.dao연결 2.성공여부 확인 3.삭제
				//7-2 삭제후 list.jsp로
				controller = new BDeleteCommand();
				controller.execute(request, response);
				
								
			} else if (command.equals("/update_view.do")) {
				System.out.println("ㅁupdate_view");
				//8-1 dao : 해당글 가져와서 수정가능하게 데이터채우기 1.bno받기 2.dao연결 3.c.b1getInfo(2) 4.성공여부 확인
				//8-2 modify.jsp로 파일 넘기기
				controller = new BUpdateViewCommand();
				controller.execute(request, response);

				
			} else if (command.equals("/update.do")) {
				System.out.println("ㅁupdate");
				//9-1 dao : 해당글번호의 데이터 수정하기 1데이터 받아오기 2.DAO불러오기 3.DAO삽입매서드 불르기 4.성공여부 확인
				//9-2 detail.jsp로 파일 넘기기
				controller = new BUpdateCommand();
				controller.execute(request, response);
				
				
			}
			
			//////////////////////////////////////////////////////////////////////////////////////////////////////
			//////////////////////////////////////////////////////////////////////////////////////////////////////
			BCommand2 controller2 = null;
			if (command.equals("/list2.do")) {
				System.out.println("ㅁlist2");
				//1-2 list.jsp로 페이지 넘기기
				//1-1 dao : 전체글 가져오기
				/*controller2 = new BList2Command();
				controller2.execute(request, response);*/

				controller2 = new BPaging2Command();
				controller2.execute(request, response);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("./board2/list2.jsp");
				dispatcher.forward(request, response);
				//response.sendRedirect(request.getContextPath() + "/board2/list2.jsp");

			
			} else if (command.equals("/write_view2.do")) {
				System.out.println("ㅁwrite_view2");
				//2-1 dao : x
				//2-2 write.jsp로 페이지 넘기기
				response.sendRedirect(request.getContextPath() + "/board2/write2.jsp");

			
			} else if (command.equals("/write2.do")) {
				System.out.println("ㅁwrite2");
				//3-1 dao : 글쓰기 기능 (insert) - 1데이터 받아오기 2.DAO불러오기 3.DAO삽입매서드 불르기 4.성공여부 확인
				//3-2 list.jsp로 페이지 넘기기
				controller2 = new BWrite2Command();
				controller2.execute(request, response);
			
				
			} else if (command.equals("/detail2.do")) {
				System.out.println("ㅁdetail2");
				//4-1 dao : 해당글번호의 데이터 가져오기  1.bno받기 2.dao연결 3.c.b1getInfo(2) 4.성공여부 확인
				//4-1 detail.jsp로 페이지 넘기기
				controller2 = new BDetail2Command();
				controller2.execute(request, response);
				//response.sendRedirect(request.getContextPath() + "/board2/detail2.jsp");

			
			} else if (command.equals("/pass_view2.do")) {
				System.out.println("ㅁpass_view2");
				//5-1 dao : x
				//5-2 detail.jsp로 페이지 넘기기
				request.setAttribute("bno", request.getParameter("bno"));
				request.setAttribute("bconmmand", request.getParameter("bcommand"));
				RequestDispatcher dispatcher = request.getRequestDispatcher("./board2/pass2.jsp");
				dispatcher.forward(request, response);

				
			} else if (command.equals("/pass2.do")) {
				System.out.println("ㅁpass");
				//6-1 dao : 해당유저인지 판단 1.bno, command 받기 2.dao연결 3.d.b1check(2) 4.성공여부 확인
				//6-2 command(delete.do / update_view.do)경로로
				controller2 = new BPass2Command();
				controller2.execute(request, response);

			
			} else if (command.equals("/delete2.do")) {
				System.out.println("ㅁdelete2");
				//7-1 dao : 삭제기능 1.dao연결 2.성공여부 확인 3.삭제
				//7-2 삭제후 list.jsp로
				controller2 = new BDelete2Command();
				controller2.execute(request, response);
				//response.sendRedirect(request.getContextPath() + "/board2/update2.jsp");

			
			} else if (command.equals("/update_view2.do")) {
				System.out.println("ㅁupdate_view");
				//8-1 dao : 해당글 가져와서 수정가능하게 데이터채우기 1.bno받기 2.dao연결 3.c.b1getInfo(2) 4.성공여부 확인
				//8-2 modify.jsp로 파일 넘기기
				controller2 = new BUpdateView2Command();
				controller2.execute(request, response);

			
			} else if (command.equals("/update2.do")) {
				System.out.println("ㅁupdate2");
				//9-1 dao : 해당글번호의 데이터 수정하기 1데이터 받아오기 2.DAO불러오기 3.DAO삽입매서드 불르기 4.성공여부 확인
				//9-2 detail.jsp로 파일 넘기기
				controller2 = new BUpdate2Command();
				controller2.execute(request, response);

				
			} 
			
			if (command.equals("/index.do")) {
				System.out.println("ㅁindex");
				//9-1 dao : 해당글번호의 데이터 수정하기 1데이터 받아오기 2.DAO불러오기 3.DAO삽입매서드 불르기 4.성공여부 확인
				//9-2 detail.jsp로 파일 넘기기
				
				/*기본리스트(전체)
				 * controller = new BListCommand();
				controller.execute(request, response);*/
				/*controller2 = new BList2Command();
				controller2.execute(request, response);*/
				
				controller2 = new BBest2Command();
				controller2.execute(request, response);
				
				controller = new BPagingCommand();
				controller.execute(request, response);
				
				controller2 = new BPaging2Command();
				controller2.execute(request, response);
				
				String viewPage = "./main/main.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			}
			
			BCommand3Search controlsearch = null;
			if(command.equals("/search.do")){
				System.out.println("ㅁsearch");
				
				request.setAttribute("usersearch", request.getParameter("usersearch"));
				
				controlsearch = new BSearchCommand();
				controlsearch.execute(request, response);
				Board2 a = (Board2)request.getAttribute("dto");
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("./search/search.jsp");
				dispatcher.forward(request, response);
			}
			
			
			MCommand mcontroller = null;
			if(command.equals("/join.do")){
				System.out.println("ㅁjoin");
				mcontroller = new MJoinCommand();
				mcontroller.execute(request, response);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/join_info.do");
				dispatcher.forward(request, response);
			} else if (command.equals("/join_info.do")) {
				System.out.println("ㅁjoin_info");
				mcontroller = new MJoin_InfoCommand();
				mcontroller.execute(request, response);

				RequestDispatcher dispatcher = request.getRequestDispatcher("./members/join_info.jsp");
				dispatcher.forward(request, response);
				
			} else if (command.equals("/login.do")) {
				System.out.println("ㅁlogin");
				mcontroller = new MLogin();
				mcontroller.execute(request, response);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/index.do");
				dispatcher.forward(request, response);

			} else if (command.equals("/logout.do")) {
				System.out.println("ㅁlogout");
				mcontroller = new MLogoutCommand();
				mcontroller.execute(request, response);

				RequestDispatcher dispatcher = request.getRequestDispatcher("/index.do");
				dispatcher.forward(request, response);
				
			} else if (command.equals("/mypage.do")) {
				System.out.println("ㅁmypage");
				mcontroller = new MMypageCommand();
				mcontroller.execute(request, response);

				RequestDispatcher dispatcher = request.getRequestDispatcher("./members/MyPage.jsp");
				dispatcher.forward(request, response);
				
				
			} else if (command.equals("/mupdate_view.do")) {
				System.out.println("ㅁmupdate_view");
				mcontroller = new MUpdate_ViewCommand();
				mcontroller.execute(request, response);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("./members/MyUpdate.jsp");
				dispatcher.forward(request, response);

				
			} else if (command.equals("/mupdate.do")) {
				System.out.println("ㅁmupdate");
				mcontroller = new MUpdateCommand();
				mcontroller.execute(request, response);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/mypage.do");
				dispatcher.forward(request, response);

				
			}else if (command.equals("/mdelete.do")) {
				System.out.println("ㅁmdelete");
				mcontroller = new MDeleteCommand();
				mcontroller.execute(request, response);
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/index.do");
				dispatcher.forward(request, response);

				
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
