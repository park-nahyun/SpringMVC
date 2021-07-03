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
<title>StudentList.jsp</title>

<!-- 부트스트랩 css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 제이쿼리 script -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
</script>
</head>
<body>
<div>
	<h1>성적 정보 입력</h1>
	<hr>
</div>

<div class="container">
	<div class="panel-group">
		<div class="panel-default">
			<div class="panel-heading" id="title">
				성적 정보 입력
			</div>
			<div class="panel-body">
				<form role="form" action="gradeinsert.action" method="post">
					
					<div class="form-group">
						<label for="name">
							SID : ${student.sid }
						</label>
						<input type="text" class="form-control" id="sid" name="sid" value="${student.sid }">
					</div>
					
					<div class="form-group">
						<label for="name">
							NAME :
						</label>
						<input type="text" class="form-control" id="name" name="name">
					</div>
					
					<div class="form-group">
						<label for="sub1">
							과목1 :
						</label>
						<input type="text" class="form-control" id="sub1" name="sub1">
						<label for="sub2">
							과목2 :
						</label>
						<input type="text" class="form-control" id="sub2" name="sub2">
						<label for="sub3">
							과목3 :
						</label>
						<input type="text" class="form-control" id="sub3" name="sub3">
					</div>
					
					<button type="submit" class="btn btn-success btn-sm">SUBMIT</button>
					<button type="reset" class="btn btn-success btn-sm btnCancel">CANCEL</button>
				</form>
			</div> 
		</div> <!-- close .panel-default -->
	</div>
</div>
</body>
</html>