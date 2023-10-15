package com.ktdsuniversity.edu.notice.service;

import com.ktdsuniversity.edu.notice.vo.NoticeListVO;
import com.ktdsuniversity.edu.notice.vo.NoticeVO;

public interface NoticeService {
	public NoticeListVO getNoticeListVO();
	public NoticeVO getOneNotice(String id);
	public boolean createNotice(NoticeVO noticeVO);
	public boolean updateNotice(NoticeVO noticeVO);
	public boolean deleteNotice(String id);
}
