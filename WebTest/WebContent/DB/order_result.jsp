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
	<%
		try {
		if (session.getAttribute("userType").toString() == "매도자") {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('매도자는 매수할 수 없습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
			if (true)
		return; // 왜인지 이거 안넣으면 중단이 안됨;;
		}
	} catch (Exception e) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");

		if (true)
			return;
	}
	%>
	<h1 style="text-align: center;">${ userName }님의 매물 주문 목록</h1>
	<%
	request.setCharacterEncoding("utf-8");
	Connection con = DB.getDB().con;

	String query = "";
	Statement stmt = null;
	ResultSet rs = null;

	//query = "select * from 주문 where 매수자이름=" + "'" + name + "'"; /* SQL 문 */
	String userID = (String) session.getAttribute("userID");
	query = "select 주문번호, 매수자_이름, 매도자_이름, 매물_등록번호, 주문일자 from 주문, 매수자, 매도자 where 주문.매도자id = 매도자.id and 주문.매수자id = 매수자.id and 매수자.id = "
			+ "'" + userID + "'" + " order by 주문번호";
	try { /* 데이터베이스에 질의 결과를 가져오는 과정 */
		stmt = con.createStatement();
		rs = stmt.executeQuery(query);
		List<Integer> row1 = new ArrayList<Integer>();
		List<String> row2 = new ArrayList<String>();
		List<String> row3 = new ArrayList<String>();
		List<Integer> row4 = new ArrayList<Integer>();
		List<String> row5 = new ArrayList<String>();
		while (rs.next()) {
			row1.add(rs.getInt(1));
			row2.add(rs.getString(2));
			row3.add(rs.getString(3));
			row4.add(rs.getInt(4));
			row5.add(rs.getString(5));
		}
	%>
	<table class="type1">
		<tr>
			<th scope="cols">주문번호</th>
			<th scope="cols">매수자이름</th>
			<th scope="cols">매도자이름</th>
			<th scope="cols">매물등록번호</th>
			<th scope="cols">주문일자</th>
		</tr>
		<%
			for (int i = 0; i < row1.size(); i++) {
			out.print("<tr>");
			out.print("<td style='text-align:center;'>" + row1.get(i) + "</td>");
			out.print("<td style='text-align:center;'>" + row2.get(i) + "</td>");
			out.print("<td style='text-align:center;'>" + row3.get(i) + "</td>");
			out.print("<td style='text-align:center;'>" + row4.get(i) + "</td>");
			out.print("<td style='text-align:center;'>" + row5.get(i).substring(0, 11) + "</td>");
			out.print("</tr>");
		}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		%>
	</table>
</body>