package com.ktdsuniversity.edu.career.vo;

import java.util.List;

import com.ktdsuniversity.edu.generalmember.vo.GeneralMemberVO;

import jakarta.validation.constraints.NotBlank;

public class CareerVO {
	private String careerId;
	private String generalMemberEmail;
	@NotBlank(message = "회사명을 입력해주세요.")
	private String previousCompanyName;
	@NotBlank(message = "직무명을 입력해주세요.")
	private String jobTitle;
	@NotBlank(message = "입사일을 입력해주세요.")
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
