<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>폼 페이지</title>
</head>
<body>
	<%-- form 엘리먼트 : 자세한 내용은 3.3절에 다룬다--%>
	<form action="./readParameter.jsp" method="post">
		이름: <input type="text" name="name" size="10"> <br> 
		학번: <input type="text" name="id" size="20"> <br> 
		수강 교과목: 
		<input type="checkbox" name="subject" value="java">자바 
		<input type="checkbox" name="subject" value="JSP">JSP 
		<input type="checkbox" name="subject" value="Spring">스프링 <br> 
		<%-- form 엘리먼트에 포함되는 input 엘리먼트들을 요청 파라미터로 만들어 --%> 
		<%-- 일괄적으로 action 페이지에 전달한다. --%> 
		<input type="submit" value="입력완료">
	</form>
</body>
</html>