<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Bare - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
table, td {
	border: 1px solid black
}

table {
	width: 50%;
	margin: auto;
	text-align: center;
}
</style>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<div class="container">
			<jsp:include page="./layout/top.jsp" flush="false" />
		</div>
	</nav>
	<h1 style="text-align: center;">주문이 정상적으로 처리되었습니다.</h1>
	<h1 style="text-align: center;">주문한 매물 목록</h1>
	<%
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String userid = "MYDB";
	String pwd = "dongsu14";
	String query = "";
	Statement stmt = null;
	ResultSet rs = null;
	try { /* 드라이버를 찾는 과정 */
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("드라이버 로드 성공");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	try { /* 데이터베이스를 연결하는 과정 */
		System.out.println("데이터베이스 연결 준비 ...");
		con = DriverManager.getConnection(url, userid, pwd);
		System.out.println("데이터베이스 연결 성공");
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	//query = "select * from 주문 where 매수자이름=" + "'" + name + "'"; /* SQL 문 */
	String userID = (String) session.getAttribute("userID");
	query = "select 매수자_이름, 매도자_이름, 매물_등록번호 from 주문, 매수자, 매도자 where 주문.매도자id = 매도자.id and 주문.매수자id = 매수자.id and 매수자.id = " + "'" + userID + "'";
	try { /* 데이터베이스에 질의 결과를 가져오는 과정 */
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		List<String> row1 = new ArrayList<String>();
		List<String> row2 = new ArrayList<String>();
		List<Integer> row3 = new ArrayList<Integer>();
		while (rs.next()) {
			row1.add(rs.getString(1));
			row2.add(rs.getString(2));
			row3.add(rs.getInt(3));
		}
	%>
	<table border='1'>
		<tr>
			<th>매수자이름</th>
			<th>매도자이름</th>
			<th>매물등록번호</th>
		</tr>
		<%
			for (int i = 0; i < row1.size(); i++) {
			out.print("<tr>");
			out.print("<td style='text-align:center;'>" + row1.get(i) + "</td>");
			out.print("<td>" + row2.get(i) + "</td>");
			out.print("<td style='text-align:center;'>" + row3.get(i) + "</td>");
			out.print("</tr>");
		}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		%>
	</table>
</body>