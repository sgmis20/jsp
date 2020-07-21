package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class tempMemberDAO {

	private final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
	private final String USER = "SCOTT";
	private final String PASS = "tiger";

	public tempMemberDAO() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch (Exception e) {
			System.out.println("Error : JDBC 드라이버 로딩 실패");
		}
	}

	public Vector<tempMemberVO> getMemberList() {

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		Vector<tempMemberVO> vecList = new Vector<tempMemberVO>();

		try {

			con = DriverManager.getConnection(JDBC_URL, USER, PASS);
			String strQuery = "SELECT * FROM tempMember";
			stmt = con.createStatement();
			rs = stmt.executeQuery(strQuery);

			while (rs.next()) {
				tempMemberVO vo = new tempMemberVO();
				vo.setId(rs.getString("id"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setName(rs.getString("name"));
				vo.setMem_num1(rs.getString("mem_num1"));
				vo.setMem_num2(rs.getString("mem_num2"));
				vo.setEmail(rs.getString("e_mail"));
				vo.setPhone(rs.getString("phone"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setAddress(rs.getString("address"));
				vo.setJob(rs.getString("job"));

				vecList.add(vo);
			}

		} catch (Exception ex) {
			System.out.println("Exception :" + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			;
			if (stmt != null)
				try {
					stmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			;
			if (con != null)
				try {
					con.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			;
		}
		return vecList;
	}

}
