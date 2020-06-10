<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="db.UserDAO"%>
<!-- userdao의 클래스 가져옴 -->

<%@ page import="java.io.PrintWriter"%>
<!-- 자바 클래스 사용 -->

<%
	request.setCharacterEncoding("UTF-8");
%>



<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:브라우저와 세션 연결에 사용-->

<jsp:useBean id="user" class="db.User" scope="session" />

<jsp:setProperty name="user" property="userID" />

<jsp:setProperty name="user" property="userPassword" />

<jsp:setProperty name="user" property="userType" />



<!DOCTYPE html>

<html>

<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp 게시판 웹사이트</title>

</head>

<body>

	<%
		UserDAO userDAO = new UserDAO(); //인스턴스생성
		System.out.println("userDAO : " + userDAO);
	int result = userDAO.login(user.getUserID(), user.getUserPassword(),user.getUserType());

	//로그인 성공

	if (result <= 1) {

		PrintWriter script = response.getWriter();
		if(result == 1) {
			session.setAttribute("userType", "매수자");
		}
		else if(result == 2) {
			session.setAttribute("userType", "매도자");
		}
		
		response.sendRedirect("ViewTable.jsp");

	}

	//로그인 실패

	else if (result == 0) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('비밀번호가 틀립니다.')");

		script.println("history.back()");

		script.println("</script>");

	}

	//아이디 없음

	else if (result == -1) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('존재하지 않는 아이디 입니다.')");

		script.println("history.back()");

		script.println("</script>");

	}

	//DB오류

	else if (result == -2) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('DB오류가 발생했습니다.')");

		script.println("history.back()");

		script.println("</script>");

	}
	%>



</body>

</body>

</html>
