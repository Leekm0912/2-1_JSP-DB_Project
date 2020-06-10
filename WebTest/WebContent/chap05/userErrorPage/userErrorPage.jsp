<%@ page contentType="text/html; charset=utf-8"%>
<%@ page isErrorPage="true"%>
<html>
<head>
<title>Exception 발생</title>
</head>
<body>
	subject 요청 파라미터를 사용하지 않아 오류가 발생하였습니다.
	<br> URL 요청경로 뒷자리에 ?subject=oooo를 사용하여 subject 파라미터를 사용해야 합니다.<br>
			<p>
				에러 타입:
				<%=exception.getClass().getName()%>
				<br> 에러 메시지: <b><%=exception.getMessage()%></b>
</body>
</html>