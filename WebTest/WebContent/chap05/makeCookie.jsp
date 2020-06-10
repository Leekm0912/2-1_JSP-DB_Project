
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
		// Cookie 클래스로 쿠키를 생성한다.
	  Cookie cookie = new Cookie("subject", URLEncoder.encode("자바 프로그래밍", "utf-8"));
		// response 객체를 사용하여 생성한 쿠키를 브라우저에 송출한다.
		response.addCookie(cookie);
	%>
<html>
<head>
<title>쿠키 생성과 송출</title>
</head>
<body>
	<%-- 생성한 쿠키의 이름과 값을 출력한다.  --%>
	<%= cookie.getName() %>
	쿠키
	<br /> 값 : "<%= cookie.getValue() %>"
</body>
</html>