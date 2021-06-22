/*==============================================
   #20.AjaxController.java
   - 사용자 정의 컨트롤러 클래스
   - 직위에 따른 최소 기본급 반환
   - DAO 객체에 대한 의존성 주입(DI)을 위한 준비
     → 인터페이스 형태의 자료형을 속성으로 구성
     → setter 메소드 구성
==============================================*/


package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구현한다.
public class AjaxController implements Controller
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

		// 데이터 수신 (→ EmployeeInsertForm.jsp 로 부터... positionID 수신)
		String positionId = request.getParameter("positionId");
		
		int result = 0;
		
		try
		{
			result = dao.getMinBasicPay(positionId);
			
			mav.addObject("result", result);
			
			mav.setViewName("/WEB-INF/views/Ajax.jsp");
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;

	}

}
