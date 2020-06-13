<%@ page contentType="text/html; charset=utf-8"%>
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
		<form action="add_data.jsp" method="post">
			주소: <input type="text" name="address" size="50"> <br> 
			가격: <input type="text" name="price" size="20"> <br> 
		<%-- 일괄적으로 action 페이지에 전달한다. --%> 
		<input type="submit" value="입력완료">
		</form>
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.slim.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>