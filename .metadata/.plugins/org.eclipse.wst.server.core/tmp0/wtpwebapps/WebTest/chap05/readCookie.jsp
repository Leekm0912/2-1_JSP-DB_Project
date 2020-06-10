<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
<title>쿠키 읽기</title>
</head>
<body>
	<%
		// 요청 데이터로부터 쿠키 목록을 구한다.
	Cookie[] cookies = request.getCookies();
	%>
	<%-- 쿠키 개수를 출력한다. --%>
	쿠키
	<%=cookies.length%>개
	<br />
	<%
		if (cookies != null && cookies.length > 0) {
		for (int i = 0; i < cookies.length; i++) {
	%>
	<%-- 쿠키 이름과 쿠키 값을 출력한다.  --%>
	<%=cookies[i].getName()%>
	:
	<%=URLDecoder.decode(cookies[i].getValue(), "utf-8")%><br> 
<%
 		}
	 } else {
 	%> 
 	쿠키가 존재하지 않습니다. 
<%
 	}
%>
</body>
</html>