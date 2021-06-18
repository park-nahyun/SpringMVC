/*==========================
 *  #01. Employee.java
 *  - 직원 데이터 자료형 클래스
 ===========================*/


package com.test.mvc;

public class Employee
{
	// 주요 속성 구성
	// 사원번호, 사원명, 주민번호, 생년월일, 양음력
	// 전화번호. 부서아이디, 부서명, 직위아이디, 직위명, 지역아이디, 지역명
	private String employeeId, name, ssn, birthday, lunarName
	, telephone, departmentId, departmentName
	, positionId, positionName, regionId, regionName;
	
	private int lunar;			// 양력0, 음력1
	private int basicPay, extraPay, pay;
	
	private String ssn1, ssn2;	// 주민번호 앞자리, 뒷자리
	private int grade;			// 관리자0, 일반직원1
	
	// getter/setter 구성
	public String getEmployeeId()
	{
		return employeeId;
	}
	public void setEmployeeId(String employeeId)
	{
		this.employeeId = employeeId;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getSsn()
	{
		return ssn;
	}
	public void setSsn(String ssn)
	{
		this.ssn = ssn;
	}
	public String getBirthday()
	{
		return birthday;
	}
	public void setBirthday(String birthday)
	{
		this.birthday = birthday;
	}
	public String getLunarName()
	{
		return lunarName;
	}
	public void setLunarName(String lunarName)
	{
		this.lunarName = lunarName;
	}
	public String getTelephone()
	{
		return telephone;
	}
	public void setTelephone(String telephone)
	{
		this.telephone = telephone;
	}
	public String getDepartmentId()
	{
		return departmentId;
	}
	public void setDepartmentId(String departmentId)
	{
		this.departmentId = departmentId;
	}
	public String getDepartmentName()
	{
		return departmentName;
	}
	public void setDepartmentName(String departmentName)
	{
		this.departmentName = departmentName;
	}
	public String getPositionId()
	{
		return positionId;
	}
	public void setPositionId(String positionId)
	{
		this.positionId = positionId;
	}
	public String getPositionName()
	{
		return positionName;
	}
	public void setPositionName(String positionName)
	{
		this.positionName = positionName;
	}
	public String getRegionId()
	{
		return regionId;
	}
	public void setRegionId(String regionId)
	{
		this.regionId = regionId;
	}
	public String getRegionName()
	{
		return regionName;
	}
	public void setRegionName(String regionName)
	{
		this.regionName = regionName;
	}
	public int getLunar()
	{
		return lunar;
	}
	public void setLunar(int lunar)
	{
		this.lunar = lunar;
	}
	public int getBasicPay()
	{
		return basicPay;
	}
	public void setBasicPay(int basicPay)
	{
		this.basicPay = basicPay;
	}
	public int getExtraPay()
	{
		return extraPay;
	}
	public void setExtraPay(int extraPay)
	{
		this.extraPay = extraPay;
	}
	public int getPay()
	{
		return pay;
	}
	public void setPay(int pay)
	{
		this.pay = pay;
	}
	public String getSsn1()
	{
		return ssn1;
	}
	public void setSsn1(String ssn1)
	{
		this.ssn1 = ssn1;
	}
	public String getSsn2()
	{
		return ssn2;
	}
	public void setSsn2(String ssn2)
	{
		this.ssn2 = ssn2;
	}
	public int getGrade()
	{
		return grade;
	}
	public void setGrade(int grade)
	{
		this.grade = grade;
	}

}
