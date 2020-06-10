<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (int i = 0 ; i < cookies.length ; i++) {
				// 기존 쿠키를 확인한 후
				if (cookies[i].getName().equals("subject")) {
					// 쿠키 이름이 동일한 새로운 쿠키를 생성한다.
					Cookie cookie = new Cookie("subject", "");
					// 쿠키의 유효시간을 0으로 세팅한다.
					cookie.setMaxAge(0);
				// 기존 쿠키의 유효시간을 0인 변경하여 쿠키를 삭제한다.
					response.addCookie(cookie);
				}
			}
		}
	%>
<html>
<head>
<title>쿠키 삭제</title>
</head>
<body>
	<%-- subject 쿠키를 삭제합니다. --%>
	<%
		response.sendRedirect("./readCookie.jsp") ;
	%>
</body>
</html>