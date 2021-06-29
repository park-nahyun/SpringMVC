/*=======================
 * MemberDTO.java
 - 데이터 저장 및 전송 전용 객체 
=========================*/

package com.test.mybatis;

public class MemberDTO
{
	private String mid, name, telephone;
	
	// getter / setter
	public String getMid()
	{
		return mid;
	}

	public void setMid(String mid)
	{
		this.mid = mid;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTelephone()
	{
		return telephone;
	}

	public void setTelephone(String telephone)
	{
		this.telephone = telephone;
	}
	
}