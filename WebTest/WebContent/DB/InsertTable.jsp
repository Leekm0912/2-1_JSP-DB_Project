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
	<div class="container" >
		<div style="margin:auto; width:50%; text-align:center;">
		<h1>매물 등록</h1>
		<form action="add_data.jsp" method="post">
			<h5>주소</h5> <input type="text" name="address" size="50" class="form-control" id="exampleTextarea" style="width:100%;"> <br> 
			<h5>가격</h5> <input type="text" name="price" size="20" class="form-control" id="exampleTextarea" style="width:100%;"> <br> 
		<%-- 일괄적으로 action 페이지에 전달한다. --%> 
		<div style="margin:auto; text-align:center;">
			<input type="submit" value="입력완료" class="btn btn-primary" >
		</div>
		</form>
		</div>
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.slim.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
