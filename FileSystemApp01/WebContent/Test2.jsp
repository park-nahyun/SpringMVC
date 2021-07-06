<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String name = request.getParameter("name");
	String upload = request.getParameter("upload");
	// 이름만 수신할 뿐 파일 자체가 수신된 것이 아님
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test2.jsp</title>
</head>
<body>

 	이름 : <%=name %><br>
 	파일 : <%=upload %><br>

</body>
</html>