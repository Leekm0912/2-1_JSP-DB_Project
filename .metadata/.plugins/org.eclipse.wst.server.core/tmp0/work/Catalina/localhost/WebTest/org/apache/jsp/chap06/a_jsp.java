/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.33
 * Generated at: 2020-06-07 12:41:51 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.chap06;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Enumeration;
import java.util.Map;

public final class a_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.Enumeration");
    _jspx_imports_classes.add("java.util.Map");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	// request 객체를 사용하여 디코딩할 인코딩 코드를 세팅한다.
request.setCharacterEncoding("utf-8");

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>요청 파라미터 읽기</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<p style=\"border: solid 2px; width: 50%; text-align: center;\">\r\n");
      out.write("\t\trequest.getParameter() 메서드 사용 <br> \r\n");
      out.write("\t\t");
      out.write(" \r\n");
      out.write("\t\t동아리 파라미터 = ");
      out.print(request.getParameter("club"));
      out.write(" <br> \r\n");
      out.write("\t\t과목 파라미터 = ");
      out.print(request.getParameter("subject"));
      out.write("\r\n");
      out.write("\t</p>\r\n");
      out.write("\t<p style=\"border: solid 2px; width: 50%; text-align: center;\">\r\n");
      out.write("\t\trequest.getParameterValues() 메서드 사용<br> ");

 	// 매개변수로 지정한 파라미터의 모든 값을 읽는다.
 String[] values = request.getParameterValues("subject");
 if (values != null) {
 	for (int i = 0; i < values.length; i++) {
 
      out.write(' ');
      out.print(values[i]);
      out.write("<br /> ");

 	}
 }
 
      out.write("\r\n");
      out.write("\t</p>\r\n");
      out.write("\t<p style=\"border: solid 2px; width: 50%; text-align: center;\">\r\n");
      out.write("\t\trequest.getParameterNames() 메서드 사용<br> ");

 	// 파라미터의 이름 목록을 구한다.
 Enumeration paramEnum = request.getParameterNames();
 while (paramEnum.hasMoreElements()) {
 	String name = (String) paramEnum.nextElement();
 
      out.write(' ');
      out.print(name);
      out.write("<br /> ");

 	}
 
      out.write("\r\n");
      out.write("\t</p>\r\n");
      out.write("\t<p style=\"border: solid 2px; width: 50%; text-align: center;\">\r\n");
      out.write("\t\trequest.getParameterMap() 메서드 사용<br> ");

 	// 파라미터들로 구성되는 Map 을 구한다.
 Map parameterMap = request.getParameterMap();
 // 파라미터 Map에서 subject 파라미터의 값을 구한다.
 String[] subjectParam = (String[]) parameterMap.get("subject");
 if (subjectParam != null) {
 	for (int i = 0; i < subjectParam.length; i++) {
 
      out.write(" 수강 교과목 ");
      out.print(i + 1);
      out.write(' ');
      out.write(':');
      out.write(' ');
      out.print(subjectParam[i]);
      out.write("<br /> ");

 	}
 }
 
      out.write("\r\n");
      out.write("\t</p>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
