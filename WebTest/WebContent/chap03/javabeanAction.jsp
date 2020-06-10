<%@ page contentType="text/html; charset=utf-8"%>
<%
		request.setCharacterEncoding("utf-8");
	%>
<%-- class 속성의 클래스는 WEB-INF/classes 폴더에 위치하는 클래스이어야 한다. --%>
<%-- 따라서 WEB-INF/src에 위치하는 chap03/MemberInfo.java를 컴파일하여 --%>
<%-- 그 결과인 MemberInfo.class를 WEB-INF/classes/chap03 폴더에 복사하여 사용한다.--%>
<%-- 이때 주의해야 할 사항은 MemberInfo.java 파일의 한글을 utf-8로 처리하기 위해서는 --%>
<%-- chap03 폴더의 명령행에서 javac -encoding utf-8 MemberInfo.java 와 같이 사용하는데--%>
<%-- 컴파일 명령에서 -encoding utf-8 옵션을 사용해야 한다. --%>
<jsp:useBean id="memberInfo" class="chap03.MemberInfo" />
<%-- 요청 파라미터와 동일 이름의 프로퍼티에 대해서는 일괄적으로 입력 처리 --%>
<jsp:setProperty name="memberInfo" property="*" />
<html>
<head>
<title>MemberInfo 자바빈 처리</title>
</head>
<body>
	<table width="250" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center">id</td>
			<td><jsp:getProperty name="memberInfo" property="id" /></td>
		</tr>
		<tr>
			<td align="center">password</td>
			<td><jsp:getProperty name="memberInfo" property="password" /></td>
		</tr>
		<tr>
			<td align="center">이름</td>
			<td><jsp:getProperty name="memberInfo" property="name" /></td>
		</tr>
		<tr>
			<td align="center">이메일</td>
			<td><jsp:getProperty name="memberInfo" property="email" /></td>
		</tr>
	</table>
</body>
</html>