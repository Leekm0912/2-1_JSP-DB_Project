<%@ page contentType="text/html; charset=utf-8"%>
<%-- 태그 파일이 위치하는 폴더는 tagdir 속성으로 지정하고 태그 접두어는 prefix 속성으로 지정한다. --%>
<%@ taglib prefix="pf" tagdir="/WEB-INF/tags"%>
<html>
<head>
<title>현재 시각</title>
</head>
<body>
	<%-- tagdir 속성으로 지정하는 폴더의 커스텀 태그 파일을 --%>
	<%-- prefix로 지정하는 태그 접두어를 사용하여 호출한다.  --%>
	오늘은
	<b><pf:time /></b> 입니다.
</body>
</html>