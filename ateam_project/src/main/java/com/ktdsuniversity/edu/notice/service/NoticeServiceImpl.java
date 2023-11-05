/**
 * 작성자: 김태현
 * 작성일자: 2023-10-13
 * 내용: 수행한 공지 테이블의 쿼리를 저장합니다.
 */

package com.ktdsuniversity.edu.notice.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.exceptions.PageNotFoundException;
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
	public NoticeListVO getValidateList() {
		NoticeListVO validateNoticeListVO = new NoticeListVO();
		validateNoticeListVO.setNoticeListCnt(noticeDAO.getValidateList().size());
		validateNoticeListVO.setNoticeList(noticeDAO.getValidateList());
		return validateNoticeListVO;
	}
	
	@Override
	public NoticeListVO getInvalidateList() {
		NoticeListVO invalidateNoticeListVO = new NoticeListVO();
		invalidateNoticeListVO.setNoticeListCnt(noticeDAO.getInvalidateList().size());
		invalidateNoticeListVO.setNoticeList(noticeDAO.getInvalidateList());
		return invalidateNoticeListVO;
	}

	@Override
	public NoticeListVO getDeleteList() {
		NoticeListVO deleteteNoticeListVO = new NoticeListVO();
		deleteteNoticeListVO.setNoticeListCnt(noticeDAO.getDeleteList().size());
		deleteteNoticeListVO.setNoticeList(noticeDAO.getDeleteList());
		return deleteteNoticeListVO;
	}
	
	@Override
	public NoticeVO getOneNotice(String id) {
		NoticeVO noticeVO = noticeDAO.getOneNotice(id);
		return noticeVO;
	}
	
	@Override
	public NoticeVO getRandomNotice() {
		List<NoticeVO> noticeList = noticeDAO.getNoticeOnList();
		
		Random rd = new Random();
		int rdIndex = rd.nextInt(noticeList.size());
		
		NoticeVO noticeVO = noticeList.get(rdIndex);
		
		return noticeVO;
	}

	@Override
	public boolean createNotice(NoticeVO noticeVO) {
		return noticeDAO.createNotice(noticeVO) > 0;
	}
	
	@Transactional
	@Override
	public boolean updateNotice(NoticeVO noticeVO) {
		return noticeDAO.updateNotice(noticeVO) > 0;
	}
	
	@Transactional
	@Override
	public boolean deleteNotice(String id) {
		return noticeDAO.deleteNotice(id) > 0;
	}
	
	@Transactional
	@Override
	public boolean toggleOnOff(NoticeVO noticeVO) {
		if (noticeVO.getOnOff().equals("On")) {
			noticeVO.setOnOff("Off");
			return noticeDAO.toggleOnOff(noticeVO) > 0;
		}
		else if (noticeVO.getOnOff().equals("Off")) {
			noticeVO.setOnOff("On");
			return noticeDAO.toggleOnOff(noticeVO) > 0;
		}
		else {
			throw new PageNotFoundException("잘못된 접근입니다.");
		}
	}
}
