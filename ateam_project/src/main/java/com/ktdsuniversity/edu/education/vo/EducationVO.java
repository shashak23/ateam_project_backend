/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-13
 * 내용 : 경력 전체 VO입니다.
 */
package com.ktdsuniversity.edu.education.vo;


import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;
public class EducationVO {
	private String educationId;
	private String generalMemberEmail;
	private String schoolName;
	private String schoolDepartment;
	private String degrees;
	private GeneralMemberVO generalMemberVO;
	
	
	
	public String getEducationId() {
		return educationId;
	}
	public void setEducationId(String educationId) {
		this.educationId = educationId;
	}
	public String getGeneralMemberEmail() {
		return generalMemberEmail;
	}
	public void setGeneralMemberEmail(String generalMemberEmail) {
		this.generalMemberEmail = generalMemberEmail;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getSchoolDepartment() {
		return schoolDepartment;
	}
	public void setSchoolDepartment(String schoolDepartment) {
		this.schoolDepartment = schoolDepartment;
	}
	public String getDegrees() {
		return degrees;
	}
	public void setDegrees(String degrees) {
		this.degrees = degrees;
	}
	public GeneralMemberVO getGeneralMemberVO() {
		return generalMemberVO;
	}
	public void setGeneralMemberVO(GeneralMemberVO generalMemberVO) {
		this.generalMemberVO = generalMemberVO;
	}
	
	
	
	
	
	
	
	
}
