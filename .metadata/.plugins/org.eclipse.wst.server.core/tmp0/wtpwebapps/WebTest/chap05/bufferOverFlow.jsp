<%@ page contentType="text/html; charset=utf-8"%>
<%@ page buffer="1kb"%>
<%@ page errorPage="./userErrorPage/userErrorPage1.jsp" %>

<html>
<head>
<title>버퍼 플러시 이후의 오류 발생</title>
</head>
<body>
	<%
		for (int i = 0; i < 300; i++) {
			out.println(i);
			//out.flush();
		}
	%>
	
	<%= 1 / 0 %>
	
</body>
</html>