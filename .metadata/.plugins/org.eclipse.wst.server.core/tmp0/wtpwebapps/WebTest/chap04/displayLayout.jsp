
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Layout을 사용한 화면 구성</title>
</head>
<body>
	<table border="1" cellpadding="0" cellspacing="0" style="width:100%;">
		<tr>
			<td colspan="2">
				<jsp:include page="./layout/top.jsp" flush="false" />
			</td>
		</tr>
		<tr>
			<td width="100" valign="top">
				<jsp:include page="./layout/left.jsp" flush="false" />
			</td>
			<td width="600" valign="top" align="center">
				<!-- 메인 창의 JSP가 위치합니다. -->
				<br /> <br /> <br /> 
				이 창은 메인 창입니다.
				<br /> 
				주작업은 이 창에서 수행합니다. 
				<br /> <br /> <br /> <br />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<jsp:include page="./layout/bottom.jsp" flush="false" />
			</td>
		</tr>
	</table>
</body>
</html>