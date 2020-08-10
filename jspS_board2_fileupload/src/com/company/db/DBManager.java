package com.company.db;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBManager {
	// 1.멤버변수
	private static DBManager instanc = new DBManager();

	// 2.생성자
	public DBManager() {
		super();
	}

	// 3.멤버함수(getter/setter/getConnection)
	public static DBManager getInstanc() {
		return instanc;
	}

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/bigdata3");
			conn = ds.getConnection();
			System.out.println("LOG:DBCP - SUCCESS!!");
		} catch (Exception e) {
			System.out.println("LOG:DBCP - ERROR!");
		}
		return conn;
	}
}
