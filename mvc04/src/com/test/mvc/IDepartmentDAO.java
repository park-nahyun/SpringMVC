/*==========================
 *  #06. IDepartmentDAO.java
 *  - 인터페이스
 ===========================*/

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDepartmentDAO
{
	public ArrayList<Department> list() throws SQLException;
	
	public int add(Department department) throws SQLException;
	public int remove(String departmentId) throws SQLException;
	public int modify(Department department) throws SQLException;
	public Department search(String departmentId) throws SQLException;
}
