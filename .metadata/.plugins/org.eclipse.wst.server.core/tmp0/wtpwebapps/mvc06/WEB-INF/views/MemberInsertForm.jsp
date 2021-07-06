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
<title>MemberInsertForm.jsp</title>
</head>
<body>

<!---------------------------------------
  #22. EmployeeInsertForm.jsp
  - 직원 데이터 입력  페이지.
---------------------------------------->


<div>

   <div id="content">
   
      <h1>[ 직원 추가 ]</h1>
      <hr>
      
      <form action="memberinsert.action" method="post" id="employeeForm">
         <table>
            <tr>
               <th>아이디</th>
               <td>
                  <input type="text" id="id" name="id" placeholder="아이디"/>
               </td>
            </tr>         
            <tr>
               <th>패스워드</th>
               <td>
                  <input type="text" id="pw" name="pw" placeholder="패스워드"/>
               </td>
            </tr>
            <tr>
               <th>이름</th>
               <td>
                  <input type="text" id="name" name="name" placeholder="이름"/>
               </td>
            </tr>
            <tr>
               <th>전화번호</th>
               <td>
                  <input type="text" id="tel" name="tel" placeholder="전화번호"/>
               </td>
            </tr>
            <tr>
               <th>이메일</th>
               <td>
                  <input type="text" id="email" name="email" placeholder="이메일"/>
               </td>
            </tr>
 
			<tr>
			  <td><button type="submit" class="btn updateBtn">등록</button></td> 
			</tr>
         </table>
      
      
      </form>
   </div>
</div>


</body>
</html>