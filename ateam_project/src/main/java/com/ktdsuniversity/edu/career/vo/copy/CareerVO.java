package com.ktdsuniversity.edu.career.vo.copy;

import java.util.List;

import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;

public class CareerVO {
	private String careerId;
	private String generalMemberEmail;
	private String previousCompanyName;
	private String jobTitle;
	private String hireDate;
	private String resignDate;
	private List<CareerVO> careerList;
	private GeneralMemberVO generalMemberVO;
	
	
	
	public List<CareerVO> getCareerList() {
		return careerList;
	}
	public void setCareerList(List<CareerVO> careerList) {
		this.careerList = careerList;
	}
	
	public GeneralMemberVO getGeneralMemberVO() {
		return generalMemberVO;
	}
	public void setGeneralMemberVO(GeneralMemberVO generalMemberVO) {
		this.generalMemberVO = generalMemberVO;
	}

	public String getCareerId() {
		return careerId;
	}
	public void setCareerId(String careerId) {
		this.careerId = careerId;
	}
	public String getGeneralMemberEmail() {
		return generalMemberEmail;
	}
	public void setGeneralMemberEmail(String generalMemberEmail) {
		this.generalMemberEmail = generalMemberEmail;
	}
	public String getPreviousCompanyName() {
		return previousCompanyName;
	}
	public void setPreviousCompanyName(String previousCompanyName) {
		this.previousCompanyName = previousCompanyName;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getHireDate() {
		return hireDate;
	}
	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}
	public String getResignDate() {
		return resignDate;
	}
	public void setResignDate(String resignDate) {
		this.resignDate = resignDate;
	}
	
	
	
	
	
}
