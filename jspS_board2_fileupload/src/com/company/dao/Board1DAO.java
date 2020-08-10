package com.company.dao;

import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.company.db.DBManager;
import com.company.dto.Board1;
import com.company.dto.Board2;

public class Board1DAO {
	public static Connection conn = null;
	public static PreparedStatement pstm = null;
	public static ResultSet rset = null;
	public static String sql = "";

	// DB연동
	public Board1DAO() {
		super();
	}

	void db() {
		conn = DBManager.getConnection();
	}

	// 1.전체글 내림차순
	public ArrayList<Board1> b1listAll() {
		db();
		System.out.println("listDB");
		ArrayList<Board1> list = new ArrayList<Board1>();
		try {
			sql = "select * from mvcboard1 order by bno desc";
			pstm = conn.prepareStatement(sql);
			rset = pstm.executeQuery();
			while (rset.next()) {
				list.add(new Board1(rset.getInt("bno"), rset.getString("btitle"), rset.getString("bname"),
						rset.getString("bdate"), rset.getInt("bhit")));
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
	public int b1listCount() {
		db();
		System.out.println("countDB");
		int a = -1;
		try {
			sql = "select count(*) from mvcboard1";
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
	public int b1write(String bname, String bpass, String btitle, String bcontent) {
		db();
		System.out.println("writeDB");
		int a = -1;
		try {
			sql = "insert into  mvcboard1  ( bname, bpass, btitle, bcontent, bip, bdate) values (?, ?, ?, ?, ?, now())";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, bname);
			pstm.setString(2, bpass);
			pstm.setString(3, btitle);
			pstm.setString(4, bcontent);
			pstm.setString(5, InetAddress.getLocalHost().getHostAddress());
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
	public Board1 b1getInfo(int bno) {
		db();
		System.out.println("InfoDB");
		Board1 dto = new Board1();
		try {
			//조회수 업데이트 DAO
			String sqlhit = "update mvcboard1 set bhit = bhit+1 where bno=?";
			pstm = conn.prepareStatement(sqlhit);
			pstm.setInt(1, bno);
			int result = pstm.executeUpdate();
			if (result < 1) {
				System.out.println("조회수 올리기 실패!");
			}

			//해당 번호 정보 불러오기
			sql = "select * from mvcboard1   where  bno=?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, bno);
			rset = pstm.executeQuery();

			if (rset.next()) {
				dto.setBno(bno);
				dto.setBname(rset.getString("bname"));
				dto.setBpass(rset.getString("bpass"));
				dto.setBtitle(rset.getString("btitle"));
				dto.setBcontent(rset.getString("bcontent").replace("<br>", "\r\n"));
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
	public int b1check(int bno, String bpass) {
		db();
		System.out.println("checkDB");
		int a = -1;
		String bpass2 = "";
		try {
			sql = "select bpass from  mvcboard1  where bno=?";
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
	public int b1update(String btitle, String bcontent, int bno) {
		db();
		System.out.println("updatDB");
		int a = -1;
		try {
			sql = "update  mvcboard1 set btitle=? , bcontent=? where bno=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, btitle);
			pstm.setString(2, bcontent);
			pstm.setInt(3, bno);
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
	public int b1delete(int bno) {
		db();
		System.out.println("deleteDB");
		int a = -1;
		try {
			sql = "delete from mvcboard1  where bno=?";
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
	public int b1hit(int bno) {
		db();
		System.out.println("hitDB");
		int a = -1;
		try {
			sql = "update  mvcboard1  set  bhit=bhit+1  where  bno=?";
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
		public ArrayList<Board1> b1list10(int startno, int onepagelimit) {
			db();
			System.out.println("b1list10");
			ArrayList<Board1> list = new ArrayList<Board1>();
			try {
				sql = "select * from mvcboard1 order by bno desc limit ?,?";
				pstm = conn.prepareStatement(sql);
				pstm.setInt(1, startno);
				pstm.setInt(2, onepagelimit);
				rset = pstm.executeQuery();
				while (rset.next()) {
					list.add(new Board1(rset.getInt("bno"), rset.getString("btitle"), rset.getString("bname"),
							rset.getString("bdate"), rset.getInt("bhit")));
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
