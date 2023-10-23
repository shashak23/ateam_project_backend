/**
 * 작성자 : 김광원
 * 작성일자 : 2023-10-18
 * 내용 : 기술스택 컬럼을 담기위한 VO
 */
package com.ktdsuniversity.edu.techstack.vo;

import java.util.List;

import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

public class TechstackVO {
	private String techstackId;
	private String email;
	private String hashtagId;
	@NotEmpty(message = "기술스택 카테고리를 선택해주세요.")
	@Size(min = 1, message = "기술스택 카테고리를 선택해주세요.")
	private List<String> hashtagList;
	
	private MemberVO memberVO;
	private CommonCodeVO commonCodeVO;

	
	public String getHashtagId() {
		return hashtagId;
	}
	public void setHashtagId(String hashtagId) {
		this.hashtagId = hashtagId;
	}
	public List<String> getHashtagList() {
		return hashtagList;
	}
	public void setHashtagList(List<String> hashtagList) {
		this.hashtagList = hashtagList;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public CommonCodeVO getCommonCodeVO() {
		return commonCodeVO;
	}
	public void setCommonCodeVO(CommonCodeVO commonCodeVO) {
		this.commonCodeVO = commonCodeVO;
	}
	public String getTechstackId() {
		return techstackId;
	}
	public void setTechstackId(String techstackId) {
		this.techstackId = techstackId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	
	
}
