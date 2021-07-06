<%@page import="java.io.DataInputStream"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	// Test3.jsp
	
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String contentType = request.getContentType();
	Enumeration e = request.getHeaderNames();
	
	out.println("전송받은 헤더 정보...<br>");
	while(e.hasMoreElements())
	{
		String key = (String)e.nextElement();
		String value = request.getHeader(key);
		out.println(key + " : " + value + "<br>");
	}
	
	out.println("<br>");
	out.println("전송받은 데이터...<br>");
	DataInputStream is = new DataInputStream(request.getInputStream());
	String str;
	
	while((str = is.readLine()) != null)
		out.println(new String(str.getBytes("ISO-8859-1"), "UTF-8") + "<br>");
	
	/* 전달받은 파일에 대한 분석 결과 출력 확인 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test3.jsp</title>
</head>
<body>


</body>
</html>