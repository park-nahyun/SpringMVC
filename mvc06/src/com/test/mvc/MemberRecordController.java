/*===============================
   MemberRecordController.java
================================*/

package com.test.mvc;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberRecordController	// MemberListController 라고 만들지 않음. 여기서 insert, insertform 다 처리하므로
{
   // ※ 액션 처리를 위한 메소드는 사용자 지정
   /*
   @RequestMapping("URL 매핑 주소")
   public String 메소드 이름(매개변수)
   {
      // ※ 비즈니스 로직 처리(모델 활용)
      //  ...
      
      return "뷰 이름.jsp";
   }
   */
   
   // 데이터베이스의 데이터를 읽어오는 과정
   @RequestMapping("/memberlist.action")
   public String memberList(Model model)
   {
      // ※ 비즈니스 로직 처리(모델 활용)
      String result = "";
      
      ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
      MemberDAO dao = new MemberDAO();
      
      try
      {
         dao.connection();
         list = dao.lists();
         
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
      finally
      {
         try
         {
            dao.close();
            
         } catch (Exception e)
         {
            System.out.println(e.toString());
         }
      }
     
     model.addAttribute("list", list);
      
      //return "뷰 이름.jsp";
      result = "/WEB-INF/views/MemberList.jsp";
      
  
      return result;
   }
   
   // 데이터 입력(회원 등록) 폼 요청 관련 액션 메소드 정의 - insertform.action
   @RequestMapping("/memberinsertform.action")	// 그냥 폼 만나게만 해주는 역할
   public String memberInsertForm()
   {
      String result = "";
      
      //return "뷰 이름.jsp";
      result = "/WEB-INF/views/MemberInsertForm.jsp";
      
      return result;
   }
   
   // 데이터 입력(회원 등록) 액션 메소드 정의 - insert.action
   @RequestMapping("/memberinsert.action")	// 원래 겟파라미터해야하는데.. 여기서는 리퀘스트 매핑에서(MemberInsertForm.jsp로부터)넘어온 객체가 MemberDTO(매개변수)로 넘어옴..
   										    // 스프링 안에서 이미 set되어 넘어옴
   public String memberInsert(MemberDTO dto)	// id, pw, name, tel, email
		   
   {
	      String result = "";
	      
	      MemberDAO dao = new MemberDAO();
	      
	      try
	      {
	    	 dao.connection();
	         dao.insertQuery(dto);
	         dao.lists();
	         
	      } catch (Exception e)
	      {
	         System.out.println(e.toString());
	      }
	      finally
	      {
	         try
	         {
	            dao.close();
	            
	         } catch (Exception e)
	         {
	            System.out.println(e.toString());
	         }
	      }
	      
	      //return "뷰 이름.jsp";
	      result = "redirect:memberlist.action";
	      
	      return result;
   }
}