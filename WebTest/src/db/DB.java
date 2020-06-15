package db;

import java.sql.*;
import java.io.*;
import java.sql.CallableStatement;
import java.util.*;

public class DB {
	public Connection con = null;
	
	private DB(){
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		/* 11g express edition은 orcl 대신 XE를 입력한다. */
		String userid = "MYDB";
		String pwd = "dongsu14";

		try { /* 드라이버를 찾는 과정 */
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//System.out.println("드라이버 로드 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try { /* 데이터베이스를 연결하는 과정 */
			//System.out.println("데이터베이스 연결 준비 ...");
			con = DriverManager.getConnection(url, userid, pwd);
			//System.out.println("데이터베이스 연결 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static DB getDB() {
		return new DB();
	}
}
