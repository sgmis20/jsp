package memberone;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class StudentDAO {

	private Connection getConnection() {
		
		Connection con = null;
		try {
			Context init = new InitialContext();
			DataSource ds =
					(DataSource)init.lookup("java:comp/env/jdbc/mydb");
			con = ds.getConnection();
		}catch(SQLException se) {
			System.err.println("Connection 생성 실패!!!");
		}
		
		return con;
	}
	
	
	
	
	
}
