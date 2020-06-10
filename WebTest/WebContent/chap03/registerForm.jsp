<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>dlqfur을 위한 폼 페이지</title>
</head>
<body>
	<%-- submit 버튼을 클릭하면 form 내부의 모든 input 엘리먼트들이 --%>
	<%-- post 방식으로  /chap03/registerProcess.jsp 페이지에 전달된다.--%>
	<form action="./registerProcess.jsp" method="post">
		이름: <input type="text" name="name" size="10"> 
		<br> 학년: <input type="text" name="grade" size="10"> 
		반: <input type="text" name="class" size="10"> 
		학번: <input type="text" name="sid" size="10"> 
		<br> 주소: <input type="text" name="address" size="30"> 
		<br> id: <input type="text" name="id" size="10"> 
		<br> 비밀번호: <input type="password" name="pwd1" size="10"> 
		<br> 비밀번호 확인: <input type="password" name="pwd2" size="10"> 
		<br> 수강 교과목: <input type="checkbox" name="subject" value="java"> 
		자바 <input type="checkbox" name="subject" value="JSP"> 
		JSP <input type="checkbox" name="subject" value="Database"> 
		Database <input type="checkbox" name="subject" value="Node"> 
		Node.js <input type="checkbox" name="subject" value="Spring"> 
		스프링 
		<br /> 전공 동아리: <input type="text" name="club" size="10"> 
		<br>
		<br> <input type="submit" value="등록">
	</form>
</body>
</html>