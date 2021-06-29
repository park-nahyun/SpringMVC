/*=======================
 * IMemberDAO.java
 - 인터페이스
=========================*/

package com.test.mybatis;

import java.util.ArrayList;

public interface IMemberDAO
{
	public int add(MemberDTO m);
	public int count();
	public ArrayList<MemberDTO> list();
	public int modify(MemberDTO m);
	public int remove(MemberDTO m);
}
