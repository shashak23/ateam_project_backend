/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-24
 * 수정일자 : 2023-10-25 수정자(김광원)
 * 내용 : 일반회원을 위한 VO입니다.
 */
package com.ktdsuniversity.edu.generalmember.vo;

import java.util.List;

import com.ktdsuniversity.edu.career.vo.CareerVO;
import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;
import com.ktdsuniversity.edu.education.vo.EducationVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.techstack.vo.TechstackVO;
import com.ktdsuniversity.edu.util.XssIgnore;

import jakarta.validation.constraints.NotBlank;

public class GeneralMemberVO extends MemberVO {
	private String generalMemberEmail;
	
	@XssIgnore
	private String selfIntro;
	
	private String jobId;
	@NotBlank(message = "주소를 입력해주세요.")
	private String region;
	private String tierId;
	private String githubUrl;
	private String additionalEmail;
	private String blogUrl;
	private List<GeneralMemberVO> generalMemberList;
	private List<CareerVO> careerVOList;
	private List<EducationVO> educationList;
	private List<CommonCodeVO> commonCodeVO;
	private TechstackVO techstackVO;
	private MemberVO memberVO;
	
	
	
	
	
	public List<CommonCodeVO> getCommonCodeVO() {
		return commonCodeVO;
	}
	public void setCommonCodeVO(List<CommonCodeVO> commonCodeVO) {
		this.commonCodeVO = commonCodeVO;
	}
	public TechstackVO getTechstackVO() {
		return techstackVO;
	}
	public void setTechstackVO(TechstackVO techstackVO) {
		this.techstackVO = techstackVO;
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
	public List<GeneralMemberVO> getGeneralMemberList() {
		return generalMemberList;
	}
	public void setGeneralMemberList(List<GeneralMemberVO> generalMemberList) {
		this.generalMemberList = generalMemberList;
	}
	public List<CareerVO> getCareerVOList() {
		return careerVOList;
	}
	public void setCareerVOList(List<CareerVO> careerVOList) {
		this.careerVOList = careerVOList;
	}
	public List<EducationVO> getEducationList() {
		return educationList;
	}
	public void setEducationList(List<EducationVO> educationList) {
		this.educationList = educationList;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
	
}
