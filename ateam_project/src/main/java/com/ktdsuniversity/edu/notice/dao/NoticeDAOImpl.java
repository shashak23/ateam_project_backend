/**
 * 작성자: 김태현
 * 작성일자:2023-10-13
 * 내용: 공지 테이블의 쿼리를 수행하는 클래스입니다.
 */

package com.ktdsuniversity.edu.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.notice.vo.NoticeVO;

@Repository
public class NoticeDAOImpl extends SqlSessionDaoSupport implements NoticeDAO {
	@Autowired
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		super.setSqlSessionTemplate(sqlSessionTemplate);
	}

	@Override
	public int getAllNoticeCount() {
		return getSqlSession().selectOne("getAllNoticeCount");
	}

	@Override
	public List<NoticeVO> getNoticeAllList() {
		return getSqlSession().selectList("getNoticeAllList");
	}

	@Override
	public NoticeVO getOneNotice(String id) {
		return getSqlSession().selectOne("getOneNotice", id);
	}

	@Override
	public int createNotice(NoticeVO noticeVO) {
		return getSqlSession().insert("createNotice", noticeVO);
	}

	@Override
	public int updateNotice(NoticeVO noticeVO) {
		return getSqlSession().update("updateNotice", noticeVO);
	}

	@Override
	public int deleteNotice(String id) {
		return getSqlSession().update("deleteNotice", id);
	}

}
