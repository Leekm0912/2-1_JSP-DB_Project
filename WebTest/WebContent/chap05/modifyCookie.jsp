<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (int i = 0 ; i < cookies.length ; i++) {
				// 기존 쿠키를 확인한 후
				if (cookies[i].getName().equals("subject")) {
					// 쿠키 이름이 동일한 새로운 쿠키를 생성한다.
					Cookie cookie = new Cookie("subject",
				     URLEncoder.encode("JSP 프로그래밍", "utf-8"));
				    // 새롭게 생성한 쿠키를 송출하여 쿠키를 변경한다.
					response.addCookie(cookie);
				}
			}
		}
	%>
<html>
<head>
<title>쿠키 값 변경</title>
</head>
<body>
	<%-- subject 쿠키의 값을 'JSP 프로그래밍'으로 변경합니다. --%>
	<%
		response.sendRedirect("./readCookie.jsp") ;
	%>
</body>
</html>