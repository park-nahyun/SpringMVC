/*==========================
 *  #03. Region.java
 *  - 지역 데이터 자료형 클래스
 ===========================*/

package com.test.mvc;

public class Region
{
	// 주요 속성 구성
	//-- 지역아이디, 지역명, 제거가능여부
	private String regionId, regionName;
	private int delCheck;	//-- 삭제 가능 여부에 대한 확인
	//-- 참조되고 있는 경우(1 이상) 삭제 불가능.
	//   그렇지 않은 경우(0)만 삭제 가능.
	
	// getter/setter 구성
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
	public int getDelCheck()
	{
		return delCheck;
	}
	public void setDelCheck(int delCheck)
	{
		this.delCheck = delCheck;
	}

}
