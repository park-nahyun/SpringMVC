<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send.jsp</title>
</head>
<body>

<div>
	<h1>Spring MVC 데이터 송수신 실습</h1>
	<hr>
</div>

<div>
	<!-- "ReceiveController.java" 이렇게가 아니라 "Receive.do" -->
	<form action="receive.do">
		이름 <input type="text" name="userName">
		<button type="submit">submit</button>
	</form>
</div>
</body>
</html>