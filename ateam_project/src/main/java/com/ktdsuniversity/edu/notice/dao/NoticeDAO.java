package com.ktdsuniversity.edu.notice.dao;

import java.util.List;

import com.ktdsuniversity.edu.notice.vo.NoticeVO;

public interface NoticeDAO {
	public int getAllNoticeCount();
	public List<NoticeVO> getNoticeAllList();
	public NoticeVO getOneNotice(String id);
	public int createNotice(NoticeVO noticeVO);
	public int updateNotice(NoticeVO noticeVO);
	public int deleteNotice(String id);
}
