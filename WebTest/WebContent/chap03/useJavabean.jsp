<%@ page contentType="text/html; charset=utf-8"%>
<%-- jsp:useBean을 사용하여 request 영역 객체 생성된 자바빈 객체 사용 --%>
<jsp:useBean id="memberInfo" scope="request" class="chap03.MemberInfo" />
<html>
<head>
<title>인사</title>
</head>
<body>
	<%= memberInfo.getName() %>
	(<%= memberInfo.getId() %>) 회원님
	<br />안녕하십니까?
</body>
</html>