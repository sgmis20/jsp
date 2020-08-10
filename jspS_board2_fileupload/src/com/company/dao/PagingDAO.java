package com.company.dao;

import java.sql.*;
import java.util.ArrayList;

import com.company.db.DBManager;
import com.company.dto.Board2;

public class PagingDAO {
	public static Connection conn = null;
	public static PreparedStatement pstm = null;
	public static ResultSet rset = null;
	public static String sql = "";

	// DB연동
	public PagingDAO() {
		super();
	}

	void db() {
		conn = DBManager.getConnection();
	}
	
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
}
