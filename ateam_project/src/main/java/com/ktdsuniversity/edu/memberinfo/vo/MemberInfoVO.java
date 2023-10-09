package com.ktdsuniversity.edu.memberinfo.vo;

import com.ktdsuniversity.edu.member.vo.MemberVO;

public class MemberInfoVO {
	private String generalMemberId;
	private String selfIntro;
	private String jobId;
	private String region;
	private String tierId;
	private String githubUrl;
	private String email;
	private String blogUrl;
	private MemberVO memberVO;
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getGeneralMemberId() {
		return generalMemberId;
	}
	public void setGeneralMemberId(String generalMemberId) {
		this.generalMemberId = generalMemberId;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBlogUrl() {
		return blogUrl;
	}
	public void setBlogUrl(String blogUrl) {
		this.blogUrl = blogUrl;
	}
	
	
}
