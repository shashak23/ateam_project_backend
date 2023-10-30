/**
 * 작성자: 김태현
 * 수정 : 장윤경
 * 작성일시: 2023-10-13
 * 내용: 공지 테이블의 VO입니다.
 */

package com.ktdsuniversity.edu.notice.vo;

import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.util.XssIgnore;

public class NoticeVO {
	private String noticeId;
	private String postWriter;
	@XssIgnore
	private String postTitle;
	@XssIgnore
	private String noticeContent;
	private String postDate;
//	@PastOrPresent(message = "게시할 날짜를 입력해주세요.")
	private String releaseStartDate;
//	@FutureOrPresent(message = "마지막 날짜를 입력해주세요.")
	private String releaseEndDate;
	private String deleteYn;
	
	private MemberVO memberVO;
	
	
	public String getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}
	public String getPostWriter() {
		return postWriter;
	}
	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public String getReleaseStartDate() {
		return releaseStartDate;
	}
	public void setReleaseStartDate(String releaseStartDate) {
		this.releaseStartDate = releaseStartDate;
	}
	public String getReleaseEndDate() {
		return releaseEndDate;
	}
	public void setReleaseEndDate(String releaseEndDate) {
		this.releaseEndDate = releaseEndDate;
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
}
