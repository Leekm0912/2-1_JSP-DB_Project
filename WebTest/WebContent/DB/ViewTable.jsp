<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="db.DB" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>연암 부동산</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="mycss.css" rel="stylesheet">
<style type="text/css">


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
		<h1 style="text-align:center;">전체 매물 보기</h1>
		<%
		request.setCharacterEncoding("utf-8");
		Connection con = DB.getDB().con;
		
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
		<table class="type1">
			<tr>
				<th scope="cols">매물등록번호</th>
				<th scope="cols">등록일자</th>
				<th scope="cols">매도자명</th>
				<th scope="cols">주소</th>
				<th scope="cols">가격</th>
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



