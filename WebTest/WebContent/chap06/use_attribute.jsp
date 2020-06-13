<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="pf" tagdir="/WEB-INF/tags"%>
<html>
<head>
<title>속성 전달하기</title>
</head>
<body>
	<%-- 커스텀 태그를 호출하면서 title과 level의 값을 태그 파일에 전달한다.  --%>
	<pf:attribute content="attribute 디렉티브 사용하기" size="1" />
	<%-- 커스텀 태그를 호출하면서 title과 level의 값을 태그 파일에 전달한다.  --%>
	<pf:attribute content="${'attribute 디렉티브를 사용하여'}" size="3" />
	<%-- 커스텀 태그를 호출하면서 title 값을 태그 파일에 전달한다.  --%>
	<pf:attribute content='<%="속성 값을 전달받는다."%>' />
	<pf:attribute content="${param.str}" size="${param.size}" />
	<pf:attribute content='<%=request.getParameter("str").concat("_java 구현 스크립트")%>' size='<%=Integer.parseInt(request.getParameter("size"))%>' />
</html>