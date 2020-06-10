<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>회원가입 입력 폼</title>
</head>
<body>
	<form action="./javabeanAction.jsp" method="post">
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td>이메일</td>
				<td colspan="3">
					<input type="text" name="email" size="10">
				</td>
			</tr>
			<tr>
				<td align="center">id</td>
				<td>
					<input type="text" name="id" size="10">
				</td>
				<td>password</td>
				<td>
					<input type="password" name="password" size="10">
				</td>
			</tr>
			<tr>
				<td align="center">이름</td>
				<td colspan="3">
					<input type="text" name="name" size="10">
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="submit" value="MemberInfo 등록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>