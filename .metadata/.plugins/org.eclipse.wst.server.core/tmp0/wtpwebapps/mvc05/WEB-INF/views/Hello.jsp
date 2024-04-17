<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello.jsp</title>
</head>
<body>

<!-- 뷰(View) 페이지 -->
<!-- → HelloController 로부터  Model 객체의 정보를 수신하여 -->
<!--   출력하는 처리 -->


<div>
	<h1>수신한 결과 출력</h1>
	<hr>
</div>

<div>
	<h2>${hello }</h2>
	<!-- "SpringMVCAnnotation World~!!!" -->
</div>
</body>
</html>