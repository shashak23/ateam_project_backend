/**
 * 수정자: 장보늬(23023-10-22)
수정자:장윤경(postWriterId로변경)
 * **/
package com.ktdsuniversity.edu.generalpost.vo;

import java.util.List;

import com.ktdsuniversity.edu.commoncode.vo.CommonCodeVO;
import com.ktdsuniversity.edu.generalposthashtag.vo.HashtagVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.util.XssIgnore;

import jakarta.validation.constraints.NotBlank;

public class GeneralPostVO {
	private String generalPostId;
	private String postWriter;
	private String boardId;
	@XssIgnore
	@NotBlank(message = "제목을 입력해 주세요.")
	private String postTitle;
	@XssIgnore
	@NotBlank(message = "내용을 입력해 주세요")
	private String postContent;
	private String postDate;
	private int likeCnt;
	private int viewCnt;
	private String deleteYn;

	// 해시태그list 받아오기
	private List<HashtagVO> hashtagListVO;
	
	// 해시태그 받아오기
	private HashtagVO hashtagVO;

	// 게시글을 작성하는 회원의 정보
	private MemberVO memberVO;

	// 공통코드 받아오기
	private CommonCodeVO commonCodeVO;
	
	
	public HashtagVO getHashtagVO() {
		return hashtagVO;
	}
	
	public void setHashtagVO(HashtagVO hashtagVO) {
		this.hashtagVO = hashtagVO;
	}
	
	private List<CommonCodeVO> commonCodeListVO;

	public List<HashtagVO> getHashtagListVO() {
		return hashtagListVO;
	}

	public void setHashtagListVO(List<HashtagVO> hashtagListVO) {
		this.hashtagListVO = hashtagListVO;
	}

	public String getGeneralPostId() {
		return generalPostId;
	}

	public void setGeneralPostId(String generalPostId) {
		this.generalPostId = generalPostId;
	}

	public String getPostWriter() {
		return postWriter;
	}

	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
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

	public List<CommonCodeVO> getCommonCodeListVO() {
		return commonCodeListVO;
	}

	public void setCommonCodeListVO(List<CommonCodeVO> commonCodeListVO) {
		this.commonCodeListVO = commonCodeListVO;
	}
}
