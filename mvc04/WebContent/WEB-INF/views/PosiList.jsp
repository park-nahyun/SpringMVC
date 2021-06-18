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
<title>PosiList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">


</head>
<body>

<!------------------------------------------------------------------
  #??. PosiList.jsp
  - 부서 리스트 출력 페이지.
  - 일반회원이 접근하는 부서 데이터 출력 페이지
  - 입력 / 수정 / 삭제 기능 없음.
------------------------------------------------------------------->

<div>
   <!-- 메뉴 영역 -->
   <div>
      <c:import url="EmpMenu.jsp"></c:import>
   </div>
   
   <!-- 콘텐츠 영역 -->
   <div id="content">
      <h1>[ 직위 리스트(일반회원 전용) ]</h1>
      <hr/>
      
      <br><br>
      
      
      <table id="customers" class="table">
         <tr>
             <!-- 항목 15EA -->
            <th>직위 번호</th>
            <th>직위 이름</th>
            <th>최소기본급</th>
         </tr>
         <c:forEach var="position" items="${positionList}">
            <tr>
               <td>${position.positionId }</td>
               <td>${position.positionName }</td>
               <td>${position.minBasicPay }
            </tr>
         </c:forEach>
      </table>
   
   </div>
   
   <!-- 회사 소개 및 어플리케이션 소개 영역 -->
   <div id="footer">
   
   </div>
   
</div>

</body>
</html>