<%@ page contentType = "text/html; charset=utf-8"%>
<%@ page import = "chap05.CookieUtil" %>
<%
	// request 객체를 매개변수로 넘기면서 CookieUtil 객체를 생성한다.
	CookieUtil cookies = new CookieUtil(request);
%>
<html>
<head>
<title>CookieUtil 사용</title>
</head>
<body>
	<%-- CookieUtil 객체의 exists 메서드를 사용하여 subject 쿠키가 존재하는지 조사한다. --%>
<%
	if (cookies.exists("subject")) {
%>
	<%-- CookieUtil 객체의 getValue 메서드를 사용하여 subject 쿠키의 값을 찾는다. --%>
		subject 쿠키 :
		<%=cookies.getValue("subject")%>
	<br> 
<%
 	}
	else{
		response.addCookie(CookieUtil.createCookie("subject", "테스트"));
		response.sendRedirect("./readCookie.jsp") ;
	}
%>
</body>
</html>