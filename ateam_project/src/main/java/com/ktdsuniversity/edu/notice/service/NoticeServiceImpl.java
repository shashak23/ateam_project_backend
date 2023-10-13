package com.ktdsuniversity.edu.notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.notice.dao.NoticeDAO;
import com.ktdsuniversity.edu.notice.vo.NoticeListVO;
import com.ktdsuniversity.edu.notice.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public NoticeListVO getNoticeListVO() {
		NoticeListVO noticeListVO = new NoticeListVO();
		noticeListVO.setNoticeListCnt(noticeDAO.getAllNoticeCount());
		noticeListVO.setNoticeList(noticeDAO.getNoticeAllList());
		return noticeListVO;
	}

	@Override
	public NoticeVO getOneNotice(String id) {
		NoticeVO noticeVO = noticeDAO.getOneNotice(id);
		return noticeVO;
	}

	@Override
	public boolean createNotice(NoticeVO noticeVO) {
		return noticeDAO.createNotice(noticeVO) > 0;
	}

	@Override
	public boolean updateNotice(NoticeVO noticeVO) {
		return noticeDAO.updateNotice(noticeVO) > 0;
	}

	@Override
	public boolean deleteNotice(String id) {
		return noticeDAO.deleteNotice(id) > 0;
	}

}
