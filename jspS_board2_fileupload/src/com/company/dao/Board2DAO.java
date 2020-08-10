package com.company.dao;

import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.company.db.DBManager;
import com.company.dto.Board2;

public class Board2DAO {
	public static Connection conn = null;
	public static PreparedStatement pstm = null;
	public static ResultSet rset = null;
	public static String sql = "";

	// DB연동
	public Board2DAO() {
		super();
	}

	void db() {
		conn = DBManager.getConnection();
	}

	// 1.전체글 내림차순
	public ArrayList<Board2> b2listAll() {
		db();
		System.out.println("listDB");
		ArrayList<Board2> list = new ArrayList<Board2>();
		try {
			sql = "select * from mvcboard2 order by bno desc";
			pstm = conn.prepareStatement(sql);
			rset = pstm.executeQuery();
			while (rset.next()) {
				list.add(new Board2(rset.getInt("bno"), rset.getString("btitle"), rset.getString("bname"),
						rset.getString("bdate"), rset.getInt("bhit"), rset.getString("bfile")));
			}
		} catch (Exception e) {
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
			}
		}
		return list;
	}

	// 2.전체글 개수
	public int b2listCount() {
		db();
		System.out.println("countDB");
		int a = -1;
		try {
			sql = "select count(*) from mvcboard2";
			pstm = conn.prepareStatement(sql);
			rset = pstm.executeQuery();
			if (rset.next()) {
				a = rset.getInt("count(*)");
			}
		} catch (Exception e) {
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
			}
		}
		return a;
	}

	// 3.글쓰기
	public int b2write(String bname, String bpass, String btitle, String bcontent, String bfile) {
		db();
		System.out.println("writeDB");
		int a = -1;
		try {
			sql = "insert into  mvcboard2  (bname, bpass, btitle, bcontent, bip, bdate, bfile) values (?, ?, ?, ?, ?, now(), ?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, bname);
			pstm.setString(2, bpass);
			pstm.setString(3, btitle);
			pstm.setString(4, bcontent);
			pstm.setString(5, InetAddress.getLocalHost().getHostAddress());
			pstm.setString(6, bfile);
			int result = pstm.executeUpdate();

			if (result > 0) {
				a = 1;
			}
		} catch (Exception e) {
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
			}
		}
		return a;
	}

	// 4.상세페이지
	public Board2 b2getInfo(int bno) {
		db();
		System.out.println("InfoDB");
		Board2 dto = new Board2();
		try {
			//조회수 업데이트 DAO
			String sqlhit = "update mvcboard2 set bhit = bhit+1 where bno=?";
			pstm = conn.prepareStatement(sqlhit);
			pstm.setInt(1, bno);
			int result = pstm.executeUpdate();
			if (result < 1) {
				System.out.println("조회수 올리기 실패!");
			}

			//해당 번호 정보 불러오기
			sql = "select * from mvcboard2 where  bno=?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, bno);
			rset = pstm.executeQuery();
			System.out.println("xxx1");
			if (rset.next()) {
				dto.setBno(bno);
				dto.setBname(rset.getString("bname"));
				dto.setBpass(rset.getString("bpass"));
				dto.setBtitle(rset.getString("btitle"));
				dto.setBcontent(rset.getString("bcontent").replace("<br>", "\r\n"));
				dto.setBfile(rset.getString("bfile"));
				dto.setBhit(rset.getInt("bhit"));
			}
		} catch (Exception e) {
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
			}
		}
		return dto;
	}

	// 5.패스워드 체크
	public int b2check(int bno, String bpass) {
		db();
		System.out.println("checkDB");
		int a = -1;
		String bpass2 = "";
		try {
			sql = "select bpass from  mvcboard2  where bno=?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, bno);
			rset = pstm.executeQuery();
			if (rset.next()) {
				bpass2 = rset.getString("bpass");
			}
			if (bpass.equals(bpass2)) {
				a=1;
			} 

		} catch (Exception e) {
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
			}
		}
		return a;
	}

	// 6.수정
	public int b2update(String btitle, String bcontent, String bfile, int bno) {
		db();
		System.out.println("updatDB");
		int a = -1;
		try {
			sql = "update  mvcboard2 set btitle=? , bcontent=?, bfile=? where bno=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, btitle);
			pstm.setString(2, bcontent);
			pstm.setString(3, bfile);
			pstm.setInt(4, bno);
			int result = pstm.executeUpdate();

			if (result > 0) {
				a = 1;
			}

		} catch (Exception e) {
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
			}
		}
		return a;
	}

	// 7.삭제
	public int b2delete(int bno) {
		db();
		System.out.println("deleteDB");
		int a = -1;
		try {
			sql = "delete from mvcboard2  where bno=?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, bno);
			int result = pstm.executeUpdate();

			if (result > 0) {
				a = 1;
			}

		} catch (Exception e) {
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
			}
		}
		return a;
	}

	// 8.조회수
	public int b2hit(int bno) {
		db();
		System.out.println("hitDB");
		int a = -1;
		try {
			sql = "update  mvcboard2  set  bhit=bhit+1  where  bno=?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, bno);
			int result = pstm.executeUpdate();

			if (result > 0) {
				a = 1;
			}
		} catch (Exception e) {
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
			}
		}
		return a;
	}
	
	// 9.페이징
	public ArrayList<Board2> b2list10(int startno, int onepagelimit) {
		db();
		System.out.println("b2list10");
		ArrayList<Board2> list = new ArrayList<Board2>();
		try {
			sql = "select * from mvcboard2 order by bno desc limit ?,?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, startno);
			pstm.setInt(2, onepagelimit);
			rset = pstm.executeQuery();
			while (rset.next()) {
				list.add(new Board2(rset.getInt("bno"), rset.getString("btitle"), rset.getString("bname"),
						rset.getString("bdate"), rset.getInt("bhit"), rset.getString("bfile")));
			}
			
		} catch (Exception e) {
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
			}
		}
		
		return list;
	}
	public ArrayList<Board2> b2best() {
		db();
		System.out.println("bestDB");
		ArrayList<Board2> list = new ArrayList<Board2>();
		try {
			sql = "select * from mvcboard2 order by bhit desc limit 0,5;";
			pstm = conn.prepareStatement(sql);
			rset = pstm.executeQuery();
			while (rset.next()) {
				list.add(new Board2(rset.getInt("bno"), rset.getString("btitle"), rset.getString("bname"),
						rset.getString("bdate"), rset.getInt("bhit"), rset.getString("bfile")));
			}
		} catch (Exception e) {
		} finally {
			try {
				if (rset != null) {
					rset.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
			}
		}
		return list;
	}
	
	
}
