<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- JDBC 프로그램으로 DB 데이터 가져와서 화면출력 --%>
<%
	//JDBC 프로그램을 위한 변수 선언
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//사용할 SQL 쿼리 작성
	String sql = "";
	sql += "SELECT SABUN, NAME, REGDATE, PAY ";
	sql += "  FROM GUEST ";
	sql += " ORDER BY SABUN ";
	
	//인원수 
	int cnt = 0;
	
	
%>    

    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 전체 목록</title>
</head>
<body>

	<h1> 사원목록</h1>
	<table border>
		<thead>
			<tr>
				<th>사번</th>
				<th>성명</th>
				<th>날짜</th>
				<th>금액</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
			<%--
			<tr>
			<td>1111</td>
			<td>USER1</td>
			<td>2021/09/26</td>
			<td>1000</td>
			<td>상세보기</td>
			</tr>
			--%>
			
<%
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. DB연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		//4. 쿼리실행
		rs = pstmt.executeQuery();
		//5. 쿼리 실행 결과에 대한 처리
		while (rs.next()) { %>
			<tr>
				<td><%=rs.getInt("SABUN") %></td>
				<td><%=rs.getString("NAME") %></td>
				<td><%=rs.getDate("REGDATE") %></td>
				<td><%=rs.getInt("PAY") %></td>
				<td>
				<a href = "detail.jsp?sabun=<%=rs.getInt("SABUN") %>">상세보기 </a>
				
				</td>
			</tr>
<%			
		} //end while
		
		rs.close();
		//전체 데이터 건수 확인
		rs = pstmt.executeQuery("SELECT COUNT (*) AS CNT FROM GUEST");
		if(rs.next()) {
			cnt = rs.getInt("CNT");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>			
		</tbody>
		
	</table>
	<p>전체인원 : <%=cnt %></p>
	<p><a href = "addForm.jsp"> 사원등록</a></p>
	
</body>
</html>