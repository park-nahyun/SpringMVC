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
			if(confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
			{
				$(location).attr("href", "gradedelete.action?sid=" + $(this).val());
			}
		});
	});

</script>
</head>
<body>

<div>
	<h1>학생 성적 정보</h1>
	<hr>
</div>

<div class="container">
	<div class="panel-group">
		<div class="panel-default">
		
			<div class="panel-heading" id="title">
				학생 성적 정보 입력
			</div>
			
			<div class="panel-body">
				<form role="form" action="studentinsert.action" method="post">
					
					<div class="form-group">
						<label for="name">
							NAME :
						</label>
						<input type="text" class="form-control" id="name" name="name">
					</div>
					
					<div class="form-group">
						<label for="tel">
							TEL :
						</label>
						<input type="text" class="form-control" id="tel" name="tel">
					</div>
					
					<button type="submit" class="btn btn-success btn-sm">SUBMIT</button>
					<button type="reset" class="btn btn-success btn-sm btnCancel">CANCEL</button>
					
				</form>
			</div>
		</div><!-- close .panel-default -->
		
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
							<th>SUB1</th>
							<th>SUB2</th>
							<th>SUB3</th>
							<th>TOT</th>
							<th>CH</th>
							<th>SUB1</th>
							<th>삭제 / 수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="student" items="${studentList}">
						<tr>
							<td>${student.sid }</td>
							<td>${student.name }</td>
							<td>${student.tel }</td>
							
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
					Count <span class="badge">${studentCount }</span>
				</button>
				
			</div>
		</div>
		
	</div>
</div>

</body>
</html>