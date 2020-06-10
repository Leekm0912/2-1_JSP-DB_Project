<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.CallableStatement"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String userType = (String)session.getAttribute("userType");
if (userType == "매도자") {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('매도자는 매수할 수 없습니다.')");
	script.println("location.href = 'main.jsp'");
	script.println("</script>");
	if(true) return; // 왜인지 이거 안넣으면 중단이 안됨;;

}
request.setCharacterEncoding("utf-8");
Connection con = null;
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String userid = "MYDB";
String pwd = "dongsu14";

try { /* 드라이버를 찾는 과정 */
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("드라이버 로드 성공");
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}

try { /* 데이터베이스를 연결하는 과정 */
	System.out.println("데이터베이스 연결 준비 ...");
	con = DriverManager.getConnection(url, userid, pwd);
	System.out.println("데이터베이스 연결 성공");
} catch (SQLException e) {
	e.printStackTrace();
}

SimpleDateFormat timeformat = new SimpleDateFormat("yyyy-MM-dd");
Date time = new Date();
int count = -1;
String query = "select 매물등록번호 from (select 매물등록번호 from 상세주문 order by  매물등록번호 desc) where rownum = 1"; /* 가장 높은 등록번호 추출 */
try { /* 데이터베이스에 질의 결과를 가져오는 과정 */
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(query);

	while (rs.next()) {
		count = rs.getInt(1)+1;
	}
} catch (SQLException e) {
	e.printStackTrace();
}
String num = request.getParameter("address");
query = "select 매도자ID from 매물 where 등록번호="+num; 
String sellername = "";

try { /* 데이터베이스에 질의 결과를 가져오는 과정 */
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(query);

	while (rs.next()) {
		sellername = rs.getString(1);
	}
} catch (SQLException e) {
	e.printStackTrace();
}

//query = "exec 매물삽입(" + ++count + ",'" + timeformat.format(time) +"',"+ request.getParameter("id") +",'"+ request.getParameter("address") +"',"+ request.getParameter("price") +")"; /* 미리 만들어놓은 프로시저 이용 */

query = "insert into 주문 values(?,?,?,?)";
try { /* 데이터베이스에 질의 결과를 가져오는 과정 */
	PreparedStatement ppst = null;
	ppst = con.prepareStatement(query); // PreparedStatement 객체 생성(쿼리 생성)
	ppst.setString(1, Integer.toString(count));
	ppst.setString(2, num);
	String userID = (String)session.getAttribute("userID");
	ppst.setString(3, userID);
	ppst.setString(4, sellername);
	ppst.executeUpdate(); // 쿼리(sql) 실행
} catch (SQLException e) {
	e.printStackTrace();
}

con.close();
response.sendRedirect("order_result.jsp");
%>

