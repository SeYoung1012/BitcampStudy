package jdbc.store.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UtilZip {
	

	public static final String DRIVER = "oracle.jdbc.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "PJ2";
	private static final String PASSWORD = "pj2";

	// static 초기화 구문
	static {
		// 1. JDBC 드라이버 로딩
		try {
			Class.forName(DRIVER);
			System.out.println(">>JDBC 드라이버 로딩 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("[예외발생] 드라이버 로딩 실패!!");

		}

	}
	public static Connection getConnection() {

		try {
			return DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;

	}

	public static void close(Connection conn, PreparedStatement pstmt) {

		try {
			if (pstmt != null)
				pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static  void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		
		try {
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(conn, pstmt);
	}

}
	
	
	


