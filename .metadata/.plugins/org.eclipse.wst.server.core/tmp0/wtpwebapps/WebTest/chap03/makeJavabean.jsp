<%@ page contentType="text/html; charset=utf-8"%>
<%-- jsp:useBean을 사용하여 자바빈 객체 생성 --%>
<jsp:useBean id="memberInfo" scope="request" class="chap03.MemberInfo" />
<%
		memberInfo.setId("kangt109");
		memberInfo.setName("강익태");
	%>
<jsp:forward page="./useJavabean.jsp" />