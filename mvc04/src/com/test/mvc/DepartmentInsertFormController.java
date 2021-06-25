/*==========================================
   #??. DepartmentInsertFormController.java
   - 사용자 정의 컨트롤러 클래스
   - DAO 객체에 대한 의존성 주입(DI)을 위한 준비
     → 인터페이스 형태의 자료형을 속성으로 구성
     → setter 메소드 구성
===========================================*/


package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 `Controller` 인터페이스를 구현하는 방법을 통해
//   사용자 정의 컨트롤러 클래스를 구현한다.

public class DepartmentInsertFormController implements Controller
{
   private IDepartmentDAO dao;
   
   public void setDao(IDepartmentDAO dao)
   {
      this.dao = dao;
   }

   @Override
   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
   {
      // 액션 코드
      
      ModelAndView mav = new ModelAndView();
	
	HttpSession session = request.getSession();
	
	if(session.getAttribute("name")==null) //-- 로그인x
	{
		mav.setViewName("redirect:loginform.action");
		return mav;
	}
	else if(session.getAttribute("admin")==null)	 //-- 일반 사원.
	{
		mav.setViewName("redirect:logout.action");	// 기존의 로그인을 풀어주는 것
		return mav;
	}
	
	// ------------------------------------------------------------------------- 세션 처리과정 추가
	// 관리자로 로그인 된 상황
		
      ArrayList<Department> departmentList = new ArrayList<Department>();
      
      try
      {
         departmentList = dao.list();

         mav.addObject("departmentList", departmentList);

         
         mav.setViewName("WEB-INF/views/DepartmentInsertForm.jsp");

         
      } 
      catch (Exception e)
      {
         System.out.println(e.toString());
      }

      
      return mav;
      
   }
   
}