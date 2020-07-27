package boardone;

import java.sql.*;

public class BoardDAO {

	private static BoardDAO instance = null;
	public BoardDAO() {}
	public static BoardDAO getInstance() {
		
		if(instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	}
	
	//--------------------------------------------------------
	// 게시판에 작성된 글을 데이터베이스에  저장하는 메소드 구현
	public void insertArticle(BoardVO article) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = article.getNum();
		int ref = article.getRef();
		int step = article.getStep();
		int depth= article.getDepth();
		
		int number = 0;
		
		String sql ="";
		
		try {
			
			con = ConnUtil.getConnection();
			pstmt = con.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next()) number = rs.getInt(1)+1;
			else number =1;
			
			if(num != 0) {// 답변 글일 경우
			sql ="update board set step=step+1 where ref=? and step > ?";	
			pstmt =con.prepareStatement(sql);	
		    pstmt.setInt(1, ref);		
			pstmt.setInt(2, step);
			pstmt.executeUpdate();
			step=step+1;
			depth=depth+1;
			}else {// 새글일 경우
				ref = number;
				step=0;
				depth =0;
			}
			// 새글을 추가하는 쿼리 작성
			sql ="insert into board(num, writer, email, subject,"
					+ " pass, regdate, ref, step, depth, content, ip) "
					+ "values(board_seq.nextval, ?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPass());
			pstmt.setTimestamp(5, article.getRegdate());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, step);
			pstmt.setInt(8, depth);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			pstmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); }catch(SQLException ss) {}
			if(pstmt != null) try { pstmt.close(); }catch(SQLException ss) {}
			if(con != null) try { con.close(); }catch(SQLException ss) {}
		}
	}// end insertArticle
	
	
	
	
	
	
	
	
}
