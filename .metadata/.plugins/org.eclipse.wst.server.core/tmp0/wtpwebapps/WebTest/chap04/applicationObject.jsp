<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.URL"%>
<html>
<head>
<title>Application 객체 사용하기</title>
</head>
<body>

	초기화 파라미터 처리하기 :
	<br />
	<%
		// web.xml로부터 초기화 파라미터 목록을 구한다.
	    Enumeration<String> initParamEnum = application.getInitParameterNames();
		// 목록이 더 있으면
		while (initParamEnum.hasMoreElements()) {
			// 다음 목록을 구한다.
			String initParamName = initParamEnum.nextElement();
	%>
		<%-- 초기화 파라미터 이름을 출력하고 --%>
		<%= initParamName %>
		=
		<%-- 초기화 파라미터 값을 출력한다. --%>
		<%= application.getInitParameter(initParamName) %><br />
	<%
		}
	%>
	<br /> 애플리케이션 자원 사용하기 :
	<br />
	<%
	    // 경로를 준비하고
		String rPath = "/chap04/resource/description.txt";
		// 출력에 사용될 버퍼를 준비한다.
		char[] buffer = new char[512];
		int len = -1;
		// 자원에 접근할 수 있는 URL 객체를 구한다.
		URL url = application.getResource(rPath);
		// InputStreamReader 객체를 준비한다.
		try (InputStreamReader br = new InputStreamReader(url.openStream(), "UTF-8")) {
			// 한줄씩 읽어 버퍼에 저장한다.
			while ( (len = br.read(buffer)) != -1) {
				// 버퍼에 저장된 내용을 출력한다.
				out.print(new String(buffer, 0, len));
			}
		} catch(IOException ex) {
			out.println("익셉션 발생: "+ex.getMessage());
		}
	%>
</body>
</html>
