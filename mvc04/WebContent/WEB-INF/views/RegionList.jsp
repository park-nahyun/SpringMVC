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
<title>RegionList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
   $(function()
   {
      $(".updateBtn").click(function()
      {       
         $(location).attr("href", "regionupdateform.action?regionId=" + $(this).val());
         // this → $(".updateBtn")
     
 
      });
      
      $(".deleteBtn").click(function()
      {
         // 테스트
         // alert("삭제 버튼 클릭");
         
         if (confirm("현재 선택한 데이터를 삭제하시겠습니가?"))
         {
        	 $(location).attr("href", "regiondelete.action?regionId=" + $(this).val());
         }
      });
   });
</script>


</head>
<body>

<!------------------------------------------------------------------
  #??. RegionList.jsp
  - 지역 리스트 출력 페이지.
  - 관리자가 접근하는 지역 데이터 출력 페이지
------------------------------------------------------------------->

<div>
   <!-- 메뉴 영역 -->
   <div>
      <c:import url="EmployeeMenu.jsp"></c:import>
   </div>
   
   <!-- 콘텐츠 영역 -->
   <div id="content">
      <h1>[ 지역 관리(관리자 전용) ]</h1>
      <hr />
      
      <div>
         <form action="/regioninsertform.action">
            <input type="button" value="지역 추가" class="btn"
            onclick="location.href='regioninsertform.action'">
         </form>
      </div>
      <br><br>
      
      
      <table id="customers" class="table">
         <tr>
             <!-- 항목 15EA -->
            <th>지역 번호</th>
            <th>지역 이름</th>
            <th>삭제가능여부</th>
            <th>수정</th>
            <th>삭제</th>
         </tr>
         <c:forEach var="region" items="${regionList}">
            <tr>
               <td>${region.regionId }</td>
               <td>${region.regionName }</td>
               <td>${region.delCheck }</td>
               <td><button type="button" class="btn updateBtn"
               value="${region.regionId }">수정</button></td>
               <td><button type="button" class="btn deleteBtn"
               value="${region.regionId }"
               ${region.delCheck==0 ? "" : "disabled=\"disabled\"" } >삭제</button></td>
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