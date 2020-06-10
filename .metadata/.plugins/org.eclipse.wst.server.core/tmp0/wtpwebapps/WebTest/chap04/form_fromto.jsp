<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>from-to의 to 선택을 위한 form 페이지</title>
</head>
<body>
	<%-- from-to의 form 페이지에서 to 페이지 선택을 위한 form 엘리먼트 --%>
	<%= request.getContextPath() %>
	<form action="./from.jsp">
		수행 페이지 선택 : <br /> &nbsp;
		<select name="subject">
			<option value="java">자바 프로그래밍</option>
			<option value="DB">데이터베이스</option>
			<option value="JSP">JSP</option>
			<option value="spring">스프링</option>
		</select>
		&nbsp;&nbsp;<input type="submit" value="선택 완료">
	</form>
</body>
</html>