/*================================
   HelloController.java
   - 사용자 정의 컨트롤러 클래스
================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구현한다.
public class ReceiveController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		// 한글이 넘어올 수도 있으므로 인코딩타입 세팅
		request.setCharacterEncoding("UTF-8");
		// send에서 보낸 값 수신 
		String userName = request.getParameter("userName");
		
		// 모델앤뷰에 userName이란 이름으로 userName을 넘기겠다.
		mav.addObject("userName", userName);
		mav.setViewName("/WEB-INF/views/Receive.jsp");
		
		return mav;

	}

}
