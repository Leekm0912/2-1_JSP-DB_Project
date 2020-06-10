<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
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
	width: 100%;
	margin: auto;
	text-align: center;
}
</style>
</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<div class="container">
			<jsp:include page="./layout/top.jsp" flush="false" />
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">
		<h1>매물 등록</h1>
		<form action="add_order.jsp" method="post">
			매물등록번호: <input type="text" name="address" size="5"> <br> 
		<%-- 일괄적으로 action 페이지에 전달한다. --%> 
		<input type="submit" value="입력완료">
		</form>
		<%
		Connection con = null;
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		/* 11g express edition은 orcl 대신 XE를 입력한다. */
		String userid = "MYDB";
		String pwd = "dongsu14";

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

		String query = "select * from 상세매물 order by 매물등록번호"; /* SQL 문 */
		try { /* 데이터베이스에 질의 결과를 가져오는 과정 */
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			List<Integer> row1 = new ArrayList<Integer>();
			List<String> row2 = new ArrayList<String>();
			List<String> row3 = new ArrayList<String>();
			List<String> row4 = new ArrayList<String>();
			List<Long> row5 = new ArrayList<Long>();
			while (rs.next()) {
				row1.add(rs.getInt(1));
				row2.add(rs.getString(2));
				row3.add(rs.getString(3));
				row4.add(rs.getString(4));
				row5.add(rs.getLong(5));
			}
		%>
		<table border='1'>
			<tr>
				<th>매물등록번호</th>
				<th>등록일자</th>
				<th>매도자명</th>
				<th>주소</th>
				<th>가격</th>
			</tr>
			<%
				DecimalFormat formatter = new DecimalFormat("###,###");
			for (int i = 0; i < row1.size(); i++) {
				out.print("<tr>");
				out.print("<td style='text-align:center;'>" + row1.get(i) + "</td>");
				out.print("<td>" + row2.get(i).substring(0, 11) + "</td>");
				out.print("<td style='text-align:center;'>" + row3.get(i) + "</td>");
				out.print("<td>" + row4.get(i) + "</td>");
				out.print("<td>" + formatter.format(row5.get(i)) + "원" + "</td>");

				out.print("</tr>");
			}
			%>
		</table>




		<%
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		%>
	</div>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.slim.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>



