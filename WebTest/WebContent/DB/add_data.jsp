<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="db.DB" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%  %>

<%
request.setCharacterEncoding("utf-8");
try {
	if (session.getAttribute("userType").toString() == "매수자") {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('매수자는 매도할 수 없습니다.')");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
		if (true) return; // 왜인지 이거 안넣으면 중단이 안됨;;
	}
} catch (Exception e) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인이 필요합니다.')");
	script.println("location.href = 'login.jsp'");
	script.println("</script>");

	if (true) return;
}

Connection con = DB.getDB().con;

SimpleDateFormat timeformat = new SimpleDateFormat("yyyy-MM-dd");
Date time = new Date();
int count = -1;
String query = "select 매물등록번호 from (select 매물등록번호 from 상세매물 order by  매물등록번호 desc) where rownum = 1"; /* 가장 높은 등록번호 추출 */
try { /* 데이터베이스에 질의 결과를 가져오는 과정 */
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(query);

	while (rs.next()) {
		count = rs.getInt(1);
	}
} catch (SQLException e) {
	e.printStackTrace();
}

//query = "exec 매물삽입(" + ++count + ",'" + timeformat.format(time) +"',"+ request.getParameter("id") +",'"+ request.getParameter("address") +"',"+ request.getParameter("price") +")"; /* 미리 만들어놓은 프로시저 이용 */

query = "insert into 매물 values(?,?,?,?,?)";
try { /* 데이터베이스에 질의 결과를 가져오는 과정 */
	PreparedStatement ppst = null;
	ppst = con.prepareStatement(query); // PreparedStatement 객체 생성(쿼리 생성)
	ppst.setString(1, Integer.toString(++count));
	ppst.setString(2, timeformat.format(time));
	ppst.setString(3, request.getParameter("address"));
	ppst.setString(4, request.getParameter("price"));
	ppst.setString(5, session.getAttribute("userID").toString());
	ppst.executeUpdate(); // 쿼리(sql) 실행
} catch (SQLException e) {
	e.printStackTrace();
}

con.close();
response.sendRedirect("ViewTable.jsp");
%>

