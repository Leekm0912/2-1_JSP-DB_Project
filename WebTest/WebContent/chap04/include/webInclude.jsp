<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 소스 상단에 /included/top.jspf 파일이 포함됩니다. --%>
<html>
<head>
<title>web.xml에 의해 Include가 자동 실행</title>
</head>
<body>
	<c:if test="true">
		현재 시각은
		${ date }
		입니다.
	</c:if>
</body>
</html>
<%-- 소스 하단에 /included/bottom.jspf 파일이 포함됩니다. --%>