package com.company.dao;

import java.net.InetAddress;
import java.sql.*;

import com.company.db.DBManager;
import com.company.dto.Members1;

public class Member1DAO {
	public static Connection conn = null;
	public static PreparedStatement pstm = null;
	public static ResultSet rset = null;
	public static String sql = "";

	// DB연동
	public Member1DAO() {
		super();
	}

	void db() {
		conn = DBManager.getConnection();
	}

	// 1.회원가입
	public int m1join(String userid, String username, String userpass, String useremail, String userpost) {
		db();
		System.out.println("joinDB");
		int a = -1;
		try {
			sql = "insert into  members1  (userid, username, userpass, useremail, userip, userdate, userpost) values (?, ?, ?, ?, ?, now(), ?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, userid);
			pstm.setString(2, username);
			pstm.setString(3, userpass);
			pstm.setString(4, useremail);
			pstm.setString(5, InetAddress.getLocalHost().getHostAddress());
			pstm.setString(6, userpost);
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

	// 2.가입정보
	public Members1 m1join_info(String userid) {
		db();
		System.out.println("join_infoDB");
		Members1 dto = new Members1();
		try {
			String sql = "select * from members1 where userid=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, userid);
			rset = pstm.executeQuery();

			if (rset.next()) {
				dto.setUsername(rset.getString("username"));
				dto.setUserid(rset.getString("userid"));
				dto.setUserpass(rset.getString("userpass"));
				dto.setUseremail(rset.getString("useremail"));
				dto.setUserdate(rset.getString("userdate"));
				dto.setUserpost(rset.getString("userpost"));
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

	// 3.로그인
	public int m1login(String userid, String userpass) {
		db();
		int count = -1;
		System.out.println("loginDB");
		try {
			String sql = "select count(*) as count from members1 where userid=? and userpass=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, userid);
			pstm.setString(2, userpass);
			rset = pstm.executeQuery();
			if (rset.next()) {
				count = rset.getInt("count");
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
		return count;
	}
	// 4.업데이트 뷰
	public Members1 m1update_view(String userid) {
		db();
		System.out.println("update_viewDB");
		Members1 dto = new Members1();

		try {
			String sql = "select * from members1 where userid=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, userid);
			rset = pstm.executeQuery();
			if (rset.next()) {
				dto.setUsername(rset.getString("username"));
				dto.setUserid(rset.getString("userid"));
				dto.setUserpass(rset.getString("userpass"));
				dto.setUseremail(rset.getString("useremail"));
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
	// 5.업데이트
	public int m1update(String userpass, String useremail, String userid, String userpost) {
		db();
		int a = -1;
		System.out.println("update_viewDB");

		try {
			String sql = "update members1 set userpass=?, useremail=?, userip=?, userdate=now(), userpost=? where userid=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, userpass);
			pstm.setString(2, useremail);
			pstm.setString(3, InetAddress.getLocalHost().getHostAddress());
			pstm.setString(4, userpost);
			pstm.setString(5, userid); 
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
	// 6.삭제
	public int m1delete(String userid) {
		db();
		int a = -1;
		System.out.println("update_viewDB");

		try {
			String sql = "delete from members1 where userid=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, userid);
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
}
