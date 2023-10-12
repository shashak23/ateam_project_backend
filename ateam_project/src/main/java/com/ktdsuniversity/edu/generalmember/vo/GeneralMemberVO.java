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
	private List<CareerVO> careerVO;
	
	public List<CareerVO> getCareerVO() {
		return careerVO;
	}
	public void setCareerVO(List<CareerVO> careerVO) {
		this.careerVO = careerVO;
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
