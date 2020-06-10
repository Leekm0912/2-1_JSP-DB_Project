<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Parameter Send</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8") ;
	%>
	<h4>교과목 설명</h4>
	<jsp:include page="receiveParameter.jsp" flush="false">
		<jsp:param name="subject" value="스프링" />
	</jsp:include>
	<%-- <jsp:param name="subject" value="JSP" />  --%>
	<%-- JSP 주석을 처리할 떄 주석이 jsp:include 액션 태그 몸체에 포함되면 오류가 발생한다. --%>
</body>
</html>