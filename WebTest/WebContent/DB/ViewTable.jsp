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
		<h1 style="text-align: center;">전체 매물 보기</h1>

		<a href="./view/전세.jsp?type=view" target="main_frame" class="btn btn-primary">전세</a>
		<a href="./view/월세.jsp?type=view" target="main_frame" class="btn btn-primary">월세</a>
		<a href="./view/토지.jsp?type=view" target="main_frame" class="btn btn-primary">토지</a>
		<a href="./view/매매.jsp?type=view" target="main_frame" class="btn btn-primary">매매</a>

	</div>
	<iframe src="./view/전세.jsp?type=view" style="display: block; margin: auto; width: 95vw; height: 80vh" id="main_frame" name="main_frame"> </iframe>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.slim.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>



