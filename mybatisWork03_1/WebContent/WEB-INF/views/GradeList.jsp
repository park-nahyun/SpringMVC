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
<title>GradeList.jsp</title>

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
				$(location).attr("href", "gradedelete.action?sid=" + $(this).val());
			}
		});
	});
	
</script>
</head>
<body>
<div>
	<h1>성적 정보</h1>
	<hr>
</div>

<div class="container">
	<div class="panel-group">		
		<div class="panel panel-default">
			<div class="panel-heading">
				성적 정보 출력
			</div>
			
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th>SID</th>
							<th>NAME</th>
							<th>과목1</th>
							<th>과목2</th>
							<th>과목3</th>
							<th>총점</th>
							<th>평균</th>
							<th>등급</th>
							<th>삭제 / 수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="grade" items="${list }">
						<tr>
							<td>${grade.sid }</td>
							<td>${grade.name }</td>
							<td>${grade.sub1 }</td>
							<td>${grade.sub2 }</td>
							<td>${grade.sub3 }</td>
							<td>${grade.tot }</td>
							<td>${grade.avg }</td>
							<td>${grade.ch }</td>
							<td>
								<button type="button" class="btn btn-danger btn-xs btnDelete" 
								value="${student.mid }">삭제</button>
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