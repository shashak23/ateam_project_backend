/**
 * 작성자: 김태현
 * 작성일자: 2023-10-13
 * 내용: 수행한 공지 테이블의 쿼리를 저장합니다.
 */

package com.ktdsuniversity.edu.notice.service;

import com.ktdsuniversity.edu.notice.vo.NoticeListVO;
import com.ktdsuniversity.edu.notice.vo.NoticeVO;

public interface NoticeService {
	public NoticeListVO getNoticeListVO();
	public NoticeListVO getValidateList();
	public NoticeListVO getInvalidateList();
	public NoticeListVO getDeleteList();
	public NoticeVO getOneNotice(String id);
	public boolean createNotice(NoticeVO noticeVO);
	public boolean updateNotice(NoticeVO noticeVO);
	public boolean deleteNotice(String id);
	public boolean toggleOnOff(NoticeVO noticeVO);
}
