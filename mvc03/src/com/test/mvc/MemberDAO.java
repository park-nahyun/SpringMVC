/*=====================================
 * MemberDAO.java
 * - 데이터베이스  액션 처리 클래스.
 * - Connection 객체에 대한 의존성 주입.
 *   → setter 메소드 추가.
 =====================================*/
package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;



public class MemberDAO implements IMemberDAO
{
	// 원래는 커넥션을 생성자 안에서 conn = 디비컨 어쩌구
	// 해서 dao 생성되면 자동으로 connection 생성되게 했지만..
	// 스프링에서 connection은 인터페이스여야하는데..
	// 인터페이스 안에서 스태틱을 만들 수 없으므로.. 다른 방법..
	// 스프링이 주입하게끔...
	
	// 인터페이스여야 하는 이유?
	// set어쩌구(인터페이스 b)
	// {} 여기에 예를 implements 한 애들은 누구나 주입할 수 있어야 하므로
	// 근데 DBConn 은 스태틱으로 구성(싱글톤 때문에)
	// 스태틱은 미리 태어나는 거라 인터페이스 안에 선언 안됨.
	// 그래서 이 방법 대신 스프링이 제공하는 걸 쓰겠다.
	// 이 떄 DBConn 대신 쓰이는 인터페이스가 DataSource
	// 얘를 imple 하는 클래스 중에 SimpleDriverDataSource 가 있음
	// DBConn만 쓰는 건 스프링 정신 아님. 이것저것 다 쓸 수 있어야함.
	// 즉 이 인터페이스를 다른데다 주입가능하겠지~ 스프링 정신!
	// 주입해달라는걸 디스패처 서블릿에 요청할 것.. 
	// SimpleDriverDataSource
	
	// ※ Connection 객체에 대한 의존성 주입을 위한 준비
	//    ① 인터페이스 형태의 데이터타입을 취하는 속성 구성
	private DataSource dataSource;
	
	//    ② setter 구성 (빈 구멍에 채워 넣을 수 있게끔.. 필요에 의해 setter로 주입.. 스프링에서 스프링이 다해줌..
	//    dataSource를 implements 한 모든 클래스를 매개변수로 넘겨줄 수 있게 됨
	//    
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	// ※ IMemberDAO 인터페이스의 메소드 오버라이딩
	@Override
	public int add(MemberDTO member) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO TBL_MEMBERLIST(MID, NAME, TELEPHONE)"
				+ " VALUES(MEMBERLISTSEQ.NEXTVAL, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getName());
		pstmt.setString(2, member.getTelephone());
		
	    result = pstmt.executeUpdate();
	    
	    pstmt.close();
	    conn.close();
	    
	    return result;
	}

	@Override
	public int count() throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBERLIST";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
	    ResultSet rs = pstmt.executeQuery();
	    while(rs.next())
	    {
	    	
	    	result = rs.getInt("COUNT");
	    }
	    
	    rs.close();
	    pstmt.close();
	    conn.close();
	    
	    return result;
	}

	@Override
	public ArrayList<MemberDTO> list() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT MID, NAME, TELEPHONE FROM TBL_MEMBERLIST ORDER BY MID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
	    ResultSet rs = pstmt.executeQuery();
	    while(rs.next())
	    {
	    	MemberDTO member = new MemberDTO();
	    	member.setMid(rs.getInt("MID"));
	    	member.setName(rs.getString("NAME"));
	    	member.setTelephone(rs.getString("TELEPHONE"));
	    	
	    	result.add(member);
	    }
	    
	    rs.close();
	    pstmt.close();
	    conn.close();
	    
	    return result;
	}

}
