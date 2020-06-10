<%@ page contentType="text/html; charset=utf-8"%>
<%
	String subject = request.getParameter("subject");
	if (subject == null) {
%>
		subject == NULL;
<%
		return;
	}
%>

	과목명 :
	<b><%=subject%></b>
	<br />
	- 선수 과목 :
<%
	if (subject.equals("JSP")) {
%>
		자바프로그래밍, 데이터베이스
<%
	} else if (subject.equals("스프링")) {
%>
		JSP 프로그래밍, JPA
<%
	}
%>