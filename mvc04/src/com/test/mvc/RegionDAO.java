/*======================================
 *  #11. RegionDAO.java
 *  - 데이터베이스 액션 처리 클래스.
	- 지역 데이터 입력 / 출력 / 수정 / 삭제 액션.
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

public class RegionDAO implements IRegionDAO
{
	private DataSource datasource;

	public void setDatasource(DataSource datasource)
	{
		this.datasource = datasource;
	}

	// 지역 리스트 전체 출력
	@Override
	public ArrayList<Region> list() throws SQLException
	{
		ArrayList<Region> result = new ArrayList<Region>();
		
		Connection conn = datasource.getConnection();
		
		String sql = "SELECT REGIONID, REGIONNAME, DELCHECK"
				+ " FROM REGIONVIEW"
				+ " ORDER BY REGIONID";
		
		PreparedStatement pstmt =  conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		Region region=null;
		
		while(rs.next())
		{
			region = new Region();
			
			region.setRegionId(rs.getString("REGIONID"));
			region.setRegionName(rs.getString("REGIONNAME"));
			region.setDelCheck(rs.getInt("DELCHECK"));
			
			result.add(region);
			
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 지역 데이터 등록(입력, 추가)
	@Override
	public int add(Region region) throws SQLException
	{
		int result = 0;
		
		Connection conn = datasource.getConnection();
		
		String sql = "INSERT INTO REGION(REGIONID, REGIONNAME)"
				+ " VALUES(REGIONSEQ.NEXTVAL, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, region.getRegionName());
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 지역 데이터 제거
	@Override
	public int remove(String regionId) throws SQLException
	{
		int result = 0;
		
		Connection conn = datasource.getConnection();
		
		String sql = "DELETE FROM REGION WHERE REGIONID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(regionId));
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	
	// 지역 데이터 수정
	@Override
	public int modify(Region region) throws SQLException
	{
		int result = 0;
		
		Connection conn = datasource.getConnection();
		
		String sql = "UPDATE REGION"
				+ " SET REGIONNAME=?"
				+ " WHERE REGIONID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, region.getRegionName());
		pstmt.setInt(2, Integer.parseInt(region.getRegionId()));
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public Region search(String regionId) throws SQLException
	{
		Region region = new Region();
		
		
		Connection conn = datasource.getConnection();
		
		String sql = "SELECT REGIONID, REGIONNAME, DELCHECK"
				+ " FROM REGIONVIEW"
				+ " WHERE REGIONID = ?";
		
		PreparedStatement pstmt =  conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(regionId));
		ResultSet rs = pstmt.executeQuery();
		
		
		while(rs.next())
		{		
			region.setRegionId(rs.getString("REGIONID"));
			region.setRegionName(rs.getString("REGIONNAME"));
			region.setDelCheck(rs.getInt("DELCHECK"));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return region;
	}

}
