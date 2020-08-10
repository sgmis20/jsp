package com.company.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.company.db.DBManager;
import com.company.dto.Board2;

public class SearchDAO {
	public static Connection conn = null;
	public static PreparedStatement pstm = null;
	public static ResultSet rset = null;
	public static String sql = "";

	public SearchDAO() {
		super();
	}

	void db() {
		conn = DBManager.getConnection();
	}

	public Board2 search(String usersearch) {
		db();
		System.out.println("SearchDB");
		Board2 dto = new Board2(); 
		try {
			/*sql = "select * from mvcboard2 where btitle like %?%";*/
			sql = "select * from mvcboard2 where btitle like ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, usersearch);
			
			rset = pstm.executeQuery();
			
			if (rset.next()) {
				dto.setBno(rset.getInt("bno"));
				dto.setBname(rset.getString("bname"));
				dto.setBpass(rset.getString("bpass"));
				dto.setBtitle(rset.getString("btitle"));
				dto.setBdate(rset.getString("bdate"));
				dto.setBcontent(rset.getString("bcontent").replace("<br>", "\r\n"));
				dto.setBfile(rset.getString("bfile"));
				dto.setBhit(rset.getInt("bhit"));
			}
		} catch (Exception e) {} finally {try {if (rset != null) {rset.close();} if (pstm != null) {pstm.close();} if (conn != null) {conn.close();}} catch (Exception e) {}}
		return dto;
	}

}
