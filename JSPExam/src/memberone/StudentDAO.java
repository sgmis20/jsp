package memberone;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StudentDAO {

	// DB 연결 메소드
	private Connection getConnection() {

		Connection conn = null;
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mydb");
			conn = ds.getConnection();
		} catch (Exception se) {
			System.err.println("Connection 생성 실패!!!");
		}

		return conn;
	}

	// ID 체크 메소드
	public boolean idCheck(String id) {
		boolean result = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from student where id =?");

			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (!rs.next())
				result = false;
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException se) {
				}

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException se) {
				}

			if (conn != null)
				try {
					conn.close();
				} catch (SQLException se) {
				}

		}

		return result;
	}

	// 우편번호 디비검색해서 Vector 저장할 메소드
	public Vector<ZipCodeVO> zipcodeRead(String dong) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<ZipCodeVO> vecList = new Vector<ZipCodeVO>();

		try {

			conn = getConnection();

			String strQuery = "select * from zipcode where dong like '" + dong + "%'";

			pstmt = conn.prepareStatement(strQuery);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				ZipCodeVO tempZipcode = new ZipCodeVO();
				tempZipcode.setZipcode(rs.getString("zipcode"));
				tempZipcode.setSido(rs.getString("sido"));
				tempZipcode.setGugun(rs.getString("gugun"));
				tempZipcode.setDong(rs.getString("dong"));
				tempZipcode.setRi(rs.getString("ri"));
				tempZipcode.setBunji(rs.getString("bunji"));

				vecList.addElement(tempZipcode);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException se) {
				}

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException se) {
				}

			if (conn != null)
				try {
					conn.close();
				} catch (SQLException se) {
				}
		}
		return vecList;
	}

}
