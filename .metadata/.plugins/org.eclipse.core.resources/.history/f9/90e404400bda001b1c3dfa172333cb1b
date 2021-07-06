package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StudentController
{
	// mybatis 객체 의존성 (자동) 주입~!!!
	@Autowired
	private SqlSession sqlSession;


	@RequestMapping(value="/studentlist.action", method = RequestMethod.GET)
	public String studentList(ModelMap model)
	{

		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());

		return "/WEB-INF/views/StudentList.jsp";
	}

	@RequestMapping(value="/studentinsert.action", method = RequestMethod.POST)
	public String studentInsert(StudentDTO s)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		dao.add(s);

		return "redirect:/studentlist.action";
	}

	@RequestMapping(value="/studentdelete.action", method = RequestMethod.GET)
	public String studentDelete(StudentDTO s)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		dao.remove(s);

		return "redirect:/studentlist.action";
	}
}
