<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	int var1 = 15;
	Map<String, String> m = new HashMap<>();
	m.put("name","홍길동");
	m.put("age","30");
	session.setAttribute("var2", m);

%>

자바공간에서 선언한 var1 출력 : ${var1}
${var1 = 10 ; ''}
<br/>
EL변수 var1 출력 : ${var1}