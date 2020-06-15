<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
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
</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<div class="container">
			<jsp:include page="./layout/top.jsp" flush="false" />
		</div>
	</nav>

	<h1 style="text-align: center;">${ userName }님이 등록한 매물 목록</h1>
	<%
	request.setCharacterEncoding("utf-8");
	Connection con = DB.getDB().con;
	
	String query = "";
	Statement stmt = null;
	ResultSet rs = null;
	

	//query = "select * from 주문 where 매수자이름=" + "'" + name + "'"; /* SQL 문 */
	String userID = (String) session.getAttribute("userID");
	query = "select * from 매물 where 매도자id = " + "'" + userID + "'" + " order by 등록번호";
	try { /* 데이터베이스에 질의 결과를 가져오는 과정 */
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		List<Integer> row1 = new ArrayList<Integer>();
		List<String> row2 = new ArrayList<String>();
		List<String> row3 = new ArrayList<String>();
		List<Integer> row4 = new ArrayList<Integer>();
		while (rs.next()) {
			row1.add(rs.getInt(1));
			row2.add(rs.getString(2));
			row3.add(rs.getString(3));
			row4.add(rs.getInt(4));
		}
	%>
	<table class="type1">
		<tr>
			<th scope="cols">매물등록번호</th>
			<th scope="cols">등록일자</th>
			<th scope="cols">주소</th>
			<th scope="cols">가격</th>
		</tr>
		<%
			for (int i = 0; i < row1.size(); i++) {
			out.print("<tr>");
			out.print("<td style='text-align:center;'>" + row1.get(i) + "</td>");
			out.print("<td style='text-align:center;'>" + row2.get(i).substring(0, 11) + "</td>");
			out.print("<td style='text-align:center;'>" + row3.get(i) + "</td>");
			out.print("<td style='text-align:center;'>" + row4.get(i) + "</td>");
			out.print("</tr>");
		}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		%>
	</table>
</body>