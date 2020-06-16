<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Map"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<title>입력을 수행하는 action 페이지</title>
</head>
<body>
	<%-- 비밀번호와 비밀번호 확인을 비교하여 일치하면 등록을 수행하고 --%>
	<%
		if (request.getParameter("pwd1").equals(request.getParameter("pwd2"))) {
	%>
	<%-- DB 등록 수행은 8장 DB 다루기를 배우고 나서 처리하며 
               현재는 입력 자료를 단순히 출력한다. --%>
	<b>기본 데이터</b>
	<br /> 이름 :
	<%=request.getParameter("name")%>
	<br /> 학년 :
	<%=request.getParameter("grade")%>
	반 :
	<%=request.getParameter("class")%>
	학번 :
	<%=request.getParameter("sid")%>
	<br /> 주소 :
	<%=request.getParameter("address")%><br />
	<br /> id :
	<%=request.getParameter("id")%>
	<br /> 전공동아리 :
	<%=request.getParameter("club")%>
	<br />
	<p>
		<b>수강 교과목</b><br>
	<%
			String[] values = request.getParameterValues("subject");
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
	%>
				<%=values[i]%><br />
	<%
			}
		}
	%>
	<%
			}
		// 일치하지 않으면 등록을 수행하지 않는다.
		else {
			out.println("비밀번호와 비밀번호 확인이 일치하지 않아 등록에 실패했습니다!!!");
		}
	%>
	
	<p>
</body>
</html>