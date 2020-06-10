<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Map"%>
<%
	// request 객체를 사용하여 디코딩할 인코딩 코드를 세팅한다.
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
	<title>요청 파라미터 읽기</title>
</head>
<body>
	<p style="border : solid 2px; width : 50%; text-align: center;">
		request.getParameter() 메서드 사용
		<br>
		<%-- request 객체를 사용하여 특정 파라미터의 값을 읽는다 --%>
		이름 파라미터 = <%=request.getParameter("name")%> <br> 
		학번 파라미터 = <%=request.getParameter("id")%>
	</p>
	<p style="border : solid 2px; width : 50%; text-align: center;">
		request.getParameterValues() 메서드 사용<br>
	<%
		// 매개변수로 지정한 파라미터의 모든 값을 읽는다.
		String[] values = request.getParameterValues("subject");
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
	%>
				<%=values[i]%><br />
	<%
			}
		}
	%>
	</p>
	<p style="border : solid 2px; width : 50%; text-align: center;">
		request.getParameterNames() 메서드 사용<br>
	<%
			// 파라미터의 이름 목록을 구한다.
		Enumeration paramEnum = request.getParameterNames();
		while (paramEnum.hasMoreElements()) {
			String name = (String) paramEnum.nextElement();
	%>
			<%=name%><br />
	<%
		}
	%>
	</p>
	<p style="border : solid 2px; width : 50%; text-align: center;">
		request.getParameterMap() 메서드 사용<br>
	<%
		// 파라미터들로 구성되는 Map 을 구한다.
		Map parameterMap = request.getParameterMap();
		// 파라미터 Map에서 subject 파라미터의 값을 구한다.
		String[] subjectParam = (String[]) parameterMap.get("subject");
		if (subjectParam != null) {
			for(int i=0; i<subjectParam.length;i++){
	%>
			수강 교과목 <%=i+1 %> : <%=subjectParam[i]%><br />
	<%
			}
		}
	%>
	</p>
	<p class="a"></p>
	<script type="text/javascript">
		var a = "자바스크립트로생성";
		document.getElementsByClassName("a")[0].innerHTML = a;
		
	</script>
</body>
</html>