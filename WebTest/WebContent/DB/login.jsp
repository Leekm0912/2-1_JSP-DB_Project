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


	<!-- 로긴폼 -->

	<div class="container">

		<div class="col-lg-4" style="margin: auto">

			<!-- 점보트론 -->

			<div class="jumbotron">

				<!-- 로그인 정보를 숨기면서 전송post -->

				<form method="post" action="loginAction.jsp" style="text-align: center;">

					<h3 style="text-align: center;">로그인화면</h3>

					<div class="form-group">

						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>



					<div class="form-group">

						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<div class="btn-group" data-toggle="buttons">

							<label> <input type="radio" name="userType" autocomplete="off" value="매수자" checked>매수자 </label> 
							<label> <input type="radio" name="userType" autocomplete="off" value="매도자">매도자 </label>

					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
				</form>

			</div>

		</div>

	</div>





	<!-- 애니매이션 담당 JQUERY -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->

	<script src="js/bootstrap.js"></script>



</body>

</html>
