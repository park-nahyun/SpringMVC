/*================================
   MemberInsertController.java
   - 사용자 정의 컨트롤러 클래스
   - 회원 데이터 추가 액션 처리 클래스.
   - DAO 객체에 대한 의존성 주입 준비.(DAO를 필요로 함)
     → 인터페이스 형태의 속성 구성
     → setter 메소드 
================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구현한다.
public class MemberInsertController implements Controller
{

	// 인터페이스 자료형을 취하는 속성 구성
	private IMemberDAO dao;
	
	public void setDao(IMemberDAO dao)
	{
		this.dao = dao;
	}
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		ModelAndView mav = new ModelAndView();

		request.setCharacterEncoding("UTF-8");
		
		// 이전 페이지로부터 넘어온 데이터 수신
		String name = request.getParameter("name");
		String tel = request.getParameter("telephone");
		
		try
		{
			
			MemberDTO member =  new MemberDTO();
			member.setName(name);
			member.setTelephone(tel);
			
			dao.add(member);
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// mav.setViewName("memberlist.action 페이지를 redirect 할 수 있도록 안내");
		mav.setViewName("redirect:memberlist.action");
		// mav.setViewName("/WEB-INF/views/MemberList.jsp"); -- (X)
		// list controller와는 다른 부분
		// 리스트 컨트롤러에는 논리적 처리가 다 된 뒤 결과만을 보냈으면 됐지만
		// 여기서는 insert 해서 생긴 변화가 반영이 안된 페이지를 부르는 것과 다름 없기 때문에
		// redirect 하라고 알려주는 것
		
		// mamberlist.action 을 다시 요청해봐(redirect)
		// 나는 나대로 처리할게 너는 너대로 페이지를 다시 요청해~!
		// 그럼 insertcotroller가 갱신해서 select 해서 뿌려줄거야~
		
		return mav;
	}

}
