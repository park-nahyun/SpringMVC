/*========================================
   #23. EmployeeUpdateFormController.java
   - 사용자 정의 컨트롤러 클래스
   - DAO 객체에 대한 의존성 주입(DI)을 위한 준비
     → 인터페이스 형태의 자료형을 속성으로 구성
     → setter 메소드 구성
==========================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구현한다.
public class EmployeeUpdateFormController implements Controller
{

	// check~!!!
	// EmployeeInsertFormController 구성과는 다른 방식으로 처리~!!!
	
	/*
	 * DepartmentDAO 지역리스트
		EmployeeDAO 지역리스트
		다 따로 만듦.
		EmployeeDAO 하나 주입받으면 되게끔..
		
		여기서는 DAO들을 각각 주입받아서 거기에 있는 지역/직위 리스트를 쓸 것
	 * */
	
	
	private IEmployeeDAO employeeDAO;
	private IRegionDAO regionDAO;
	private IDepartmentDAO departmentDAO;
	private IPositionDAO positionDAO;
	
	public void setEmployeeDAO(IEmployeeDAO employeeDAO)
	{
		this.employeeDAO = employeeDAO;
	}

	// check~!!!
	// 나현이 엎드렷~!!!

	public void setRegionDAO(IRegionDAO regionDAO)
	{
		this.regionDAO = regionDAO;
	}
	public void setDepartmentDAO(IDepartmentDAO departmentDAO)
	{
		this.departmentDAO = departmentDAO;
	}
	public void setPositionDAO(IPositionDAO positionDAO)
	{
		this.positionDAO = positionDAO;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리과정 추가 (로그인해서 name이나 admin이 없다면 이 페이지 이용 못해야 함)-------------
		// 즉 로그아웃 상태나 일반회원 상태에서 주소창에 employeelist.action 을 직접 입력해서 접근 못하도록
		
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
		
		ArrayList<Region> regionList = new ArrayList<Region>();
		ArrayList<Department> departmentList = new ArrayList<Department>();
		ArrayList<Position> positionList = new ArrayList<Position>();
		try
		{
			// 데이터 수신 (→ EmloyeeList.jsp 로 부터... employeeId 수신)
			String employeeId = request.getParameter("employeeId");
			Employee employee = new Employee();
			
			employee = employeeDAO.searchId(employeeId);
			//System.out.println(employee.getEmployeeId());
			
			regionList = regionDAO.list();
			departmentList = departmentDAO.list();
			positionList = positionDAO.list();
			
			mav.addObject("employee", employee);
			mav.addObject("regionList", regionList);
			mav.addObject("departmentList", departmentList);
			mav.addObject("positionList", positionList);
			
			mav.setViewName("/WEB-INF/views/EmployeeUpdateForm.jsp");
			
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;

	}

}
