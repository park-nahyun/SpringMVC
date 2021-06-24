/*===================================
   #29. LoginController.java
   - 사용자 정의 컨트롤러 클래스
   - 로그인 액션 처리 전용 클래스
   - DAO 객체에 대한 의존성 주입(DI)을 위한 준비
     → 인터페이스 형태의 자료형을 속성으로 구성
     → setter 메소드 구성   
=====================================*/
package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구현한다.
public class LoginController implements Controller
{	
	private IEmployeeDAO dao;
	
	
	public void setDao(IEmployeeDAO dao)
	{
		this.dao = dao;
	}


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();

		// 데이터 수신(→ LoginForm.jsp 페이지로부터 넘어온 데이터 수신)
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String admin = request.getParameter("admin");
		
		String name = null;
		
		
		try
		{
			// 로그인 처리 → 대상에 따른 로그인 처리 방식 구분/분기
			if(admin==null)		// dao에서 result를 ""로 초기화 했다면 문제가 생김. 어쨌든 admin에 무슨 값이 들어가있으므로 admin 속성을 가진 것이 됨..
			{
				// 일반 사원 로그인
				name = dao.login(id, pw);
			}
			else
			{
				// 관리자 로그인
				name = dao.loginAdmin(id, pw);
			}
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		// 로그인 수행에 따른 성공 여부 확인 및 구분/분기
		if(name==null)
		{
			// 로그인 실패 → 로그인 폼을 다시 요청할 수 있도록 안내
			mav.setViewName("redirect:loginform.action");
		}
		else
		{
			// 로그인 성공 → 세션 구성
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			
			// 관리자인지의 여부 확인
			// 관리자 → employeelist.action 을 요청할 수 있도록 안내
			// 일반직원 → emplist.action 을 요청할 수 있도록 안내 
			
			if(admin==null) 	//-- 일반 직원으로 로그인 성공한 상황
			{
				mav.setViewName("redirect:emplist.action");
			}
			else		//-- 관리자로 로그인 성공한 상황
			{
				session.setAttribute("admin", "");
				mav.setViewName("redirect:employeelist.action");
			}

		}
		
		return mav;

	}

}
