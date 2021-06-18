/*==========================
 *  #05. IEmployeeDAO.java
 *  - 인터페이스
 ===========================*/

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IEmployeeDAO
{
	public ArrayList<Employee> list() throws SQLException;
	public ArrayList<Region> regionList() throws SQLException;
	public ArrayList<Department> departmentList() throws SQLException;
	public ArrayList<Position> positionList() throws SQLException;
	
	public int getMinBasicPay(String positionId) throws SQLException;
	// 기본급 5만원.. 이런식으로 입력 못하게끔 하기 위해..
	public int employeeAdd(Employee employee) throws SQLException;
	public int remove(String employeeId) throws SQLException;
	public int modify(Employee employee) throws SQLException;
	public Employee searchId(String employeeId) throws SQLException;
	
	public String login(String id, String pw) throws SQLException;
	public String loginAdmin(String id, String pw) throws SQLException;
}
// 직원 입력할 때 부서 입력하려면 우리 DB 상에 있는 부서를 입력하게끔 해야함.
// 부서(개발부/마케팅부/영업부) : ... 그러려면 괄호안에 부서 리스트를 들고와야함