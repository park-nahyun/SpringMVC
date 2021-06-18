<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
      request.setCharacterEncoding("UTF-8");
      String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmpList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">

</head>
<body>

<!------------------------------------------------------------------
  #31. EmpList.jsp
  - 직원 리스트 출력 페이지.
  - 일반직원이 접근하는 직원 데이터 출력 페이지
  - 입력 / 수정 / 삭제 기능 없음.
------------------------------------------------------------------->

<div>
   <!-- 메뉴 영역 -->
   <div>
      <c:import url="EmpMenu.jsp"></c:import>
   </div>
   
   <!-- 콘텐츠 영역 -->
   <div id="content">
      <h1>[ 직원 리스트(일반직원 적용) ]</h1>
      <hr />

      <br><br>
      
      <!-- EMPLOYEEID NAME DEPARTMENTNAME POSITIONNAME REGIONNAME GRADE  -->
      
      <table id="customers" class="table">
         <tr>
             <!-- 항목 15EA -->
            <th>번호</th>
            <th>이름</th>
            <th>지역</th>
            <th>부서</th>
            <th>직위</th>
            <th>등급</th>
         </tr>
         <c:forEach var="employee" items="${employeeList}">
         <!-- 지금은 우리에게 필요한 것 빼고 다 지울 것.
         그런데 실무에서는... 사실 employeeList 안에는 ssn 등이 다 있음... 
         즉 악의적이라면 충분히 정보를 빼갈 수 있는 상황... 철가방 탈취 당하면 그 안의 음식을 다 뺏김...
         그래서 처음부터 employeeList 전체가 아니라 필요한 것만 가져오는 것이 중요-->
            <tr>
               <td>${employee.employeeId }</td>
               <td>${employee.name }</td>
               <td>${employee.regionName }</td>
               <td>${employee.departmentName }</td>
               <td>${employee.positionName }</td>
               <td>
                  ${employee.grade==0? "관리자" : "일반직원" }
               </td>
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