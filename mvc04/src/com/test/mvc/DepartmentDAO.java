/*======================================
 *  #10. DepartmentDAO.java
 *  - 데이터베이스 액션 처리 클래스.
	- 부서 정보 입력 / 출력 / 수정 / 삭제 액션.
	- Connection 객체에 대한 의존성 주입을 위한 준비.
	  → setter injection
	     → · 인터페이스 형태의 자료형 구성
	       · setter 메소드 정의
 ========================================*/

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class DepartmentDAO implements IDepartmentDAO
{
	// 인터페이스 형태의 자료형을 속성으로 구성
	private DataSource datasource;
	
	// setter 메소드 정의(구성)
	public void setDatasource(DataSource datasource)
	{
		this.datasource = datasource;
	}
	
// 인터페이스에서 선언된 메소드 재정의 ----------------------------------------------------
	
	// 부서 전체 리스트 출력
	@Override
	public ArrayList<Department> list() throws SQLException
	{
		ArrayList<Department> result = new ArrayList<Department>();
		
		Connection conn = datasource.getConnection();
		
		String sql = "SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK"
				+ " FROM DEPARTMENTVIEW"
				+ " ORDER BY DEPARTMENTID";
		
		PreparedStatement pstmt =  conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		Department department=null;
		
		while(rs.next())
		{
			 department = new Department();
			
			department.setDepartmentId(rs.getString("DEPARTMENTID"));
			department.setDepartmentName(rs.getString("DEPARTMENTNAME"));
			department.setDelCheck(rs.getInt("DELCHECK"));
			
			result.add(department);
			
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 부서 데이터 등록(입력, 추가)
	@Override
	public int add(Department department) throws SQLException
	{
		int result = 0;
		
		Connection conn = datasource.getConnection();
		
		String sql = "INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME)"
				+ " VALUES(DEPARTMENTSEQ.NEXTVAL, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, department.getDepartmentName());
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;

	}

	// 부서 데이터 제거
	@Override
	public int remove(String departmentId) throws SQLException
	{
		int result = 0;
		
		Connection conn = datasource.getConnection();
		
		String sql = "DELETE FROM DEPARTMENT WHERE DEPARTMENTID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(departmentId));
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		return result;
	}

	// 부서 데이터 수정
	@Override
	public int modify(Department department) throws SQLException
	{
		int result = 0;
		
		Connection conn = datasource.getConnection();
		
		String sql = "UPDATE DEPARTMENT"
				+ " SET DEPARTMENTNAME=?"
				+ " WHERE DEPARTMENTID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, department.getDepartmentName());
		pstmt.setInt(2, Integer.parseInt(department.getDepartmentId()));
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public Department search(String departmentId) throws SQLException
	{
		Department department = new Department();
		
		
		Connection conn = datasource.getConnection();
		
		String sql = "SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK"
				+ " FROM DEPARTMENTVIEW"
				+ " WHERE DEPARTMENTID = ?";
		
		PreparedStatement pstmt =  conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(departmentId));
		ResultSet rs = pstmt.executeQuery();
		
		
		while(rs.next())
		{		
			department.setDepartmentId(rs.getString("DEPARTMENTID"));
			department.setDepartmentName(rs.getString("DEPARTMENTNAME"));
			department.setDelCheck(rs.getInt("DELCHECK"));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return department;
	}

	
}
