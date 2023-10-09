package com.ktdsuniversity.edu.career.vo;

public class CareerVO {
	private String careerId;
	private String generalMemberId;
	/**
	 * 근무 회사명
	 */
	private String previousCompanyName;
	private String jobTitle;
	private String hireDate;
	private String resignDate;
	private CareerVO careerVO;
	
	
	public CareerVO getCareerVO() {
		return careerVO;
	}
	public void setCareerVO(CareerVO careerVO) {
		this.careerVO = careerVO;
	}
	public String getCareerId() {
		return careerId;
	}
	public void setCareerId(String careerId) {
		this.careerId = careerId;
	}
	public String getGeneralMemberId() {
		return generalMemberId;
	}
	public void setGeneralMemberId(String generalMemberId) {
		this.generalMemberId = generalMemberId;
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
