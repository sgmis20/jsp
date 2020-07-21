package jdbc;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnUtil {

	public Connection getConnection() {

		Connection con = null;

		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mydb");

			con = ds.getConnection();

		} catch (Exception e) {
			System.out.println("Connection 생성 실패");
		}

		return con;
	}

}
