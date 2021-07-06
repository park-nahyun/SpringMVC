<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%

	// Test4.jsp
	
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	/* String root = request.getRealPath("/"); */ // 예전 방식
	String root = pageContext.getServletContext().getRealPath("/");
	
	// 실제 물리적 주소
	System.out.println(root);	// web 에서 실행하고 console 창에서 확인
	//--==> C:\SpringMVC\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileSystemApp03\
	//		워크스페이스\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileSystemApp03\
	
	// 저장되는 위치와 폴더
	String path = root  + "pds"+ File.separator  + "File.separator" + "saveData";

	// 확인
	System.out.println(path);
	
	// 저장 대상(디렉터리 경로)이 존재하지 않으면 생성 (얘네에 의해 그 경로 디렉토리가 만들어 지는 것)
	File dir = new File(path);
	if(!dir.exists())
		dir.mkdirs();
	
	String encType = "UTF-8";
	int maxFileSize = 5*1024*1024;	// 전송 최대 사이즈 5M
	
	try
	{
		MultipartRequest req = null; 
		req = new MultipartRequest(request, path, maxFileSize, encType, new DefaultFileRenamePolicy());
								//  ↑ 이 리퀘스트(요청객체)를 건네주면 알아서 필터링해서 주는게 req			
		// out.println("이름 :" + request.getParameter("name") + "<br>");	// null 바이너리 형식으로 바인딩하면 얘를 못 읽음
		out.println("이름 : " + req.getParameter("name") + "<br>");
		out.println("서버에 저장된 파일명 : " + req.getFilesystemName("upload") + "<br>");
		out.println("파일 타입 : " + req.getContentType("upload") + "<br>");
		
		  File file = req.getFile("upload");
	      if(file != null)
	         out.println("파일길이 : "+ file.length()+"<br>");
	      
	      // 디폴트 정책 : 같은 이름 업로드하면 알아서 1, 2, 3, .. 이렇게 붙어서 저장되는 것
	      // 이름 같다고 충돌나면 클라이언트가 제어 못하니까 이런 기본 이름 정책을 준비

	}
	catch(Exception e)
	{
		System.out.println("e.toString()");
	}
%>















