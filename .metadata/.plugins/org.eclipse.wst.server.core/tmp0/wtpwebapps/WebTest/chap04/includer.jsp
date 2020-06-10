<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>include 디렉티브 사용하기</title>
</head>
<body>
	<%
		String subject = "자바 프로그래밍";
	%>
	<%@ include file="./includee.jspf"%>
	includee.jspf에서 정의한 변수 사용하기 : "<%= outVariable %>"
</body>
</html>