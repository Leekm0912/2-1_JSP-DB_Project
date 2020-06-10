<%@ page contentType="text/html; charset=utf-8"%>
<%
		String code = request.getParameter("subject");
		String toURI = null;
			if (code.equals("java")) {
			toURI = "./to/java.jsp";
		} else if (code.equals("DB")) {
			toURI = "./to/DB.jsp";
		} else if (code.equals("JSP")) {
			toURI = "./to/JSP.jsp";
		} else if (code.equals("spring")) {
			toURI = "./to/spring.jsp";
		}
	%>
주의 1 : from 페이지의 출력 내용은 브라우저에 출력되지 않습니다.
<jsp:forward page="<%= toURI %>" />
주의 2 : jsp:forward 액션 태그 이후에 위치하는 내용은 수행되지 않습니다.
