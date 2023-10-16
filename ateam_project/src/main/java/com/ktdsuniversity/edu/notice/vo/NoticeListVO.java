/**
 * 작성자: 김태현
 * 작성일자: 2023-10-13
 * 내용: 공지 전체 목록을 저정할 VO입니다.
 */

package com.ktdsuniversity.edu.notice.vo;

import java.util.List;

public class NoticeListVO {
	private int noticeListCnt;
	private List<NoticeVO> noticeList;
	
	
	public int getNoticeListCnt() {
		return noticeListCnt;
	}
	public void setNoticeListCnt(int noticeListCnt) {
		this.noticeListCnt = noticeListCnt;
	}
	public List<NoticeVO> getNoticeList() {
		return noticeList;
	}
	public void setNoticeList(List<NoticeVO> noticeList) {
		this.noticeList = noticeList;
	}
}
