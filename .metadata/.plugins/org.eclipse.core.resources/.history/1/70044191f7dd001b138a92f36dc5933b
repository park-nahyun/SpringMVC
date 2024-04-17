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
<title>Test1.jsp</title>
</head>
<body>
	<!-- 『multipart/form-data』 : 파일을 필수적으로 업로드하기 위한 필수 속성-->
	<form action="Test3.jsp" method="post" enctype="multipart/form-data">
		이름 : <input type="text" name="name"><br>
		파일 : <input type="file" name="upload"><br>
		<input type="submit" value="전송">
		<!-- 이번에는 결과값으로 null만 출력 -->
		<!-- 즉, 바이너리(2진수)값을 getParameter 를 통해서 얻을 수 없다는 의미이다-->
	</form>
</body>
</html>