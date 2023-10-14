package com.ktdsuniversity.edu.generalmember.vo;

import java.util.List;

import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public class GeneralMemberVO extends MemberVO {
	private String generalMemberEmail;
	private String selfIntro;
	private String jobId;
	private String region;
	private String tierId;
	private String githubUrl;
	private String additionalEmail;
	private String blogUrl;
	private List<GeneralMemberVO> generalMemberList;
	private List<CareerVO> careerVOList;
	private MemberVO memberVO;
	
	
	public List<GeneralMemberVO> getGeneralMemberList() {
		return generalMemberList;
	}
	public void setGeneralMemberList(List<GeneralMemberVO> generalMemberList) {
		this.generalMemberList = generalMemberList;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public List<CareerVO> getCareerVOList() {
		return careerVOList;
	}
	public void setCareerVOList(List<CareerVO> careerVOList) {
		this.careerVOList = careerVOList;
	}
	public String getGeneralMemberEmail() {
		return generalMemberEmail;
	}
	public void setGeneralMemberEmail(String generalMemberEmail) {
		this.generalMemberEmail = generalMemberEmail;
	}
	
	public String getSelfIntro() {
		return selfIntro;
	}
	public void setSelfIntro(String selfIntro) {
		this.selfIntro = selfIntro;
	}
	public String getJobId() {
		return jobId;
	}
	public void setJobId(String jobId) {
		this.jobId = jobId;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getTierId() {
		return tierId;
	}
	public void setTierId(String tierId) {
		this.tierId = tierId;
	}
	public String getGithubUrl() {
		return githubUrl;
	}
	public void setGithubUrl(String githubUrl) {
		this.githubUrl = githubUrl;
	}
	
	public String getAdditionalEmail() {
		return additionalEmail;
	}
	public void setAdditionalEmail(String additionalEmail) {
		this.additionalEmail = additionalEmail;
	}
	public String getBlogUrl() {
		return blogUrl;
	}
	public void setBlogUrl(String blogUrl) {
		this.blogUrl = blogUrl;
	}
	
	
}
