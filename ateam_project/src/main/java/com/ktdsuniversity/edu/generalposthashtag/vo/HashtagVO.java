/**
 * 작성자: 김시하
 * 작성일자: 2023-10-26
 * 내용: 해시태그를 담을 VO 클래스 
 */
package com.ktdsuniversity.edu.generalposthashtag.vo;

import java.util.List;

import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;
import com.ktdsuniversity.edu.generalpost.vo.GeneralPostVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public class HashtagVO {
	private String generalPostHashtagId;
	private String hashtagId;
	private String generalPostId;
	// 코드명 가져오기
	private CommonCodeVO commonCodeVO;
	// 회원 가져오기
	private MemberVO memberVO;
	// 게시글 가져오기
	private GeneralPostVO generalPostVO;
	
	public CommonCodeVO getCommonCodeVO() {
		return commonCodeVO;
	}
	public void setCommonCodeVO(CommonCodeVO commonCodeVO) {
		this.commonCodeVO = commonCodeVO;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public GeneralPostVO getGeneralPostVO() {
		return generalPostVO;
	}
	public void setGeneralPostVO(GeneralPostVO generalPostVO) {
		this.generalPostVO = generalPostVO;
	}
	public String getGeneralPostHashtagId() {
		return generalPostHashtagId;
	}
	public void setGeneralPostHashtagId(String generalPostHashtagId) {
		this.generalPostHashtagId = generalPostHashtagId;
	}
	public String getHashtagId() {
		return hashtagId;
	}
	public void setHashtagId(String hashtagId) {
		this.hashtagId = hashtagId;
	}
	public String getGeneralPostId() {
		return generalPostId;
	}
	public void setGeneralPostId(String generalPostId) {
		this.generalPostId = generalPostId;
	}
	
	
}
