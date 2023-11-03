/**
 * 작성자: 김태현
 * 작성일자: 2023-10-13
 * 내용: 공지 테이블의 쿼리를 수행하는 클래스입니다.
 */

package com.ktdsuniversity.edu.notice.dao;

import java.util.List;

import com.ktdsuniversity.edu.notice.vo.NoticeVO;

public interface NoticeDAO {
	public int getAllNoticeCount();
	public List<NoticeVO> getNoticeAllList();
	public List<NoticeVO> getValidateList();
	public List<NoticeVO> getInvalidateList();
	public List<NoticeVO> getDeleteList();	
	public NoticeVO getOneNotice(String id);
	public int createNotice(NoticeVO noticeVO);
	public int updateNotice(NoticeVO noticeVO);
	public int deleteNotice(String id);
	public int toggleOnOff(NoticeVO noticeVO);
}
