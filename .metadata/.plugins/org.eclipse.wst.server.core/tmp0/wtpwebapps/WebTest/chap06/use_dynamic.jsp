<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="pf" tagdir="/WEB-INF/tags"%>
<html>
<head>
<title>속성을 동적으로 전달하기</title>
</head>
<body>
	<form method="post" action="a.jsp">
		교과목 선택 :
		<pf:dynamic name="subject" java="자바" jsp="JSP" spring="스프링" />
		<br /> <br /> <br /> <br /> 동아리 선택 :
		<pf:dynamic name="club" spring="iCloser" iot="IoT 동아리" smartfactory="club SF" />
		<br /> <input type="submit" value="입력완료" />
	</form>
</body>
</html>