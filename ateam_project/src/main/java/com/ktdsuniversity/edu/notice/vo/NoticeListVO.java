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
