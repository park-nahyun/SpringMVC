/*================================
   #.?? PositionListController.java
   - 사용자 정의 컨트롤러 클래스
================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구현한다.
public class PositionListController implements Controller
{

	// DAO 인터페이스 자료형 멤버 구성
	private IPositionDAO dao;
	
	// setter 구성
	public void setDao(IPositionDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{

			// 액션 코드
			
			ModelAndView mav = new ModelAndView();
			
			
			// 세션 처리과정 추가 (로그인해서 name이나 admin이 없다면 이 페이지 이용 못해야 함)-------------
			
			HttpSession session = request.getSession();
			
			if(session.getAttribute("name")==null) //-- 로그인이 되어있지 않은 상황
			{
				mav.setViewName("redirect:loginform.action");
				return mav;
			}
			else if(session.getAttribute("admin")==null)	 //-- 로그인은 되었지만 관리자가 아님. 일반 사원.
			{
				mav.setViewName("redirect:logout.action");	// 기존의 로그인을 풀어주는 것
				return mav;
			}
			
			// ------------------------------------------------------------------------- 세션 처리과정 추가
			// 관리자로 로그인 된 상황
			
			ArrayList<Position> positionList = new ArrayList<Position>();
			
			try
			{
				positionList = dao.list();
				
				mav.addObject("positionList", positionList);
				
				mav.setViewName("/WEB-INF/views/PositionList.jsp");
			}
			catch (Exception e)
			{
				System.out.println(e.toString());
			}

			return mav;

	}

}
