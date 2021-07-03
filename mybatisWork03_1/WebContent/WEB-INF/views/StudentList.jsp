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
	
	$(function()
	{
		$(".btnDelete").click(function()
		{
			if (confirm("진짜로 삭제?"))
			{
				$(location).attr("href", "studentdelete.action?sid=" + $(this).val());
			}
		});
	});
	
</script>
</head>
<body>
<div>
	<h1>회원 정보</h1>
	<hr>
</div>

<div class="container">
	<div class="panel-group">		
		<div class="panel panel-default">
			<div class="panel-heading">
				학생 정보 출력
			</div>
			
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th>SID</th>
							<th>NAME</th>
							<th>TEL</th>
							<th>성적입력</th>
							<th>삭제 / 수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="student" items="${list }">
						<tr>
							<td>${student.sid }</td>
							<td>${student.name }</td>
							<td>${student.tel }</td>
							<td>
							<button type="button" class="btn btn-danger btn-xs btnInsert" 
								value="${student.sid }"
								onclick="location.href='gradeinsertform.action'">성적입력</button>
							</td>
							<td>
								<button type="button" class="btn btn-danger btn-xs btnDelete" 
								value="${student.sid }">삭제</button>
								<button type="button" class="btn btn-primary btn-xs btnUpdate">수정</button>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="button" class="btn btn-default btn-sm">
					COUNT <span class="badge">${count }</span>
				</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>