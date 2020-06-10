<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "chap05.ExceptionTest" %>
<html>
<head>
<title>파라미터 출력</title>
</head>
<body>
	<%
		ExceptionTest e = new ExceptionTest();
		e.error();
		
		/*if (request.getParameter("subject").equals("JSP")) {
			out.println("subject의 값은 JSP이다.<br> 익셉션이 발생하지 않았습니다.");
		} else {
			out.println("subject의 값은 JSP가 아니다.<br> 익셉션이 발생하지 않았습니다.");
		}*/
		
	%>
	<%-- errorPage를 지정하였기 때문에 --%>
	<%-- subject 파라미터를 사용하지 않으면 /userErrorPage/userErrorPage.jsp가 수행됩니다.--%>
	정상출력
</body>
</html>
